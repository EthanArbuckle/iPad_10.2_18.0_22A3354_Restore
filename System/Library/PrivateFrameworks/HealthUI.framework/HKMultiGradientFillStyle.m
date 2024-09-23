@implementation HKMultiGradientFillStyle

- (HKMultiGradientFillStyle)initWithColors:(id)a3
{
  id v5;
  HKMultiGradientFillStyle *v6;
  HKMultiGradientFillStyle *v7;
  NSLock *v8;
  NSLock *multiGradientFillStyleLock;
  UIImage *cachedImageStorage;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKMultiGradientFillStyle;
  v6 = -[HKMultiGradientFillStyle init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_colors, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    multiGradientFillStyleLock = v7->_multiGradientFillStyleLock;
    v7->_multiGradientFillStyleLock = v8;

    -[NSLock setName:](v7->_multiGradientFillStyleLock, "setName:", CFSTR("HKMultiGradientFillStyleLock"));
    cachedImageStorage = v7->_cachedImageStorage;
    v7->_cachedImageStorage = 0;

  }
  return v7;
}

- (void)clearCache
{
  void *v3;
  UIImage *cachedImageStorage;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKMultiGradientFillStyle;
  -[HKFillStyle clearCache](&v6, sel_clearCache);
  -[HKMultiGradientFillStyle multiGradientFillStyleLock](self, "multiGradientFillStyleLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  cachedImageStorage = self->_cachedImageStorage;
  self->_cachedImageStorage = 0;

  -[HKMultiGradientFillStyle multiGradientFillStyleLock](self, "multiGradientFillStyleLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

}

- (id)fillImageWithHeight:(double)a3
{
  void *v5;
  UIImage *v6;
  void *v7;

  -[HKMultiGradientFillStyle multiGradientFillStyleLock](self, "multiGradientFillStyleLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[HKMultiGradientFillStyle _renderCacheIfNecessaryForHeight:](self, "_renderCacheIfNecessaryForHeight:", a3);
  v6 = self->_cachedImageStorage;
  -[HKMultiGradientFillStyle multiGradientFillStyleLock](self, "multiGradientFillStyleLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  return v6;
}

- (id)fillImageWithWidth:(double)a3
{
  void *v5;
  UIImage *v6;
  void *v7;

  -[HKMultiGradientFillStyle multiGradientFillStyleLock](self, "multiGradientFillStyleLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[HKMultiGradientFillStyle _renderCacheIfNecessaryForWidth:](self, "_renderCacheIfNecessaryForWidth:", a3);
  v6 = self->_cachedImageStorage;
  -[HKMultiGradientFillStyle multiGradientFillStyleLock](self, "multiGradientFillStyleLock");
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
  -[HKMultiGradientFillStyle fillImageWithHeight:](self, "fillImageWithHeight:", CGRectGetHeight(v15));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  CGContextAddPath(a4, a3);
  CGContextClip(a4);
  objc_msgSend(v14, "drawInRect:blendMode:alpha:", 0, x, y, width, height, a6);
  CGContextRestoreGState(a4);

}

- (void)_renderCacheIfNecessaryForHeight:(double)a3
{
  -[HKMultiGradientFillStyle _renderCacheIfNecessaryForSize:](self, "_renderCacheIfNecessaryForSize:", 1.0, a3);
}

- (void)_renderCacheIfNecessaryForWidth:(double)a3
{
  -[HKMultiGradientFillStyle _renderCacheIfNecessaryForSize:](self, "_renderCacheIfNecessaryForSize:", a3, 1.0);
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
  if (-[HKMultiGradientFillStyle _needsRenderForSize:](self, "_needsRenderForSize:"))
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", width, height);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__HKMultiGradientFillStyle__renderCacheIfNecessaryForSize___block_invoke;
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

uint64_t __59__HKMultiGradientFillStyle__renderCacheIfNecessaryForSize___block_invoke(uint64_t a1, void *a2)
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
  CGFloat height;
  CGFloat width;
  CGColorSpace *DeviceRGB;
  void *v9;
  CGFloat *v10;
  const __CFArray *Mutable;
  void *v12;
  CGGradient *v13;
  CGFloat v14;
  CGFloat v15;
  _QWORD v16[6];
  CGPoint v17;
  CGPoint v18;
  CGRect v19;

  height = a4.height;
  width = a4.width;
  CGContextSaveGState(a3);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  -[HKMultiGradientFillStyle colors](self, "colors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (CGFloat *)malloc_type_malloc(8 * (int)objc_msgSend(v9, "count"), 0x100004000313F17uLL);

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  -[HKMultiGradientFillStyle colors](self, "colors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__HKMultiGradientFillStyle__renderInContext_size___block_invoke;
  v16[3] = &__block_descriptor_48_e41_v32__0__HKMultiGradientFillColor_8Q16_B24l;
  v16[4] = Mutable;
  v16[5] = v10;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);

  v13 = CGGradientCreateWithColors(DeviceRGB, Mutable, v10);
  v14 = *MEMORY[0x1E0C9D538];
  v15 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  CGContextSaveGState(a3);
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = width;
  v19.size.height = height;
  CGContextAddRect(a3, v19);
  CGContextClip(a3);
  v18.x = 0.0;
  v17.x = v14;
  v17.y = v15;
  v18.y = height;
  CGContextDrawLinearGradient(a3, v13, v17, v18, 0);
  CGContextRestoreGState(a3);
  CGGradientRelease(v13);
  CGColorSpaceRelease(DeviceRGB);
  free(v10);
}

void __50__HKMultiGradientFillStyle__renderInContext_size___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  __CFArray *v5;
  id v6;
  id v7;
  float v8;
  id v9;

  v5 = *(__CFArray **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "color");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CFArrayAppendValue(v5, (const void *)objc_msgSend(v7, "CGColor"));

  objc_msgSend(v6, "location");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "floatValue");
  *(double *)(*(_QWORD *)(a1 + 40) + 8 * a3) = v8;

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKMultiGradientFillStyle;
  v4 = -[HKFillStyle copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 1, self->_colors);
  objc_storeStrong(v4 + 3, self->_cachedImageStorage);
  return v4;
}

- (NSArray)colors
{
  return self->_colors;
}

- (NSLock)multiGradientFillStyleLock
{
  return self->_multiGradientFillStyleLock;
}

- (UIImage)cachedImageStorage
{
  return self->_cachedImageStorage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedImageStorage, 0);
  objc_storeStrong((id *)&self->_multiGradientFillStyleLock, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

@end
