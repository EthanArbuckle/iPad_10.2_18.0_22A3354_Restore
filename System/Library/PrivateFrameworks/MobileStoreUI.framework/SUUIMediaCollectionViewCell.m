@implementation SUUIMediaCollectionViewCell

- (SUUIEmbeddedMediaView)mediaView
{
  SUUIEmbeddedMediaView *mediaView;
  void *v4;
  SUUIEmbeddedMediaView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  SUUIEmbeddedMediaView *v10;
  SUUIEmbeddedMediaView *v11;
  SUUIEmbeddedMediaView *v12;
  void *v13;

  mediaView = self->_mediaView;
  if (!mediaView)
  {
    -[SUUIMediaCollectionViewCell contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [SUUIEmbeddedMediaView alloc];
    objc_msgSend(v4, "bounds");
    v10 = -[SUUIEmbeddedMediaView initWithFrame:](v5, "initWithFrame:", v6 + self->_contentInset.left, v7 + self->_contentInset.top, v8 - (self->_contentInset.left + self->_contentInset.right), v9 - (self->_contentInset.top + self->_contentInset.bottom));
    v11 = self->_mediaView;
    self->_mediaView = v10;

    v12 = self->_mediaView;
    -[SUUIMediaCollectionViewCell backgroundColor](self, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIEmbeddedMediaView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    objc_msgSend(v4, "addSubview:", self->_mediaView);
    mediaView = self->_mediaView;
  }
  return mediaView;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SUUIMediaCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  SUUIEmbeddedMediaView *mediaView;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIMediaCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v9, sel_layoutSubviews);
  mediaView = self->_mediaView;
  -[SUUIMediaCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SUUIEmbeddedMediaView setFrame:](mediaView, "setFrame:", v5 + self->_contentInset.left, v6 + self->_contentInset.top, v7 - (self->_contentInset.left + self->_contentInset.right), v8 - (self->_contentInset.top + self->_contentInset.bottom));

}

- (void)setBackgroundColor:(id)a3
{
  SUUIEmbeddedMediaView *mediaView;
  id v5;
  objc_super v6;

  mediaView = self->_mediaView;
  v5 = a3;
  -[SUUIEmbeddedMediaView setBackgroundColor:](mediaView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIMediaCollectionViewCell;
  -[SUUICollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaView, 0);
}

@end
