@implementation AXRActionCollectionViewCell

- (AXRActionCollectionViewCell)initWithFrame:(CGRect)a3
{
  AXRActionCollectionViewCell *v3;
  uint64_t v4;
  UIImageView *imageView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x24BDAC8D0];
  v27.receiver = self;
  v27.super_class = (Class)AXRActionCollectionViewCell;
  v3 = -[AXRActionCollectionViewCell initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v4;

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRActionCollectionViewCell contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v3->_imageView, "setTintColor:", v8);

    -[AXRActionCollectionViewCell contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v3->_imageView);

    v21 = (void *)MEMORY[0x24BDD1628];
    -[UIImageView centerXAnchor](v3->_imageView, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRActionCollectionViewCell contentView](v3, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "centerXAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v23;
    -[UIImageView centerYAnchor](v3->_imageView, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRActionCollectionViewCell contentView](v3, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v12;
    -[UIImageView heightAnchor](v3->_imageView, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToConstant:", 40.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v14;
    -[UIImageView widthAnchor](v3->_imageView, "widthAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView heightAnchor](v3->_imageView, "heightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v18);

    v19 = (void *)objc_opt_new();
    -[AXRActionCollectionViewCell addInteraction:](v3, "addInteraction:", v19);

  }
  return v3;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXRActionCollectionViewCell;
  -[AXRActionCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[UIImageView setImage:](self->_imageView, "setImage:", 0);
  -[AXRActionCollectionViewCell setAccessibilityLabel:](self, "setAccessibilityLabel:", 0);
}

- (void)layoutSubviews
{
  void *v3;
  CGFloat v4;
  void *v5;
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)AXRActionCollectionViewCell;
  -[AXRActionCollectionViewCell layoutSubviews](&v6, sel_layoutSubviews);
  -[AXRActionCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v4 = CGRectGetHeight(v7) * 0.5;
  -[AXRActionCollectionViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setCornerRadius:", v4);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  AXRActionCollectionViewCell *v11;
  CGAffineTransform v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  AXRActionCollectionViewCell *v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  objc_super v20;

  v3 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AXRActionCollectionViewCell;
  -[AXRActionCollectionViewCell setHighlighted:](&v20, sel_setHighlighted_);
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeScale(&v19, 1.0, 1.0);
  if (v3)
  {
    v14 = 3221225472;
    v18 = v19;
    v13 = MEMORY[0x24BDAC760];
    v15 = __46__AXRActionCollectionViewCell_setHighlighted___block_invoke;
    v16 = &unk_24F4F6CD0;
    v17 = self;
    v5 = 0.165000007;
    v6 = &v13;
  }
  else
  {
    v8 = 3221225472;
    v12 = v19;
    v7 = MEMORY[0x24BDAC760];
    v9 = __46__AXRActionCollectionViewCell_setHighlighted___block_invoke_2;
    v10 = &unk_24F4F6CD0;
    v11 = self;
    v5 = 0.25;
    v6 = &v7;
  }
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 6, v6, 0, v5, 0.0, v7, v8, v9, v10, v11, *(_OWORD *)&v12.a, *(_OWORD *)&v12.c, *(_OWORD *)&v12.tx, v13, v14, v15, v16,
    v17,
    *(_OWORD *)&v18.a,
    *(_QWORD *)&v18.c,
    *(_OWORD *)&v18.d,
    *(_QWORD *)&v18.ty);
}

uint64_t __46__AXRActionCollectionViewCell_setHighlighted___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  CGAffineTransform v5;
  CGAffineTransform v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v5.a = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&v5.c = v3;
  *(_OWORD *)&v5.tx = *(_OWORD *)(a1 + 72);
  CGAffineTransformScale(&v6, &v5, 0.970000029, 0.970000029);
  objc_msgSend(v2, "setTransform:", &v6);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.5);
}

uint64_t __46__AXRActionCollectionViewCell_setHighlighted___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "setTransform:", v5);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)setImage:(id)a3 title:(id)a4
{
  UIImageView *imageView;
  id v7;

  imageView = self->_imageView;
  v7 = a4;
  -[UIImageView setImage:](imageView, "setImage:", a3);
  -[AXRActionCollectionViewCell setAccessibilityLabel:](self, "setAccessibilityLabel:", v7);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)showsLargeContentViewer
{
  return 1;
}

- (UIImage)largeContentImage
{
  return -[UIImageView image](self->_imageView, "image");
}

- (BOOL)scalesLargeContentImage
{
  return 1;
}

- (UIEdgeInsets)largeContentImageInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x24BDF7718];
  v3 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v4 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v5 = *(double *)(MEMORY[0x24BDF7718] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
