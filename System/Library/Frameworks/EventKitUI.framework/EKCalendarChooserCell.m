@implementation EKCalendarChooserCell

- (EKCalendarChooserCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKCalendarChooserCell *v4;
  EKCalendarChooserCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKCalendarChooserCell;
  v4 = -[EKUITableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[EKCalendarChooserCell setShowCheckmarksOnLeft:](v4, "setShowCheckmarksOnLeft:", 1);
  return v5;
}

- (void)prepareForReuse
{
  NSString *selectionCheckmarkCheckedSystemImageName;
  NSString *selectionCheckmarkUncheckedSystemImageName;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKCalendarChooserCell;
  -[EKCalendarChooserCell prepareForReuse](&v5, sel_prepareForReuse);
  self->_shouldAnimate = 0;
  self->_showsColorDot = 0;
  selectionCheckmarkCheckedSystemImageName = self->_selectionCheckmarkCheckedSystemImageName;
  self->_selectionCheckmarkCheckedSystemImageName = 0;

  selectionCheckmarkUncheckedSystemImageName = self->_selectionCheckmarkUncheckedSystemImageName;
  self->_selectionCheckmarkUncheckedSystemImageName = 0;

}

- (NSString)selectionCheckmarkCheckedSystemImageName
{
  if (self->_selectionCheckmarkCheckedSystemImageName)
    return self->_selectionCheckmarkCheckedSystemImageName;
  else
    return (NSString *)CFSTR("checkmark.circle.fill");
}

- (NSString)selectionCheckmarkUncheckedSystemImageName
{
  if (self->_selectionCheckmarkUncheckedSystemImageName)
    return self->_selectionCheckmarkUncheckedSystemImageName;
  else
    return (NSString *)CFSTR("circle");
}

- (void)setAccessoryType:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKCalendarChooserCell;
  -[EKCalendarChooserCell setAccessoryType:](&v5, sel_setAccessoryType_);
  -[EKCalendarChooserCell setEditingAccessoryType:](self, "setEditingAccessoryType:", a3);
}

- (void)setShowCheckmarksOnLeft:(BOOL)a3
{
  UIImageView *checkmarkView;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *v8;
  void *v9;

  self->_showCheckmarksOnLeft = a3;
  checkmarkView = self->_checkmarkView;
  if (a3)
  {
    if (!checkmarkView)
    {
      -[EKCalendarChooserCell traitCollection](self, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      TableViewCheckmarkImage(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v6);
      v8 = self->_checkmarkView;
      self->_checkmarkView = v7;

      -[EKCalendarChooserCell contentView](self, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", self->_checkmarkView);

      -[UIImageView setAlpha:](self->_checkmarkView, "setAlpha:", 0.0);
LABEL_6:

    }
  }
  else if (checkmarkView)
  {
    -[UIImageView removeFromSuperview](checkmarkView, "removeFromSuperview");
    v6 = self->_checkmarkView;
    self->_checkmarkView = 0;
    goto LABEL_6;
  }
  -[EKCalendarChooserCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateTextLabelTextWithColorDot
{
  UIImage *colorDot;
  NSTextAttachment *colorDotAttachment;
  NSTextAttachment *v5;
  NSTextAttachment *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  const __CFString *textLabelText;
  void *v21;
  void *v22;
  id v23;

  v23 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  colorDot = self->_colorDot;
  if (colorDot)
  {
    colorDotAttachment = self->_colorDotAttachment;
    if (!colorDotAttachment)
    {
      v5 = (NSTextAttachment *)objc_alloc_init(MEMORY[0x1E0DC12B0]);
      v6 = self->_colorDotAttachment;
      self->_colorDotAttachment = v5;

      colorDot = self->_colorDot;
      colorDotAttachment = self->_colorDotAttachment;
    }
    -[NSTextAttachment setImage:](colorDotAttachment, "setImage:", colorDot);
    if (!-[UIImage isSymbolImage](self->_colorDot, "isSymbolImage"))
    {
      -[EKCalendarChooserCell textLabel](self, "textLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "font");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "capHeight");
      v10 = v9;

      -[UIImage size](self->_colorDot, "size");
      CalRoundToScreenScale((v10 - v11) * 0.5);
      v13 = v12;
      -[UIImage size](self->_colorDot, "size");
      v15 = v14;
      -[UIImage size](self->_colorDot, "size");
      -[NSTextAttachment setBounds:](self->_colorDotAttachment, "setBounds:", 0.0, v13, v15, v16);
    }
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", self->_colorDotAttachment);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "appendAttributedString:", v17);

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    objc_msgSend(v23, "appendAttributedString:", v18);

  }
  v19 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (self->_textLabelText)
    textLabelText = (const __CFString *)self->_textLabelText;
  else
    textLabelText = &stru_1E601DFA8;
  v21 = (void *)objc_msgSend(v19, "initWithString:", textLabelText);
  objc_msgSend(v23, "appendAttributedString:", v21);

  -[EKCalendarChooserCell textLabel](self, "textLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAttributedText:", v23);

}

- (void)setTextLabelText:(id)a3
{
  NSString **p_textLabelText;
  void *v6;
  _BOOL4 v7;
  void *v8;
  NSString *v9;

  p_textLabelText = &self->_textLabelText;
  v9 = (NSString *)a3;
  if (*p_textLabelText != v9)
    objc_storeStrong((id *)&self->_textLabelText, a3);
  if (!self->_colorDot)
    goto LABEL_8;
  -[EKCalendarChooserCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!EKUIUsesLargeTextLayout(v6))
  {
    v7 = -[EKCalendarChooserCell multiSelectStyle](self, "multiSelectStyle");

    if (v7)
      goto LABEL_7;
LABEL_8:
    -[EKCalendarChooserCell textLabel](self, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", *p_textLabelText);

    goto LABEL_9;
  }

LABEL_7:
  -[EKCalendarChooserCell _updateTextLabelTextWithColorDot](self, "_updateTextLabelTextWithColorDot");
LABEL_9:

}

- (void)setColorDotImage:(id)a3
{
  UIImage **p_colorDot;
  void *v6;
  BOOL v7;
  UIImageView *colorDotView;
  UIImageView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIImageView *v16;
  UIImageView *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  UIImage *v26;

  p_colorDot = &self->_colorDot;
  v26 = (UIImage *)a3;
  if (*p_colorDot != v26)
    objc_storeStrong((id *)&self->_colorDot, a3);
  -[EKCalendarChooserCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (EKUIUsesLargeTextLayout(v6))
  {

LABEL_6:
    -[UIImageView removeFromSuperview](self->_colorDotView, "removeFromSuperview");
    colorDotView = self->_colorDotView;
    self->_colorDotView = 0;

    -[EKCalendarChooserCell _updateTextLabelTextWithColorDot](self, "_updateTextLabelTextWithColorDot");
    goto LABEL_7;
  }
  v7 = -[EKCalendarChooserCell multiSelectStyle](self, "multiSelectStyle");

  if (v7)
    goto LABEL_6;
  v9 = self->_colorDotView;
  if (v9)
  {
    -[UIImageView setImage:](v9, "setImage:", *p_colorDot);
    -[UIImageView frame](self->_colorDotView, "frame");
    v11 = v10;
    v13 = v12;
    -[UIImage size](*p_colorDot, "size");
    -[UIImageView setFrame:](self->_colorDotView, "setFrame:", v11, v13, v14, v15);
  }
  else
  {
    v16 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v26);
    v17 = self->_colorDotView;
    self->_colorDotView = v16;

    -[UIImageView frame](self->_colorDotView, "frame");
    v19 = v18;
    v21 = v20;
    -[UIImage size](*p_colorDot, "size");
    -[UIImageView setFrame:](self->_colorDotView, "setFrame:", v19, v21, v22, v23);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](self->_colorDotView, "setTintColor:", v24);

    -[EKCalendarChooserCell contentView](self, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", self->_colorDotView);

  }
LABEL_7:
  -[EKCalendarChooserCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)setColorDotHighlightedImage:(id)a3
{
  UIImage *v5;

  v5 = (UIImage *)a3;
  if (self->_colorDotHighlighted != v5)
    objc_storeStrong((id *)&self->_colorDotHighlighted, a3);
  -[EKCalendarChooserCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)setChecked:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  EKCalendarChooserCell *v6;
  uint64_t v7;

  v3 = a3;
  self->_checked = a3;
  if (!-[EKCalendarChooserCell showCheckmarksOnLeft](self, "showCheckmarksOnLeft"))
  {
    if (-[EKCalendarChooserCell accessoryType](self, "accessoryType") != 3 || v3)
    {
      if (-[EKCalendarChooserCell accessoryType](self, "accessoryType") || !v3)
        return;
      v6 = self;
      v7 = 3;
    }
    else
    {
      v6 = self;
      v7 = 0;
    }
    -[EKCalendarChooserCell setAccessoryType:](v6, "setAccessoryType:", v7);
    return;
  }
  v5 = 0.0;
  if (v3)
    v5 = 1.0;
  -[UIImageView setAlpha:](self->_checkmarkView, "setAlpha:", v5);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  UIImage *colorDot;
  objc_super v8;

  v4 = a4;
  LODWORD(v5) = a3;
  if (-[EKCalendarChooserCell selectionStyle](self, "selectionStyle"))
    v5 = v5;
  else
    v5 = 0;
  v8.receiver = self;
  v8.super_class = (Class)EKCalendarChooserCell;
  -[EKCalendarChooserCell setHighlighted:animated:](&v8, sel_setHighlighted_animated_, v5, v4);
  if (!(_DWORD)v5 || (colorDot = self->_colorDotHighlighted) == 0)
    colorDot = self->_colorDot;
  -[UIImageView setImage:](self->_colorDotView, "setImage:", colorDot);
  if (-[EKCalendarChooserCell multiSelectStyle](self, "multiSelectStyle"))
    -[EKCalendarChooserCell updateSelectionCheckmark](self, "updateSelectionCheckmark");
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  _BOOL8 v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  if (-[EKCalendarChooserCell selectionStyle](self, "selectionStyle"))
    v7 = v5;
  else
    v7 = 0;
  v8.receiver = self;
  v8.super_class = (Class)EKCalendarChooserCell;
  -[EKCalendarChooserCell setSelected:animated:](&v8, sel_setSelected_animated_, v7, v4);
  if (-[EKCalendarChooserCell multiSelectStyle](self, "multiSelectStyle"))
    -[EKCalendarChooserCell updateSelectionCheckmark](self, "updateSelectionCheckmark");
}

- (void)updateSelectionCheckmark
{
  int v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  UIColor *checkMarkColor;
  UIColor *v9;
  void *v10;
  int64_t v11;
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
  UIColor *v22;
  UIColor *v23;
  id v24;

  v3 = -[EKCalendarChooserCell isSelected](self, "isSelected");
  v4 = v3 ^ -[EKCalendarChooserCell isHighlighted](self, "isHighlighted");
  -[EKCalendarChooserCell imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && self->_showingSelectionCheckmark == v4)
  {
    checkMarkColor = self->_checkMarkColor;
    -[EKCalendarChooserCell selectionCheckmarkColor](self, "selectionCheckmarkColor");
    v9 = (UIColor *)objc_claimAutoreleasedReturnValue();

    if (checkMarkColor == v9)
      return;
  }
  else
  {

  }
  -[EKCalendarChooserCell traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[EKUIConstrainedFontUtilities tableViewCellCappedSymbolImageScaleWithScale:traitCollection:](EKUIConstrainedFontUtilities, "tableViewCellCappedSymbolImageScaleWithScale:traitCollection:", 0, v10);

  v12 = (void *)MEMORY[0x1E0DC3888];
  -[EKCalendarChooserCell textLabel](self, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "font");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configurationWithFont:scale:", v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v4 & 1) != 0)
    -[EKCalendarChooserCell selectionCheckmarkCheckedSystemImageName](self, "selectionCheckmarkCheckedSystemImageName");
  else
    -[EKCalendarChooserCell selectionCheckmarkUncheckedSystemImageName](self, "selectionCheckmarkUncheckedSystemImageName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v16, v15);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooserCell imageView](self, "imageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setImage:", v24);

  -[EKCalendarChooserCell selectionCheckmarkColor](self, "selectionCheckmarkColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooserCell traitCollection](self, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "userInterfaceStyle");
  CUIKAdjustedColorForColor();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooserCell imageView](self, "imageView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTintColor:", v20);

  -[EKCalendarChooserCell selectionCheckmarkColor](self, "selectionCheckmarkColor");
  v22 = (UIColor *)objc_claimAutoreleasedReturnValue();
  v23 = self->_checkMarkColor;
  self->_checkMarkColor = v22;

  self->_showingSelectionCheckmark = v4;
}

- (double)textLeadingIndent
{
  void *v3;
  _BOOL4 v4;
  double v5;
  double v6;
  int IsLeftToRight;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double result;
  CGRect v20;
  CGRect v21;

  -[EKCalendarChooserCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = EKUIUsesLargeTextLayout(v3);

  v5 = 0.0;
  if (!-[EKCalendarChooserCell multiSelectStyle](self, "multiSelectStyle"))
  {
    if (-[EKCalendarChooserCell showCheckmarksOnLeft](self, "showCheckmarksOnLeft"))
    {
      -[UIImageView frame](self->_checkmarkView, "frame");
      v5 = v6 + 11.0 + 10.0;
    }
    else
    {
      v5 = 16.0;
      if (v4)
      {
        IsLeftToRight = CalInterfaceIsLeftToRight();
        -[EKCalendarChooserCell layoutMargins](self, "layoutMargins");
        if (IsLeftToRight)
          v5 = v8;
        else
          v5 = v9;
        -[EKCalendarChooserCell showsColorDot](self, "showsColorDot");
        goto LABEL_11;
      }
    }
  }
  if (-[EKCalendarChooserCell showsColorDot](self, "showsColorDot")
    && !v4
    && !-[EKCalendarChooserCell multiSelectStyle](self, "multiSelectStyle"))
  {
    -[UIImage size](self->_colorDot, "size");
    v5 = v5 + v18 + 10.0;
    goto LABEL_17;
  }
LABEL_11:
  -[EKCalendarChooserCell imageView](self, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if ((CalInterfaceIsLeftToRight() & 1) != 0)
    {
      -[EKCalendarChooserCell imageView](self, "imageView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      v14 = v13;
    }
    else
    {
      -[EKCalendarChooserCell bounds](self, "bounds");
      v16 = v15;
      -[EKCalendarChooserCell imageView](self, "imageView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      v14 = v16 - CGRectGetMaxX(v20);
    }

    -[EKCalendarChooserCell imageView](self, "imageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v5 = v14 + CGRectGetWidth(v21) + 10.0;

  }
LABEL_17:
  CalRoundToScreenScale(v5);
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD aBlock[5];

  if (!-[EKCalendarChooserCell multiSelectStyle](self, "multiSelectStyle")
    && (-[EKCalendarChooserCell showCheckmarksOnLeft](self, "showCheckmarksOnLeft")
     || -[EKCalendarChooserCell showsColorDot](self, "showsColorDot")))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__EKCalendarChooserCell_layoutSubviews__block_invoke;
    aBlock[3] = &unk_1E6018688;
    aBlock[4] = self;
    v3 = _Block_copy(aBlock);
    v4 = v3;
    if (self->_shouldAnimate)
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v3, 0, 0.300000012, 0.0);
    else
      (*((void (**)(void *))v3 + 2))(v3);

  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)EKCalendarChooserCell;
    -[EKUITableViewCell layoutSubviews](&v5, sel_layoutSubviews);
  }
}

uint64_t __39__EKCalendarChooserCell_layoutSubviews__block_invoke(uint64_t a1)
{
  int IsLeftToRight;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  CGFloat Height;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  uint64_t result;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  objc_super v40;
  CGRect v41;
  CGRect v42;

  v40.receiver = *(id *)(a1 + 32);
  v40.super_class = (Class)EKCalendarChooserCell;
  objc_msgSendSuper2(&v40, sel_layoutSubviews);
  IsLeftToRight = CalInterfaceIsLeftToRight();
  objc_msgSend(*(id *)(a1 + 32), "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_capOffsetFromBoundsTop");
  v8 = v5 + v7;
  objc_msgSend(*(id *)(a1 + 32), "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "capHeight");
  CalRoundToScreenScale(v8 + v11 * 0.5);
  v13 = v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "sizeToFit");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "bounds");
  Height = CGRectGetHeight(v41);
  CalRoundToScreenScale(v13 - Height * 0.5);
  v16 = v15;
  v17 = 11.0;
  if ((IsLeftToRight & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v20 = v19;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "frame");
    v17 = v20 - v21 + -11.0;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "frame");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "setFrame:", v17, v16);
  if (objc_msgSend(*(id *)(a1 + 32), "showCheckmarksOnLeft"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "frame");
    if (IsLeftToRight)
    {
      v26 = CGRectGetMaxX(*(CGRect *)&v22) + 10.0;
LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "safeAreaInsets");
      v28 = v26 + v27;
      goto LABEL_11;
    }
    v26 = CGRectGetMinX(*(CGRect *)&v22) + -10.0;
  }
  else
  {
    v26 = 16.0;
    if ((IsLeftToRight & 1) != 0)
      goto LABEL_7;
    objc_msgSend(*(id *)(a1 + 32), "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    v26 = v30 + -16.0;

  }
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bounds");
  v33 = v32 - v26;
  objc_msgSend(*(id *)(a1 + 32), "safeAreaInsets");
  v28 = v33 + v34;

LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "setSeparatorInset:", 0.0, v28, 0.0, 0.0);
  result = objc_msgSend(*(id *)(a1 + 32), "showsColorDot");
  if ((_DWORD)result)
  {
    if (!IsLeftToRight)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "frame");
      v26 = v26 - v36;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "bounds");
    v37 = CGRectGetHeight(v42);
    CalRoundToScreenScale(v13 + v37 * -0.5);
    v39 = v38;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "frame");
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setFrame:", v26, v39);
  }
  return result;
}

- (BOOL)showingSelectionCheckmark
{
  return self->_showingSelectionCheckmark;
}

- (void)setShowingSelectionCheckmark:(BOOL)a3
{
  self->_showingSelectionCheckmark = a3;
}

- (BOOL)multiSelectStyle
{
  return self->_multiSelectStyle;
}

- (void)setMultiSelectStyle:(BOOL)a3
{
  self->_multiSelectStyle = a3;
}

- (BOOL)showCheckmarksOnLeft
{
  return self->_showCheckmarksOnLeft;
}

- (BOOL)checked
{
  return self->_checked;
}

- (BOOL)shouldAnimate
{
  return self->_shouldAnimate;
}

- (void)setShouldAnimate:(BOOL)a3
{
  self->_shouldAnimate = a3;
}

- (BOOL)showsColorDot
{
  return self->_showsColorDot;
}

- (void)setShowsColorDot:(BOOL)a3
{
  self->_showsColorDot = a3;
}

- (NSString)textLabelText
{
  return self->_textLabelText;
}

- (UIColor)selectionCheckmarkColor
{
  return self->_selectionCheckmarkColor;
}

- (void)setSelectionCheckmarkColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectionCheckmarkColor, a3);
}

- (void)setSelectionCheckmarkCheckedSystemImageName:(id)a3
{
  objc_storeStrong((id *)&self->_selectionCheckmarkCheckedSystemImageName, a3);
}

- (void)setSelectionCheckmarkUncheckedSystemImageName:(id)a3
{
  objc_storeStrong((id *)&self->_selectionCheckmarkUncheckedSystemImageName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionCheckmarkUncheckedSystemImageName, 0);
  objc_storeStrong((id *)&self->_selectionCheckmarkCheckedSystemImageName, 0);
  objc_storeStrong((id *)&self->_selectionCheckmarkColor, 0);
  objc_storeStrong((id *)&self->_textLabelText, 0);
  objc_storeStrong((id *)&self->_colorDotAttachment, 0);
  objc_storeStrong((id *)&self->_checkMarkColor, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_colorDotView, 0);
  objc_storeStrong((id *)&self->_colorDotHighlighted, 0);
  objc_storeStrong((id *)&self->_colorDot, 0);
}

@end
