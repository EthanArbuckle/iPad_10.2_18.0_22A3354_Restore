@implementation AVTCameraCollectionViewCell

- (AVTCameraCollectionViewCell)initWithFrame:(CGRect)a3
{
  AVTCameraCollectionViewCell *v3;
  AVTCameraItemView *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVTCameraCollectionViewCell;
  v3 = -[AVTStickerCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[AVTCameraItemView initWithFrame:]([AVTCameraItemView alloc], "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    -[AVTCameraCollectionViewCell setCameraCellView:](v3, "setCameraCellView:", v4);

    -[AVTCameraCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCameraCollectionViewCell cameraCellView](v3, "cameraCellView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTCameraCollectionViewCell;
  -[AVTStickerCollectionViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[AVTCameraCollectionViewCell updateCameraViewFrame](self, "updateCameraViewFrame");
}

- (void)updateCameraViewFrame
{
  void *v3;
  void *v4;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  -[AVTCameraCollectionViewCell cameraCellView](self, "cameraCellView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 18);

  -[AVTCameraCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v15 = CGRectInset(v14, 20.0, 20.0);
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;

  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v17 = CGRectInset(v16, fmax((width - fmin(width, 107.0)) * 0.5, 0.0), fmax((height - fmin(height, 107.0)) * 0.5, 0.0));
  v9 = v17.origin.x;
  v10 = v17.origin.y;
  v11 = v17.size.width;
  v12 = v17.size.height;
  -[AVTCameraCollectionViewCell cameraCellView](self, "cameraCellView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v9, v10, v11, v12);

}

- (UIView)cameraCellView
{
  return self->_cameraCellView;
}

- (void)setCameraCellView:(id)a3
{
  objc_storeStrong((id *)&self->_cameraCellView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraCellView, 0);
}

@end
