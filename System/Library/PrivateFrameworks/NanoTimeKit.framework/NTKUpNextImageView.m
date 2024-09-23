@implementation NTKUpNextImageView

- (NTKUpNextImageView)initWithFrame:(CGRect)a3 parentCell:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  NTKUpNextImageView *v10;
  NTKUpNextImageView *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  UIImageView *foregroundImageView;
  uint64_t v19;
  UIImageView *foregroundAccentImageView;
  uint64_t v21;
  UIImageView *backgroundImageView;
  uint64_t v23;
  UIImageView *overrideImageView;
  uint64_t v25;
  CALayer *foregroundAccentBackdrop;
  void *v27;
  void *v28;
  objc_super v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v30.receiver = self;
  v30.super_class = (Class)NTKUpNextImageView;
  v10 = -[NTKUpNextImageView initWithFrame:](&v30, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_parentCell, v9);
    v12 = objc_alloc(MEMORY[0x1E0DC3890]);
    v13 = *MEMORY[0x1E0C9D648];
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v17 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], v14, v15, v16);
    foregroundImageView = v11->_foregroundImageView;
    v11->_foregroundImageView = (UIImageView *)v17;

    -[UIImageView setContentMode:](v11->_foregroundImageView, "setContentMode:", 4);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v13, v14, v15, v16);
    foregroundAccentImageView = v11->_foregroundAccentImageView;
    v11->_foregroundAccentImageView = (UIImageView *)v19;

    -[UIImageView setContentMode:](v11->_foregroundAccentImageView, "setContentMode:", 4);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v13, v14, v15, v16);
    backgroundImageView = v11->_backgroundImageView;
    v11->_backgroundImageView = (UIImageView *)v21;

    -[UIImageView setContentMode:](v11->_backgroundImageView, "setContentMode:", 4);
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v13, v14, v15, v16);
    overrideImageView = v11->_overrideImageView;
    v11->_overrideImageView = (UIImageView *)v23;

    -[UIImageView setContentMode:](v11->_overrideImageView, "setContentMode:", 4);
    -[NTKUpNextImageView addSubview:](v11, "addSubview:", v11->_backgroundImageView);
    -[NTKUpNextImageView addSubview:](v11, "addSubview:", v11->_foregroundImageView);
    -[NTKUpNextImageView addSubview:](v11, "addSubview:", v11->_foregroundAccentImageView);
    -[NTKUpNextImageView addSubview:](v11, "addSubview:", v11->_overrideImageView);
    v25 = objc_opt_new();
    foregroundAccentBackdrop = v11->_foregroundAccentBackdrop;
    v11->_foregroundAccentBackdrop = (CALayer *)v25;

    -[NTKUpNextImageView layer](v11, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "insertSublayer:atIndex:", v11->_foregroundAccentBackdrop, 0);

    objc_msgSend(v9, "addContentsLayerProvider:", v11);
    -[NTKUpNextImageView layer](v11, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAllowsGroupBlending:", 0);

  }
  return v11;
}

- (void)setCompositingFilter:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_storeStrong((id *)&self->_compositingFilter, a3);
  -[CALayer setHidden:](self->_foregroundAccentBackdrop, "setHidden:", self->_compositingFilter == 0);
  -[UIImageView layer](self->_foregroundAccentImageView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCompositingFilter:", v7);

  }
  else
  {
    objc_msgSend(v5, "setCompositingFilter:", 0);
  }

  -[UIImageView layer](self->_backgroundImageView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCompositingFilter:", v10);

  }
  else
  {
    objc_msgSend(v8, "setCompositingFilter:", 0);
  }

}

- (id)contentsLayer
{
  return self->_foregroundAccentBackdrop;
}

- (CGRect)contentsLayerBoundsForLayout:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id WeakRetained;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  objc_msgSend(a3, "unitFrameOnScreen");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentCell);
  objc_msgSend(WeakRetained, "bounds");
  v14 = v13;
  v16 = v15;

  -[NTKUpNextImageView frame](self, "frame");
  v18 = v5 + v17 / v14 * v9;
  v20 = v7 + v19 / v16 * v11;
  v22 = v9 * (v21 / v14);
  v24 = v11 * (v23 / v16);
  result.size.height = v24;
  result.size.width = v22;
  result.origin.y = v20;
  result.origin.x = v18;
  return result;
}

- (CGSize)intrinsicContentSize
{
  UIImage *overrideImage;
  double v4;
  double v5;
  double v6;
  double v7;
  void (**v8)(void *, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD aBlock[5];
  uint64_t v20;
  double *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  CGSize result;

  overrideImage = self->_overrideImage;
  if (!overrideImage)
  {
    if (!self->_imageProvider)
    {
      v5 = *MEMORY[0x1E0DC55F0];
      v7 = *MEMORY[0x1E0DC55F0];
      goto LABEL_12;
    }
    v20 = 0;
    v21 = (double *)&v20;
    v22 = 0x3010000000;
    v23 = &unk_1B75A3F6B;
    v24 = *MEMORY[0x1E0C9D820];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __42__NTKUpNextImageView_intrinsicContentSize__block_invoke;
    aBlock[3] = &unk_1E6BCEEF8;
    aBlock[4] = &v20;
    v8 = (void (**)(void *, void *))_Block_copy(aBlock);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIImageView image](self->_backgroundImageView, "image");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v9);

      -[UIImageView image](self->_foregroundImageView, "image");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v10);

      -[UIImageView image](self->_foregroundAccentImageView, "image");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v11);
    }
    else
    {
      if (!-[NTKUpNextImageView _hasMultipartImages](self, "_hasMultipartImages"))
      {
        -[CLKImageProvider onePieceImage](self->_imageProvider, "onePieceImage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "size");
        v5 = v15;
        v7 = v16;

        goto LABEL_11;
      }
      -[CLKImageProvider twoPieceImageBackground](self->_imageProvider, "twoPieceImageBackground");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v12);

      -[CLKImageProvider twoPieceImageForeground](self->_imageProvider, "twoPieceImageForeground");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v13);

      -[CLKImageProvider foregroundAccentImage](self->_imageProvider, "foregroundAccentImage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v11);
    }

    v5 = v21[4];
    v7 = v21[5];
LABEL_11:

    _Block_object_dispose(&v20, 8);
    goto LABEL_12;
  }
  -[UIImage size](overrideImage, "size");
  v5 = v4;
  v7 = v6;
LABEL_12:
  v17 = v5;
  v18 = v7;
  result.height = v18;
  result.width = v17;
  return result;
}

void __42__NTKUpNextImageView_intrinsicContentSize__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (a2)
  {
    v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
    v4 = a2;
    objc_msgSend(v4, "size");
    if (v3 >= v5)
      v5 = v3;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = v5;
    v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v4, "size");
    v8 = v7;

    if (v6 >= v8)
      v9 = v6;
    else
      v9 = v8;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = v9;
  }
}

- (void)layoutSubviews
{
  UIImageView *overrideImageView;
  UIImageView *foregroundAccentImageView;
  UIImageView *foregroundImageView;
  UIImageView *backgroundImageView;
  CALayer *foregroundAccentBackdrop;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKUpNextImageView;
  -[NTKUpNextImageView layoutSubviews](&v8, sel_layoutSubviews);
  overrideImageView = self->_overrideImageView;
  -[NTKUpNextImageView bounds](self, "bounds");
  -[UIImageView setFrame:](overrideImageView, "setFrame:");
  foregroundAccentImageView = self->_foregroundAccentImageView;
  -[NTKUpNextImageView bounds](self, "bounds");
  -[UIImageView setFrame:](foregroundAccentImageView, "setFrame:");
  foregroundImageView = self->_foregroundImageView;
  -[NTKUpNextImageView bounds](self, "bounds");
  -[UIImageView setFrame:](foregroundImageView, "setFrame:");
  backgroundImageView = self->_backgroundImageView;
  -[NTKUpNextImageView bounds](self, "bounds");
  -[UIImageView setFrame:](backgroundImageView, "setFrame:");
  foregroundAccentBackdrop = self->_foregroundAccentBackdrop;
  -[NTKUpNextImageView bounds](self, "bounds");
  -[CALayer setFrame:](foregroundAccentBackdrop, "setFrame:");
}

- (BOOL)_hasMultipartImages
{
  char isKindOfClass;
  CLKImageProvider *imageProvider;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  imageProvider = self->_imageProvider;
  if ((isKindOfClass & 1) != 0)
    return -[CLKImageProvider isTwoPiece](imageProvider, "isTwoPiece");
  -[CLKImageProvider twoPieceImageBackground](imageProvider, "twoPieceImageBackground");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CLKImageProvider twoPieceImageForeground](self->_imageProvider, "twoPieceImageForeground");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  -[CLKImageProvider foregroundAccentImage](self->_imageProvider, "foregroundAccentImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9 != 0;

  if (v6)
  {
    v7 = 0;
    goto LABEL_8;
  }
LABEL_9:

  return v8;
}

- (void)setFullColorImage:(id)a3 tintableImageProvider:(id)a4
{
  id v6;

  v6 = a3;
  -[NTKUpNextImageView setImageProvider:](self, "setImageProvider:", a4);
  -[NTKUpNextImageView setOverrideImage:](self, "setOverrideImage:", v6);

  -[NTKUpNextImageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setImageProvider:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CLKImageProvider *v9;
  CLKImageProvider **p_imageProvider;
  CLKImageProvider *v11;
  UIColor *v12;
  UIColor *fallbackTintColor;
  UIColor *v14;
  UIColor *v15;
  void *v16;
  void *v17;
  void *v18;
  UIImageView *backgroundImageView;
  void *v20;
  _BOOL4 v21;
  UIImageView *foregroundImageView;
  UIImageView *v23;
  void *v24;
  void *v25;
  UIImageView *v26;
  void *v27;
  void *v28;
  UIImageView *foregroundAccentImageView;
  void *v30;
  void *v31;
  UIImageView *v32;
  void *v33;
  id WeakRetained;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  UIImageView *v40;
  void *v41;
  void *v42;
  CLKImageProvider *v43;

  v43 = (CLKImageProvider *)a3;
  -[UIImageView layer](self->_backgroundImageView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilters:", 0);

  -[UIImageView layer](self->_foregroundImageView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFilters:", 0);

  -[UIImageView layer](self->_foregroundAccentImageView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFilters:", 0);

  -[UIImageView layer](self->_overrideImageView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFilters:", 0);

  v9 = v43;
  p_imageProvider = &self->_imageProvider;
  if (self->_imageProvider != v43)
  {
    objc_storeStrong((id *)&self->_imageProvider, a3);
    v9 = v43;
    if (v43)
    {
      -[UIImageView setHidden:](self->_overrideImageView, "setHidden:", 1);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v43;
        -[CLKImageProvider tintColor](*p_imageProvider, "tintColor");
        v12 = (UIColor *)objc_claimAutoreleasedReturnValue();
        fallbackTintColor = v12;
        if (v12 || (fallbackTintColor = self->_fallbackTintColor) != 0)
        {
          v14 = fallbackTintColor;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          v14 = (UIColor *)objc_claimAutoreleasedReturnValue();
        }
        v15 = v14;

        if (-[CLKImageProvider isTwoPiece](v11, "isTwoPiece"))
        {
          -[CLKImageProvider createSymbolImageForType:color:](v11, "createSymbolImageForType:color:", 3, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLKImageProvider createSymbolImageForType:color:](v11, "createSymbolImageForType:color:", 2, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          -[UIImageView setHidden:](self->_foregroundImageView, "setHidden:", 0);
          -[UIImageView setHidden:](self->_backgroundImageView, "setHidden:", 0);
          -[UIImageView setHidden:](self->_foregroundAccentImageView, "setHidden:", 1);
          -[UIImageView setImage:](self->_foregroundImageView, "setImage:", v18);
          backgroundImageView = self->_backgroundImageView;
          objc_msgSend(v16, "imageWithRenderingMode:", 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIImageView setImage:](backgroundImageView, "setImage:", v20);

        }
        else
        {
          -[UIImageView setHidden:](self->_backgroundImageView, "setHidden:", 0);
          -[UIImageView setHidden:](self->_foregroundImageView, "setHidden:", 1);
          -[UIImageView setHidden:](self->_foregroundAccentImageView, "setHidden:", 1);
          v32 = self->_backgroundImageView;
          -[CLKImageProvider createSymbolImage](v11, "createSymbolImage");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIImageView setImage:](v32, "setImage:", v33);

          -[UIImageView setImage:](self->_foregroundImageView, "setImage:", 0);
        }
        WeakRetained = objc_loadWeakRetained((id *)&self->_parentCell);
        objc_msgSend(WeakRetained, "device");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "screenScale");
        v37 = v36;
        -[NTKUpNextImageView layer](self, "layer");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setRasterizationScale:", v37);

        -[NTKUpNextImageView layer](self, "layer");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setShouldRasterize:", 1);

      }
      else
      {
        v21 = -[NTKUpNextImageView _hasMultipartImages](self, "_hasMultipartImages");
        -[UIImageView setHidden:](self->_backgroundImageView, "setHidden:", 0);
        foregroundImageView = self->_foregroundImageView;
        if (v21)
        {
          -[UIImageView setHidden:](foregroundImageView, "setHidden:", 0);
          -[UIImageView setHidden:](self->_foregroundAccentImageView, "setHidden:", 0);
          v23 = self->_foregroundImageView;
          -[CLKImageProvider twoPieceImageForeground](*p_imageProvider, "twoPieceImageForeground");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "imageWithRenderingMode:", 2);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIImageView setImage:](v23, "setImage:", v25);

          v26 = self->_backgroundImageView;
          -[CLKImageProvider twoPieceImageBackground](*p_imageProvider, "twoPieceImageBackground");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "imageWithRenderingMode:", 2);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIImageView setImage:](v26, "setImage:", v28);

          foregroundAccentImageView = self->_foregroundAccentImageView;
          -[CLKImageProvider foregroundAccentImage](*p_imageProvider, "foregroundAccentImage");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "imageWithRenderingMode:", 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIImageView setImage:](foregroundAccentImageView, "setImage:", v31);

        }
        else
        {
          -[UIImageView setHidden:](foregroundImageView, "setHidden:", 1);
          -[UIImageView setHidden:](self->_foregroundAccentImageView, "setHidden:", 1);
          v40 = self->_backgroundImageView;
          -[CLKImageProvider onePieceImage](*p_imageProvider, "onePieceImage");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "imageWithRenderingMode:", 2);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIImageView setImage:](v40, "setImage:", v42);

          -[UIImageView setImage:](self->_foregroundImageView, "setImage:", 0);
        }
        -[NTKUpNextImageView layer](self, "layer");
        v11 = (CLKImageProvider *)objc_claimAutoreleasedReturnValue();
        -[CLKImageProvider setShouldRasterize:](v11, "setShouldRasterize:", 0);
      }

      -[NTKUpNextImageView _updateColors](self, "_updateColors");
      v9 = v43;
    }
  }

}

- (void)setOverrideImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_overrideImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_overrideImage, a3);
    v5 = v6;
    if (v6)
    {
      -[UIImageView setHidden:](self->_foregroundImageView, "setHidden:", 1);
      -[UIImageView setHidden:](self->_backgroundImageView, "setHidden:", 1);
      -[UIImageView setHidden:](self->_foregroundAccentImageView, "setHidden:", 1);
      -[UIImageView setHidden:](self->_overrideImageView, "setHidden:", 0);
      -[UIImageView setImage:](self->_overrideImageView, "setImage:", self->_overrideImage);
      v5 = v6;
    }
  }

}

- (void)_updateColors
{
  UIColor *v3;
  UIColor *fallbackTintColor;
  UIColor *v5;
  UIImageView *foregroundImageView;
  void *v7;
  int *v8;
  UIColor *v9;

  -[CLKImageProvider tintColor](self->_imageProvider, "tintColor");
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  fallbackTintColor = v3;
  if (v3 || (fallbackTintColor = self->_fallbackTintColor) != 0)
  {
    v5 = fallbackTintColor;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v5;

  if (-[NTKUpNextImageView _hasMultipartImages](self, "_hasMultipartImages")
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    foregroundImageView = self->_foregroundImageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](foregroundImageView, "setTintColor:", v7);

    v8 = &OBJC_IVAR___NTKUpNextImageView__backgroundImageView;
  }
  else
  {
    v8 = &OBJC_IVAR___NTKUpNextImageView__foregroundImageView;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v8), "setTintColor:", v9);

}

- (void)setContentMode:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKUpNextImageView;
  -[NTKUpNextImageView setContentMode:](&v5, sel_setContentMode_);
  -[UIImageView setContentMode:](self->_foregroundImageView, "setContentMode:", a3);
  -[UIImageView setContentMode:](self->_backgroundImageView, "setContentMode:", a3);
  -[UIImageView setContentMode:](self->_foregroundAccentImageView, "setContentMode:", a3);
  -[UIImageView setContentMode:](self->_overrideImageView, "setContentMode:", a3);
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (self->_overrideImage && self->_imageProvider)
  {
    -[NTKUpNextImageView updateMonochromeColor](self, "updateMonochromeColor");
    -[UIImageView setHidden:](self->_overrideImageView, "setHidden:", 0);
    -[UIImageView layer](self->_overrideImageView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFilters:", 0);

    -[UIImageView setAlpha:](self->_overrideImageView, "setAlpha:", 1.0 - a3);
  }
  else
  {
    -[NTKUpNextImageView filterProvider](self, "filterProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filtersForView:style:fraction:", self, 2, a3);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[UIImageView layer](self->_backgroundImageView, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFilters:", v15);

    }
    -[NTKUpNextImageView filterProvider](self, "filterProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filtersForView:style:fraction:", self, 0, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[UIImageView layer](self->_foregroundImageView, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFilters:", v9);

    }
    -[NTKUpNextImageView filterProvider](self, "filterProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "filtersForView:style:fraction:", self, 1, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[UIImageView layer](self->_foregroundAccentImageView, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFilters:", v12);

      -[UIImageView layer](self->_overrideImageView, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFilters:", v12);

    }
  }
}

- (void)updateMonochromeColor
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
  id v12;

  if (self->_imageProvider)
  {
    -[UIImageView setHidden:](self->_overrideImageView, "setHidden:", 1);
    -[UIImageView setAlpha:](self->_overrideImageView, "setAlpha:", 1.0);
    -[UIImageView setHidden:](self->_foregroundAccentImageView, "setHidden:", 0);
    -[UIImageView setHidden:](self->_foregroundImageView, "setHidden:", 0);
    -[UIImageView setHidden:](self->_backgroundImageView, "setHidden:", 0);
  }
  -[NTKUpNextImageView filterProvider](self, "filterProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filtersForView:style:", self, 2);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[UIImageView layer](self->_backgroundImageView, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFilters:", v12);

  }
  -[NTKUpNextImageView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filtersForView:style:", self, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIImageView layer](self->_foregroundImageView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFilters:", v6);

  }
  -[NTKUpNextImageView filterProvider](self, "filterProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filtersForView:style:", self, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UIImageView layer](self->_foregroundAccentImageView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFilters:", v9);

    -[UIImageView layer](self->_overrideImageView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFilters:", v9);

  }
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->_filterProvider);
}

- (void)setFilterProvider:(id)a3
{
  objc_storeWeak((id *)&self->_filterProvider, a3);
}

- (UIColor)fallbackTintColor
{
  return self->_fallbackTintColor;
}

- (void)setFallbackTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackTintColor, a3);
}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (UIImage)overrideImage
{
  return self->_overrideImage;
}

- (NSString)compositingFilter
{
  return self->_compositingFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositingFilter, 0);
  objc_storeStrong((id *)&self->_overrideImage, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_fallbackTintColor, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_destroyWeak((id *)&self->_parentCell);
  objc_storeStrong((id *)&self->_overrideImageView, 0);
  objc_storeStrong((id *)&self->_foregroundAccentImageView, 0);
  objc_storeStrong((id *)&self->_foregroundAccentBackdrop, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_foregroundImageView, 0);
}

@end
