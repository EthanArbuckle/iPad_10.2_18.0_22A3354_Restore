@implementation CEKBadgeTextView

- (CEKBadgeTextView)initWithFrame:(CGRect)a3
{
  CEKBadgeTextView *v3;
  CEKBadgeTextView *v4;
  UIEdgeInsets *p_textInsets;
  objc_class *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  uint64_t v10;
  NSDictionary *textAttributes;
  CEKBadgeTextView *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CEKBadgeTextView;
  v3 = -[CEKBadgeView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    p_textInsets = &v3->__textInsets;
    objc_msgSend((id)objc_opt_class(), "_defaultTextInsets");
    *(_QWORD *)&p_textInsets->top = v6;
    v4->__textInsets.left = v7;
    v4->__textInsets.bottom = v8;
    v4->__textInsets.right = v9;
    v4->_fontStyle = 0;
    objc_msgSend((id)objc_opt_class(), "_textAttributesForContentSize:fontStyle:", *MEMORY[0x1E0DC4918], v4->_fontStyle);
    v10 = objc_claimAutoreleasedReturnValue();
    textAttributes = v4->__textAttributes;
    v4->__textAttributes = (NSDictionary *)v10;

    v12 = v4;
  }

  return v4;
}

+ (UIEdgeInsets)_defaultTextInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = 1.0 / v3;

  v5 = 2.0 - v4;
  v6 = 1.0 - v4 + 5.0;
  v7 = 2.0;
  v8 = 5.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void)setFontStyle:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_fontStyle != a3)
  {
    self->_fontStyle = a3;
    v5 = (void *)objc_opt_class();
    -[CEKBadgeTextView traitCollection](self, "traitCollection");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_textAttributesForContentSize:fontStyle:", v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKBadgeTextView _setTextAttributes:](self, "_setTextAttributes:", v7);

  }
}

- (id)_maskImage
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  CGSize v19;

  -[CEKBadgeTextView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[CEKBadgeTextView _text](self, "_text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKBadgeTextView _textSize](self, "_textSize");
  v9 = v8;
  v11 = v10;
  -[CEKBadgeTextView _textInsets](self, "_textInsets");
  v13 = v12;
  v15 = v14;
  v19.width = v4;
  v19.height = v6;
  UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
  -[CEKBadgeTextView _textAttributes](self, "_textAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "drawInRect:withAttributes:", v16, v15, v13, v9, v11);

  UIGraphicsGetImageFromCurrentImageContext();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v17;
}

- (CGSize)_textSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[CEKBadgeTextView _text](self, "_text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKBadgeTextView _textAttributes](self, "_textAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeWithAttributes:", v4);
  UICeilToViewScale();
  v6 = v5;
  UICeilToViewScale();
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[CEKBadgeTextView _textInsets](self, "_textInsets");
  -[CEKBadgeTextView _textSize](self, "_textSize");
  UICeilToViewScale();
  v4 = v3;
  UICeilToViewScale();
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CEKBadgeTextView;
  v4 = a3;
  -[CEKBadgeTextView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "preferredContentSizeCategory", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CEKBadgeTextView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v5 && (objc_msgSend(v7, "isEqualToString:", v5) & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "_textAttributesForContentSize:fontStyle:", v7, -[CEKBadgeTextView fontStyle](self, "fontStyle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKBadgeTextView _setTextAttributes:](self, "_setTextAttributes:", v8);

  }
}

- (void)_setText:(id)a3
{
  NSString *v5;
  NSString *text;
  BOOL v7;
  NSString *v8;

  v5 = (NSString *)a3;
  text = self->__text;
  if (text != v5)
  {
    v8 = v5;
    v7 = -[NSString isEqualToString:](text, "isEqualToString:", v5);
    v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->__text, a3);
      -[CEKBadgeTextView _didUpdateContents](self, "_didUpdateContents");
      v5 = v8;
    }
  }

}

- (void)_setTextAttributes:(id)a3
{
  NSDictionary *v5;
  NSDictionary *textAttributes;
  BOOL v7;
  NSDictionary *v8;

  v5 = (NSDictionary *)a3;
  textAttributes = self->__textAttributes;
  if (textAttributes != v5)
  {
    v8 = v5;
    v7 = -[NSDictionary isEqualToDictionary:](textAttributes, "isEqualToDictionary:", v5);
    v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->__textAttributes, a3);
      -[CEKBadgeTextView _didUpdateContents](self, "_didUpdateContents");
      v5 = v8;
    }
  }

}

- (void)_setTextInsets:(UIEdgeInsets)a3
{
  if (self->__textInsets.left != a3.left
    || self->__textInsets.top != a3.top
    || self->__textInsets.right != a3.right
    || self->__textInsets.bottom != a3.bottom)
  {
    self->__textInsets = a3;
    -[CEKBadgeTextView _didUpdateContents](self, "_didUpdateContents");
  }
}

- (void)_didUpdateContents
{
  id v3;

  -[CEKBadgeTextView setNeedsDisplay](self, "setNeedsDisplay");
  -[CEKBadgeTextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[CEKBadgeView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "badgeViewDidChangeIntrinsicContentSize:", self);

}

+ (id)_textAttributesForContentSize:(id)a3 fontStyle:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  void *v14;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_fontForContentSize:fontStyle:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0DC32A0]);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0DC32A8]);

  v9 = objc_alloc_init(MEMORY[0x1E0DC33B0]);
  objc_msgSend(v6, "leading");
  objc_msgSend(v9, "setLineSpacing:");
  objc_msgSend(v9, "setAlignment:", 1);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0DC32C0]);
  CEKLocalizedFrameworkString(CFSTR("CAMERA_APPLY_CUSTOM_KERNING"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("YES"));

  if (!v11)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "pointSize");
    objc_msgSend(v12, "numberWithDouble:", v13 * 25.0 / 1000.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0DC32B0]);

  }
  return v7;
}

+ (id)_fontForContentSize:(id)a3 fontStyle:(unint64_t)a4
{
  id v5;
  double v6;
  void *v7;
  double Width;
  double v9;
  void *v10;
  CGRect v12;

  v5 = a3;
  v6 = 13.0;
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC4908]) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC4930]) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC4920]) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC4918]) & 1) == 0)
  {
    v6 = 14.0;
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC4900]) & 1) == 0)
    {
      if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC48F8]))
        v6 = 16.0;
      else
        v6 = 18.0;
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_referenceBounds");
  Width = CGRectGetWidth(v12);

  v9 = 0.0;
  if (Width > 320.0)
    v9 = 1.0;
  CEKFontOfSizeAndStyle(a4, v6 + v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (double)_textHeightForContentSize:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a1, "_fontForContentSize:fontStyle:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lineHeight");
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");

  UICeilToScale();
  v6 = v5;

  return v6;
}

+ (double)_heightForContentSize:(id)a3 textInsets:(UIEdgeInsets)a4
{
  void *v4;
  double result;

  objc_msgSend(a1, "_textHeightForContentSize:", a3);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");

  UICeilToScale();
  return result;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (void)setContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (unint64_t)fontStyle
{
  return self->_fontStyle;
}

- (NSDictionary)_textAttributes
{
  return self->__textAttributes;
}

- (NSString)_text
{
  return self->__text;
}

- (UIEdgeInsets)_textInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->__textInsets.top;
  left = self->__textInsets.left;
  bottom = self->__textInsets.bottom;
  right = self->__textInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__text, 0);
  objc_storeStrong((id *)&self->__textAttributes, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
}

@end
