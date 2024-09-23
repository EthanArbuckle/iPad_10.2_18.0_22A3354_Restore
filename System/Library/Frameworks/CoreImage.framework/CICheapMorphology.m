@implementation CICheapMorphology

- (CGRect)regionOf:(id)a3 destRect:(CGRect)a4 Offset:(float)a5
{
  return CGRectInset(a4, (float)-a5, (float)-a5);
}

- (id)outputImage
{
  CIImage *inputImage;
  CIImage *v4;
  int v6;
  float v7;
  int v8;
  CIImage *v9;
  void (***v10)(CI::GeneralKernel *__hidden);
  CIKernel *v11;
  float v12;
  double x;
  double y;
  double width;
  double height;
  void (***v17)(CI::GeneralKernel *__hidden);
  CIKernel *v18;
  float v19;
  float v20;
  CIKernel *v21;
  uint64_t v22;
  float v23;
  float v24;
  float v25;
  CIVector *v26;
  CIImage *v27;
  _QWORD v28[4];
  float v29;
  _QWORD v30[4];
  float v31;
  _QWORD v32[2];
  _QWORD v33[3];
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v33[2] = *MEMORY[0x1E0C80C00];
  inputImage = self->super.inputImage;
  if (!inputImage)
    return 0;
  -[CIImage extent](inputImage, "extent");
  if (CGRectIsEmpty(v34))
    return 0;
  v6 = -[NSNumber intValue](self->super.inputRadius, "intValue");
  v7 = fabsf((float)v6);
  if (v7 >= 1.0)
  {
    v8 = v6;
    if (v7 >= 5.0)
    {
      if (v6 >= 0)
        v17 = &CI::_min3x3;
      else
        v17 = &CI::_max3x3;
      v18 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", v17);
      v4 = self->super.inputImage;
      v19 = 1.0;
      v20 = (float)(floorf(v7) * 2.0) + 1.0;
      if (v20 > 1.0)
      {
        v21 = v18;
        v22 = MEMORY[0x1E0C809B0];
        do
        {
          v23 = v19 * 3.0;
          v24 = (float)((float)(v19 * 3.0) - v20) * 0.5;
          if ((float)(v19 * 3.0) < v20)
            v24 = 0.0;
          v25 = v19 - v24;
          v26 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (float)(v19 - v24), (float)(v19 - v24) * 0.707106781, (float)-(float)(v19 - v24) * 0.707106781, 0.0);
          v27 = -[CIImage imageBySamplingNearest](v4, "imageBySamplingNearest");
          -[CIImage extent](v27, "extent");
          v38 = CGRectInset(v37, (float)-v25, (float)-v25);
          v28[0] = v22;
          v28[1] = 3221225472;
          v28[2] = __32__CICheapMorphology_outputImage__block_invoke_2;
          v28[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
          v29 = v25;
          v32[0] = v27;
          v32[1] = v26;
          v4 = -[CIKernel applyWithExtent:roiCallback:arguments:](v21, "applyWithExtent:roiCallback:arguments:", v28, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2), v38.origin.x, v38.origin.y, v38.size.width, v38.size.height);
          v19 = v23;
        }
        while (v23 < v20);
      }
    }
    else
    {
      v9 = -[CIImage imageBySamplingNearest](self->super.inputImage, "imageBySamplingNearest");
      if (v8 >= 0)
        v10 = &CI::_minDisk;
      else
        v10 = &CI::_maxDisk;
      v11 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", v10);
      v12 = floorf(v7);
      -[CIImage extent](v9, "extent");
      v36 = CGRectInset(v35, (float)-v12, (float)-v12);
      x = v36.origin.x;
      y = v36.origin.y;
      width = v36.size.width;
      height = v36.size.height;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __32__CICheapMorphology_outputImage__block_invoke;
      v30[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      v31 = v12;
      v33[0] = v9;
      v33[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE((unint64_t)LODWORD(v7)));
      return -[CIKernel applyWithExtent:roiCallback:arguments:](v11, "applyWithExtent:roiCallback:arguments:", v30, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2), x, y, width, height);
    }
    return v4;
  }
  return self->super.inputImage;
}

double __32__CICheapMorphology_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, (float)-*(float *)(a1 + 32), (float)-*(float *)(a1 + 32));
  return result;
}

double __32__CICheapMorphology_outputImage__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, (float)-*(float *)(a1 + 32), (float)-*(float *)(a1 + 32));
  return result;
}

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryBlur");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryBuiltIn");
  v5[4] = CFSTR("CICategoryApplePrivate");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  v7[1] = CFSTR("10");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.11");
  v6[3] = CFSTR("inputRadius");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = CFSTR("CIAttributeTypeDistance");
  v4[1] = &unk_1E2F1A410;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1A420;
  v4[3] = &unk_1E2F1A430;
  v3[4] = CFSTR("CIAttributeIdentity");
  v4[4] = &unk_1E2F1A440;
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

@end
