@implementation CICheapBlur

- (id)_CICheapBlur
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_cheapBlur);
}

- (id)_CILerp
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_lerp);
}

- (id)outputImage
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  int v8;
  CIImage *inputImage;
  _BOOL4 v10;
  float v11;
  uint64_t v12;
  float v13;
  CIImage *v14;
  double v15;
  CIVector *v16;
  double x;
  double y;
  double width;
  double height;
  float v21;
  id v22;
  CIVector *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  id v36;
  float v38;
  _BOOL4 v39;
  float v40;
  CGAffineTransform v41;
  _QWORD v42[4];
  float v43;
  CGAffineTransform v44;
  _QWORD v45[3];
  _QWORD v46[4];
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v46[2] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputPasses, "floatValue");
  v4 = v3;
  -[NSNumber floatValue](self->inputSampling, "floatValue");
  v6 = v5;
  v7 = floorf(v4);
  v8 = (int)(float)(v7 + 1.0);
  inputImage = self->inputImage;
  v10 = v5 != 1.0 && v5 != 0.0;
  if (v10)
  {
    CGAffineTransformMakeScale(&v44, (float)(1.0 / v5), (float)(1.0 / v5));
    inputImage = -[CIImage imageByApplyingTransform:](inputImage, "imageByApplyingTransform:", &v44);
  }
  if (v8 >= 1)
  {
    v39 = v10;
    v40 = v6;
    v38 = roundf((float)(v4 - v7) * 10.0) / 10.0;
    v11 = 1.0;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 1.0;
    do
    {
      v14 = inputImage;
      v15 = v11;
      v16 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", (float)(v13 * v11) / 3.0, v11 / 3.0);
      -[CIImage extent](v14, "extent");
      v48 = CGRectInset(v47, (float)-v11 * 4.0 / 3.0, (float)-v11 * 4.0 / 3.0);
      x = v48.origin.x;
      y = v48.origin.y;
      width = v48.size.width;
      height = v48.size.height;
      v21 = v11 * 4.0 / 3.0;
      v22 = -[CICheapBlur _CICheapBlur](self, "_CICheapBlur");
      v42[0] = v12;
      v42[1] = 3221225472;
      v42[2] = __26__CICheapBlur_outputImage__block_invoke;
      v42[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      v43 = v21;
      v46[0] = v14;
      v46[1] = v16;
      inputImage = (CIImage *)objc_msgSend(v22, "applyWithExtent:roiCallback:arguments:", v42, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2), x, y, width, height);
      v11 = v15 * 1.4142;
      v13 = -v13;
      --v8;
    }
    while (v8);
    if (v14)
    {
      if (fabsf(v38) >= 0.01)
      {
        if (fabsf(v38 + -1.0) >= 0.01)
        {
          v23 = +[CIVector vectorWithX:](CIVector, "vectorWithX:", v38);
          v49.origin.x = x;
          v49.origin.y = y;
          v49.size.width = width;
          v49.size.height = height;
          if (CGRectIsEmpty(v49))
          {
            -[CIImage extent](inputImage, "extent");
            v25 = v24;
            v27 = v26;
            v29 = v28;
            v31 = v30;
            -[CIImage extent](v14, "extent");
            v52.origin.x = v32;
            v52.origin.y = v33;
            v52.size.width = v34;
            v52.size.height = v35;
            v50.origin.x = v25;
            v50.origin.y = v27;
            v50.size.width = v29;
            v50.size.height = v31;
            v51 = CGRectUnion(v50, v52);
            x = v51.origin.x;
            y = v51.origin.y;
            width = v51.size.width;
            height = v51.size.height;
          }
          v36 = -[CICheapBlur _CILerp](self, "_CILerp");
          v45[0] = inputImage;
          v45[1] = v14;
          v45[2] = v23;
          inputImage = (CIImage *)objc_msgSend(v36, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3), x, y, width, height);
        }
      }
      else
      {
        inputImage = v14;
      }
    }
    v6 = v40;
    v10 = v39;
  }
  if (v10)
  {
    CGAffineTransformMakeScale(&v41, v6, v6);
    inputImage = -[CIImage imageByApplyingTransform:](inputImage, "imageByApplyingTransform:", &v41);
  }
  return inputImage;
}

double __26__CICheapBlur_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, (float)-*(float *)(a1 + 32), (float)-*(float *)(a1 + 32));
  return result;
}

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[5];
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryBlur");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryBuiltIn");
  v7[4] = CFSTR("CICategoryApplePrivate");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 5);
  v8[1] = CFSTR("inputPasses");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F18E50;
  v6[1] = &unk_1E2F18E50;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F18E60;
  v6[3] = &unk_1E2F18E70;
  v5[4] = CFSTR("CIAttributeIdentity");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F18E50;
  v6[5] = CFSTR("CIAttributeTypeDistance");
  v9[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v8[2] = CFSTR("inputSampling");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F18E80;
  v4[1] = &unk_1E2F18E80;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F18E60;
  v4[3] = &unk_1E2F18E80;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F18E80;
  v4[5] = CFSTR("CIAttributeTypeDistance");
  v9[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
}

@end
