@implementation CIMotionBlur

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryBlur");
  v5[1] = CFSTR("CICategoryStillImage");
  v5[2] = CFSTR("CICategoryVideo");
  v5[3] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v7[1] = CFSTR("8.3");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.4");
  v6[3] = CFSTR("inputRadius");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F1A480;
  v4[1] = &unk_1E2F1A480;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeIdentity");
  v4[2] = &unk_1E2F1A490;
  v4[3] = &unk_1E2F1A480;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F1A4A0;
  v4[5] = CFSTR("CIAttributeTypeDistance");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_motionBlur);
}

- (id)_blur:(id)a3 pass:(int)a4 weightsFactor:(float)a5 legacyExtent:(CGRect *)a6
{
  char v8;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  CIVector *v20;
  double width;
  float v22;
  double v23;
  float v24;
  id v25;
  double height;
  double y;
  double x;
  _QWORD v30[4];
  float v31;
  float v32;
  _QWORD v33[3];
  CGRect v34;
  CGRect v35;

  v8 = a4;
  v33[2] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputAngle, "floatValue");
  v12 = sinf(v11);
  v13 = (float)(1 << v8);
  -[NSNumber floatValue](self->inputAngle, "floatValue");
  v15 = cosf(v14) * v13;
  v16 = fabsf(v12 * v13);
  v17 = ceil(v16 + v16);
  v18 = fabsf(v15);
  v19 = ceil(v18 + v18);
  v20 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v15, (float)(v12 * v13), (float)(1.0 - a5) + a5 * 0.375, a5 * 0.25);
  objc_msgSend(a3, "extent");
  v35 = CGRectInset(v34, (float)-v19, (float)-v17);
  y = v35.origin.y;
  x = v35.origin.x;
  width = v35.size.width;
  height = v35.size.height;
  v22 = -v15;
  if (v15 >= 0.0)
    v22 = v15;
  v23 = -floor(v22 + v22);
  v24 = -(float)(v12 * v13);
  if ((float)(v12 * v13) >= 0.0)
    v24 = v12 * v13;
  *a6 = CGRectInset(*a6, v23, -floor(v24 + v24));
  v25 = -[CIMotionBlur _kernel](self, "_kernel");
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __54__CIMotionBlur__blur_pass_weightsFactor_legacyExtent___block_invoke;
  v30[3] = &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v31 = v19;
  v32 = v17;
  v33[0] = a3;
  v33[1] = v20;
  return (id)objc_msgSend(v25, "applyWithExtent:roiCallback:arguments:", v30, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2), x, y, width, height);
}

double __54__CIMotionBlur__blur_pass_weightsFactor_legacyExtent___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, (float)-*(float *)(a1 + 32), (float)-*(float *)(a1 + 36));
  return result;
}

- (BOOL)_isIdentity
{
  float v2;

  -[NSNumber floatValue](self->inputRadius, "floatValue");
  return v2 < 0.001;
}

- (id)outputImage
{
  float v4;
  float v5;
  float v6;
  uint64_t v7;
  float v8;
  float v9;
  float v10;
  CIImage *inputImage;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;

  if (!self->inputImage)
    return 0;
  if (-[CIMotionBlur _isIdentity](self, "_isIdentity"))
    return self->inputImage;
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v5 = v4 * v4;
  v6 = 1.0833;
  v7 = 0;
  if (v5 > 1.0833)
  {
    v8 = 1.0;
    do
    {
      v9 = v6;
      v7 = (v7 + 1);
      v8 = v8 * 4.0;
      v6 = v6 + v8;
    }
    while (v5 > v6);
    v5 = v5 - v9;
    v6 = v6 - v9;
  }
  v10 = v5 / v6;
  inputImage = self->inputImage;
  -[CIImage extent](inputImage, "extent");
  v18 = v12;
  v19 = v13;
  v20 = v14;
  v21 = v15;
  if ((int)v7 < 1)
  {
    v7 = 0;
  }
  else
  {
    v16 = 0;
    do
    {
      LODWORD(v12) = 1.0;
      inputImage = -[CIMotionBlur _blur:pass:weightsFactor:legacyExtent:](self, "_blur:pass:weightsFactor:legacyExtent:", inputImage, v16, &v18, v12);
      v16 = (v16 + 1);
    }
    while ((_DWORD)v7 != (_DWORD)v16);
  }
  *(float *)&v12 = v10;
  v17 = -[CIMotionBlur _blur:pass:weightsFactor:legacyExtent:](self, "_blur:pass:weightsFactor:legacyExtent:", inputImage, v7, &v18, v12);
  return (id)objc_msgSend(v17, "imageByCroppingToRect:", v18, v19, v20, v21);
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

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
