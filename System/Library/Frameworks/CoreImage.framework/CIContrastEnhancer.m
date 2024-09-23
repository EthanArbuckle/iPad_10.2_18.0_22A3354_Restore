@implementation CIContrastEnhancer

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[5];
  _QWORD v12[7];
  _QWORD v13[9];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryColorEffect");
  v11[1] = CFSTR("CICategoryNonSquarePixels");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryBuiltIn");
  v11[4] = CFSTR("CICategoryApplePrivate");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v13[1] = CFSTR("12");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.14");
  v12[3] = CFSTR("inputIntensity");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeMax");
  v10[0] = &unk_1E2F195B0;
  v10[1] = &unk_1E2F195E0;
  v9[2] = CFSTR("CIAttributeSliderMin");
  v9[3] = CFSTR("CIAttributeSliderMax");
  v10[2] = &unk_1E2F195B0;
  v10[3] = &unk_1E2F195E0;
  v9[4] = CFSTR("CIAttributeDefault");
  v9[5] = CFSTR("CIAttributeType");
  v10[4] = &unk_1E2F19600;
  v10[5] = CFSTR("CIAttributeTypeScalar");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v12[4] = CFSTR("inputScale");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeMax");
  v8[0] = &unk_1E2F195B0;
  v8[1] = &unk_1E2F195E0;
  v7[2] = CFSTR("CIAttributeSliderMin");
  v7[3] = CFSTR("CIAttributeSliderMax");
  v8[2] = &unk_1E2F195B0;
  v8[3] = &unk_1E2F195E0;
  v7[4] = CFSTR("CIAttributeDefault");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F19610;
  v8[5] = CFSTR("CIAttributeTypeScalar");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v12[5] = CFSTR("inputLocal");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeType");
  v6[0] = MEMORY[0x1E0C9AAA0];
  v6[1] = CFSTR("CIAttributeTypeBoolean");
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v12[6] = CFSTR("inputPerceptual");
  v3[0] = CFSTR("CIAttributeDefault");
  v3[1] = CFSTR("CIAttributeType");
  v4[0] = MEMORY[0x1E0C9AAB0];
  v4[1] = CFSTR("CIAttributeTypeBoolean");
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (id)outputImage
{
  float v3;
  float v4;
  float v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  float v26;
  float v27;
  _BOOL4 v28;
  double v29;
  double v30;
  long double v31;
  float v32;
  float v33;
  int v34;
  double v35;
  double v36;
  CIImage *inputImage;
  CIImage *v38;
  CIColorKernel *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CIImage *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CIImage *v51;
  CIColorKernel *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CIImage *v57;
  CIKernel *v58;
  CIKernel *v59;
  unsigned int v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  CIVector *v79;
  CIImage *v80;
  uint64_t v81;
  CIVector *v83;
  uint64_t v84;
  float v85;
  CIImage *v86;
  CIColorKernel *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  CIImage *v96;
  _BOOL4 v97;
  CGAffineTransform v98;
  CGAffineTransform v99;
  _QWORD v100[3];
  const __CFString *v101;
  CIVector *v102;
  const __CFString *v103;
  CIVector *v104;
  CIImage *v105;
  CIImage *v106;
  CGAffineTransform v107;
  uint64_t v108;
  CGRect v109;
  CGRect v110;

  v108 = *MEMORY[0x1E0C80C00];
  -[CIImage extent](self->inputImage, "extent");
  if (CGRectIsInfinite(v109))
    return self->inputImage;
  -[CIImage extent](self->inputImage, "extent");
  if (CGRectIsEmpty(v110))
    return self->inputImage;
  -[NSNumber floatValue](self->inputIntensity, "floatValue");
  if (v3 <= 0.0)
    return self->inputImage;
  -[NSNumber floatValue](self->inputIntensity, "floatValue");
  v5 = v4;
  -[CIImage extent](self->inputImage, "extent");
  v7 = v6;
  -[CIImage extent](self->inputImage, "extent");
  v9 = v7 / v8;
  -[CIImage extent](self->inputImage, "extent");
  v11 = v10;
  -[CIImage extent](self->inputImage, "extent");
  v13 = v12;
  -[CIImage extent](self->inputImage, "extent");
  if (v11 >= v13)
    v16 = v15;
  else
    v16 = v14;
  v17 = 128.0;
  if (v16 <= 128.0)
  {
    -[CIImage extent](self->inputImage, "extent");
    v19 = v18;
    -[CIImage extent](self->inputImage, "extent");
    v21 = v20;
    -[CIImage extent](self->inputImage, "extent");
    if (v19 < v21)
      v17 = v22;
    else
      v17 = v23;
  }
  v24 = (double)(int)v17;
  v25 = roundf(v9 * (float)(int)v17);
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v27 = v26;
  v28 = -[NSNumber BOOLValue](self->inputLocal, "BOOLValue");
  v29 = v27;
  v97 = v28;
  if (!v28)
    v29 = 0.699999988;
  v30 = fmin(v29, 1.0);
  if (v24 <= v25)
    v31 = v25;
  else
    v31 = v24;
  v32 = v30 * log2(v31);
  v33 = roundf(v32);
  if (v33 <= 0.0)
    v33 = 0.0;
  v34 = (int)v33;
  -[CIImage extent](self->inputImage, "extent");
  memset(&v99, 0, sizeof(v99));
  CGAffineTransformMakeScale(&v99, v24 / v35, v25 / v36);
  inputImage = self->inputImage;
  v98 = v99;
  v38 = -[CIImage imageByApplyingTransform:](inputImage, "imageByApplyingTransform:", &v98);
  v39 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_CEcomp_minmax);
  -[CIImage extent](v38, "extent");
  v106 = v38;
  v44 = -[CIColorKernel applyWithExtent:arguments:](v39, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1), v40, v41, v42, v43);
  -[CIImage extent](v44, "extent");
  v46 = v45;
  v48 = v47;
  CGAffineTransformMakeTranslation(&v107, -v49, -v50);
  v51 = -[CIImage imageByCroppingToRect:](-[CIImage imageByApplyingTransform:](v44, "imageByApplyingTransform:", &v107), "imageByCroppingToRect:", 0.0, 0.0, v46, v48);
  if (-[NSNumber BOOLValue](self->inputPerceptual, "BOOLValue"))
    v51 = -[CIImage imageByApplyingFilter:](v51, "imageByApplyingFilter:", CFSTR("CILinearToSRGBToneCurve"));
  v52 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_CEcomp_minmax);
  -[CIImage extent](v51, "extent");
  v105 = v51;
  v57 = -[CIColorKernel applyWithExtent:arguments:](v52, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v105, 1), v53, v54, v55, v56);
  v58 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_DEminmax4);
  if (v34 >= 1)
  {
    v59 = v58;
    v60 = v34 + 1;
    do
    {
      -[CIImage extent](v57, "extent");
      v62 = v61;
      v64 = v63;
      v66 = ceil(v65 * 0.5);
      v68 = ceil(v67 * 0.5);
      *(_QWORD *)&v107.a = v57;
      -[CIImage extent](v57, "extent");
      v70 = v69;
      -[CIImage extent](v57, "extent");
      *(_QWORD *)&v107.b = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v70, v71);
      v57 = -[CIKernel applyWithExtent:roiCallback:arguments:](v59, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_154, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 2), v62, v64, v66, v68);
      --v60;
    }
    while (v60 > 1);
  }
  if (v97)
  {
    -[CIImage extent](self->inputImage, "extent");
    v73 = v72;
    -[CIImage extent](v57, "extent");
    v75 = v73 / v74;
    -[CIImage extent](self->inputImage, "extent");
    v77 = v76;
    -[CIImage extent](v57, "extent");
    v79 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v75, v77 / v78);
    v80 = -[CIImage imageByClampingToExtent](v57, "imageByClampingToExtent");
    v103 = CFSTR("inputScale");
    v104 = v79;
    v81 = -[CIImage imageByApplyingFilter:withInputParameters:](v80, "imageByApplyingFilter:withInputParameters:", CFSTR("CISoftCubicUpsample"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1));
  }
  else
  {
    -[CIImage extent](v57, "extent");
    v83 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
    v101 = CFSTR("inputExtent");
    v102 = v83;
    v81 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v57, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaAverage"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1)), "imageByClampingToExtent");
  }
  v84 = v81;
  v85 = v5 + v5;
  v86 = -[CIImage imageByUnpremultiplyingAlpha](self->inputImage, "imageByUnpremultiplyingAlpha");
  if (-[NSNumber BOOLValue](self->inputPerceptual, "BOOLValue"))
    v86 = -[CIImage imageByApplyingFilter:](v86, "imageByApplyingFilter:", CFSTR("CILinearToSRGBToneCurve"));
  v87 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_CEstretch);
  -[CIImage extent](v86, "extent");
  v89 = v88;
  v91 = v90;
  v93 = v92;
  v95 = v94;
  v100[0] = v86;
  v100[1] = v84;
  *(float *)&v88 = v85;
  v100[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v88);
  v96 = -[CIColorKernel applyWithExtent:arguments:](v87, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 3), v89, v91, v93, v95);
  if (-[NSNumber BOOLValue](self->inputPerceptual, "BOOLValue"))
    v96 = -[CIImage imageByApplyingFilter:](v96, "imageByApplyingFilter:", CFSTR("CISRGBToneCurveToLinear"));
  return -[CIImage imageByPremultiplyingAlpha](v96, "imageByPremultiplyingAlpha");
}

- (NSNumber)inputIntensity
{
  return self->inputIntensity;
}

- (void)setInputIntensity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputLocal
{
  return self->inputLocal;
}

- (void)setInputLocal:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputPerceptual
{
  return self->inputPerceptual;
}

- (void)setInputPerceptual:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
