@implementation SUUIIndexBarEntry

+ (id)entryWithAttributedString:(id)a3
{
  id v3;
  SUUIAttributedStringIndexBarEntry *v4;

  v3 = a3;
  v4 = -[SUUIAttributedStringIndexBarEntry initWithAttributedString:]([SUUIAttributedStringIndexBarEntry alloc], "initWithAttributedString:", v3);

  return v4;
}

+ (id)entryWithImage:(id)a3
{
  id v3;
  SUUIImageIndexBarEntry *v4;

  v3 = a3;
  v4 = -[SUUIImageIndexBarEntry initWithImage:]([SUUIImageIndexBarEntry alloc], "initWithImage:", v3);

  return v4;
}

+ (id)placeholderEntryWithSize:(CGSize)a3
{
  return -[SUUIPlaceholderIndexBarEntry initWithPlaceholderSize:]([SUUIPlaceholderIndexBarEntry alloc], "initWithPlaceholderSize:", a3.width, a3.height);
}

+ (id)systemCombinedEntry
{
  return objc_alloc_init(SUUISystemCombinedIndexBarEntry);
}

- (unint64_t)hash
{
  return (self->_entryType ^ self->_visibilityPriority) + 52314;
}

- (BOOL)isEqual:(id)a3
{
  SUUIIndexBarEntry *v4;
  BOOL v5;

  v4 = (SUUIIndexBarEntry *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && v4->_visibilityPriority == self->_visibilityPriority
      && v4->_entryType == self->_entryType;
  }

  return v5;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  if (self->_hasValidContentSize)
  {
    width = self->_contentSize.width;
    height = self->_contentSize.height;
  }
  else
  {
    -[SUUIIndexBarEntry _calculatedContentSize](self, "_calculatedContentSize");
    self->_contentSize.width = width;
    self->_contentSize.height = height;
    self->_hasValidContentSize = 1;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (NSAttributedString)entryAttributedString
{
  return 0;
}

- (UIImage)entryImage
{
  return 0;
}

- (void)setTintColor:(id)a3
{
  UIColor *v5;
  UIColor *tintColor;
  char v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  tintColor = self->_tintColor;
  if (tintColor != v5)
  {
    v8 = v5;
    v7 = -[UIColor isEqual:](tintColor, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_tintColor, a3);
      -[SUUIIndexBarEntry _tintColorDidChange](self, "_tintColorDidChange");
      v5 = v8;
    }
  }

}

- (CGSize)size
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[SUUIIndexBarEntry contentSize](self, "contentSize");
  v4 = v3 + self->_contentEdgeInsets.left + self->_contentEdgeInsets.right;
  v6 = v5 + self->_contentEdgeInsets.top + self->_contentEdgeInsets.bottom;
  result.height = v6;
  result.width = v4;
  return result;
}

- (UIColor)tintColor
{
  UIColor *tintColor;

  tintColor = self->_tintColor;
  if (tintColor)
    return tintColor;
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (CGSize)_calculatedContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_drawInRect:(CGRect)a3
{
  -[SUUIIndexBarEntry _drawContentInRect:](self, "_drawContentInRect:", a3.origin.x + self->_contentEdgeInsets.left, a3.origin.y + self->_contentEdgeInsets.top, a3.size.width - (self->_contentEdgeInsets.left + self->_contentEdgeInsets.right), a3.size.height - (self->_contentEdgeInsets.top + self->_contentEdgeInsets.bottom));
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  self->_contentEdgeInsets = a3;
}

- (int64_t)entryType
{
  return self->_entryType;
}

- (void)setEntryType:(int64_t)a3
{
  self->_entryType = a3;
}

- (int64_t)visibilityPriority
{
  return self->_visibilityPriority;
}

- (void)setVisibilityPriority:(int64_t)a3
{
  self->_visibilityPriority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end
