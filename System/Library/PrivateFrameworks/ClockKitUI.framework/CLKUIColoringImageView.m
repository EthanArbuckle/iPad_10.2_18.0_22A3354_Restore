@implementation CLKUIColoringImageView

- (void)_commonInit
{
  self->_maxSize = (CGSize)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  self->_symbolImageType = 1;
}

- (CLKUIColoringImageView)initWithFrame:(CGRect)a3
{
  CLKUIColoringImageView *v3;
  CLKUIColoringImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKUIColoringImageView;
  v3 = -[CLKUIColoringImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CLKUIColoringImageView _commonInit](v3, "_commonInit");
  return v4;
}

- (CLKUIColoringImageView)initWithImage:(id)a3
{
  CLKUIColoringImageView *v3;
  CLKUIColoringImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKUIColoringImageView;
  v3 = -[CLKUIColoringImageView initWithImage:](&v6, sel_initWithImage_, a3);
  v4 = v3;
  if (v3)
    -[CLKUIColoringImageView _commonInit](v3, "_commonInit");
  return v4;
}

- (CLKUIColoringImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  CLKUIColoringImageView *v4;
  CLKUIColoringImageView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKUIColoringImageView;
  v4 = -[CLKUIColoringImageView initWithImage:highlightedImage:](&v7, sel_initWithImage_highlightedImage_, a3, a4);
  v5 = v4;
  if (v4)
    -[CLKUIColoringImageView _commonInit](v4, "_commonInit");
  return v5;
}

- (void)setImage:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "renderingMode") != 2)
  {
    objc_msgSend(v4, "imageWithRenderingMode:", 2);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  v6.receiver = self;
  v6.super_class = (Class)CLKUIColoringImageView;
  -[CLKUIColoringImageView setImage:](&v6, sel_setImage_, v4);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CLKImageProvider *imageProvider;
  double v10;
  double width;
  double v12;
  double height;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  -[CLKUIColoringImageView image](self, "image", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;

  imageProvider = self->_imageProvider;
  if (imageProvider)
  {
    -[CLKImageProvider maxSize](imageProvider, "maxSize");
    width = v10;
    height = v12;
  }
  else
  {
    width = self->_maxSize.width;
    height = self->_maxSize.height;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  -[CLKImageProvider pointSize](self->_imageProvider, "pointSize");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

LABEL_8:
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "device");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    CLKFloorForDevice();
    v6 = v18;
    CLKFloorForDevice();
    v8 = v19;

    goto LABEL_9;
  }
  -[CLKImageProvider overridePointSize](self->_imageProvider, "overridePointSize");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    goto LABEL_8;
  if (v6 != 0.0 && v8 != 0.0)
  {
    if (width / v6 >= height / v8)
    {
      v6 = v6 * height / v8;
      v8 = height;
    }
    else
    {
      v8 = v8 * width / v6;
      v6 = width;
    }
  }
LABEL_9:
  v20 = v6;
  v21 = v8;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)sizeToFit
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGAffineTransform v9;

  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLKUIColoringImageView transform](self, "transform");
  if (CGAffineTransformIsIdentity(&v9))
  {
    -[CLKUIColoringImageView frame](self, "frame");
    -[CLKUIColoringImageView sizeThatFits:](self, "sizeThatFits:", v5, v6);
    CLKPixelAlignRectForDevice();
    -[CLKUIColoringImageView setFrame:](self, "setFrame:");
  }
  else
  {
    -[CLKUIColoringImageView bounds](self, "bounds");
    -[CLKUIColoringImageView sizeThatFits:](self, "sizeThatFits:", v7, v8);
    CLKPixelAlignRectForDevice();
    -[CLKUIColoringImageView setBounds:](self, "setBounds:");
  }

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

- (void)setImageProvider:(id)a3
{
  id *p_imageProvider;
  char isKindOfClass;
  id v7;
  int64_t symbolImageType;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  p_imageProvider = (id *)&self->_imageProvider;
  v12 = a3;
  if ((objc_msgSend(*p_imageProvider, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_imageProvider, a3);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = *p_imageProvider;
    if ((isKindOfClass & 1) != 0)
    {
      symbolImageType = self->_symbolImageType;
      -[CLKUIColoringImageView color](self, "color");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (!v9)
      {
        -[CLKUIColoringImageView overrideColor](self, "overrideColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "createSymbolImageForType:color:", symbolImageType, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIColoringImageView setImage:](self, "setImage:", v11);

      if (!v9)
    }
    else
    {
      objc_msgSend(*p_imageProvider, "onePieceImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIColoringImageView setImage:](self, "setImage:", v9);
    }

  }
}

- (BOOL)usesLegibility
{
  return 0;
}

- (void)setOverrideColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideColor, a3);
}

- (CGSize)maxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxSize.width;
  height = self->_maxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaxSize:(CGSize)a3
{
  self->_maxSize = a3;
}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (int64_t)symbolImageType
{
  return self->_symbolImageType;
}

- (void)setSymbolImageType:(int64_t)a3
{
  self->_symbolImageType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_overrideColor, 0);
}

@end
