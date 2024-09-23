@implementation AVTUIAnimatingImageView

- (AVTUIAnimatingImageView)initWithFrame:(CGRect)a3
{
  AVTUIAnimatingImageView *v3;
  id v4;
  uint64_t v5;
  UIImageView *imageView;
  id v7;
  uint64_t v8;
  UIImageView *fadeInImageView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVTUIAnimatingImageView;
  v3 = -[AVTUIAnimatingImageView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[AVTUIAnimatingImageView bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v5;

    v7 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[AVTUIAnimatingImageView bounds](v3, "bounds");
    v8 = objc_msgSend(v7, "initWithFrame:");
    fadeInImageView = v3->_fadeInImageView;
    v3->_fadeInImageView = (UIImageView *)v8;

    -[UIImageView setAutoresizingMask:](v3->_imageView, "setAutoresizingMask:", 18);
    -[UIImageView setAutoresizingMask:](v3->_fadeInImageView, "setAutoresizingMask:", 18);
    -[AVTUIAnimatingImageView addSubview:](v3, "addSubview:", v3->_fadeInImageView);
    -[AVTUIAnimatingImageView addSubview:](v3, "addSubview:", v3->_imageView);
  }
  return v3;
}

- (void)setImage:(id)a3
{
  -[AVTUIAnimatingImageView setImage:animated:](self, "setImage:animated:", a3, 0);
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIImage *v7;
  void *v8;
  uint64_t v9;
  UIImage *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  UIImage *v25;

  v4 = a4;
  v7 = (UIImage *)a3;
  if (self->_image != v7)
  {
    objc_storeStrong((id *)&self->_image, a3);
    -[AVTUIAnimatingImageView fadeInImageView](self, "fadeInImageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", 0);

    v9 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __45__AVTUIAnimatingImageView_setImage_animated___block_invoke;
    v24[3] = &unk_1EA51D570;
    v24[4] = self;
    v10 = v7;
    v25 = v10;
    v11 = MEMORY[0x1DF0D0754](v24);
    v12 = (void *)v11;
    if (v4)
    {
      -[AVTUIAnimatingImageView imageView](self, "imageView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "image");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[AVTUIAnimatingImageView fadeInImageView](self, "fadeInImageView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setImage:", v10);

        -[AVTUIAnimatingImageView imageView](self, "imageView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAlpha:", 1.0);

        v17 = (void *)MEMORY[0x1E0CEABB0];
        v22[0] = v9;
        v22[1] = 3221225472;
        v22[2] = __45__AVTUIAnimatingImageView_setImage_animated___block_invoke_3;
        v22[3] = &unk_1EA51D188;
        v22[4] = self;
        v20[0] = v9;
        v20[1] = 3221225472;
        v20[2] = __45__AVTUIAnimatingImageView_setImage_animated___block_invoke_4;
        v20[3] = &unk_1EA51D3F0;
        v21 = v12;
        objc_msgSend(v17, "animateWithDuration:animations:completion:", v22, v20, 0.18);

      }
      else
      {
        -[AVTUIAnimatingImageView imageView](self, "imageView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setAlpha:", 0.0);

        -[AVTUIAnimatingImageView imageView](self, "imageView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setImage:", v10);

        v23[0] = v9;
        v23[1] = 3221225472;
        v23[2] = __45__AVTUIAnimatingImageView_setImage_animated___block_invoke_2;
        v23[3] = &unk_1EA51D188;
        v23[4] = self;
        objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v23, 0.18);
      }
    }
    else
    {
      (*(void (**)(uint64_t))(v11 + 16))(v11);
    }

  }
}

void __45__AVTUIAnimatingImageView_setImage_animated___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v3);

  objc_msgSend(*(id *)(a1 + 32), "fadeInImageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", 0);

}

void __45__AVTUIAnimatingImageView_setImage_animated___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __45__AVTUIAnimatingImageView_setImage_animated___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __45__AVTUIAnimatingImageView_setImage_animated___block_invoke_4(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)setContentMode:(int64_t)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVTUIAnimatingImageView;
  -[AVTUIAnimatingImageView setContentMode:](&v7, sel_setContentMode_);
  -[AVTUIAnimatingImageView imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentMode:", a3);

  -[AVTUIAnimatingImageView fadeInImageView](self, "fadeInImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentMode:", a3);

}

- (void)setContinuousCornerRadius:(double)a3
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3 > 0.0;
  -[AVTUIAnimatingImageView imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClipsToBounds:", v5);

  -[AVTUIAnimatingImageView fadeInImageView](self, "fadeInImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClipsToBounds:", v5);

  -[AVTUIAnimatingImageView setClipsToBounds:](self, "setClipsToBounds:", v5);
  -[AVTUIAnimatingImageView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", a3);
  -[AVTUIAnimatingImageView imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setContinuousCornerRadius:", a3);

  -[AVTUIAnimatingImageView fadeInImageView](self, "fadeInImageView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setContinuousCornerRadius:", a3);

}

- (UIImage)image
{
  return self->_image;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIImageView)fadeInImageView
{
  return self->_fadeInImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeInImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
