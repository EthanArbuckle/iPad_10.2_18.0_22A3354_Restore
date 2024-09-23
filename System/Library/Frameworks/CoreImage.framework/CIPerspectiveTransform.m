@implementation CIPerspectiveTransform

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[4];
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryGeometryAdjustment");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryBuiltIn");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v13[1] = CFSTR("6");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.4");
  v12[3] = CFSTR("inputBottomLeft");
  v9[0] = CFSTR("CIAttributeDefault");
  v9[1] = CFSTR("CIAttributeType");
  v10[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 155.0, 153.0);
  v10[1] = CFSTR("CIAttributeTypePosition");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v12[4] = CFSTR("inputBottomRight");
  v7[0] = CFSTR("CIAttributeDefault");
  v7[1] = CFSTR("CIAttributeType");
  v8[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 548.0, 140.0);
  v8[1] = CFSTR("CIAttributeTypePosition");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v12[5] = CFSTR("inputTopRight");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeType");
  v6[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 646.0, 507.0);
  v6[1] = CFSTR("CIAttributeTypePosition");
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v12[6] = CFSTR("inputTopLeft");
  v3[0] = CFSTR("CIAttributeDefault");
  v3[1] = CFSTR("CIAttributeType");
  v4[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 118.0, 484.0);
  v4[1] = CFSTR("CIAttributeTypePosition");
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (id)outputImage
{
  CIImage *inputImage;
  CIImage *v5;
  CIVector *v6;
  CIVector *inputTopLeft;
  CIVector *inputTopRight;
  CIVector *inputBottomRight;
  CIVector *inputBottomLeft;
  CGRect v11;

  inputImage = self->inputImage;
  if (!inputImage)
    return 0;
  -[CIImage extent](inputImage, "extent");
  if (CGRectIsInfinite(v11))
    return 0;
  v5 = self->inputImage;
  -[CIImage extent](v5, "extent");
  v6 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  inputTopLeft = self->inputTopLeft;
  if (!inputTopLeft)
    inputTopLeft = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 0.0);
  inputTopRight = self->inputTopRight;
  if (!inputTopRight)
    inputTopRight = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 0.0);
  inputBottomRight = self->inputBottomRight;
  if (!inputBottomRight)
    inputBottomRight = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 0.0);
  inputBottomLeft = self->inputBottomLeft;
  if (!inputBottomLeft)
    inputBottomLeft = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 0.0);
  return -[CIImage filteredImage:keysAndValues:](v5, "filteredImage:keysAndValues:", CFSTR("CIPerspectiveTransformWithExtent"), CFSTR("inputExtent"), v6, CFSTR("inputTopLeft"), inputTopLeft, CFSTR("inputTopRight"), inputTopRight, CFSTR("inputBottomRight"), inputBottomRight, CFSTR("inputBottomLeft"), inputBottomLeft, 0);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputTopLeft
{
  return self->inputTopLeft;
}

- (void)setInputTopLeft:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIVector)inputTopRight
{
  return self->inputTopRight;
}

- (void)setInputTopRight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CIVector)inputBottomRight
{
  return self->inputBottomRight;
}

- (void)setInputBottomRight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (CIVector)inputBottomLeft
{
  return self->inputBottomLeft;
}

- (void)setInputBottomLeft:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
