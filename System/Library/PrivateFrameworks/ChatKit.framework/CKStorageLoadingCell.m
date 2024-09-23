@implementation CKStorageLoadingCell

- (CKStorageLoadingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKStorageLoadingCell *v4;
  uint64_t v5;
  UIActivityIndicatorView *spinner;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKStorageLoadingCell;
  v4 = -[CKStorageLoadingCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    spinner = v4->_spinner;
    v4->_spinner = (UIActivityIndicatorView *)v5;

    -[UIActivityIndicatorView startAnimating](v4->_spinner, "startAnimating");
    -[CKStorageLoadingCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4->_spinner);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKStorageLoadingCell;
  -[CKStorageLoadingCell layoutSubviews](&v10, sel_layoutSubviews);
  -[CKStorageLoadingCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", (v5 - v8) * 0.5, (v7 - v9) * 0.5);
}

+ (id)reuseIdentifier
{
  return CFSTR("CKStorageLoadingCell");
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
