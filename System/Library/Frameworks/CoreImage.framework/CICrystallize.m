@implementation CICrystallize

- (id)_CICrystallize
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_crystallize);
}

- (id)outputImage
{
  float v4;
  double v5;
  float v6;
  double v7;
  double v8;
  double v9;
  CIVector *v10;
  id v11;
  double x;
  double y;
  double width;
  double height;
  id v16;
  CIImage *inputImage;
  _QWORD v18[4];
  uint64_t v19;
  _QWORD v20[5];
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v20[4] = *MEMORY[0x1E0C80C00];
  -[CIImage extent](self->inputImage, "extent");
  if (CGRectIsEmpty(v21))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  if (v4 < 1.0)
    return self->inputImage;
  v5 = round(v4 * 0.5);
  v6 = v5 + v5;
  -[CIVector X](self->inputCenter, "X");
  v8 = round(v7);
  -[CIVector Y](self->inputCenter, "Y");
  v10 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v8, round(v9));
  v11 = +[CIImage noiseImageNearest](CIImage, "noiseImageNearest");
  -[CIImage extent](self->inputImage, "extent");
  v23 = CGRectInset(v22, v6 * -1.5, v6 * -1.5);
  x = v23.origin.x;
  y = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;
  v16 = -[CICrystallize _CICrystallize](self, "_CICrystallize");
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __28__CICrystallize_outputImage__block_invoke;
  v18[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  inputImage = self->inputImage;
  *(float *)&v19 = v6;
  v20[2] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v6, 1.0 / v6, MEMORY[0x1E0C809B0], 3221225472, __28__CICrystallize_outputImage__block_invoke, &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, v19, inputImage, v11);
  v20[3] = v10;
  return (id)objc_msgSend(v16, "applyWithExtent:roiCallback:arguments:", v18, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4), x, y, width, height);
}

double __28__CICrystallize_outputImage__block_invoke(uint64_t a1, int a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  CGFloat v15;
  float v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  if (a2 == 1)
    return 0.0;
  v9 = a3;
  if (!a2)
  {
    v16 = *(float *)(a1 + 32);
    v15 = CGRectGetMinX(*(CGRect *)&a3) + 0.5;
    v17.origin.x = v9;
    v17.origin.y = a4;
    v17.size.width = a5;
    v17.size.height = a6;
    v10 = CGRectGetMinY(v17) + 0.5;
    v18.origin.x = v9;
    v18.origin.y = a4;
    v18.size.width = a5;
    v18.size.height = a6;
    v11 = CGRectGetMaxX(v18) + -0.5;
    v19.origin.x = v9;
    v19.origin.y = a4;
    v19.size.width = a5;
    v19.size.height = a6;
    v12 = CGRectGetMaxY(v19) + -0.5;
    v20.origin.x = (floor(v15 / v16 + -0.5) + 0.5) * v16 + 0.5;
    v20.origin.y = (floor(v10 / v16 + -0.5) + 0.5) * v16 + 0.5;
    v13 = (floor(v12 / v16 + -0.5) + 0.5) * v16 + 0.5 + v16;
    v20.size.width = (floor(v11 / v16 + -0.5) + 0.5) * v16 + 0.5 + v16 - v20.origin.x;
    v20.size.height = v13 - v20.origin.y;
    *(_QWORD *)&v9 = (unint64_t)CGRectInset(v20, v16 * -0.325, v16 * -0.325);
  }
  return v9;
}

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[5];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryStylize");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryHighDynamicRange");
  v5[4] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  v7[1] = CFSTR("9");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.4");
  v6[3] = CFSTR("inputRadius");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F19330;
  v4[3] = &unk_1E2F19340;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[0] = &unk_1E2F19320;
  v4[1] = &unk_1E2F19320;
  v4[4] = &unk_1E2F19320;
  v4[5] = CFSTR("CIAttributeTypeDistance");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
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

@end
