@implementation DOCFittingImageView

- (void)initCommon
{
  uint64_t v3;
  void *v4;

  v3 = *MEMORY[0x24BDE58E8];
  -[DOCFittingImageView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerCurve:", v3);

  -[DOCFittingImageView setClipsToBounds:](self, "setClipsToBounds:", 1);
}

- (void)layoutSubviews
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DOCFittingImageView;
  -[DOCFittingImageView layoutSubviews](&v7, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x24BDF6950], "separatorColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");
  -[DOCFittingImageView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderColor:", v4);

  -[DOCFittingImageView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fittingImageViewDidLayout:", self);

}

- (DOCFittingImageViewDelegate)delegate
{
  return (DOCFittingImageViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  -[DOCFittingImageView fittingSize](self, "fittingSize");
  v10.receiver = self;
  v10.super_class = (Class)DOCFittingImageView;
  -[DOCFittingImageView intrinsicContentSize](&v10, sel_intrinsicContentSize);
  -[DOCFittingImageView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  DOCAdaptSizeToRect();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)fittingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_fittingSize.width;
  height = self->_fittingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImage:(id)a3
{
  id v4;
  char v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  NSObject **v24;
  NSObject *v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DOCFittingImageView;
  -[DOCFittingImageView setImage:](&v26, sel_setImage_, v4);
  v5 = -[DOCFittingImageView translatesAutoresizingMaskIntoConstraints](self, "translatesAutoresizingMaskIntoConstraints");
  if (v4 && (v5 & 1) == 0)
  {
    objc_msgSend(v4, "size");
    if (v6 <= 0.0 || (objc_msgSend(v4, "size"), v7 <= 0.0))
    {
      v24 = (NSObject **)MEMORY[0x24BE2DF90];
      v25 = *MEMORY[0x24BE2DF90];
      if (!*MEMORY[0x24BE2DF90])
      {
        DOCInitLogging();
        v25 = *v24;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[DOCFittingImageView setImage:].cold.1((uint64_t)v4, v25);
    }
    else
    {
      -[DOCFittingImageView aspectRatioConstraint](self, "aspectRatioConstraint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "multiplier");
      v10 = v9;

      -[DOCFittingImageView aspectRatioConstraint](self, "aspectRatioConstraint");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "size");
      v13 = v12;
      objc_msgSend(v4, "size");
      if (vabdd_f64(v10, v13 / v14) > 0.01 || v11 == 0)
      {
        -[DOCFittingImageView aspectRatioConstraint](self, "aspectRatioConstraint");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setActive:", 0);

        -[DOCFittingImageView widthAnchor](self, "widthAnchor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[DOCFittingImageView heightAnchor](self, "heightAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "size");
        v20 = v19;
        objc_msgSend(v4, "size");
        objc_msgSend(v17, "constraintEqualToAnchor:multiplier:", v18, v20 / v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[DOCFittingImageView setAspectRatioConstraint:](self, "setAspectRatioConstraint:", v22);

        -[DOCFittingImageView aspectRatioConstraint](self, "aspectRatioConstraint");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setActive:", 1);

      }
    }
  }

}

- (NSLayoutConstraint)aspectRatioConstraint
{
  return self->_aspectRatioConstraint;
}

- (void)setAspectRatioConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_aspectRatioConstraint, a3);
}

- (void)setThumbnail:(id)a3
{
  DOCThumbnail *v5;
  DOCThumbnail *thumbnail;
  void *v7;
  void *v8;
  DOCThumbnail *v9;

  v5 = (DOCThumbnail *)a3;
  thumbnail = self->_thumbnail;
  v9 = v5;
  if (thumbnail != v5)
  {
    -[DOCThumbnail removeListener:](thumbnail, "removeListener:", self);
    objc_storeStrong((id *)&self->_thumbnail, a3);
    -[DOCThumbnail addListener:](self->_thumbnail, "addListener:", self);
  }
  -[DOCThumbnail thumbnail](v9, "thumbnail");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCFittingImageView image](self, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v7)
    -[DOCFittingImageView setImage:](self, "setImage:", v7);

}

- (DOCThumbnail)thumbnail
{
  return self->_thumbnail;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DOCFittingImageView)initWithFrame:(CGRect)a3
{
  DOCFittingImageView *v3;
  DOCFittingImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCFittingImageView;
  v3 = -[DOCFittingImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[DOCFittingImageView initCommon](v3, "initCommon");
  return v4;
}

- (void)setFittingSize:(CGSize)a3
{
  if (self->_fittingSize.width != a3.width || self->_fittingSize.height != a3.height)
  {
    self->_fittingSize = a3;
    -[DOCFittingImageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aspectRatioConstraint, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __39__DOCFittingImageView_thumbnailLoaded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "thumbnail");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "thumbnail");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 != *(void **)(a1 + 32))
  {

LABEL_5:
    v5 = v6;
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 40), "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "setImage:", v6);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)thumbnailLoaded:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  DOCRunInMainThread();

}

- (DOCFittingImageView)initWithImage:(id)a3
{
  DOCFittingImageView *v3;
  DOCFittingImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCFittingImageView;
  v3 = -[DOCFittingImageView initWithImage:](&v6, sel_initWithImage_, a3);
  v4 = v3;
  if (v3)
    -[DOCFittingImageView initCommon](v3, "initCommon");
  return v4;
}

- (DOCFittingImageView)initWithCoder:(id)a3
{
  DOCFittingImageView *v3;
  DOCFittingImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCFittingImageView;
  v3 = -[DOCFittingImageView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[DOCFittingImageView initCommon](v3, "initCommon");
  return v4;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  v11.receiver = self;
  v11.super_class = (Class)DOCFittingImageView;
  -[DOCFittingImageView intrinsicContentSize](&v11, sel_intrinsicContentSize);
  -[DOCFittingImageView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  DOCAdaptSizeToRect();
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setImage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_2172C6000, a2, OS_LOG_TYPE_ERROR, "Attempting to assign image with zero width or height: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
