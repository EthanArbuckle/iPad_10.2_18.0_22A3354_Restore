@implementation CIKMeans

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryReduction");
  v9[1] = CFSTR("CICategoryVideo");
  v9[2] = CFSTR("CICategoryStillImage");
  v9[3] = CFSTR("CICategoryHighDynamicRange");
  v9[4] = CFSTR("CICategoryBuiltIn");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v11[1] = CFSTR("13");
  v10[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v10[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v11[2] = CFSTR("10.15");
  v10[3] = CFSTR("inputCount");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeMax");
  v8[0] = &unk_1E2F1BE30;
  v8[1] = &unk_1E2F1BE48;
  v7[2] = CFSTR("CIAttributeDefault");
  v7[3] = CFSTR("CIAttributeIdentity");
  v8[2] = &unk_1E2F1BE60;
  v8[3] = &unk_1E2F1BE30;
  v7[4] = CFSTR("CIAttributeType");
  v8[4] = CFSTR("CIAttributeTypeCount");
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v10[4] = CFSTR("inputPasses");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeMax");
  v6[0] = &unk_1E2F1BE30;
  v6[1] = &unk_1E2F1BE78;
  v5[2] = CFSTR("CIAttributeDefault");
  v5[3] = CFSTR("CIAttributeIdentity");
  v6[2] = &unk_1E2F1BE90;
  v6[3] = &unk_1E2F1BE30;
  v5[4] = CFSTR("CIAttributeType");
  v6[4] = CFSTR("CIAttributeTypeCount");
  v11[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v10[5] = CFSTR("inputPerceptual");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeMax");
  v4[0] = MEMORY[0x1E0C9AAA0];
  v4[1] = MEMORY[0x1E0C9AAB0];
  v3[2] = CFSTR("CIAttributeDefault");
  v3[3] = CFSTR("CIAttributeType");
  v4[2] = MEMORY[0x1E0C9AAA0];
  v4[3] = CFSTR("CIAttributeTypeBoolean");
  v11[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
}

- (id)_combine:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  char isKindOfClass;
  CIImage *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CIColor *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CIImage *v25;
  uint64_t j;

  v4 = objc_msgSend(a3, "count");
  v5 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
  if (!v4)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v6 = (void *)v5;
  for (i = 0; i != v4; ++i)
  {
    objc_msgSend(a3, "objectAtIndexedSubscript:", i);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v9 = (CIImage *)objc_msgSend(a3, "objectAtIndexedSubscript:", i);
    if ((isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = objc_msgSend(a3, "objectAtIndexedSubscript:", i);
      }
      else
      {
        objc_msgSend(a3, "objectAtIndexedSubscript:", i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          continue;
        v11 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", i);
        if (objc_msgSend(v11, "count") == 3)
        {
          objc_msgSend(v11, "X");
          v13 = v12;
          objc_msgSend(v11, "Y");
          v15 = v14;
          objc_msgSend(v11, "Z");
          v17 = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", v13, v15, v16);
        }
        else
        {
          if (objc_msgSend(v11, "count") != 4)
            continue;
          objc_msgSend(v11, "X");
          v19 = v18;
          objc_msgSend(v11, "Y");
          v21 = v20;
          objc_msgSend(v11, "Z");
          v23 = v22;
          objc_msgSend(v11, "W");
          v17 = +[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", v19, v21, v23, v24);
        }
        v10 = (uint64_t)v17;
      }
      v9 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", v10);
    }
    if (v9)
      objc_msgSend(v6, "setObject:atIndexedSubscript:", v9, i);
  }
  v25 = +[CIImage emptyImage](CIImage, "emptyImage");
  for (j = 0; j != v4; ++j)
    v25 = (CIImage *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", j), "imageByClampingToExtent"), "imageByCroppingToRect:", (double)(int)j, 0.0, 1.0, 1.0), "imageByCompositingOverImage:", v25);
  return v25;
}

- (id)_kernelKmeans
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_KM_select);
}

- (id)defuse:(id)a3 seed:(int)a4
{
  double v6;
  unint64_t v7;
  double v8;
  CIImage *v9;
  uint64_t v10;
  CIKernel *v11;
  _QWORD v13[8];
  CGAffineTransform v14;
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "extent");
  v7 = (unint64_t)v6;
  v8 = (double)(unint64_t)v6;
  v9 = -[CIFilter outputImage](+[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIRandomGenerator")), "outputImage");
  CGAffineTransformMakeTranslation(&v14, (double)a4, 0.0);
  v10 = -[CIImage imageBySettingAlphaOneInExtent:](-[CIImage imageByApplyingTransform:](v9, "imageByApplyingTransform:", &v14), "imageBySettingAlphaOneInExtent:", 0.0, 0.0, v8, 1.0);
  v11 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_KM_defuse);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __24__CIKMeans_defuse_seed___block_invoke;
  v13[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v13[4] = 0;
  v13[5] = 0;
  *(double *)&v13[6] = v8;
  v13[7] = 0x3FF0000000000000;
  v15[0] = a3;
  v15[1] = v10;
  v15[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v7);
  v15[3] = &unk_1E2F1DAE8;
  return -[CIKernel applyWithExtent:roiCallback:arguments:](v11, "applyWithExtent:roiCallback:arguments:", v13, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4), 0.0, 0.0, v8, 1.0);
}

double __24__CIKMeans_defuse_seed___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (id)outputImage
{
  CIKMeans *v2;
  CIImage *inputMeans;
  char isKindOfClass;
  CIImage *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  float v11;
  unint64_t v12;
  double v13;
  const __CFString *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  CIImage *inputImage;
  CIVector *inputExtent;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  NSNumber *inputPerceptual;
  _BOOL4 v33;
  NSNumber *inputPasses;
  id v35;
  double v36;
  _BOOL4 v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  void *v45;
  CIImage *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  CIKMeans *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[8];
  const __CFString *v54;
  CIVector *v55;
  _QWORD v56[4];
  _QWORD v57[4];
  _QWORD v58[6];
  CGRect v59;
  CGRect v60;

  v2 = self;
  v58[4] = *MEMORY[0x1E0C80C00];
  inputMeans = self->inputMeans;
  if (inputMeans)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = v2->inputMeans;
    if ((isKindOfClass & 1) != 0)
    {
      inputMeans = -[CIKMeans _combine:](v2, "_combine:", v2->inputMeans);
      v6 = -[CIImage count](v5, "count");
      goto LABEL_10;
    }
    if (v5)
    {
      -[CIImage extent](v2->inputMeans, "extent");
      v11 = v10;
      v12 = vcvtas_u32_f32(v11);
      -[CIImage extent](v2->inputMeans, "extent");
      goto LABEL_11;
    }
  }
  else if (!self->inputCount)
  {
    v7 = ci_logger_api();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CIKMeans outputImage].cold.1(v7, v8, v9);
    return +[CIImage emptyImage](CIImage, "emptyImage");
  }
  v6 = -[NSNumber unsignedIntegerValue](v2->inputCount, "unsignedIntegerValue");
LABEL_10:
  v12 = v6;
  if (!inputMeans)
  {
    v15 = 1;
    goto LABEL_21;
  }
LABEL_11:
  -[CIImage extent](inputMeans, "extent");
  if (CGRectIsInfinite(v59) || (-[CIImage extent](inputMeans, "extent"), v13 > 1.0))
  {
    -[CIImage extent](inputMeans, "extent");
    if (CGRectIsInfinite(v60))
    {
      v14 = CFSTR("infinite");
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      -[CIImage extent](inputMeans, "extent");
      v18 = v17;
      -[CIImage extent](inputMeans, "extent");
      v14 = (const __CFString *)objc_msgSend(v16, "stringWithFormat:", CFSTR("%.1f x %.1f"), v18, v19);
    }
    v20 = ci_logger_filter();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[CIKMeans outputImage].cold.2((uint64_t)v2, (uint64_t)v14, v20);
    return +[CIImage emptyImage](CIImage, "emptyImage");
  }
  v15 = 0;
LABEL_21:
  if (v12 - 129 <= 0xFFFFFFFFFFFFFF7FLL)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  inputImage = v2->super.inputImage;
  inputExtent = v2->super.inputExtent;
  if (inputExtent)
    -[CIVector CGRectValue](inputExtent, "CGRectValue");
  else
    -[CIImage extent](v2->super.inputImage, "extent");
  v28 = v24;
  v29 = v25;
  v30 = v26;
  v31 = v27;
  inputPerceptual = v2->inputPerceptual;
  if (inputPerceptual)
    v33 = -[NSNumber BOOLValue](inputPerceptual, "BOOLValue");
  else
    v33 = 0;
  inputPasses = v2->inputPasses;
  if (inputPasses)
    v51 = -[NSNumber intValue](inputPasses, "intValue");
  else
    v51 = 0;
  v35 = -[CIKMeans _kernelKmeans](v2, "_kernelKmeans");
  v36 = (double)v12;
  if (v15)
  {
    v57[0] = CFSTR("inputPoint0");
    v58[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 0.0);
    v57[1] = CFSTR("inputPoint1");
    v58[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", (double)(v12 - 1), 0.0);
    v57[2] = CFSTR("inputColor0");
    v58[2] = +[CIColor magentaColor](CIColor, "magentaColor");
    v57[3] = CFSTR("inputColor1");
    v58[3] = +[CIColor greenColor](CIColor, "greenColor");
    inputMeans = -[CIImage imageByCroppingToRect:](-[CIFilter outputImage](+[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", CFSTR("CILinearGradient"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 4)), "outputImage"), "imageByCroppingToRect:", 0.0, 0.0, (double)v12, 1.0);
  }
  if (v51)
    v37 = v33;
  else
    v37 = 0;
  if (v37)
  {
    inputImage = -[CIImage imageByApplyingFilter:](inputImage, "imageByApplyingFilter:", CFSTR("CILinearToSRGBToneCurve"));
    inputMeans = -[CIImage imageByApplyingFilter:](inputMeans, "imageByApplyingFilter:", CFSTR("CILinearToSRGBToneCurve"));
  }
  v38 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v12);
  if (v51)
  {
    v39 = (void *)v38;
    v40 = 0;
    v50 = v2;
    do
    {
      v52 = v40;
      v41 = -[CIKMeans defuse:seed:](v2, "defuse:seed:", inputMeans);
      v42 = 0;
      do
      {
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __23__CIKMeans_outputImage__block_invoke;
        v53[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
        v53[4] = 0;
        v53[5] = 0;
        *(double *)&v53[6] = v36;
        v53[7] = 0x3FF0000000000000;
        v56[0] = inputImage;
        v56[1] = v41;
        v56[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v12);
        v56[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v42);
        v43 = objc_msgSend(v35, "applyWithExtent:roiCallback:arguments:", v53, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 4), v28, v29, v30, v31);
        v44 = v12;
        v45 = v35;
        v46 = inputImage;
        v47 = (void *)v43;
        v54 = CFSTR("inputExtent");
        v55 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v28, v29, v30, v31);
        v48 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
        v49 = v47;
        inputImage = v46;
        v35 = v45;
        v12 = v44;
        objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend((id)objc_msgSend(v49, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaAverage"), v48), "imageByUnpremultiplyingAlpha"), v42++);
      }
      while (v44 != v42);
      v2 = v50;
      inputMeans = -[CIKMeans _combine:](v50, "_combine:", v39);
      v40 = v52 + 1;
    }
    while (v52 + 1 != v51);
  }
  return -[CIImage imageBySettingProperties:](inputMeans, "imageBySettingProperties:", MEMORY[0x1E0C9AA70]);
}

double __23__CIKMeans_outputImage__block_invoke(uint64_t a1, int a2)
{
  double result;

  if (a2)
    return *(double *)(a1 + 32);
  return result;
}

- (NSNumber)inputCount
{
  return self->inputCount;
}

- (void)setInputCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)inputPasses
{
  return self->inputPasses;
}

- (void)setInputPasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (CIImage)inputMeans
{
  return self->inputMeans;
}

- (void)setInputMeans:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputPerceptual
{
  return self->inputPerceptual;
}

- (void)setInputPerceptual:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)outputImage
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 138543618;
  v7 = objc_msgSend((id)objc_opt_class(), "description");
  v8 = 2114;
  v9 = a2;
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, a3, v5, "%{public}@: Mean seeds should be passed as a K x 1 image but received %{public}@]", (uint8_t *)&v6);
}

@end
