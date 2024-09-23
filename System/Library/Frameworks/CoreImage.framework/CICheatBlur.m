@implementation CICheatBlur

- (id)_CIBox4
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_box4);
}

- (id)_CIBox6
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_box6);
}

- (id)_CICross4
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_cross4);
}

- (id)outputImage
{
  float v3;
  double v4;
  CIImage *inputImage;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double x;
  double y;
  double width;
  double height;
  id v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  double v38;
  _QWORD v40[6];
  _QWORD v41[6];
  CGAffineTransform v42;
  CGAffineTransform v43;
  _QWORD v44[2];
  CIImage *v45;
  _QWORD v46[2];
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v46[1] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputAmount, "floatValue");
  v4 = v3;
  inputImage = self->inputImage;
  v6 = 1.0;
  if (v3 >= 9.0)
  {
    do
    {
      -[CIImage extent](inputImage, "extent");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      CGAffineTransformMakeScale(&v43, 0.166666667, 0.166666667);
      v47.origin.x = v8;
      v47.origin.y = v10;
      v47.size.width = v12;
      v47.size.height = v14;
      v48 = CGRectApplyAffineTransform(v47, &v43);
      x = v48.origin.x;
      y = v48.origin.y;
      width = v48.size.width;
      height = v48.size.height;
      v19 = -[CICheatBlur _CIBox6](self, "_CIBox6");
      v46[0] = inputImage;
      inputImage = (CIImage *)objc_msgSend(v19, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_4, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1), x, y, width, height);
      v4 = v4 * 0.166666667;
      v6 = v6 * 6.0;
    }
    while (v4 >= 9.0);
  }
  if (v4 >= 6.0)
  {
    -[CIImage extent](inputImage, "extent");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    CGAffineTransformMakeScale(&v42, 0.25, 0.25);
    v49.origin.x = v21;
    v49.origin.y = v23;
    v49.size.width = v25;
    v49.size.height = v27;
    v50 = CGRectApplyAffineTransform(v49, &v42);
    v28 = v50.origin.x;
    v29 = v50.origin.y;
    v30 = v50.size.width;
    v31 = v50.size.height;
    v32 = -[CICheatBlur _CIBox4](self, "_CIBox4");
    v45 = inputImage;
    inputImage = (CIImage *)objc_msgSend(v32, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_4, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1), v28, v29, v30, v31);
    v4 = v4 * 0.25;
    v6 = v6 * 4.0;
  }
  if (v4 >= 3.0)
  {
    v41[0] = 0x3FE0000000000000;
    v41[1] = 0;
    v41[2] = 0;
    v41[3] = 0x3FE0000000000000;
    v41[4] = 0;
    v41[5] = 0;
    inputImage = -[CIImage imageByApplyingTransform:](inputImage, "imageByApplyingTransform:", v41);
    v4 = v4 * 0.5;
    v6 = v6 + v6;
  }
  if (v4 >= 0.0)
  {
    -[CIImage extent](inputImage, "extent");
    v52 = CGRectInset(v51, -2.0, -2.0);
    v33 = v52.origin.x;
    v34 = v52.origin.y;
    v35 = v52.size.width;
    v36 = v52.size.height;
    v37 = -[CICheatBlur _CICross4](self, "_CICross4");
    v44[0] = inputImage;
    v38 = v4 * 0.333333333;
    *(float *)&v38 = v4 * 0.333333333;
    v44[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
    inputImage = (CIImage *)objc_msgSend(v37, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_5, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2), v33, v34, v35, v36);
  }
  if (v6 > 1.0)
  {
    *(double *)v40 = v6;
    v40[1] = 0;
    v40[2] = 0;
    *(double *)&v40[3] = v6;
    v40[4] = 0;
    v40[5] = 0;
    return -[CIImage imageByApplyingTransform:](inputImage, "imageByApplyingTransform:", v40);
  }
  return inputImage;
}

double __26__CICheatBlur_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  double result;
  CGRect v5;

  v5.origin.x = a1 * 6.0;
  v5.origin.y = a2 * 6.0;
  v5.size.width = a3 * 6.0;
  v5.size.height = a4 * 6.0;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v5, -3.0, -3.0);
  return result;
}

double __26__CICheatBlur_outputImage__block_invoke_2(double a1, double a2, double a3, double a4)
{
  double result;
  CGRect v5;

  v5.origin.x = a1 * 4.0;
  v5.origin.y = a2 * 4.0;
  v5.size.width = a3 * 4.0;
  v5.size.height = a4 * 4.0;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v5, -2.0, -2.0);
  return result;
}

double __26__CICheatBlur_outputImage__block_invoke_3(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -2.0, -2.0);
  return result;
}

+ (id)customAttributes
{
  uint64_t v2;
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[5];
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("CIAttributeFilterCategories");
  v6[0] = CFSTR("CICategoryBlur");
  v6[1] = CFSTR("CICategoryVideo");
  v6[2] = CFSTR("CICategoryStillImage");
  v6[3] = CFSTR("CICategoryBuiltIn");
  v6[4] = CFSTR("CICategoryApplePrivate");
  v2 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 5);
  v7[1] = CFSTR("inputAmount");
  v8[0] = v2;
  v4[0] = CFSTR("CIAttributeMin");
  v4[1] = CFSTR("CIAttributeSliderMin");
  v4[2] = CFSTR("CIAttributeSliderMax");
  v4[3] = CFSTR("CIAttributeDefault");
  v5[2] = &unk_1E2F18EA0;
  v5[3] = &unk_1E2F18EB0;
  v4[4] = CFSTR("CIAttributeIdentity");
  v4[5] = CFSTR("CIAttributeType");
  v5[0] = &unk_1E2F18E90;
  v5[1] = &unk_1E2F18E90;
  v5[4] = &unk_1E2F18E90;
  v5[5] = CFSTR("CIAttributeTypeDistance");
  v8[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
}

@end
