@implementation IHKBilateralGridUtils

+ (CGImage)autoApplyGridBufferWithGridBuffer:(vImage_Buffer *)a3 image:(CGImage *)a4 assume_BGRA_sRGB:(BOOL)a5 gridStrength:(float)a6
{
  void *data;
  vImagePixelCount height;
  vImagePixelCount width;
  size_t rowBytes;
  CGImage *v12;
  int64x2_t *v13;

  data = a3->data;
  height = a3->height;
  width = a3->width;
  rowBytes = a3->rowBytes;
  v12 = a4;
  v13 = sub_23ECC607C((uint64_t)data, height, width, rowBytes, (uint64_t)v12, a5, a6);

  return (CGImage *)v13;
}

- (_TtC21ImageHarmonizationKit21IHKBilateralGridUtils)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IHKBilateralGridUtils();
  return -[IHKBilateralGridUtils init](&v3, sel_init);
}

@end
