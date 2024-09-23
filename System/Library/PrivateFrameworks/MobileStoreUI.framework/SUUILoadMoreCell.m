@implementation SUUILoadMoreCell

- (SUUILoadMoreCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SUUILoadMoreCell *v4;
  SUUILoadMoreCell *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  UIActivityIndicatorView *indicator;
  double v13;
  float v14;
  double v15;
  float v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SUUILoadMoreCell;
  v4 = -[SUUITableViewCell initWithStyle:reuseIdentifier:](&v18, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SUUILoadMoreCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 2);
    indicator = v5->_indicator;
    v5->_indicator = (UIActivityIndicatorView *)v11;

    -[UIActivityIndicatorView setAutoresizingMask:](v5->_indicator, "setAutoresizingMask:", 45);
    -[UIActivityIndicatorView sizeToFit](v5->_indicator, "sizeToFit");
    -[UIActivityIndicatorView frame](v5->_indicator, "frame");
    v14 = (v8 - v13) * 0.5;
    v16 = (v10 - v15) * 0.5;
    -[UIActivityIndicatorView setFrame:](v5->_indicator, "setFrame:", floorf(v14), floorf(v16));
    objc_msgSend(v6, "addSubview:", v5->_indicator);

  }
  return v5;
}

- (void)startAnimating
{
  -[UIActivityIndicatorView startAnimating](self->_indicator, "startAnimating");
}

- (void)stopAnimating
{
  -[UIActivityIndicatorView stopAnimating](self->_indicator, "stopAnimating");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicator, 0);
}

@end
