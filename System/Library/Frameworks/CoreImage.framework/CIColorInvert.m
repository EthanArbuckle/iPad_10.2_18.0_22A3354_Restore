@implementation CIColorInvert

- (id)outputImage
{
  return -[CIImage filteredImage:keysAndValues:](self->inputImage, "filteredImage:keysAndValues:", CFSTR("CIColorMatrix"), CFSTR("inputRVector"), +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", -1.0, 0.0, 0.0), CFSTR("inputGVector"), +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", 0.0, -1.0, 0.0), CFSTR("inputBVector"), +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", 0.0, 0.0, -1.0), CFSTR("inputAVector"), +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0), CFSTR("inputBiasVector"), +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", 1.0, 1.0, 1.0), 0);
}

+ (id)customAttributes
{
  _QWORD v3[7];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryColorEffect");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryInterlaced");
  v3[3] = CFSTR("CICategoryNonSquarePixels");
  v3[4] = CFSTR("CICategoryStillImage");
  v3[5] = CFSTR("CICategoryHighDynamicRange");
  v3[6] = CFSTR("CICategoryBuiltIn");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7);
  v5[1] = CFSTR("5");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.4");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

@end
