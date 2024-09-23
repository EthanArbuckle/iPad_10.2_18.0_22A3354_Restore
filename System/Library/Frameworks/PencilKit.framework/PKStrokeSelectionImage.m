@implementation PKStrokeSelectionImage

- (PKStrokeSelectionImage)initWithImage:(id)a3 config:(id)a4 fullSizeConfig:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKStrokeSelectionImage *v12;
  PKStrokeSelectionImage *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[PKStrokeSelectionImage init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_image, a3);
    objc_storeStrong((id *)&v13->_config, a4);
    objc_storeStrong((id *)&v13->_fullSizeConfig, a5);
  }

  return v13;
}

- (UIImage)combinedImage
{
  UIImage *addImage;
  CGImage *v4;
  uint64_t v5;
  CGContext *v6;
  double Width;
  double Height;
  id v9;
  UIImage *image;
  CGImage *v11;
  CGImage *v12;
  CGImage *v13;
  CGImage *v14;
  void *v15;
  void *v16;
  double v17;
  UIImage *v18;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  addImage = self->_addImage;
  if (addImage && self->_mulImage)
  {
    v4 = -[UIImage CGImage](addImage, "CGImage");
    v5 = CGBitmapContextCreateForFlatteningImage();
    if (!v5)
      goto LABEL_13;
    v6 = (CGContext *)v5;
    Width = (double)CGImageGetWidth(v4);
    Height = (double)CGImageGetHeight(v4);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(v6, (CGColorRef)objc_msgSend(v9, "CGColor"));

    v20.origin.x = 0.0;
    v20.origin.y = 0.0;
    v20.size.width = Width;
    v20.size.height = Height;
    CGContextFillRect(v6, v20);
    image = self->_image;
    if (image)
    {
      v11 = -[UIImage CGImage](image, "CGImage");
      v21.origin.x = 0.0;
      v21.origin.y = 0.0;
      v21.size.width = Width;
      v21.size.height = Height;
      CGContextDrawImage(v6, v21, v11);
    }
    if (self->_mulImage)
    {
      CGContextSetBlendMode(v6, kCGBlendModeMultiply);
      v12 = -[UIImage CGImage](self->_mulImage, "CGImage");
      v22.origin.x = 0.0;
      v22.origin.y = 0.0;
      v22.size.width = Width;
      v22.size.height = Height;
      CGContextDrawImage(v6, v22, v12);
    }
    if (self->_addImage)
    {
      CGContextSetBlendMode(v6, kCGBlendModePlusLighter);
      v13 = -[UIImage CGImage](self->_addImage, "CGImage");
      v23.origin.x = 0.0;
      v23.origin.y = 0.0;
      v23.size.width = Width;
      v23.size.height = Height;
      CGContextDrawImage(v6, v23, v13);
    }
    v14 = CGBitmapContextCreateImage(v6);
    CGContextRelease(v6);
    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "scale");
      objc_msgSend(v15, "imageWithCGImage:scale:orientation:", v14, -[UIImage imageOrientation](self->_addImage, "imageOrientation"), v17);
      v18 = (UIImage *)objc_claimAutoreleasedReturnValue();

      CGImageRelease(v14);
    }
    else
    {
LABEL_13:
      v18 = 0;
    }
  }
  else
  {
    v18 = self->_image;
  }
  return v18;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (PKStrokeSelectionImageConfig)config
{
  return self->_config;
}

- (PKStrokeSelectionImageConfig)fullSizeConfig
{
  return self->_fullSizeConfig;
}

- (UIImage)addImage
{
  return self->_addImage;
}

- (void)setAddImage:(id)a3
{
  objc_storeStrong((id *)&self->_addImage, a3);
}

- (UIImage)mulImage
{
  return self->_mulImage;
}

- (void)setMulImage:(id)a3
{
  objc_storeStrong((id *)&self->_mulImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mulImage, 0);
  objc_storeStrong((id *)&self->_addImage, 0);
  objc_storeStrong((id *)&self->_fullSizeConfig, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
