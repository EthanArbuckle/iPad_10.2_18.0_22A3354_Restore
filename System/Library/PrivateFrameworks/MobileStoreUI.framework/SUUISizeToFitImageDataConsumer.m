@implementation SUUISizeToFitImageDataConsumer

+ (id)consumerWithConstraintSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  id result;

  height = a3.height;
  width = a3.width;
  result = (id)objc_msgSend(a1, "consumer");
  *((CGFloat *)result + 1) = width;
  *((CGFloat *)result + 2) = height;
  return result;
}

+ (id)consumerWithConstraintSize2:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  id result;

  height = a3.height;
  width = a3.width;
  result = (id)objc_msgSend(a1, "consumer");
  *((CGFloat *)result + 1) = width;
  *((CGFloat *)result + 2) = height;
  *((_BYTE *)result + 24) = 1;
  return result;
}

- (id)imageForImage:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  CGFloat v9;
  CGContext *CurrentContext;
  double width;
  double height;
  double v13;
  double v14;
  id v15;
  float v16;
  float v17;
  double v18;
  CGFloat v19;
  CGSize v21;
  CGSize v22;

  v4 = a3;
  v5 = v4;
  if (self->_custom)
  {
    v21.width = 0.0;
    v21.height = 0.0;
    objc_msgSend(v4, "size");
    SUUIIconFrameForIconSize(&v21.width, 0, v6, v7, self->_constraintSize.width, self->_constraintSize.height, 0.0);
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    UIGraphicsBeginImageContextWithOptions(v21, 0, v9);

    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationLow);
    width = v21.width;
    height = v21.height;
LABEL_10:
    objc_msgSend(v5, "drawInRect:", 0.0, 0.0, width, height);
    -[SUUISizeToFitImageDataConsumer _drawGradientWithContext:imageRect:](self, "_drawGradientWithContext:imageRect:", CurrentContext, 0.0, 0.0, width, height);
    CGContextRestoreGState(CurrentContext);
    UIGraphicsGetImageFromCurrentImageContext();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    goto LABEL_11;
  }
  objc_msgSend(v4, "size");
  width = self->_constraintSize.width;
  height = self->_constraintSize.height;
  if (height != 0.0)
  {
    if (width <= height)
    {
      v17 = v13 * (height / v14);
      width = floorf(v17);
      goto LABEL_9;
    }
LABEL_7:
    v16 = v14 * (width / v13);
    height = floorf(v16);
LABEL_9:
    objc_msgSend(v5, "scale");
    v19 = v18;
    v22.width = width;
    v22.height = height;
    UIGraphicsBeginImageContextWithOptions(v22, 0, v19);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationLow);
    goto LABEL_10;
  }
  if (width != 0.0)
    goto LABEL_7;
  v15 = v5;
LABEL_11:

  return v15;
}

- (void)_drawGradientWithContext:(CGContext *)a3 imageRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGColorSpace *DeviceRGB;
  id v11;
  const __CFArray *v12;
  CGGradient *v13;
  CGFloat v14;
  const void *v15[2];
  CGFloat locations[3];
  uint64_t v17;
  CGPoint v18;
  CGPoint v19;
  CGRect v20;
  CGRect v21;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_gradientEndColor)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)locations = xmmword_241EFBBB0;
    -[UIColor colorWithAlphaComponent:](self->_gradientEndColor, "colorWithAlphaComponent:", 0.0);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15[1] = -[UIColor CGColor](self->_gradientEndColor, "CGColor", objc_msgSend(v11, "CGColor"));

    v12 = CFArrayCreate(0, v15, 2, MEMORY[0x24BDBD690]);
    v13 = CGGradientCreateWithColors(DeviceRGB, v12, locations);
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v14 = CGRectGetMaxY(v20) - self->_gradientHeight;
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v19.y = CGRectGetMaxY(v21);
    v18.x = 0.0;
    v19.x = 0.0;
    v18.y = v14;
    CGContextDrawLinearGradient(a3, v13, v18, v19, 0);
    CGGradientRelease(v13);
    CFRelease(v12);
    CGColorSpaceRelease(DeviceRGB);
  }
}

- (CGSize)constraintSize
{
  double width;
  double height;
  CGSize result;

  width = self->_constraintSize.width;
  height = self->_constraintSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setConstraintSize:(CGSize)a3
{
  self->_constraintSize = a3;
}

- (UIColor)gradientEndColor
{
  return self->_gradientEndColor;
}

- (void)setGradientEndColor:(id)a3
{
  objc_storeStrong((id *)&self->_gradientEndColor, a3);
}

- (double)gradientHeight
{
  return self->_gradientHeight;
}

- (void)setGradientHeight:(double)a3
{
  self->_gradientHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientEndColor, 0);
}

@end
