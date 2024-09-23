@implementation SUUIOnboardingCircleImageDataConsumer

- (id)imageForImage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  const void *v21;
  CGSize *p_outputSize;
  void *v23;
  CGFloat v24;
  CGContext *CurrentContext;
  double width;
  double height;
  void *v28;
  CGRect v30;

  v4 = a3;
  if (-[SUUIOnboardingCircleImageDataConsumer usesSaturationFilter](self, "usesSaturationFilter"))
  {
    v5 = (void *)SUUICoreImageFramework();
    v6 = SUUIWeakLinkedClassForString(CFSTR("CIContext"), (uint64_t)v5);
    v7 = SUUIWeakLinkedClassForString(CFSTR("CIImage"), (uint64_t)v5);
    v8 = SUUIWeakLinkedClassForString(CFSTR("CIFilter"), (uint64_t)v5);
    v9 = *(id *)SUUIWeakLinkedSymbolForString("kCIInputBackgroundImageKey", v5);
    v10 = *(id *)SUUIWeakLinkedSymbolForString("kCIInputImageKey", v5);
    v11 = *(id *)SUUIWeakLinkedSymbolForString("kCIOutputImageKey", v5);
    objc_msgSend(v8, "filterWithName:keysAndValues:", CFSTR("CIColorControls"), CFSTR("inputSaturation"), &unk_2512EE808, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_retainAutorelease(v4);
    objc_msgSend(v7, "imageWithCGImage:", objc_msgSend(v13, "CGImage"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forKey:", v14, v10);

    objc_msgSend(v8, "filterWithName:", CFSTR("CIMultiplyBlendMode"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueForKey:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKey:", v16, v10);

    objc_msgSend(v13, "size");
    -[SUUIOnboardingCircleImageDataConsumer _saturationBackgroundImageWithSize:](self, "_saturationBackgroundImageWithSize:");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "imageWithCGImage:", objc_msgSend(v17, "CGImage"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKey:", v18, v9);

    objc_msgSend(v6, "contextWithOptions:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueForKey:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "extent");
    v21 = (const void *)objc_msgSend(v19, "createCGImage:fromRect:", v20);
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:", v21);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    CFRelease(v21);
  }
  p_outputSize = &self->_outputSize;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "scale");
  UIGraphicsBeginImageContextWithOptions(*p_outputSize, 0, v24);

  CurrentContext = UIGraphicsGetCurrentContext();
  width = p_outputSize->width;
  height = p_outputSize->height;
  CGContextBeginPath(CurrentContext);
  v30.origin.x = 0.0;
  v30.origin.y = 0.0;
  v30.size.width = width;
  v30.size.height = height;
  CGContextAddEllipseInRect(CurrentContext, v30);
  CGContextClosePath(CurrentContext);
  CGContextClip(CurrentContext);
  objc_msgSend(v4, "drawInRect:", 0.0, 0.0, width, height);
  UIGraphicsGetImageFromCurrentImageContext();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v28;
}

- (id)_saturationBackgroundImageWithSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v6;
  double v7;
  CGFloat v8;
  void *v9;
  void *v10;
  CGSize v12;
  CGRect v13;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;
  v12.width = width;
  v12.height = height;
  UIGraphicsBeginImageContextWithOptions(v12, 0, v8);

  -[SUUIOnboardingCircleImageDataConsumer tintColor](self, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "set");

  v13.origin.x = 0.0;
  v13.origin.y = 0.0;
  v13.size.width = width;
  v13.size.height = height;
  UIRectFill(v13);
  UIGraphicsGetImageFromCurrentImageContext();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v10;
}

- (CGSize)outputSize
{
  double width;
  double height;
  CGSize result;

  width = self->_outputSize.width;
  height = self->_outputSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setOutputSize:(CGSize)a3
{
  self->_outputSize = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)usesSaturationFilter
{
  return self->_usesSaturationFilter;
}

- (void)setUsesSaturationFilter:(BOOL)a3
{
  self->_usesSaturationFilter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end
