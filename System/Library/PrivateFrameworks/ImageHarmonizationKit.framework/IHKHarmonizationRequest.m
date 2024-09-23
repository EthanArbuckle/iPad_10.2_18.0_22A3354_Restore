@implementation IHKHarmonizationRequest

- (IHKHarmonizationRequest)initWithForeground:(CGImage *)a3 background:(CGImage *)a4
{
  return (IHKHarmonizationRequest *)MEMORY[0x24BEDD108](self, sel_initWithForeground_background_forceHarmonization_, a3, a4, 0);
}

- (IHKHarmonizationRequest)initWithForeground:(CGImage *)a3 background:(CGImage *)a4 forceHarmonization:(BOOL)a5
{
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  float v13;
  const char *v14;
  double v15;

  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], a2, (uint64_t)a3, (uint64_t)a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatForKey_(v8, v9, (uint64_t)CFSTR("com.apple.ImageHarmonizationKit.harmonizationStrength"), v10, v11);
  v13 = v12;

  LODWORD(v15) = 1.0;
  if (v13 != 0.0)
  {
    *(float *)&v15 = v13;
    if (v13 < 0.0)
      LODWORD(v15) = 0;
  }
  return (IHKHarmonizationRequest *)objc_msgSend_initWithForeground_background_forceHarmonization_harmonizationStrength_(self, v14, (uint64_t)a3, (uint64_t)a4, 0, v15);
}

- (IHKHarmonizationRequest)initWithForeground:(CGImage *)a3 background:(CGImage *)a4 forceHarmonization:(BOOL)a5 harmonizationStrength:(float)a6
{
  IHKHarmonizationRequest *v10;
  IHKHarmonizationRequest *v11;
  IHKHarmonizationRequest *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)IHKHarmonizationRequest;
  v10 = -[IHKHarmonizationRequest init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_forceHarmonization = a5;
    v10->_fg = CGImageRetain(a3);
    v11->_bg = CGImageRetain(a4);
    v11->_harmonizationStrength = a6;
    v12 = v11;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_fg);
  CGImageRelease(self->_bg);
  v3.receiver = self;
  v3.super_class = (Class)IHKHarmonizationRequest;
  -[IHKHarmonizationRequest dealloc](&v3, sel_dealloc);
}

- (BOOL)forceHarmonization
{
  return self->_forceHarmonization;
}

- (CGImage)fg
{
  return self->_fg;
}

- (CGImage)bg
{
  return self->_bg;
}

- (float)harmonizationStrength
{
  return self->_harmonizationStrength;
}

@end
