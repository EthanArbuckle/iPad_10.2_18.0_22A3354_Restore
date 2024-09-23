@implementation MFSendLaterHeaderCollectionViewHelper

- (MFSendLaterHeaderCollectionViewHelper)initWithWidth:(double)a3 layoutMargins:(UIEdgeInsets)a4 viewScale:(double)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  MFSendLaterHeaderCollectionViewHelper *result;
  objc_super v12;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v12.receiver = self;
  v12.super_class = (Class)MFSendLaterHeaderCollectionViewHelper;
  result = -[MFSendLaterHeaderCollectionViewHelper init](&v12, sel_init);
  if (result)
  {
    result->_layoutMargins.top = top;
    result->_layoutMargins.left = left;
    result->_layoutMargins.bottom = bottom;
    result->_layoutMargins.right = right;
    result->_width = a3;
    result->_viewScale = a5;
  }
  return result;
}

- (void)precalculateWidthsWithDescription:(id)a3
{
  id v4;
  uint64_t i;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  v10 = a3;
  -[MFSendLaterHeaderCollectionViewHelper setSendLaterLabelWidth:](self, "setSendLaterLabelWidth:", -[MFSendLaterHeaderCollectionViewHelper _widthOfString:](self, v10));
  v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v4, "setDay:", 30);
  objc_msgSend(v4, "setYear:", 2888);
  objc_msgSend(v4, "setHour:", 12);
  objc_msgSend(v4, "setMinute:", 0);
  for (i = 1; i != 13; ++i)
  {
    objc_msgSend(v4, "setMonth:", i);
    -[MFSendLaterHeaderCollectionViewHelper _convertDateToString:]((uint64_t)self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MFSendLaterHeaderCollectionViewHelper _widthOfString:](self, v6);
    -[MFSendLaterHeaderCollectionViewHelper longestDateWidth](self, "longestDateWidth");
    if (v7 >= v8)
      v8 = v7;
    -[MFSendLaterHeaderCollectionViewHelper setLongestDateWidth:](self, "setLongestDateWidth:", v8);

  }
  -[MFSendLaterHeaderCollectionViewHelper _convertTimeToString:]((uint64_t)self, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFSendLaterHeaderCollectionViewHelper setLongestTimeWidth:](self, "setLongestTimeWidth:", -[MFSendLaterHeaderCollectionViewHelper _widthOfString:](self, v9));

}

- (double)_widthOfString:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v10 = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v3, v5);
    objc_msgSend(v6, "size");
    objc_msgSend(a1, "viewScale");
    UIRoundToScale();
    v8 = v7;

  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (id)_convertDateToString:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateFromComponents:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v5, 2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_convertTimeToString:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateFromComponents:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v5, 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)willContentTruncate
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[MFSendLaterHeaderCollectionViewHelper layoutMargins](self, "layoutMargins");
  v4 = v3 + 48.0;
  -[MFSendLaterHeaderCollectionViewHelper layoutMargins](self, "layoutMargins");
  v6 = v4 + v5;
  -[MFSendLaterHeaderCollectionViewHelper sendLaterLabelWidth](self, "sendLaterLabelWidth");
  v8 = v7;
  -[MFSendLaterHeaderCollectionViewHelper longestDateWidth](self, "longestDateWidth");
  v10 = v8 + v9;
  -[MFSendLaterHeaderCollectionViewHelper longestTimeWidth](self, "longestTimeWidth");
  v12 = v6 + v10 + v11 + 4.0 + 8.0 + 3.0;
  -[MFSendLaterHeaderCollectionViewHelper width](self, "width");
  return v12 >= v13;
}

- (BOOL)updateLayoutMarginsIfNeeded:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[MFSendLaterHeaderCollectionViewHelper layoutMargins](self, "layoutMargins");
  v9 = left - v8;
  v10 = -(left - v8);
  if (v9 < 0.0)
    v9 = v10;
  if (v9 < 2.22044605e-16)
  {
    -[MFSendLaterHeaderCollectionViewHelper layoutMargins](self, "layoutMargins");
    v12 = right - v11;
    if (right - v11 < 0.0)
      v12 = -(right - v11);
    if (v12 < 2.22044605e-16)
      return 0;
  }
  -[MFSendLaterHeaderCollectionViewHelper setLayoutMargins:](self, "setLayoutMargins:", top, left, bottom, right);
  return 1;
}

- (BOOL)updateWidthIfNeeded:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[MFSendLaterHeaderCollectionViewHelper width](self, "width");
  v6 = v5 - a3;
  if (v6 >= 0.0)
    v7 = v6;
  else
    v7 = -v6;
  if (v7 >= 2.22044605e-16)
    -[MFSendLaterHeaderCollectionViewHelper setWidth:](self, "setWidth:", a3);
  return v7 >= 2.22044605e-16;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (UIEdgeInsets)layoutMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_layoutMargins.top;
  left = self->_layoutMargins.left;
  bottom = self->_layoutMargins.bottom;
  right = self->_layoutMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  self->_layoutMargins = a3;
}

- (double)viewScale
{
  return self->_viewScale;
}

- (void)setViewScale:(double)a3
{
  self->_viewScale = a3;
}

- (double)sendLaterLabelWidth
{
  return self->_sendLaterLabelWidth;
}

- (void)setSendLaterLabelWidth:(double)a3
{
  self->_sendLaterLabelWidth = a3;
}

- (double)longestDateWidth
{
  return self->_longestDateWidth;
}

- (void)setLongestDateWidth:(double)a3
{
  self->_longestDateWidth = a3;
}

- (double)longestTimeWidth
{
  return self->_longestTimeWidth;
}

- (void)setLongestTimeWidth:(double)a3
{
  self->_longestTimeWidth = a3;
}

@end
