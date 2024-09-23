@implementation AVTStickerPagingCollectionViewCell

+ (id)cellIdentifier
{
  return CFSTR("AVTStickerPagerCollectionViewCell");
}

- (void)setPageContentView:(id)a3
{
  UIView *v5;
  UIView *pageContentView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIView *v11;

  v5 = (UIView *)a3;
  pageContentView = self->_pageContentView;
  if (pageContentView != v5)
  {
    v11 = v5;
    -[UIView superview](pageContentView, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerPagingCollectionViewCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v8)
      -[UIView removeFromSuperview](self->_pageContentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_pageContentView, a3);
    v5 = v11;
    if (v11)
    {
      -[UIView removeFromSuperview](v11, "removeFromSuperview");
      -[AVTStickerPagingCollectionViewCell contentView](self, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      -[UIView setFrame:](v11, "setFrame:");

      -[UIView setAutoresizingMask:](v11, "setAutoresizingMask:", 18);
      -[AVTStickerPagingCollectionViewCell contentView](self, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", v11);

      -[AVTStickerPagingCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
      v5 = v11;
    }
  }

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
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)AVTStickerPagingCollectionViewCell;
  -[AVTStickerPagingCollectionViewCell layoutSubviews](&v21, sel_layoutSubviews);
  -[AVTStickerPagingCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AVTStickerPagingCollectionViewCell additionalContentInsets](self, "additionalContentInsets");
  v13 = v5 + v12;
  v15 = v7 + v14;
  v17 = v9 - (v12 + v16);
  v19 = v11 - (v14 + v18);
  -[AVTStickerPagingCollectionViewCell pageContentView](self, "pageContentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

}

- (void)prepareForReuse
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIView *pageContentView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVTStickerPagingCollectionViewCell;
  -[AVTStickerPagingCollectionViewCell prepareForReuse](&v10, sel_prepareForReuse);
  -[AVTStickerPagingCollectionViewCell pageContentView](self, "pageContentView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[AVTStickerPagingCollectionViewCell pageContentView](self, "pageContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerPagingCollectionViewCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
    {
      -[AVTStickerPagingCollectionViewCell pageContentView](self, "pageContentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

    }
  }
  pageContentView = self->_pageContentView;
  self->_pageContentView = 0;

}

- (UIView)pageContentView
{
  return self->_pageContentView;
}

- (UIEdgeInsets)additionalContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_additionalContentInsets.top;
  left = self->_additionalContentInsets.left;
  bottom = self->_additionalContentInsets.bottom;
  right = self->_additionalContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setAdditionalContentInsets:(UIEdgeInsets)a3
{
  self->_additionalContentInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageContentView, 0);
}

@end
