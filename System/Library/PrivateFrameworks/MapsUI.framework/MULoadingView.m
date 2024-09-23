@implementation MULoadingView

- (MULoadingView)initWithFrame:(CGRect)a3
{
  MULoadingView *v3;
  uint64_t v4;
  UIActivityIndicatorView *loadingIndicator;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MULoadingView;
  v3 = -[MULoadingView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    loadingIndicator = v3->_loadingIndicator;
    v3->_loadingIndicator = (UIActivityIndicatorView *)v4;

    -[UIActivityIndicatorView setHidesWhenStopped:](v3->_loadingIndicator, "setHidesWhenStopped:", 1);
    -[MULoadingView addSubview:](v3, "addSubview:", v3->_loadingIndicator);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  if (-[UIActivityIndicatorView isAnimating](self->_loadingIndicator, "isAnimating"))
    -[UIActivityIndicatorView stopAnimating](self->_loadingIndicator, "stopAnimating");
  v3.receiver = self;
  v3.super_class = (Class)MULoadingView;
  -[MULoadingView dealloc](&v3, sel_dealloc);
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MULoadingView;
  -[MULoadingView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[MULoadingView _layout](self, "_layout");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MULoadingView;
  -[MULoadingView layoutSubviews](&v3, sel_layoutSubviews);
  -[MULoadingView _layout](self, "_layout");
}

- (void)_layout
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v7;
  CGRect v8;
  CGRect v9;

  -[MULoadingView bounds](self, "bounds");
  x = v8.origin.x;
  y = v8.origin.y;
  width = v8.size.width;
  height = v8.size.height;
  v7 = CGRectGetWidth(v8) * 0.5;
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  -[UIActivityIndicatorView setCenter:](self->_loadingIndicator, "setCenter:", v7, CGRectGetHeight(v9) * 0.5);
}

- (void)beginAnimatingActivityIndicator
{
  -[UIActivityIndicatorView startAnimating](self->_loadingIndicator, "startAnimating");
}

- (void)endAnimatingActivityIndicatorWithError:(id)a3
{
  -[UIActivityIndicatorView stopAnimating](self->_loadingIndicator, "stopAnimating", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
}

@end
