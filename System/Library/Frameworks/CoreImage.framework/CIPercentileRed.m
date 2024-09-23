@implementation CIPercentileRed

+ (id)customAttributes
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[4];
  _QWORD v8[4];
  _QWORD v9[4];
  _QWORD v10[4];
  _QWORD v11[4];
  _QWORD v12[4];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[9];
  _QWORD v19[10];

  v19[9] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("CIAttributeFilterCategories");
  v17[0] = CFSTR("CICategoryReduction");
  v17[1] = CFSTR("CICategoryVideo");
  v17[2] = CFSTR("CICategoryStillImage");
  v17[3] = CFSTR("CICategoryBuiltIn");
  v17[4] = CFSTR("CICategoryApplePrivate");
  v19[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
  v18[1] = CFSTR("inputPercentile");
  v15[0] = CFSTR("CIAttributeMin");
  v15[1] = CFSTR("CIAttributeMax");
  v16[0] = &unk_1E2F1B458;
  v16[1] = &unk_1E2F1B4A0;
  v15[2] = CFSTR("CIAttributeDefault");
  v15[3] = CFSTR("CIAttributeIdentity");
  v16[2] = &unk_1E2F18BC0;
  v16[3] = &unk_1E2F1B458;
  v15[4] = CFSTR("CIAttributeType");
  v16[4] = CFSTR("CIAttributeTypeScalar");
  v19[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
  v18[2] = CFSTR("inputScale");
  v13[0] = CFSTR("CIAttributeMin");
  v13[1] = CFSTR("CIAttributeSliderMin");
  v14[0] = &unk_1E2F18BB0;
  v14[1] = &unk_1E2F18BB0;
  v13[2] = CFSTR("CIAttributeSliderMax");
  v13[3] = CFSTR("CIAttributeDefault");
  v14[2] = &unk_1E2F18B60;
  v14[3] = &unk_1E2F18B60;
  v13[4] = CFSTR("CIAttributeType");
  v14[4] = CFSTR("CIAttributeTypeScalar");
  v19[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v18[3] = CFSTR("inputCount");
  v11[0] = CFSTR("CIAttributeMin");
  v11[1] = CFSTR("CIAttributeMax");
  v12[0] = &unk_1E2F1B4A0;
  v12[1] = &unk_1E2F1B4B8;
  v11[2] = CFSTR("CIAttributeDefault");
  v11[3] = CFSTR("CIAttributeType");
  v12[2] = &unk_1E2F1B4D0;
  v12[3] = CFSTR("CIAttributeTypeScalar");
  v19[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v18[4] = CFSTR("inputNormalize");
  v2 = MEMORY[0x1E0C9AAA0];
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeMax");
  v3 = MEMORY[0x1E0C9AAB0];
  v10[0] = MEMORY[0x1E0C9AAA0];
  v10[1] = MEMORY[0x1E0C9AAB0];
  v9[2] = CFSTR("CIAttributeDefault");
  v9[3] = CFSTR("CIAttributeType");
  v10[2] = MEMORY[0x1E0C9AAB0];
  v10[3] = CFSTR("CIAttributeTypeBoolean");
  v19[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v18[5] = CFSTR("inputClip");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeMax");
  v8[0] = v2;
  v8[1] = v3;
  v7[2] = CFSTR("CIAttributeDefault");
  v7[3] = CFSTR("CIAttributeType");
  v8[2] = v2;
  v8[3] = CFSTR("CIAttributeTypeBoolean");
  v19[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v18[6] = CFSTR("inputHard");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeMax");
  v6[0] = v2;
  v6[1] = v3;
  v5[2] = CFSTR("CIAttributeDefault");
  v5[3] = CFSTR("CIAttributeType");
  v6[2] = v2;
  v6[3] = CFSTR("CIAttributeTypeBoolean");
  v19[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v19[7] = CFSTR("12");
  v18[7] = CFSTR("CIAttributeFilterAvailable_iOS");
  v18[8] = CFSTR("CIAttributeFilterAvailable_Mac");
  v19[8] = CFSTR("10.14");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 9);
}

- (id)outputImage
{
  CIImage *inputImage;
  double x;
  double y;
  double width;
  double height;
  CIImage *v8;
  double v9;
  _BOOL4 v10;
  uint64_t v11;
  CIColorKernel *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  CIVector *v23;
  NSNumber *inputScale;
  uint64_t v25;
  CIKernel *v26;
  NSNumber *inputPercentile;
  CIColorKernel *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CIImage *v38;
  _BOOL4 v39;
  CIColorKernel *v40;
  CIColorKernel *v41;
  CIColorKernel *v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v49;
  _BOOL4 v50;
  _QWORD v51[10];
  __int128 v52;
  _QWORD v53[2];
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[2];
  const __CFString *v58;
  CIVector *v59;
  _QWORD v60[4];
  CGRect v61;

  v60[2] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  -[CIImage extent](inputImage, "extent");
  x = v61.origin.x;
  y = v61.origin.y;
  width = v61.size.width;
  height = v61.size.height;
  if (CGRectIsInfinite(v61))
    return 0;
  v9 = (double)-[NSNumber intValue](self->inputCount, "intValue");
  v10 = -[NSNumber BOOLValue](self->inputNormalize, "BOOLValue");
  v50 = -[NSNumber BOOLValue](self->inputClip, "BOOLValue");
  if (v10)
  {
    v58 = CFSTR("inputExtent");
    -[CIImage extent](inputImage, "extent");
    v59 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
    v11 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaMinMaxRed"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1)), "imageByClampingToExtent");
    v12 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_perc_norm_red);
    -[CIImage extent](inputImage, "extent");
    v49 = v9;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v57[0] = inputImage;
    v57[1] = v11;
    v21 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
    v22 = v14;
    v9 = v49;
    inputImage = -[CIColorKernel applyWithExtent:arguments:](v12, "applyWithExtent:arguments:", v21, v22, v16, v18, v20);
  }
  else
  {
    v11 = 0;
  }
  v55[0] = CFSTR("inputExtent");
  v23 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", x, y, width, height);
  inputScale = self->inputScale;
  v56[0] = v23;
  v56[1] = inputScale;
  v55[1] = CFSTR("inputScale");
  v55[2] = CFSTR("inputCount");
  v56[2] = self->inputCount;
  v25 = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaHistogram"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 3));
  v26 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_perc_accum_red);
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __30__CIPercentileRed_outputImage__block_invoke;
  v51[3] = &__block_descriptor_96_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v51[4] = 0;
  v51[5] = 0;
  *(double *)&v51[6] = v9;
  v51[8] = 0;
  v51[9] = 0;
  v51[7] = 0x3FF0000000000000;
  __asm { FMOV            V0.2D, #1.0 }
  v52 = _Q0;
  inputPercentile = self->inputPercentile;
  v54[0] = v25;
  v54[1] = inputPercentile;
  v54[2] = self->inputCount;
  v8 = -[CIImage imageByClampingToExtent](-[CIKernel applyWithExtent:roiCallback:arguments:](v26, "applyWithExtent:roiCallback:arguments:", v51, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3), 0.0, 0.0, 1.0, 1.0), "imageByClampingToExtent");
  if (v10)
  {
    v33 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_perc_denorm_red);
    -[CIImage extent](inputImage, "extent");
    v53[0] = v8;
    v53[1] = v11;
    v8 = -[CIColorKernel applyWithExtent:arguments:](v33, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2), v34, v35, v36, v37);
  }
  if (v50)
  {
    v38 = self->inputImage;
    v39 = -[NSNumber BOOLValue](self->inputHard, "BOOLValue");
    v40 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_perc_clip_hard);
    v41 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_perc_clip_soft);
    if (v39)
      v42 = v40;
    else
      v42 = v41;
    v43 = -[CIImage imageByClampingToExtent](v8, "imageByClampingToExtent");
    -[CIImage extent](v38, "extent");
    v60[0] = v38;
    v60[1] = v43;
    return -[CIColorKernel applyWithExtent:arguments:](v42, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2), v44, v45, v46, v47);
  }
  return v8;
}

double __30__CIPercentileRed_outputImage__block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;

  v2 = 64;
  if (!a2)
    v2 = 32;
  return *(double *)(a1 + v2);
}

- (NSNumber)inputPercentile
{
  return self->inputPercentile;
}

- (void)setInputPercentile:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputCount
{
  return self->inputCount;
}

- (void)setInputCount:(id)a3
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

- (NSNumber)inputNormalize
{
  return self->inputNormalize;
}

- (void)setInputNormalize:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSNumber)inputClip
{
  return self->inputClip;
}

- (void)setInputClip:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSNumber)inputHard
{
  return self->inputHard;
}

- (void)setInputHard:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

@end
