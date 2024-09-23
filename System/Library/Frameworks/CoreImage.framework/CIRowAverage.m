@implementation CIRowAverage

- (id)outputImage
{
  CIImage *inputImage;
  CIImage *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  inputImage = self->super.super.inputImage;
  v15 = xmmword_1924948E0;
  v16 = 0x3FF0000000000000;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v4 = -[CIImage imageByApplyingTransform:](inputImage, "imageByApplyingTransform:", &v15);
  -[CIVector Y](self->super.super.inputExtent, "Y");
  v6 = v5;
  -[CIVector X](self->super.super.inputExtent, "X");
  v8 = -v7;
  -[CIVector Z](self->super.super.inputExtent, "Z");
  v10 = v8 - v9;
  -[CIVector W](self->super.super.inputExtent, "W");
  v12 = v11;
  -[CIVector Z](self->super.super.inputExtent, "Z");
  return -[CIImage filteredImage:keysAndValues:](v4, "filteredImage:keysAndValues:", CFSTR("CIColumnAverage"), CFSTR("inputExtent"), +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v6, v10, v12, v13), 0);
}

@end
