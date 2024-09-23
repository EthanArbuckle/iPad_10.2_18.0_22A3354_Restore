@implementation CIPersonSegmentation

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryVideo");
  v5[1] = CFSTR("CICategoryStillImage");
  v5[2] = CFSTR("CICategoryBuiltIn");
  v5[3] = CFSTR("CICategoryStylize");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v7[1] = CFSTR("15");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("12.0");
  v6[3] = CFSTR("inputQualityLevel");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeMax");
  v4[0] = &unk_1E2F1BBA8;
  v4[1] = &unk_1E2F1BBC0;
  v3[2] = CFSTR("CIAttributeSliderMin");
  v3[3] = CFSTR("CIAttributeSliderMax");
  v4[2] = &unk_1E2F1BBA8;
  v4[3] = &unk_1E2F1BBC0;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F1BBA8;
  v4[5] = CFSTR("CIAttributeTypeInteger");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (id)outputImage
{
  CIImage *inputImage;
  NSObject *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGColorSpace *v13;
  unsigned int v14;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  CIImage *v20;
  CIImage *v21;
  CIImage *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  CIVector *v32;
  CIImage *v33;
  CGAffineTransform v35;
  CGAffineTransform v36;
  uint64_t v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  CGRect v41;

  v40[1] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  if (!inputImage || (-[CIImage extent](inputImage, "extent"), CGRectIsInfinite(v41)))
  {
    v4 = ci_logger_filter();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[CIPersonSegmentation outputImage].cold.1((uint64_t)self, v4);
    return +[CIImage emptyImage](CIImage, "emptyImage");
  }
  v37 = 0;
  -[CIImage extent](self->inputImage, "extent");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  v14 = -[NSNumber unsignedIntValue](self->inputQualityLevel, "unsignedIntValue");
  if (v14 >= 3 || self->inputQualityLevel == 0)
    v16 = 0;
  else
    v16 = v14;
  if ((_DWORD)v16 == 1)
  {
    v17 = 384.0;
    *(double *)&v18 = 512.0;
    goto LABEL_15;
  }
  if ((_DWORD)v16 == 2)
  {
    v17 = 256.0;
    *(double *)&v18 = 192.0;
LABEL_15:
    v19 = *(double *)&v18;
    goto LABEL_17;
  }
  v17 = 1512.0;
  v19 = 2016.0;
LABEL_17:
  v20 = -[CIImage imageByClampingToExtent](self->inputImage, "imageByClampingToExtent");
  CGAffineTransformMakeTranslation(&v36, -v6, -v8);
  v21 = -[CIImage imageByApplyingTransform:](v20, "imageByApplyingTransform:", &v36);
  CGAffineTransformMakeScale(&v35, v19 / v10, v17 / v12);
  v22 = -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](-[CIImage imageByCroppingToRect:](-[CIImage imageByApplyingTransform:](v21, "imageByApplyingTransform:", &v35), "imageByCroppingToRect:", 0.0, 0.0, v19, v17), "imageByColorMatchingWorkingSpaceToColorSpace:", v13);
  -[CIImage extent](v22, "extent");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v40[0] = v22;
  v31 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v38[0] = CFSTR("rect");
  -[CIImage extent](v22, "extent");
  v32 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  v38[1] = CFSTR("q");
  v39[0] = v32;
  v39[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
  v33 = -[CIImage imageByColorMatchingColorSpaceToWorkingSpace:](+[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](CIPersonSegmentationKernel, "applyWithExtent:inputs:arguments:error:", v31, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2), &v37, v24, v26, v28, v30), "imageByColorMatchingColorSpaceToWorkingSpace:", v13);
  CGColorSpaceRelease(v13);
  if (v37)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  return v33;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputQualityLevel
{
  return self->inputQualityLevel;
}

- (void)setInputQualityLevel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (void)outputImage
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = objc_msgSend((id)objc_opt_class(), "description");
  _os_log_error_impl(&dword_1921E4000, a2, OS_LOG_TYPE_ERROR, "%{public}@: requires an inputImage with a finite extent.", (uint8_t *)&v3, 0xCu);
}

@end
