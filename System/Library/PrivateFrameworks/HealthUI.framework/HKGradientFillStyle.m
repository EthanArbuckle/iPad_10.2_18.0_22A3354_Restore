@implementation HKGradientFillStyle

- (HKGradientFillStyle)initWithFirstColor:(id)a3 secondColor:(id)a4
{
  return -[HKGradientFillStyle initWithFirstColor:secondColor:fillPercentage:fillDirection:gradientSize:](self, "initWithFirstColor:secondColor:fillPercentage:fillDirection:gradientSize:", a3, a4, 0, 1.0, 0.0);
}

- (HKGradientFillStyle)initWithFirstColor:(id)a3 secondColor:(id)a4 fillPercentage:(double)a5 fillDirection:(int64_t)a6 gradientSize:(double)a7
{
  id v13;
  id v14;
  HKGradientFillStyle *v15;
  HKGradientFillStyle *v16;
  double v17;
  NSLock *v18;
  NSLock *gradientFillStyleLock;
  UIImage *cachedImageStorage;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HKGradientFillStyle;
  v15 = -[HKGradientFillStyle init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_firstColor, a3);
    objc_storeStrong((id *)&v16->_secondColor, a4);
    v17 = 0.0;
    if (a5 >= 0.0)
      v17 = a5;
    v16->_fillPercentage = fmin(v17, 1.0);
    v16->_fillDirection = a6;
    v16->_gradientSize = a7;
    v18 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    gradientFillStyleLock = v16->_gradientFillStyleLock;
    v16->_gradientFillStyleLock = v18;

    -[NSLock setName:](v16->_gradientFillStyleLock, "setName:", CFSTR("HKGradientFillStyleLock"));
    cachedImageStorage = v16->_cachedImageStorage;
    v16->_cachedImageStorage = 0;

  }
  return v16;
}

- (void)clearCache
{
  void *v3;
  UIImage *cachedImageStorage;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKGradientFillStyle;
  -[HKFillStyle clearCache](&v6, sel_clearCache);
  -[HKGradientFillStyle gradientFillStyleLock](self, "gradientFillStyleLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  cachedImageStorage = self->_cachedImageStorage;
  self->_cachedImageStorage = 0;

  -[HKGradientFillStyle gradientFillStyleLock](self, "gradientFillStyleLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

}

- (id)fillImageWithHeight:(double)a3
{
  void *v5;
  UIImage *v6;
  void *v7;

  -[HKGradientFillStyle gradientFillStyleLock](self, "gradientFillStyleLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[HKGradientFillStyle _renderCacheIfNecessaryForHeight:](self, "_renderCacheIfNecessaryForHeight:", a3);
  v6 = self->_cachedImageStorage;
  -[HKGradientFillStyle gradientFillStyleLock](self, "gradientFillStyleLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  return v6;
}

- (id)fillImageWithWidth:(double)a3
{
  void *v5;
  UIImage *v6;
  void *v7;

  -[HKGradientFillStyle gradientFillStyleLock](self, "gradientFillStyleLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[HKGradientFillStyle _renderCacheIfNecessaryForWidth:](self, "_renderCacheIfNecessaryForWidth:", a3);
  v6 = self->_cachedImageStorage;
  -[HKGradientFillStyle gradientFillStyleLock](self, "gradientFillStyleLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  return v6;
}

- (void)renderPath:(CGPath *)a3 context:(CGContext *)a4 axisRect:(CGRect)a5 alpha:(double)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  CGRect v15;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  CGContextSaveGState(a4);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  -[HKGradientFillStyle fillImageWithHeight:](self, "fillImageWithHeight:", CGRectGetHeight(v15));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  CGContextAddPath(a4, a3);
  CGContextClip(a4);
  objc_msgSend(v14, "drawInRect:blendMode:alpha:", 0, x, y, width, height, a6);
  CGContextRestoreGState(a4);

}

- (void)_renderCacheIfNecessaryForHeight:(double)a3
{
  -[HKGradientFillStyle _renderCacheIfNecessaryForSize:](self, "_renderCacheIfNecessaryForSize:", 1.0, a3);
}

- (void)_renderCacheIfNecessaryForWidth:(double)a3
{
  -[HKGradientFillStyle _renderCacheIfNecessaryForSize:](self, "_renderCacheIfNecessaryForSize:", a3, 1.0);
}

- (void)_renderCacheIfNecessaryForSize:(CGSize)a3
{
  double height;
  double width;
  UIImage *v6;
  UIImage *cachedImageStorage;
  id v8;
  _QWORD v9[7];

  height = a3.height;
  width = a3.width;
  if (-[HKGradientFillStyle _needsRenderForSize:](self, "_needsRenderForSize:"))
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", width, height);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__HKGradientFillStyle__renderCacheIfNecessaryForSize___block_invoke;
    v9[3] = &unk_1E9C42D90;
    v9[4] = self;
    *(double *)&v9[5] = width;
    *(double *)&v9[6] = height;
    objc_msgSend(v8, "imageWithActions:", v9);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    cachedImageStorage = self->_cachedImageStorage;
    self->_cachedImageStorage = v6;

  }
}

uint64_t __54__HKGradientFillStyle__renderCacheIfNecessaryForSize___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_renderInContext:size:", objc_msgSend(a2, "CGContext"), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (BOOL)_needsRenderForSize:(CGSize)a3
{
  double height;
  double width;
  UIImage *cachedImageStorage;
  double v6;
  double v7;
  BOOL v9;

  height = a3.height;
  width = a3.width;
  cachedImageStorage = self->_cachedImageStorage;
  -[UIImage size](cachedImageStorage, "size");
  v9 = width != v7 || cachedImageStorage == 0;
  return height != v6 || v9;
}

- (void)_renderInContext:(CGContext *)a3 size:(CGSize)a4
{
  double height;
  double width;
  CGColorSpace *DeviceRGB;
  double fillPercentage;
  const __CFArray *v10;
  CGGradient *v11;
  double gradientSize;
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
  _QWORD v23[2];
  CGFloat locations[3];
  CGPoint v25;
  CGPoint v26;
  CGRect v27;

  height = a4.height;
  width = a4.width;
  locations[2] = *(CGFloat *)MEMORY[0x1E0C80C00];
  CGContextSaveGState(a3);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  fillPercentage = self->_fillPercentage;
  locations[0] = 0.0;
  locations[1] = fillPercentage;
  v23[0] = -[UIColor CGColor](self->_firstColor, "CGColor");
  v23[1] = -[UIColor CGColor](self->_secondColor, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v10 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v11 = CGGradientCreateWithColors(DeviceRGB, v10, locations);
  gradientSize = self->_gradientSize;
  v14 = *MEMORY[0x1E0C9D538];
  v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  switch(self->_fillDirection)
  {
    case 0:
      if (gradientSize <= 0.00000011920929)
        v15 = height;
      else
        v15 = self->_gradientSize;
      v16 = 0.0;
      break;
    case 1:
      if (gradientSize <= 0.00000011920929)
        v17 = height;
      else
        v17 = self->_gradientSize;
      v15 = height - v17;
      v16 = 0.0;
      v13 = height;
      v14 = 0.0;
      break;
    case 2:
      if (gradientSize <= 0.00000011920929)
        v16 = width;
      else
        v16 = self->_gradientSize;
      v15 = 0.0;
      break;
    case 3:
      if (gradientSize <= 0.00000011920929)
        v18 = width;
      else
        v18 = self->_gradientSize;
      v16 = width - v18;
      v15 = 0.0;
      v13 = 0.0;
      v14 = width;
      break;
    default:
      v15 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v16 = *MEMORY[0x1E0C9D538];
      break;
  }
  CGContextSaveGState(a3);
  v27.origin.x = 0.0;
  v27.origin.y = 0.0;
  v27.size.width = width;
  v27.size.height = height;
  CGContextAddRect(a3, v27);
  CGContextClip(a3);
  v25.x = v14;
  v25.y = v13;
  v26.x = v16;
  v26.y = v15;
  CGContextDrawLinearGradient(a3, v11, v25, v26, 0);
  if (gradientSize > 0.00000011920929)
  {
    CGContextSetFillColorWithColor(a3, -[UIColor CGColor](self->_secondColor, "CGColor"));
    switch(self->_fillDirection)
    {
      case 0:
      case 2:
        v19 = v16;
        v20 = v15;
        goto LABEL_23;
      case 1:
      case 3:
        v16 = v14 - v16;
        v15 = v13 - v15;
        v19 = 0.0;
        v20 = 0.0;
LABEL_23:
        v21 = height - v15;
        v22 = width - v16;
        CGContextFillRect(a3, *(CGRect *)&v19);
        break;
      default:
        break;
    }
  }
  CGContextRestoreGState(a3);
  CGGradientRelease(v11);
  CGColorSpaceRelease(DeviceRGB);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKGradientFillStyle;
  v4 = -[HKFillStyle copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 1, self->_firstColor);
  objc_storeStrong(v4 + 2, self->_secondColor);
  v4[3] = *(id *)&self->_fillPercentage;
  v4[4] = (id)self->_fillDirection;
  v4[5] = *(id *)&self->_gradientSize;
  objc_storeStrong(v4 + 7, self->_cachedImageStorage);
  return v4;
}

- (UIColor)firstColor
{
  return self->_firstColor;
}

- (UIColor)secondColor
{
  return self->_secondColor;
}

- (double)fillPercentage
{
  return self->_fillPercentage;
}

- (int64_t)fillDirection
{
  return self->_fillDirection;
}

- (double)gradientSize
{
  return self->_gradientSize;
}

- (NSLock)gradientFillStyleLock
{
  return self->_gradientFillStyleLock;
}

- (UIImage)cachedImageStorage
{
  return self->_cachedImageStorage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedImageStorage, 0);
  objc_storeStrong((id *)&self->_gradientFillStyleLock, 0);
  objc_storeStrong((id *)&self->_secondColor, 0);
  objc_storeStrong((id *)&self->_firstColor, 0);
}

@end
