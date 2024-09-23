@implementation MFComposeDropPreviewView

- (MFComposeDropPreviewView)initWithFrame:(CGRect)a3
{
  MFComposeDropPreviewView *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MFComposeDropPreviewView;
  v3 = -[MFComposeDropPreviewView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "mailGeneralBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeDropPreviewView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[MFComposeDropPreviewView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[MFComposeDropPreviewView setOpaque:](v3, "setOpaque:", 1);
    v5 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[MFComposeDropPreviewView bounds](v3, "bounds");
    v6 = (void *)objc_msgSend(v5, "initWithFrame:");
    -[MFComposeDropPreviewView setImageView:](v3, "setImageView:", v6);

    -[MFComposeDropPreviewView imageView](v3, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentMode:", 0);

    -[MFComposeDropPreviewView imageView](v3, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAutoresizingMask:", 18);

    -[MFComposeDropPreviewView imageView](v3, "imageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeDropPreviewView addSubview:](v3, "addSubview:", v9);

  }
  return v3;
}

- (void)setPreviewView:(id)a3
{
  UIView *v5;
  void *v6;
  UIView *v7;
  _QWORD v8[4];
  UIView *v9;
  MFComposeDropPreviewView *v10;

  v5 = (UIView *)a3;
  if (self->_previewView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_previewView, a3);
    v6 = (void *)MEMORY[0x1E0DC3F10];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__MFComposeDropPreviewView_setPreviewView___block_invoke;
    v8[3] = &unk_1E5A65430;
    v9 = v7;
    v10 = self;
    objc_msgSend(v6, "performWithoutAnimation:", v8);

    v5 = v7;
  }

}

uint64_t __43__MFComposeDropPreviewView_setPreviewView___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  objc_msgSend(*(id *)(a1 + 32), "setAutoresizingMask:", 18);
  return objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(a1 + 32));
}

- (void)setPreviewClippingPath:(id)a3
{
  UIBezierPath *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v28;
  CGFloat v29;
  __int128 v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double MidY;
  double v37;
  double MidX;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v5 = (UIBezierPath *)a3;
  if (self->_previewClippingPath != v5)
  {
    objc_storeStrong((id *)&self->_previewClippingPath, a3);
    if (self->_previewClippingPath)
    {
      -[MFComposeDropPreviewView previewClippingPath](self, "previewClippingPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bounds");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

      -[MFComposeDropPreviewView previewView](self, "previewView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "convertRect:toView:", self, v8, v10, v12, v14);
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;

      -[MFComposeDropPreviewView bounds](self, "bounds");
      x = v44.origin.x;
      y = v44.origin.y;
      width = v44.size.width;
      height = v44.size.height;
      MidX = CGRectGetMidX(v44);
      v45.origin.x = v17;
      v45.origin.y = v19;
      v45.size.width = v21;
      v45.size.height = v23;
      v37 = CGRectGetMidX(v45);
      v46.origin.x = x;
      v46.origin.y = y;
      v46.size.width = width;
      v46.size.height = height;
      MidY = CGRectGetMidY(v46);
      v47.origin.x = v17;
      v47.origin.y = v19;
      v47.size.width = v21;
      v47.size.height = v23;
      v35 = CGRectGetMidY(v47);
      v48.origin.x = x;
      v48.origin.y = y;
      v48.size.width = width;
      v48.size.height = height;
      v34 = CGRectGetWidth(v48);
      v49.origin.x = v17;
      v49.origin.y = v19;
      v49.size.width = v21;
      v49.size.height = v23;
      v33 = CGRectGetWidth(v49);
      v50.origin.x = x;
      v50.origin.y = y;
      v50.size.width = width;
      v50.size.height = height;
      v28 = CGRectGetHeight(v50);
      v51.origin.x = v17;
      v51.origin.y = v19;
      v51.size.width = v21;
      v51.size.height = v23;
      v29 = CGRectGetHeight(v51);
      *(_QWORD *)&v30 = -1;
      *((_QWORD *)&v30 + 1) = -1;
      *(_OWORD *)&v43.c = v30;
      *(_OWORD *)&v43.tx = v30;
      *(_OWORD *)&v43.a = v30;
      v31 = v28 / v29;
      CGAffineTransformMakeScale(&v43, v34 / v33, v28 / v29);
      v41 = v43;
      CGAffineTransformTranslate(&v42, &v41, (MidX - v37) / (v34 / v33), (MidY - v35) / v31);
      v43 = v42;
      v40 = v42;
      -[MFComposeDropPreviewView previewView](self, "previewView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v40;
      objc_msgSend(v32, "setTransform:", &v39);

    }
  }

}

- (void)setFinalImage:(id)a3
{
  UIImage *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v5 = (UIImage *)a3;
  if (self->_finalImage != v5)
  {
    objc_storeStrong((id *)&self->_finalImage, a3);
    -[MFComposeDropPreviewView imageView](self, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v5);

    -[MFComposeDropPreviewView previewView](self, "previewView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __42__MFComposeDropPreviewView_setFinalImage___block_invoke;
      v8[3] = &unk_1E5A65480;
      v8[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v8, 0.25);
    }
  }

}

void __42__MFComposeDropPreviewView_setFinalImage___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "previewView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (UIView)previewView
{
  return self->_previewView;
}

- (UIBezierPath)previewClippingPath
{
  return self->_previewClippingPath;
}

- (UIImage)finalImage
{
  return self->_finalImage;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_finalImage, 0);
  objc_storeStrong((id *)&self->_previewClippingPath, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
}

@end
