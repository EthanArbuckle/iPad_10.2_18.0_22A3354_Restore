@implementation CDStackedImagesComplicationImageView

- (CDStackedImagesComplicationImageView)initWithFrame:(CGRect)a3
{
  CDStackedImagesComplicationImageView *v3;
  void *v4;
  uint64_t v5;
  CLKDevice *device;
  uint64_t v7;
  UIColor *shadowColor;
  uint64_t v9;
  UIColor *foregroundColor;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CDStackedImagesComplicationImageView;
  v3 = -[CDStackedImagesComplicationImageView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDB8780], "sharedRenderingContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "device");
    v5 = objc_claimAutoreleasedReturnValue();
    device = v3->_device;
    v3->_device = (CLKDevice *)v5;

    v3->_shadowBlur = *(double *)MEMORY[0x24BE16EF8];
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, *MEMORY[0x24BE16EF0]);
    v7 = objc_claimAutoreleasedReturnValue();
    shadowColor = v3->_shadowColor;
    v3->_shadowColor = (UIColor *)v7;

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v9 = objc_claimAutoreleasedReturnValue();
    foregroundColor = v3->_foregroundColor;
    v3->_foregroundColor = (UIColor *)v9;

    -[CDStackedImagesComplicationImageView _updateAlpha](v3, "_updateAlpha");
  }
  return v3;
}

- (void)_enumerateMultipartImageViewsWithBlock:(id)a3
{
  void (*v5)(void);
  id v6;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, CLKUIColoringImageView *))a3 + 2))(v6, self->_backgroundImageView);
  (*((void (**)(id, UIImageView *))a3 + 2))(v6, self->_foregroundAccentImageView);

}

- (void)_enumerateImageViewsWithBlock:(id)a3
{
  void (**v4)(id, CLKUIColoringImageView *);

  v4 = (void (**)(id, CLKUIColoringImageView *))a3;
  -[CDStackedImagesComplicationImageView _enumerateMultipartImageViewsWithBlock:](self, "_enumerateMultipartImageViewsWithBlock:", v4);
  v4[2](v4, self->_monochromeImageView);
  v4[2](v4, (CLKUIColoringImageView *)self->_layerMaskImageView);

}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  _QWORD v9[9];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CDStackedImagesComplicationImageView;
  -[CDStackedImagesComplicationImageView layoutSubviews](&v10, sel_layoutSubviews);
  -[CDStackedImagesComplicationImageView bounds](self, "bounds");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__CDStackedImagesComplicationImageView_layoutSubviews__block_invoke;
  v9[3] = &unk_24CF21650;
  v9[5] = v3;
  v9[6] = v4;
  v9[7] = v5;
  v9[8] = v6;
  v9[4] = self;
  -[CDStackedImagesComplicationImageView _enumerateImageViewsWithBlock:](self, "_enumerateImageViewsWithBlock:", v9);
  if (-[CDStackedImagesComplicationImageView _hasShadowViews](self, "_hasShadowViews"))
  {
    v7 = *MEMORY[0x24BDBF148];
    v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
    -[UIImageView sizeThatFits:](self->_monochromeShadowView, "sizeThatFits:", *MEMORY[0x24BDBF148], v8);
    CLKRectCenteredIntegralRectForDevice();
    -[UIImageView setFrame:](self->_monochromeShadowView, "setFrame:");
    -[UIImageView sizeThatFits:](self->_multipartShadowView, "sizeThatFits:", v7, v8);
    CLKRectCenteredIntegralRectForDevice();
    -[UIImageView setFrame:](self->_multipartShadowView, "setFrame:");
  }
}

void __54__CDStackedImagesComplicationImageView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  id v4;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v4 = a2;
  objc_msgSend(v4, "sizeThatFits:", v2, v3);
  CLKRectCenteredIntegralRectForDevice();
  objc_msgSend(v4, "setFrame:");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  float64_t v6;
  float64x2_t v7;
  double v8;
  double v9;
  float64x2_t *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[5];
  CGSize v16;
  uint64_t v17;
  float64x2_t *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v17 = 0;
  v18 = (float64x2_t *)&v17;
  v19 = 0x3010000000;
  v20 = &unk_213073871;
  v21 = *MEMORY[0x24BDBF148];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __53__CDStackedImagesComplicationImageView_sizeThatFits___block_invoke;
  v15[3] = &unk_24CF21678;
  v16 = a3;
  v15[4] = &v17;
  -[CDStackedImagesComplicationImageView _enumerateMultipartImageViewsWithBlock:](self, "_enumerateMultipartImageViewsWithBlock:", v15);
  -[CLKUIColoringImageView sizeThatFits:](self->_monochromeImageView, "sizeThatFits:", width, height);
  v7.f64[1] = v6;
  v18[2] = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v7, v18[2]), (int8x16_t)v7, (int8x16_t)v18[2]);
  -[_CDComplicationImageViewProviderImageView sizeThatFits:](self->_layerMaskImageView, "sizeThatFits:", width, height);
  v10 = v18;
  if (v18[2].f64[0] >= v8)
    v11 = v18[2].f64[0];
  else
    v11 = v8;
  if (v18[2].f64[1] >= v9)
    v12 = v18[2].f64[1];
  else
    v12 = v9;
  v18[2].f64[0] = v11;
  v10[2].f64[1] = v12;
  _Block_object_dispose(&v17, 8);
  v13 = v11;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

float64x2_t __53__CDStackedImagesComplicationImageView_sizeThatFits___block_invoke(uint64_t a1, void *a2)
{
  float64x2_t *v3;
  float64_t v4;
  float64x2_t v5;
  float64x2_t result;

  objc_msgSend(a2, "sizeThatFits:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v3 = *(float64x2_t **)(*(_QWORD *)(a1 + 32) + 8);
  v5.f64[1] = v4;
  result = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v5, v3[2]), (int8x16_t)v5, (int8x16_t)v3[2]);
  v3[2] = result;
  return result;
}

- (void)_updateImageSubviewsMaxSize
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v8[6];
  _QWORD v9[5];
  _QWORD v10[4];
  __int128 v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3010000000;
  v10[3] = &unk_213073871;
  v3 = MEMORY[0x24BDAC760];
  v11 = *MEMORY[0x24BDBF148];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__CDStackedImagesComplicationImageView__updateImageSubviewsMaxSize__block_invoke;
  v9[3] = &unk_24CF216A0;
  v9[4] = v10;
  -[CDStackedImagesComplicationImageView _enumerateMultipartImageViewsWithBlock:](self, "_enumerateMultipartImageViewsWithBlock:", v9);
  -[CLKImageProvider maxSize](self->_imageProvider, "maxSize");
  CLKFloorForDevice();
  v5 = v4;
  CLKFloorForDevice();
  v7 = v6;
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __67__CDStackedImagesComplicationImageView__updateImageSubviewsMaxSize__block_invoke_2;
  v8[3] = &__block_descriptor_48_e21_v16__0__UIImageView_8l;
  *(double *)&v8[4] = v5;
  *(double *)&v8[5] = v6;
  -[CDStackedImagesComplicationImageView _enumerateMultipartImageViewsWithBlock:](self, "_enumerateMultipartImageViewsWithBlock:", v8);
  -[CLKUIColoringImageView setMaxSize:](self->_monochromeImageView, "setMaxSize:", v5, v7);
  -[_CDComplicationImageViewProviderImageView setMaxSize:](self->_layerMaskImageView, "setMaxSize:", v5, v7);
  _Block_object_dispose(v10, 8);
}

float64x2_t __67__CDStackedImagesComplicationImageView__updateImageSubviewsMaxSize__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  float64x2_t *v7;
  float64x2_t v8;
  float64x2_t result;
  float64_t v10;
  float64_t v11;

  v3 = a2;
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v10 = v6;
  v11 = v5;

  objc_msgSend(v3, "sizeToFit");
  v7 = *(float64x2_t **)(*(_QWORD *)(a1 + 32) + 8);
  v8.f64[0] = v11;
  v8.f64[1] = v10;
  result = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v8, v7[2]), (int8x16_t)v8, (int8x16_t)v7[2]);
  v7[2] = result;
  return result;
}

void __67__CDStackedImagesComplicationImageView__updateImageSubviewsMaxSize__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setMaxSize:", *(double *)(a1 + 32), *(double *)(a1 + 40));

}

- (void)_updateColors
{
  UIColor *v3;
  UIColor *color;
  UIColor *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  UIColor *v9;
  CLKUIColoringImageView *backgroundImageView;
  UIColor *v11;
  UIColor *v12;
  UIColor *v13;

  if (-[CDStackedImagesComplicationImageView _hasMultipartImages](self, "_hasMultipartImages")
    || self->_multicolorAlpha != 1.0)
  {
    v13 = self->_color;
  }
  else
  {
    -[CLKImageProvider tintColor](self->_imageProvider, "tintColor");
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
    color = v3;
    if (!v3)
      color = self->_color;
    v13 = color;

  }
  v5 = self->_foregroundColor;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CLKImageProvider secondaryTintColor](self->_imageProvider, "secondaryTintColor");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v5;
    v9 = v8;

    v5 = v9;
  }
  -[CLKUIColoringImageView setColor:](self->_foregroundImageView, "setColor:", v5);
  backgroundImageView = self->_backgroundImageView;
  -[CLKImageProvider tintColor](self->_imageProvider, "tintColor");
  v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    v12 = self->_color;
  -[CLKUIColoringImageView setColor:](backgroundImageView, "setColor:", v12);

  -[CLKUIColoringImageView setColor:](self->_monochromeImageView, "setColor:", v13);
}

- (void)_updateShadowViewImages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  self->_isShadowImagesStale = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (void *)MEMORY[0x24BDD1968];
    -[CLKUIColoringImageView sizeThatFits:](self->_monochromeImageView, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    objc_msgSend(v3, "valueWithCGSize:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    CLKUIShadowImageFromView();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_monochromeShadowView, "setImage:", v4);
  }
  else
  {
    -[CLKUIColoringImageView image](self->_monochromeImageView, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CLKUIShadowImage();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_monochromeShadowView, "setImage:", v5);

    v7 = 0;
  }

  CLKUIShadowImage();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_multipartShadowView, "setImage:", v6);

}

- (void)_updateImages
{
  CLKUIColoringImageView *foregroundImageView;
  void *v4;
  CLKUIColoringImageView *backgroundImageView;
  void *v6;
  CLKUIColoringImageView *monochromeImageView;
  void *v8;
  UIImageView *foregroundAccentImageView;
  void *v10;
  _CDComplicationImageViewProviderImageView *layerMaskImageView;
  void *v12;
  __int128 v13;
  uint64_t v14;
  UIImage *v15;
  UIImage *multipartShadowViewSource;
  _QWORD v17[6];
  _QWORD v18[6];
  uint64_t v19;
  CGFloat *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CGRect *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CLKUIColoringImageView setImageProvider:](self->_monochromeImageView, "setImageProvider:", self->_imageProvider);
    -[CLKUIColoringImageView setImageProvider:](self->_foregroundImageView, "setImageProvider:", self->_imageProvider);
    -[CLKUIColoringImageView setImageProvider:](self->_backgroundImageView, "setImageProvider:", self->_imageProvider);
  }
  else
  {
    if (!-[CDStackedImagesComplicationImageView _shouldIgnoreTwoPieceImage](self, "_shouldIgnoreTwoPieceImage"))
    {
      foregroundImageView = self->_foregroundImageView;
      -[CLKImageProvider twoPieceImageForeground](self->_imageProvider, "twoPieceImageForeground");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIColoringImageView setImage:](foregroundImageView, "setImage:", v4);

      backgroundImageView = self->_backgroundImageView;
      -[CLKImageProvider twoPieceImageBackground](self->_imageProvider, "twoPieceImageBackground");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIColoringImageView setImage:](backgroundImageView, "setImage:", v6);

    }
    monochromeImageView = self->_monochromeImageView;
    -[CLKImageProvider onePieceImage](self->_imageProvider, "onePieceImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringImageView setImage:](monochromeImageView, "setImage:", v8);

    foregroundAccentImageView = self->_foregroundAccentImageView;
    -[CLKImageProvider foregroundAccentImage](self->_imageProvider, "foregroundAccentImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](foregroundAccentImageView, "setImage:", v10);

    layerMaskImageView = self->_layerMaskImageView;
    -[CLKImageProvider onePieceImage](self->_imageProvider, "onePieceImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDComplicationImageViewProviderImageView setImage:](layerMaskImageView, "setImage:", v12);

  }
  if (-[CDStackedImagesComplicationImageView _hasShadowViews](self, "_hasShadowViews"))
  {
    if (-[CDStackedImagesComplicationImageView _hasMultipartImages](self, "_hasMultipartImages"))
    {
      v23 = 0;
      v24 = (CGRect *)&v23;
      v25 = 0x4010000000;
      v26 = &unk_213073871;
      v13 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
      v27 = *MEMORY[0x24BDBF090];
      v28 = v13;
      v19 = 0;
      v20 = (CGFloat *)&v19;
      v21 = 0x2020000000;
      v22 = 0;
      v14 = MEMORY[0x24BDAC760];
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __53__CDStackedImagesComplicationImageView__updateImages__block_invoke;
      v18[3] = &unk_24CF216E8;
      v18[4] = &v19;
      v18[5] = &v23;
      -[CDStackedImagesComplicationImageView _enumerateMultipartImageViewsWithBlock:](self, "_enumerateMultipartImageViewsWithBlock:", v18);
      if (CGRectIsEmpty(v24[1]))
      {
        v15 = 0;
      }
      else
      {
        UIGraphicsBeginImageContextWithOptions(v24[1].size, 0, v20[3]);
        v17[0] = v14;
        v17[1] = 3221225472;
        v17[2] = __53__CDStackedImagesComplicationImageView__updateImages__block_invoke_2;
        v17[3] = &unk_24CF216E8;
        v17[4] = &v23;
        v17[5] = &v19;
        -[CDStackedImagesComplicationImageView _enumerateMultipartImageViewsWithBlock:](self, "_enumerateMultipartImageViewsWithBlock:", v17);
        UIGraphicsGetImageFromCurrentImageContext();
        v15 = (UIImage *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
      }
      _Block_object_dispose(&v19, 8);
      _Block_object_dispose(&v23, 8);
    }
    else
    {
      v15 = 0;
    }
    multipartShadowViewSource = self->_multipartShadowViewSource;
    self->_multipartShadowViewSource = v15;

    if (self->_isUsingLegibility)
      -[CDStackedImagesComplicationImageView _updateShadowViewImages](self, "_updateShadowViewImages");
    else
      self->_isShadowImagesStale = 1;
    -[CDStackedImagesComplicationImageView setNeedsLayout](self, "setNeedsLayout");
  }
}

void __53__CDStackedImagesComplicationImageView__updateImages__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;

  v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  if (v3 >= v7)
    v8 = v3;
  else
    v8 = v7;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
  v9 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
  objc_msgSend(v4, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "size");
  v12 = v11;

  if (v9 < v12)
    v9 = v12;
  v13 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56);
  objc_msgSend(v4, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "size");
  v16 = v15;

  if (v13 >= v16)
    v17 = v13;
  else
    v17 = v16;
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_OWORD *)(v18 + 32) = *MEMORY[0x24BDBEFB0];
  *(double *)(v18 + 48) = v9;
  *(double *)(v18 + 56) = v17;
}

void __53__CDStackedImagesComplicationImageView__updateImages__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  objc_msgSend(a2, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  UIRectCenteredIntegralRectScale();
  objc_msgSend(v4, "drawInRect:", v3);

}

- (void)_updateAlpha
{
  double v3;
  double v4;
  _QWORD v5[5];

  v3 = 0.0;
  if (-[CDStackedImagesComplicationImageView _hasMultipartImages](self, "_hasMultipartImages"))
  {
    -[CDStackedImagesComplicationImageView multicolorAlpha](self, "multicolorAlpha");
    v3 = v4;
  }
  -[CLKUIColoringImageView setAlpha:](self->_monochromeImageView, "setAlpha:", 1.0 - v3);
  -[UIImageView setAlpha:](self->_monochromeShadowView, "setAlpha:", 1.0 - v3);
  -[UIImageView setAlpha:](self->_multipartShadowView, "setAlpha:", v3);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__CDStackedImagesComplicationImageView__updateAlpha__block_invoke;
  v5[3] = &__block_descriptor_40_e21_v16__0__UIImageView_8l;
  *(double *)&v5[4] = v3;
  -[CDStackedImagesComplicationImageView _enumerateMultipartImageViewsWithBlock:](self, "_enumerateMultipartImageViewsWithBlock:", v5);
}

uint64_t __52__CDStackedImagesComplicationImageView__updateAlpha__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlpha:", *(double *)(a1 + 32));
}

- (void)_updateShadow
{
  UIImageView *v3;
  UIImageView *multipartShadowView;
  UIImageView *v5;
  UIImageView *monochromeShadowView;

  if (self->_isUsingLegibility)
  {
    if (-[CDStackedImagesComplicationImageView _hasShadowViews](self, "_hasShadowViews"))
    {
      -[UIImageView setHidden:](self->_multipartShadowView, "setHidden:", 0);
      -[UIImageView setHidden:](self->_monochromeShadowView, "setHidden:", 0);
    }
    else
    {
      v3 = (UIImageView *)objc_opt_new();
      multipartShadowView = self->_multipartShadowView;
      self->_multipartShadowView = v3;

      v5 = (UIImageView *)objc_opt_new();
      monochromeShadowView = self->_monochromeShadowView;
      self->_monochromeShadowView = v5;

      -[CDStackedImagesComplicationImageView addSubview:](self, "addSubview:", self->_multipartShadowView);
      -[CDStackedImagesComplicationImageView addSubview:](self, "addSubview:", self->_monochromeShadowView);
      -[CDStackedImagesComplicationImageView sendSubviewToBack:](self, "sendSubviewToBack:", self->_multipartShadowView);
      -[CDStackedImagesComplicationImageView sendSubviewToBack:](self, "sendSubviewToBack:", self->_monochromeShadowView);
      -[CDStackedImagesComplicationImageView _updateImages](self, "_updateImages");
      -[CDStackedImagesComplicationImageView _updateShadowViewImages](self, "_updateShadowViewImages");
    }
    -[CDStackedImagesComplicationImageView setClipsToBounds:](self, "setClipsToBounds:", 0);
  }
  else
  {
    -[UIImageView setHidden:](self->_multipartShadowView, "setHidden:", 1);
    -[UIImageView setHidden:](self->_monochromeShadowView, "setHidden:", 1);
  }
}

- (BOOL)_hasMultipartImages
{
  BOOL v3;
  char v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;

  v3 = -[CDStackedImagesComplicationImageView _shouldIgnoreTwoPieceImage](self, "_shouldIgnoreTwoPieceImage");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = -[CLKImageProvider isTwoPiece](self->_imageProvider, "isTwoPiece");
  else
    v4 = 0;
  -[CLKImageProvider twoPieceImageBackground](self->_imageProvider, "twoPieceImageBackground");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CLKImageProvider twoPieceImageForeground](self->_imageProvider, "twoPieceImageForeground");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v4 = 1;
  }

  if (!v3 && (v4 & 1) != 0)
    return 1;
  -[CLKImageProvider foregroundAccentImage](self->_imageProvider, "foregroundAccentImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8 != 0;

  return v7;
}

- (BOOL)_hasShadowViews
{
  return self->_multipartShadowView || self->_monochromeShadowView != 0;
}

- (void)_loadImageViewsIfNecessary
{
  char isKindOfClass;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  BOOL v9;
  CLKUIColoringImageView *backgroundImageView;
  BOOL v11;
  CLKUIColoringImageView *v12;
  CLKUIColoringImageView *v13;
  uint64_t v14;
  char v15;
  CLKUIColoringImageView *foregroundImageView;
  CLKUIColoringImageView *v17;
  CLKUIColoringImageView *v18;
  uint64_t v19;
  _CDComplicationImageViewProviderImageView *v20;
  _CDComplicationImageViewProviderImageView *layerMaskImageView;
  CLKUIColoringImageView *monochromeImageView;
  uint64_t v23;
  CLKUIColoringImageView *v24;
  CLKUIColoringImageView *v25;
  void *v26;
  UIImageView *foregroundAccentImageView;
  UIImageView *v28;
  UIImageView *v29;
  UIImageView *v30;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v4 = -[CLKImageProvider isTwoPiece](self->_imageProvider, "isTwoPiece");
  else
    v4 = 0;
  -[CLKImageProvider twoPieceImageBackground](self->_imageProvider, "twoPieceImageBackground");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLKImageProvider twoPieceImageForeground](self->_imageProvider, "twoPieceImageForeground");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = 1;
  else
    v7 = v4;

  -[CLKImageProvider onePieceImage](self->_imageProvider, "onePieceImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;

  backgroundImageView = self->_backgroundImageView;
  if (v5)
    v11 = 0;
  else
    v11 = v4 == 0;
  if (v11)
  {
    v14 = 1;
  }
  else
  {
    if (!backgroundImageView)
    {
      v12 = (CLKUIColoringImageView *)objc_opt_new();
      v13 = self->_backgroundImageView;
      self->_backgroundImageView = v12;

      -[CDStackedImagesComplicationImageView addSubview:](self, "addSubview:", self->_backgroundImageView);
      backgroundImageView = self->_backgroundImageView;
    }
    v14 = 0;
  }
  -[CLKUIColoringImageView setHidden:](backgroundImageView, "setHidden:", v14);
  v15 = isKindOfClass | v9;
  foregroundImageView = self->_foregroundImageView;
  if (v7)
  {
    if (!foregroundImageView)
    {
      v17 = (CLKUIColoringImageView *)objc_opt_new();
      v18 = self->_foregroundImageView;
      self->_foregroundImageView = v17;

      -[CDStackedImagesComplicationImageView addSubview:](self, "addSubview:", self->_foregroundImageView);
      foregroundImageView = self->_foregroundImageView;
    }
    v19 = 0;
  }
  else
  {
    v19 = 1;
  }
  -[CLKUIColoringImageView setHidden:](foregroundImageView, "setHidden:", v19);
  if ((v15 & 1) == 0)
    goto LABEL_24;
  if (-[CLKImageProvider useOnePieceAsLayerMask](self->_imageProvider, "useOnePieceAsLayerMask"))
  {
    if (!self->_layerMaskImageView)
    {
      v20 = (_CDComplicationImageViewProviderImageView *)objc_opt_new();
      layerMaskImageView = self->_layerMaskImageView;
      self->_layerMaskImageView = v20;

      -[CDStackedImagesComplicationImageView addSubview:](self, "addSubview:", self->_layerMaskImageView);
    }
LABEL_24:
    monochromeImageView = self->_monochromeImageView;
    v23 = 1;
    goto LABEL_28;
  }
  monochromeImageView = self->_monochromeImageView;
  if (!monochromeImageView)
  {
    v24 = (CLKUIColoringImageView *)objc_opt_new();
    v25 = self->_monochromeImageView;
    self->_monochromeImageView = v24;

    -[CDStackedImagesComplicationImageView addSubview:](self, "addSubview:", self->_monochromeImageView);
    monochromeImageView = self->_monochromeImageView;
  }
  v23 = 0;
LABEL_28:
  -[CLKUIColoringImageView setHidden:](monochromeImageView, "setHidden:", v23);
  -[CLKImageProvider foregroundAccentImage](self->_imageProvider, "foregroundAccentImage");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  foregroundAccentImageView = self->_foregroundAccentImageView;
  if (v26)
  {
    if (!foregroundAccentImageView)
    {
      v28 = (UIImageView *)objc_opt_new();
      v29 = self->_foregroundAccentImageView;
      self->_foregroundAccentImageView = v28;

      -[CDStackedImagesComplicationImageView addSubview:](self, "addSubview:", self->_foregroundAccentImageView);
    }
  }
  else
  {
    -[UIImageView removeFromSuperview](foregroundAccentImageView, "removeFromSuperview");
    v30 = self->_foregroundAccentImageView;
    self->_foregroundAccentImageView = 0;

  }
  -[CLKUIColoringImageView setSymbolImageType:](self->_backgroundImageView, "setSymbolImageType:", 3);
  -[CLKUIColoringImageView setSymbolImageType:](self->_foregroundImageView, "setSymbolImageType:", 2);
}

- (BOOL)_shouldIgnoreTwoPieceImage
{
  CLKMonochromeFilterProvider **p_filterProvider;
  id WeakRetained;
  char v5;
  id v6;
  char v7;

  p_filterProvider = &self->_filterProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 0;
  v6 = objc_loadWeakRetained((id *)p_filterProvider);
  v7 = objc_msgSend(v6, "viewShouldIgnoreTwoPieceImage:", self);

  return v7;
}

- (BOOL)hasMonochromeImage
{
  void *v2;
  BOOL v3;

  -[CLKUIColoringImageView image](self->_monochromeImageView, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_color != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_color, a3);
    -[CDStackedImagesComplicationImageView _updateColors](self, "_updateColors");
    v5 = v6;
  }

}

- (void)setForegroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_foregroundColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_foregroundColor, a3);
    -[CDStackedImagesComplicationImageView _updateColors](self, "_updateColors");
    v5 = v6;
  }

}

- (void)setImageProvider:(id)a3
{
  CLKImageProvider *v5;
  void *v6;
  void *v7;
  void *v8;
  CLKImageProvider *v9;

  v5 = (CLKImageProvider *)a3;
  if (self->_imageProvider != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_imageProvider, a3);
    -[CDStackedImagesComplicationImageView _enumerateImageViewsWithBlock:](self, "_enumerateImageViewsWithBlock:", &__block_literal_global_3);
    -[CDStackedImagesComplicationImageView _loadImageViewsIfNecessary](self, "_loadImageViewsIfNecessary");
    -[CDStackedImagesComplicationImageView _updateAlpha](self, "_updateAlpha");
    -[CDStackedImagesComplicationImageView _updateImages](self, "_updateImages");
    -[CDStackedImagesComplicationImageView _updateColors](self, "_updateColors");
    -[CDStackedImagesComplicationImageView _updateShadow](self, "_updateShadow");
    if (-[CLKImageProvider isForegroundAccentImageTinted](v9, "isForegroundAccentImageTinted"))
    {
      -[CLKUIColoringImageView layer](self->_foregroundImageView, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "filters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView layer](self->_foregroundAccentImageView, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFilters:", v7);

    }
    else
    {
      -[UIImageView layer](self->_foregroundAccentImageView, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFilters:", 0);
    }

    if (self->_isUsingLegibility)
      -[CDStackedImagesComplicationImageView _updateShadowViewImages](self, "_updateShadowViewImages");
    else
      self->_isShadowImagesStale = 1;
    -[CDStackedImagesComplicationImageView _updateImageSubviewsMaxSize](self, "_updateImageSubviewsMaxSize");
    -[CDStackedImagesComplicationImageView sizeToFit](self, "sizeToFit");
    v5 = v9;
  }

}

void __57__CDStackedImagesComplicationImageView_setImageProvider___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "setMaxSize:", 1.79769313e308, 1.79769313e308);

}

- (void)setMulticolorAlpha:(double)a3
{
  if (self->_multicolorAlpha != a3)
  {
    self->_multicolorAlpha = a3;
    -[CDStackedImagesComplicationImageView _updateAlpha](self, "_updateAlpha");
    -[CDStackedImagesComplicationImageView _updateColors](self, "_updateColors");
  }
}

- (UIColor)contentColor
{
  return 0;
}

- (UIColor)overrideColor
{
  UIColor *overrideColor;

  overrideColor = self->_overrideColor;
  if (overrideColor)
    return overrideColor;
  -[CLKImageProvider tintColor](self->_imageProvider, "tintColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)usesLegibility
{
  return self->_isUsingLegibility;
}

- (void)setUsesLegibility:(BOOL)a3
{
  if (self->_isUsingLegibility != a3)
  {
    self->_isUsingLegibility = a3;
    -[CDStackedImagesComplicationImageView _updateShadow](self, "_updateShadow");
    if (self->_isShadowImagesStale)
      -[CDStackedImagesComplicationImageView _updateShadowViewImages](self, "_updateShadowViewImages");
  }
}

- (double)shadowBlur
{
  return self->_shadowBlur;
}

- (void)setShadowBlur:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_shadowBlur = a3;
    if (self->_isUsingLegibility)
      -[CDStackedImagesComplicationImageView _updateShadowViewImages](self, "_updateShadowViewImages");
    else
      self->_isShadowImagesStale = 1;
  }
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_shadowColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_shadowColor, a3);
    if (self->_isUsingLegibility)
      -[CDStackedImagesComplicationImageView _updateShadowViewImages](self, "_updateShadowViewImages");
    else
      self->_isShadowImagesStale = 1;
  }

}

- (BOOL)legibilityEnabled
{
  return self->_isUsingLegibility;
}

- (int64_t)_backgroundFilterStyle
{
  return 0;
}

- (int64_t)_foregroundFilterStyle
{
  return 2;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  char isKindOfClass;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  objc_msgSend(WeakRetained, "filtersForView:style:fraction:", self, -[CDStackedImagesComplicationImageView _backgroundFilterStyle](self, "_backgroundFilterStyle"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CLKUIColoringImageView layer](self->_backgroundImageView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFilters:", v7);

    -[CLKUIColoringImageView layer](self->_monochromeImageView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFilters:", v7);

    if ((isKindOfClass & 1) != 0)
    {
      -[CLKUIColoringImageView layer](self->_foregroundImageView, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFilters:", v7);

    }
    if (-[CLKImageProvider useOnePieceAsLayerMask](self->_imageProvider, "useOnePieceAsLayerMask"))
    {
      v11 = objc_loadWeakRetained((id *)&self->_filterProvider);
      objc_msgSend(v11, "colorForView:accented:", self, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_loadWeakRetained((id *)&self->_filterProvider);
      objc_msgSend(v13, "colorForView:accented:", self, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      _CDLayerMaskColorizationFilter(v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDComplicationImageViewProviderImageView layer](self->_layerMaskImageView, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFilters:", v16);

    }
  }
  if ((isKindOfClass & 1) == 0)
  {
    v18 = objc_loadWeakRetained((id *)&self->_filterProvider);
    objc_msgSend(v18, "filtersForView:style:fraction:", self, -[CDStackedImagesComplicationImageView _foregroundFilterStyle](self, "_foregroundFilterStyle"), a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[CLKUIColoringImageView layer](self->_foregroundImageView, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setFilters:", v19);

      LODWORD(v20) = -[CLKImageProvider isForegroundAccentImageTinted](self->_imageProvider, "isForegroundAccentImageTinted");
      -[UIImageView layer](self->_foregroundAccentImageView, "layer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if ((_DWORD)v20)
        v23 = v19;
      else
        v23 = 0;
      objc_msgSend(v21, "setFilters:", v23);

    }
  }

}

- (void)updateMonochromeColor
{
  char isKindOfClass;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  objc_msgSend(WeakRetained, "filtersForView:style:", self, -[CDStackedImagesComplicationImageView _backgroundFilterStyle](self, "_backgroundFilterStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CLKUIColoringImageView layer](self->_backgroundImageView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilters:", v5);

    -[CLKUIColoringImageView layer](self->_monochromeImageView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFilters:", v5);

    if ((isKindOfClass & 1) != 0)
    {
      -[CLKUIColoringImageView layer](self->_foregroundImageView, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFilters:", v5);

    }
    if (-[CLKImageProvider useOnePieceAsLayerMask](self->_imageProvider, "useOnePieceAsLayerMask"))
    {
      v9 = objc_loadWeakRetained((id *)&self->_filterProvider);
      objc_msgSend(v9, "colorForView:accented:", self, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_loadWeakRetained((id *)&self->_filterProvider);
      objc_msgSend(v11, "colorForView:accented:", self, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      _CDLayerMaskColorizationFilter(v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDComplicationImageViewProviderImageView layer](self->_layerMaskImageView, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFilters:", v14);

    }
  }
  if ((isKindOfClass & 1) == 0)
  {
    v16 = objc_loadWeakRetained((id *)&self->_filterProvider);
    objc_msgSend(v16, "filtersForView:style:", self, -[CDStackedImagesComplicationImageView _foregroundFilterStyle](self, "_foregroundFilterStyle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[CLKUIColoringImageView layer](self->_foregroundImageView, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFilters:", v17);

      LODWORD(v18) = -[CLKImageProvider isForegroundAccentImageTinted](self->_imageProvider, "isForegroundAccentImageTinted");
      -[UIImageView layer](self->_foregroundAccentImageView, "layer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if ((_DWORD)v18)
        v21 = v17;
      else
        v21 = 0;
      objc_msgSend(v19, "setFilters:", v21);

    }
  }

}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->_filterProvider);
}

- (void)setFilterProvider:(id)a3
{
  objc_storeWeak((id *)&self->_filterProvider, a3);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setOverrideColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideColor, a3);
}

- (double)multicolorAlpha
{
  return self->_multicolorAlpha;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_layerMaskImageView, 0);
  objc_storeStrong((id *)&self->_multipartShadowViewSource, 0);
  objc_storeStrong((id *)&self->_multipartShadowView, 0);
  objc_storeStrong((id *)&self->_monochromeShadowView, 0);
  objc_storeStrong((id *)&self->_monochromeImageView, 0);
  objc_storeStrong((id *)&self->_foregroundAccentImageView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_foregroundImageView, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
