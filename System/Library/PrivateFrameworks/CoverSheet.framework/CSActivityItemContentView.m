@implementation CSActivityItemContentView

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  -[CSActivityItemContentView sizeProvider](self, "sizeProvider", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentSizeForContentView:", self);
  v7 = v6;

  v8 = width;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CSActivityItemContentViewSizeProviding)sizeProvider
{
  return (CSActivityItemContentViewSizeProviding *)objc_loadWeakRetained((id *)&self->_sizeProvider);
}

- (void)setSizeProvider:(id)a3
{
  objc_storeWeak((id *)&self->_sizeProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sizeProvider);
}

@end
