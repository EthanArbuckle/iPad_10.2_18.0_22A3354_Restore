@implementation CIGlassDistortion

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[2];
  _QWORD v6[2];
  const __CFString *v7;
  const __CFString *v8;
  _QWORD v9[4];
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryDistortionEffect");
  v9[1] = CFSTR("CICategoryVideo");
  v9[2] = CFSTR("CICategoryStillImage");
  v9[3] = CFSTR("CICategoryBuiltIn");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v11[1] = CFSTR("8");
  v10[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v10[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v11[2] = CFSTR("10.4");
  v10[3] = CFSTR("inputTexture");
  v7 = CFSTR("CIAttributeType");
  v8 = CFSTR("CIAttributeTypeImage");
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v10[4] = CFSTR("inputCenter");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeType");
  v6[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 150.0, 150.0);
  v6[1] = CFSTR("CIAttributeTypePosition");
  v11[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v10[5] = CFSTR("inputScale");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F19CC0;
  v4[1] = &unk_1E2F19CD0;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F19CE0;
  v4[3] = &unk_1E2F19CF0;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F19CC0;
  v4[5] = CFSTR("CIAttributeTypeDistance");
  v11[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_glassDistort);
}

- (id)outputImage
{
  float v3;
  double v4;
  float v5;
  double v6;
  float v7;
  double v8;
  float v9;
  double v10;
  float v11;
  CIVector *v12;
  CIVector *v13;
  CIVector *v14;
  CIVector *v15;
  CIVector *v16;
  uint64_t v17;
  CIImage *inputImage;
  CIImage *inputTexture;
  double v20;
  double v21;
  double v22;
  double v23;
  id v25;
  _QWORD v26[5];
  _QWORD v27[8];
  _QWORD v28[8];

  v28[6] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  -[NSNumber floatValue](self->inputScale, "floatValue");
  if (v3 < 0.001 || !self->inputTexture)
    return self->inputImage;
  -[CIVector X](self->inputCenter, "X");
  v5 = v4;
  -[CIVector Y](self->inputCenter, "Y");
  v7 = v6;
  -[CIImage extent](self->inputTexture, "extent");
  v9 = v8 + -1.0;
  v11 = v10 + -1.0;
  v12 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", (float)(1.0 / v9), (float)(1.0 / v9));
  v13 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v9, v11);
  v14 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", (float)((float)(0.0 - v5) / v9), (float)((float)(0.0 - v7) / v11));
  v15 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", (float)((float)(1.0 - v5) / v9), (float)((float)(0.0 - v7) / v11));
  v16 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", (float)((float)(0.0 - v5) / v9), (float)((float)(1.0 - v7) / v11));
  v28[0] = self->inputScale;
  v28[1] = v12;
  v28[2] = v14;
  v28[3] = v15;
  v28[4] = v16;
  v28[5] = v13;
  v17 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 6);
  v25 = -[CIGlassDistortion _kernel](self, "_kernel");
  -[CIImage extent](self->inputImage, "extent");
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __32__CIGlassDistortion_outputImage__block_invoke;
  v26[3] = &unk_1E2EC3588;
  inputImage = self->inputImage;
  inputTexture = self->inputTexture;
  v26[4] = v17;
  v27[0] = inputImage;
  v27[1] = inputTexture;
  v27[2] = v12;
  v27[3] = v14;
  v27[4] = v15;
  v27[5] = v16;
  v27[6] = v13;
  v27[7] = self->inputScale;
  return (id)objc_msgSend(v25, "applyWithExtent:roiCallback:arguments:", v26, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 8), v20, v21, v22, v23);
}

void __32__CIGlassDistortion_outputImage__block_invoke(uint64_t a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  void *v11;
  float v12;
  CGFloat v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  v11 = *(void **)(a1 + 32);
  objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 0), "floatValue");
  if (a2)
  {
    objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 1), "X");
    objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 1), "Y");
    objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 5), "X");
    objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 5), "Y");
    v14.origin.x = a3;
    v14.origin.y = a4;
    v14.size.width = a5;
    v14.size.height = a6;
    CGRectGetMinX(v14);
    objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 2), "X");
    v15.origin.x = a3;
    v15.origin.y = a4;
    v15.size.width = a5;
    v15.size.height = a6;
    CGRectGetMinY(v15);
    objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 2), "Y");
    v16.origin.x = a3;
    v16.origin.y = a4;
    v16.size.width = a5;
    v16.size.height = a6;
    CGRectGetMaxX(v16);
    objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 3), "X");
    v17.origin.x = a3;
    v17.origin.y = a4;
    v17.size.width = a5;
    v17.size.height = a6;
    CGRectGetMaxY(v17);
    objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 4), "Y");
  }
  else
  {
    v13 = (float)(v12 * -0.5);
    v18.origin.x = a3;
    v18.origin.y = a4;
    v18.size.width = a5;
    v18.size.height = a6;
    CGRectInset(v18, v13, v13);
  }
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputTexture
{
  return self->inputTexture;
}

- (void)setInputTexture:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
