@implementation CIColorPosterize

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[7];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryColorEffect");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryInterlaced");
  v5[3] = CFSTR("CICategoryNonSquarePixels");
  v5[4] = CFSTR("CICategoryStillImage");
  v5[5] = CFSTR("CICategoryHighDynamicRange");
  v5[6] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 7);
  v7[1] = CFSTR("6");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.4");
  v6[3] = CFSTR("inputLevels");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F190D0;
  v4[1] = &unk_1E2F190E0;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F190F0;
  v4[3] = &unk_1E2F19100;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F19110;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_colorPosterize);
}

- (BOOL)_isIdentity
{
  double v2;

  -[NSNumber doubleValue](self->inputLevels, "doubleValue");
  return v2 >= 300.0;
}

- (id)outputImage
{
  float v4;
  float v5;
  double v6;
  double v7;
  CIImage *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  if (-[CIColorPosterize _isIdentity](self, "_isIdentity"))
    return self->inputImage;
  -[NSNumber floatValue](self->inputLevels, "floatValue");
  v5 = floorf(v4 + -1.0);
  if (v5 <= 0.0)
  {
    v6 = 0.0;
    v7 = 1.0;
  }
  else
  {
    v6 = v5;
    v7 = (float)(1.0 / v5);
  }
  v8 = -[CIImage imageByUnpremultiplyingAlpha](self->inputImage, "imageByUnpremultiplyingAlpha");
  v9 = -[CIColorPosterize _kernel](self, "_kernel");
  -[CIImage extent](v8, "extent");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18[0] = v8;
  v18[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v6, v7);
  return (id)objc_msgSend((id)objc_msgSend(v9, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2), v11, v13, v15, v17), "imageByPremultiplyingAlpha");
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputLevels
{
  return self->inputLevels;
}

- (void)setInputLevels:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
