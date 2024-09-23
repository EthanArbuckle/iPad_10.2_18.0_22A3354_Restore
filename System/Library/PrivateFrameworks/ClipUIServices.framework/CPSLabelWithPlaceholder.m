@implementation CPSLabelWithPlaceholder

- (CPSLabelWithPlaceholder)initWithFrame:(CGRect)a3
{
  CPSLabelWithPlaceholder *v3;
  CPSLabelWithPlaceholder *v4;
  CPSLabelWithPlaceholder *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPSLabelWithPlaceholder;
  v3 = -[CPSLabelWithPlaceholder initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CPSLabelWithPlaceholder _commonInit](v3, "_commonInit");
    -[CPSLabelWithPlaceholder _placeholderInputsDidChange](v4, "_placeholderInputsDidChange");
    v5 = v4;
  }

  return v4;
}

- (CPSLabelWithPlaceholder)initWithCoder:(id)a3
{
  CPSLabelWithPlaceholder *v3;
  CPSLabelWithPlaceholder *v4;
  uint64_t v5;
  NSString *text;
  CPSLabelWithPlaceholder *v7;
  objc_super v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CPSLabelWithPlaceholder;
  v3 = -[CPSLabelWithPlaceholder initWithCoder:](&v10, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[CPSLabelWithPlaceholder _commonInit](v3, "_commonInit");
    v9.receiver = v4;
    v9.super_class = (Class)CPSLabelWithPlaceholder;
    -[CPSLabelWithPlaceholder text](&v9, sel_text);
    v5 = objc_claimAutoreleasedReturnValue();
    text = v4->_text;
    v4->_text = (NSString *)v5;

    -[CPSLabelWithPlaceholder _placeholderInputsDidChange](v4, "_placeholderInputsDidChange");
    v7 = v4;
  }

  return v4;
}

- (void)_commonInit
{
  void *v3;
  UIView *v4;
  UIView *placeholderView;

  -[CPSLabelWithPlaceholder placeholderColor](self, "placeholderColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSLabelWithPlaceholder setPlaceholderColor:](self, "setPlaceholderColor:", v3);

  if (self->_placeholderWidth == 0.0)
    self->_placeholderWidth = 100.0;
  v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  placeholderView = self->_placeholderView;
  self->_placeholderView = v4;

  -[UIView setBackgroundColor:](self->_placeholderView, "setBackgroundColor:", self->_placeholderColor);
  -[CPSLabelWithPlaceholder addSubview:](self, "addSubview:", self->_placeholderView);
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double placeholderWidth;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  if (-[UIView isHidden](self->_placeholderView, "isHidden"))
  {
    v11.receiver = self;
    v11.super_class = (Class)CPSLabelWithPlaceholder;
    -[CPSLabelWithPlaceholder intrinsicContentSize](&v11, sel_intrinsicContentSize);
    placeholderWidth = v3;
    v6 = v5;
  }
  else
  {
    placeholderWidth = self->_placeholderWidth;
    -[CPSLabelWithPlaceholder font](self, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_bodyLeading");
    v6 = v8;

  }
  v9 = placeholderWidth;
  v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v18.receiver = self;
  v18.super_class = (Class)CPSLabelWithPlaceholder;
  -[CPSLabelWithPlaceholder layoutSubviews](&v18, sel_layoutSubviews);
  if (!-[UIView isHidden](self->_placeholderView, "isHidden"))
  {
    -[CPSLabelWithPlaceholder bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[CPSLabelWithPlaceholder _desiredPlaceholderSize](self, "_desiredPlaceholderSize");
    v12 = v11;
    v14 = v13;
    v19.origin.x = v4;
    v19.origin.y = v6;
    v19.size.width = v8;
    v19.size.height = v10;
    v15 = fmin(v12, CGRectGetWidth(v19));
    v20.origin.x = v4;
    v20.origin.y = v6;
    v20.size.width = v8;
    v20.size.height = v10;
    v16 = fmin(v14, CGRectGetHeight(v20));
    if (-[CPSLabelWithPlaceholder effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
    {
      v21.origin.x = v4;
      v21.origin.y = v6;
      v21.size.width = v8;
      v21.size.height = v10;
      v17 = CGRectGetWidth(v21) - v15;
    }
    else
    {
      v17 = 0.0;
    }
    v22.origin.x = v4;
    v22.origin.y = v6;
    v22.size.width = v8;
    v22.size.height = v10;
    -[UIView setFrame:](self->_placeholderView, "setFrame:", v17, (CGRectGetHeight(v22) - v16) * 0.5, v15, v16);
    -[UIView frame](self->_placeholderView, "frame");
    -[UIView _setContinuousCornerRadius:](self->_placeholderView, "_setContinuousCornerRadius:", CGRectGetHeight(v23) * 0.5);
  }
}

- (void)setAttributedText:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("CPSLabelWithPlacement does not support attributed text."), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  v4 = (NSString *)a3;
  text = self->_text;
  if (text != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](text, "isEqualToString:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      v8 = self->_text;
      self->_text = v7;

      -[CPSLabelWithPlaceholder _placeholderInputsDidChange](self, "_placeholderInputsDidChange");
      v4 = v9;
    }
  }

}

- (id)text
{
  return self->_text;
}

- (void)setPlaceholderColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_placeholderColor, v4);
  if (!v5)

  -[UIView setBackgroundColor:](self->_placeholderView, "setBackgroundColor:", self->_placeholderColor);
}

- (void)setPlaceholderWidth:(double)a3
{
  self->_placeholderWidth = a3;
  -[CPSLabelWithPlaceholder setNeedsLayout](self, "setNeedsLayout");
}

- (void)_placeholderInputsDidChange
{
  NSUInteger v3;
  NSString *text;
  UIView **p_placeholderView;
  objc_super v6;
  objc_super v7;

  v3 = -[NSString length](self->_text, "length");
  text = self->_text;
  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)CPSLabelWithPlaceholder;
    -[CPSLabelWithPlaceholder setText:](&v7, sel_setText_, text);
    p_placeholderView = &self->_placeholderView;
    if (-[UIView isHidden](self->_placeholderView, "isHidden"))
      return;
    goto LABEL_3;
  }
  if (!-[NSString length](self->_text, "length"))
  {
    p_placeholderView = &self->_placeholderView;
    if (-[UIView isHidden](self->_placeholderView, "isHidden"))
    {
      v6.receiver = self;
      v6.super_class = (Class)CPSLabelWithPlaceholder;
      -[CPSLabelWithPlaceholder setText:](&v6, sel_setText_, &stru_1E8E8B5E8);
LABEL_3:
      -[UIView setHidden:](*p_placeholderView, "setHidden:", v3 != 0);
      -[CPSLabelWithPlaceholder invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      -[CPSLabelWithPlaceholder setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (CGSize)_desiredPlaceholderSize
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double placeholderWidth;
  double v9;
  CGSize result;

  -[CPSLabelWithPlaceholder font](self, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSLabelWithPlaceholder traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "capHeight");
  v7 = round(v6);

  placeholderWidth = self->_placeholderWidth;
  v9 = v7;
  result.height = v9;
  result.width = placeholderWidth;
  return result;
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (double)placeholderWidth
{
  return self->_placeholderWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
}

@end
