@implementation CIDither

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[5];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryColorEffect");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryHighDynamicRange");
  v5[4] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  v7[1] = CFSTR("12");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.14");
  v6[3] = CFSTR("inputIntensity");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeMax");
  v4[0] = &unk_1E2F19070;
  v4[1] = &unk_1E2F19090;
  v3[2] = CFSTR("CIAttributeSliderMin");
  v3[3] = CFSTR("CIAttributeSliderMax");
  v4[2] = &unk_1E2F19070;
  v4[3] = &unk_1E2F19080;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F190A0;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

+ (id)_kernelDither
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_ddither);
}

- (id)outputImage
{
  float v3;
  CIImage *v5;
  CIImage *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  -[NSNumber floatValue](self->inputIntensity, "floatValue");
  if (v3 < 0.0001)
    return self->inputImage;
  v5 = -[CIFilter outputImage](+[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIRandomGenerator")), "outputImage");
  v6 = -[CIImage imageByUnpremultiplyingAlpha](self->inputImage, "imageByUnpremultiplyingAlpha");
  v7 = +[CIDither _kernelDither](CIDither, "_kernelDither");
  -[CIImage extent](v6, "extent");
  v12[0] = v6;
  v12[1] = v5;
  v12[2] = self->inputIntensity;
  return (id)objc_msgSend((id)objc_msgSend(v7, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3), v8, v9, v10, v11), "imageByPremultiplyingAlpha");
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputIntensity
{
  return self->inputIntensity;
}

- (void)setInputIntensity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
