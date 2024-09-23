@implementation CKTextTighteningLabel

- (void)layoutSubviews
{
  objc_super v3;

  -[CKTextTighteningLabel _updateTightenedAttributedText](self, "_updateTightenedAttributedText");
  v3.receiver = self;
  v3.super_class = (Class)CKTextTighteningLabel;
  -[CKTextTighteningLabel layoutSubviews](&v3, sel_layoutSubviews);
}

- (void)setManagedText:(id)a3
{
  id v4;
  __CFString *v5;
  NSString *v6;
  NSString *managedText;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4)
  {
    objc_msgSend(v4, "trimmedString");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1E276D870;
  }
  if (!-[NSString isEqualToString:](self->_managedText, "isEqualToString:", v5))
  {
    v6 = (NSString *)-[__CFString copy](v5, "copy");
    managedText = self->_managedText;
    self->_managedText = v6;

    -[CKTextTighteningLabel _clearTextTighteningCaches](self, "_clearTextTighteningCaches");
    -[CKTextTighteningLabel setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKTextTighteningLabel;
  -[CKTextTighteningLabel traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CKTextTighteningLabel _clearTextTighteningCaches](self, "_clearTextTighteningCaches");
  -[CKTextTighteningLabel setNeedsLayout](self, "setNeedsLayout");
}

- (void)setFont:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;

  v4 = a3;
  -[CKTextTighteningLabel font](self, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  v7.receiver = self;
  v7.super_class = (Class)CKTextTighteningLabel;
  -[CKTextTighteningLabel setFont:](&v7, sel_setFont_, v4);

  if ((v6 & 1) == 0)
  {
    -[CKTextTighteningLabel _clearTextTighteningCaches](self, "_clearTextTighteningCaches");
    -[CKTextTighteningLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_clearTextTighteningCaches
{
  NSAttributedString *tightenedAttributedText;
  NSAttributedString *untightenedAttributedText;

  tightenedAttributedText = self->_tightenedAttributedText;
  self->_tightenedAttributedText = 0;

  self->_tightenedAttributedTextBoundsWidth = 0.0;
  untightenedAttributedText = self->_untightenedAttributedText;
  self->_untightenedAttributedText = 0;

}

- (void)_updateTightenedAttributedText
{
  double v3;
  double v4;

  -[CKTextTighteningLabel bounds](self, "bounds");
  -[CKTextTighteningLabel _updateAttributedTextForFittingSize:boundsSize:](self, "_updateAttributedTextForFittingSize:boundsSize:", 0, v3, v4);
}

- (id)_attributedTextForFittingSize:(BOOL)a3 boundsSize:(CGSize)a4
{
  double height;
  double width;
  _BOOL8 v6;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v8 = self->_managedText;
  -[CKTextTighteningLabel traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredContentSizeCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKTextTighteningLabel font](self, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_attributedStringWithText:font:sizeCategory:textRect:forFittingSize:", v8, v11, v10, v6, 0.0, 0.0, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_updateAttributedTextForFittingSize:(BOOL)a3 boundsSize:(CGSize)a4
{
  CGFloat width;
  NSAttributedString **p_untightenedAttributedText;
  NSAttributedString *untightenedAttributedText;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  NSAttributedString *v11;
  NSAttributedString *v12;

  width = a4.width;
  if (a3)
  {
    p_untightenedAttributedText = &self->_untightenedAttributedText;
    untightenedAttributedText = self->_untightenedAttributedText;
    v8 = &OBJC_IVAR___CKTextTighteningLabel__untightenedAttributedTextBoundsWidth;
    if (!untightenedAttributedText || vabdd_f64(self->_untightenedAttributedTextBoundsWidth, a4.width) > 2.22044605e-16)
    {
      v9 = 1;
LABEL_8:
      -[CKTextTighteningLabel _attributedTextForFittingSize:boundsSize:](self, "_attributedTextForFittingSize:boundsSize:", v9, a4.width, a4.height);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *p_untightenedAttributedText;
      *p_untightenedAttributedText = (NSAttributedString *)v10;

      *(CGFloat *)((char *)&self->super.super.super.super.isa + *v8) = width;
      untightenedAttributedText = *p_untightenedAttributedText;
    }
  }
  else
  {
    p_untightenedAttributedText = &self->_tightenedAttributedText;
    untightenedAttributedText = self->_tightenedAttributedText;
    v8 = &OBJC_IVAR___CKTextTighteningLabel__tightenedAttributedTextBoundsWidth;
    if (!untightenedAttributedText || vabdd_f64(self->_tightenedAttributedTextBoundsWidth, a4.width) > 2.22044605e-16)
    {
      v9 = 0;
      goto LABEL_8;
    }
  }
  v12 = untightenedAttributedText;
  -[CKTextTighteningLabel setAttributedText:](self, "setAttributedText:", v12);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CKTextTighteningLabel attributedText](self, "attributedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTextTighteningLabel _updateAttributedTextForFittingSize:boundsSize:](self, "_updateAttributedTextForFittingSize:boundsSize:", 1, width, height);
  v13.receiver = self;
  v13.super_class = (Class)CKTextTighteningLabel;
  -[CKTextTighteningLabel sizeThatFits:](&v13, sel_sizeThatFits_, width, height);
  v8 = v7;
  v10 = v9;
  -[CKTextTighteningLabel setAttributedText:](self, "setAttributedText:", v6);

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

+ (id)_attributedStringWithText:(id)a3 font:(id)a4 sizeCategory:(id)a5 textRect:(CGRect)a6 forFittingSize:(BOOL)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  id v20;
  double v21;
  unint64_t v22;
  unint64_t v23;
  double v24;
  void *v25;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v15 = a3;
  v16 = a4;
  v17 = (NSString *)a5;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v15);
  if (objc_msgSend(v15, "length"))
  {
    v19 = objc_msgSend(v15, "length");
    objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v16, 0, v19);
    v20 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    objc_msgSend(v20, "setAlignment:", 1);
    objc_msgSend(v20, "setAllowsDefaultTighteningForTruncation:", 1);
    objc_msgSend(v20, "setLineBreakMode:", 4);
    objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v20, 0, v19);
    if (!a7 && width > 0.0 && (objc_msgSend(a1, "attributedText:fitsInRect:", v18, x, y, width, height) & 1) == 0)
    {
      if (v17
        && UIContentSizeCategoryCompareToCategory(v17, (UIContentSizeCategory)*MEMORY[0x1E0CEB420]) == NSOrderedDescending)
      {
        v21 = 1.5;
        v22 = 30;
      }
      else
      {
        v21 = 3.0;
        v22 = 20;
      }
      v23 = 0;
      while (1)
      {
        ++v23;
        objc_msgSend(a1, "applyKerning:whitespaceKerning:toAttributedString:", v18, (double)v23 * -0.05, v21 * ((double)v23 * -0.05));
        if ((objc_msgSend(a1, "attributedText:fitsInRect:", v18, x, y, width, height) & 1) != 0)
          break;
        if (v22 == v23)
        {
          v24 = (double)((unint64_t)((double)v22 * 0.9) + 1) * -0.05;
          objc_msgSend(a1, "applyKerning:whitespaceKerning:toAttributedString:", v18, v24, v21 * v24);
          break;
        }
      }
    }

  }
  v25 = (void *)objc_msgSend(v18, "copy");

  return v25;
}

+ (BOOL)attributedText:(id)a3 fitsInRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGRect v10;
  CGRect v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(a3, "boundingRectWithSize:options:context:", 0, 0, 1.79769313e308, 1.79769313e308);
  v8 = CGRectGetWidth(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  return v8 <= CGRectGetWidth(v11);
}

+ (void)applyKerning:(double)a3 whitespaceKerning:(double)a4 toAttributedString:(id)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a5;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v20, "length");
  v10 = objc_msgSend(v8, "rangeOfCharacterFromSet:", v7);
  v12 = v11;
  v13 = 0;
  v14 = *MEMORY[0x1E0DC1150];
  while (1)
  {
    v15 = v10 == 0x7FFFFFFFFFFFFFFFLL ? v9 : v10;
    v16 = v15 - v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAttribute:value:range:", v14, v17, v13, v16);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    objc_msgSend(v20, "addAttribute:value:range:", v14, v18, v10, v12);
    v13 = v10 + v12;
    v10 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:range:", v7, 0, v10 + v12, v9 - (v10 + v12));
    v12 = v19;

  }
}

- (NSString)managedText
{
  return self->_managedText;
}

- (NSAttributedString)tightenedAttributedText
{
  return self->_tightenedAttributedText;
}

- (void)setTightenedAttributedText:(id)a3
{
  objc_storeStrong((id *)&self->_tightenedAttributedText, a3);
}

- (double)tightenedAttributedTextBoundsWidth
{
  return self->_tightenedAttributedTextBoundsWidth;
}

- (void)setTightenedAttributedTextBoundsWidth:(double)a3
{
  self->_tightenedAttributedTextBoundsWidth = a3;
}

- (NSAttributedString)untightenedAttributedText
{
  return self->_untightenedAttributedText;
}

- (void)setUntightenedAttributedText:(id)a3
{
  objc_storeStrong((id *)&self->_untightenedAttributedText, a3);
}

- (double)untightenedAttributedTextBoundsWidth
{
  return self->_untightenedAttributedTextBoundsWidth;
}

- (void)setUntightenedAttributedTextBoundsWidth:(double)a3
{
  self->_untightenedAttributedTextBoundsWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_untightenedAttributedText, 0);
  objc_storeStrong((id *)&self->_tightenedAttributedText, 0);
  objc_storeStrong((id *)&self->_managedText, 0);
}

@end
