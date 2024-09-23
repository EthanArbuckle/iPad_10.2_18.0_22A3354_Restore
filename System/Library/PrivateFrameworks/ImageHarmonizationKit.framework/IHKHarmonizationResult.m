@implementation IHKHarmonizationResult

- (IHKHarmonizationResult)initWithHarmonized:(CGImage *)a3 gatingScore:(float)a4 shouldHarmonize:(BOOL)a5
{
  IHKHarmonizationResult *v8;
  IHKHarmonizationResult *v9;
  IHKHarmonizationResult *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IHKHarmonizationResult;
  v8 = -[IHKHarmonizationResult init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_gatingScore = a4;
    v8->_harmonized = CGImageRetain(a3);
    v9->_shouldHarmonize = a5;
    v10 = v9;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_harmonized);
  v3.receiver = self;
  v3.super_class = (Class)IHKHarmonizationResult;
  -[IHKHarmonizationResult dealloc](&v3, sel_dealloc);
}

- (CGImage)harmonized
{
  return self->_harmonized;
}

- (float)gatingScore
{
  return self->_gatingScore;
}

- (BOOL)shouldHarmonize
{
  return self->_shouldHarmonize;
}

@end
