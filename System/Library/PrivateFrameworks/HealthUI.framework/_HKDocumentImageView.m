@implementation _HKDocumentImageView

- (_HKDocumentImageView)initWithImage:(id)a3
{
  id v4;
  char *v5;
  _HKDocumentImageView *v6;
  uint64_t v7;
  UIImageView *imageView;
  double v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_HKDocumentImageView;
  v5 = -[_HKDocumentImageView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = (_HKDocumentImageView *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 424) = 0u;
    *(_OWORD *)(v5 + 440) = 0u;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v4);
    imageView = v6->_imageView;
    v6->_imageView = (UIImageView *)v7;

    -[UIImageView setContentMode:](v6->_imageView, "setContentMode:", 1);
    -[_HKDocumentImageView addSubview:](v6, "addSubview:", v6->_imageView);
    LODWORD(v9) = 1148846080;
    -[_HKDocumentImageView setContentHuggingPriority:forAxis:](v6, "setContentHuggingPriority:forAxis:", 0, v9);
    LODWORD(v10) = 1148846080;
    -[_HKDocumentImageView setContentCompressionResistancePriority:forAxis:](v6, "setContentCompressionResistancePriority:forAxis:", 0, v10);
  }

  return v6;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[UIImageView intrinsicContentSize](self->_imageView, "intrinsicContentSize");
  v4 = v3 + self->_margins.top + self->_margins.bottom;
  v6 = fmin(v5, 65.0) + self->_margins.left + self->_margins.right;
  result.height = v4;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;

  -[_HKDocumentImageView frame](self, "frame");
  -[UIImageView setFrame:](self->_imageView, "setFrame:", self->_margins.left, self->_margins.top, v3 - self->_margins.left - self->_margins.right, v4 - self->_margins.top - self->_margins.bottom);
}

- (UIEdgeInsets)margins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_margins.top;
  left = self->_margins.left;
  bottom = self->_margins.bottom;
  right = self->_margins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMargins:(UIEdgeInsets)a3
{
  self->_margins = a3;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
