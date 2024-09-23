@implementation MKCollectionBatchCell

- (MKCollectionBatchCell)initWithFrame:(CGRect)a3
{
  MKCollectionBatchCell *v3;
  MKCollectionBatchCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKCollectionBatchCell;
  v3 = -[MKCollectionBatchCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MKCollectionBatchCell setupSubviews](v3, "setupSubviews");
  return v4;
}

- (void)setupSubviews
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *loadingView;
  void *v5;

  v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  loadingView = self->_loadingView;
  self->_loadingView = v3;

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKCollectionBatchCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_loadingView);

  -[MKCollectionBatchCell setupConstraitns](self, "setupConstraitns");
}

- (void)setupConstraitns
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[UIActivityIndicatorView centerXAnchor](self->_loadingView, "centerXAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKCollectionBatchCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerXAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  -[UIActivityIndicatorView centerYAnchor](self->_loadingView, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKCollectionBatchCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateConstraints:", v12);

}

- (void)startedLoadingBatch
{
  if (!-[UIActivityIndicatorView isAnimating](self->_loadingView, "isAnimating"))
    -[UIActivityIndicatorView startAnimating](self->_loadingView, "startAnimating");
}

- (void)finishedLoadingBatch
{
  if (-[UIActivityIndicatorView isAnimating](self->_loadingView, "isAnimating"))
    -[UIActivityIndicatorView stopAnimating](self->_loadingView, "stopAnimating");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingView, 0);
}

@end
