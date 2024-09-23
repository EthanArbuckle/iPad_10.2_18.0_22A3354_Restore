@implementation CICrop

+ (id)customAttributes
{
  double *v2;
  _QWORD v4[3];
  _QWORD v5[3];
  _QWORD v6[4];
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("CIAttributeFilterCategories");
  v6[0] = CFSTR("CICategoryGeometryAdjustment");
  v6[1] = CFSTR("CICategoryVideo");
  v6[2] = CFSTR("CICategoryStillImage");
  v6[3] = CFSTR("CICategoryBuiltIn");
  v8[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v8[1] = CFSTR("5");
  v7[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v7[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v8[2] = CFSTR("10.4");
  v7[3] = CFSTR("inputRectangle");
  v5[0] = CFSTR("CIAttributeTypeRectangle");
  v4[0] = CFSTR("CIAttributeType");
  v4[1] = CFSTR("CIAttributeDefault");
  v2 = (double *)MEMORY[0x1E0C9D5E0];
  v5[1] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", *MEMORY[0x1E0C9D5E0], *(double *)(MEMORY[0x1E0C9D5E0] + 8), *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
  v4[2] = CFSTR("CIAttributeIdentity");
  v5[2] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", *v2, v2[1], v2[2], v2[3]);
  v8[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
}

- (id)outputImage
{
  CIImage *inputImage;
  CIVector *inputRectangle;

  inputImage = self->inputImage;
  if (!inputImage)
    return 0;
  inputRectangle = self->inputRectangle;
  if (!inputRectangle)
    return inputImage;
  -[CIVector CGRectValue](inputRectangle, "CGRectValue");
  return -[CIImage imageByCroppingToRect:](self->inputImage, "imageByCroppingToRect:");
}

- (id)_outputProperties
{
  double y;
  double width;
  double height;
  _QWORD v6[5];
  CGRect v7;
  CGRect v8;

  v6[4] = *MEMORY[0x1E0C80C00];
  -[CIVector CGRectValue](self->inputRectangle, "CGRectValue");
  v8 = CGRectStandardize(v7);
  y = v8.origin.y;
  width = v8.size.width;
  height = v8.size.height;
  v6[0] = metadataPropertyWithDouble(v8.origin.x);
  v6[1] = metadataPropertyWithDouble(y);
  v6[2] = metadataPropertyWithDouble(width);
  v6[3] = metadataPropertyWithDouble(height);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
}

- (id)_initFromProperties:(id)a3
{
  double v6;
  double v7;
  double v8;
  double v9;

  v8 = 0.0;
  v9 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  if (metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("CropX"), &v9)&& metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("CropY"), &v8)&& metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("CropW"), &v7)&& metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("CropH"), &v6))
  {
    -[CICrop setInputRectangle:](self, "setInputRectangle:", +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v9, v8, v7, v6));
  }
  else
  {

    return 0;
  }
  return self;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputRectangle
{
  return self->inputRectangle;
}

- (void)setInputRectangle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
