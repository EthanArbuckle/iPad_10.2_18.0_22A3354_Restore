@implementation CKTextMetricsRequest

- (CKTextMetricsRequest)initWithAttributedString:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  _OWORD *v8;
  __int128 v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKTextMetricsRequest;
  v5 = -[CKTextMetricsRequest init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v6;

    v8 = (_OWORD *)MEMORY[0x1E0CEB4B0];
    *((int64x2_t *)v5 + 3) = vdupq_n_s64(0x40C3880000000000uLL);
    v9 = v8[1];
    *(_OWORD *)(v5 + 72) = *v8;
    *((_QWORD *)v5 + 4) = 0;
    *((_QWORD *)v5 + 5) = 0;
    *((_QWORD *)v5 + 3) = 0x4014000000000000;
    v5[8] = 1;
    *(_OWORD *)(v5 + 88) = v9;
    *((_QWORD *)v5 + 8) = 0;
  }

  return (CKTextMetricsRequest *)v5;
}

- (double)adjustedMaximumWidth
{
  double result;

  result = self->_maximumWidth;
  if (!self->_alreadyPadded)
    return result + self->_lineFragmentPadding * 2.0;
  return result;
}

- (CGSize)adjustedMaximumSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[CKTextMetricsRequest adjustedMaximumWidth](self, "adjustedMaximumWidth");
  v4 = v3;
  -[CKTextMetricsRequest maximumHeight](self, "maximumHeight");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKTextMetricsRequest *v4;
  void *v5;
  CKTextMetricsRequest *v6;

  v4 = [CKTextMetricsRequest alloc];
  v5 = (void *)-[NSAttributedString copy](self->_attributedString, "copy");
  v6 = -[CKTextMetricsRequest initWithAttributedString:](v4, "initWithAttributedString:", v5);

  -[CKTextMetricsRequest setLineFragmentPadding:](v6, "setLineFragmentPadding:", self->_lineFragmentPadding);
  -[CKTextMetricsRequest setLineBreakMode:](v6, "setLineBreakMode:", self->_lineBreakMode);
  -[CKTextMetricsRequest setMaximumNumberOfLines:](v6, "setMaximumNumberOfLines:", self->_maximumNumberOfLines);
  -[CKTextMetricsRequest setMaximumWidth:](v6, "setMaximumWidth:", self->_maximumWidth);
  -[CKTextMetricsRequest setMaximumHeight:](v6, "setMaximumHeight:", self->_maximumHeight);
  -[CKTextMetricsRequest setAlreadyPadded:](v6, "setAlreadyPadded:", self->_alreadyPadded);
  -[CKTextMetricsRequest setContainerInset:](v6, "setContainerInset:", self->_containerInset.top, self->_containerInset.left, self->_containerInset.bottom, self->_containerInset.right);
  -[CKTextMetricsRequest setMinimumViewHeight:](v6, "setMinimumViewHeight:", self->_minimumViewHeight);
  return v6;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)lineFragmentPadding
{
  return self->_lineFragmentPadding;
}

- (void)setLineFragmentPadding:(double)a3
{
  self->_lineFragmentPadding = a3;
}

- (int64_t)lineBreakMode
{
  return self->_lineBreakMode;
}

- (void)setLineBreakMode:(int64_t)a3
{
  self->_lineBreakMode = a3;
}

- (unint64_t)maximumNumberOfLines
{
  return self->_maximumNumberOfLines;
}

- (void)setMaximumNumberOfLines:(unint64_t)a3
{
  self->_maximumNumberOfLines = a3;
}

- (double)maximumWidth
{
  return self->_maximumWidth;
}

- (void)setMaximumWidth:(double)a3
{
  self->_maximumWidth = a3;
}

- (double)maximumHeight
{
  return self->_maximumHeight;
}

- (void)setMaximumHeight:(double)a3
{
  self->_maximumHeight = a3;
}

- (BOOL)isAlreadyPadded
{
  return self->_alreadyPadded;
}

- (void)setAlreadyPadded:(BOOL)a3
{
  self->_alreadyPadded = a3;
}

- (UIEdgeInsets)containerInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_containerInset.top;
  left = self->_containerInset.left;
  bottom = self->_containerInset.bottom;
  right = self->_containerInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContainerInset:(UIEdgeInsets)a3
{
  self->_containerInset = a3;
}

- (double)minimumViewHeight
{
  return self->_minimumViewHeight;
}

- (void)setMinimumViewHeight:(double)a3
{
  self->_minimumViewHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end
