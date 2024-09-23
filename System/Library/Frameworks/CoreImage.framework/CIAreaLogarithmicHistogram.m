@implementation CIAreaLogarithmicHistogram

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[5];
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryReduction");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryHighDynamicRange");
  v11[4] = CFSTR("CICategoryBuiltIn");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v13[1] = CFSTR("16");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("13.0");
  v12[3] = CFSTR("inputCount");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = &unk_1E2F18B60;
  v10[1] = &unk_1E2F18B70;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeMax");
  v10[2] = &unk_1E2F18B80;
  v10[3] = &unk_1E2F18B90;
  v9[4] = CFSTR("CIAttributeDefault");
  v9[5] = CFSTR("CIAttributeType");
  v10[4] = &unk_1E2F18BA0;
  v10[5] = CFSTR("CIAttributeTypeScalar");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v12[4] = CFSTR("inputScale");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F18BB0;
  v8[1] = &unk_1E2F18BB0;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F18B60;
  v8[3] = &unk_1E2F18B60;
  v7[4] = CFSTR("CIAttributeType");
  v8[4] = CFSTR("CIAttributeTypeScalar");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v12[5] = CFSTR("inputMinimumStop");
  v6[0] = &unk_1E2F1B410;
  v6[1] = &unk_1E2F1B428;
  v5[0] = CFSTR("CIAttributeSliderMin");
  v5[1] = CFSTR("CIAttributeSliderMax");
  v5[2] = CFSTR("CIAttributeDefault");
  v5[3] = CFSTR("CIAttributeType");
  v6[2] = &unk_1E2F1B440;
  v6[3] = CFSTR("CIAttributeTypeScalar");
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v12[6] = CFSTR("inputMaximumStop");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F1B458;
  v4[1] = &unk_1E2F1B470;
  v3[2] = CFSTR("CIAttributeDefault");
  v3[3] = CFSTR("CIAttributeType");
  v4[2] = &unk_1E2F1B488;
  v4[3] = CFSTR("CIAttributeTypeScalar");
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (id)outputImage
{
  CIColorKernel *v3;
  CIImage *inputImage;
  float v5;
  float v6;
  float v7;
  NSNumber *inputMinimumStop;
  double v9;
  double v10;
  double v11;
  double v12;
  CIImage *v13;
  CIVector *inputExtent;
  NSNumber *inputScale;
  NSObject *v17;
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v3 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_logHistogram);
  inputImage = self->super.inputImage;
  -[NSNumber floatValue](self->inputMinimumStop, "floatValue");
  v6 = v5;
  -[NSNumber floatValue](self->inputMaximumStop, "floatValue");
  if (v7 <= v6)
  {
    v17 = ci_logger_filter();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CIAreaLogarithmicHistogram outputImage].cold.1((uint64_t)self, v17);
    return 0;
  }
  else
  {
    -[CIImage extent](inputImage, "extent");
    inputMinimumStop = self->inputMinimumStop;
    v20[0] = inputImage;
    v20[1] = inputMinimumStop;
    v20[2] = self->inputMaximumStop;
    v13 = -[CIColorKernel applyWithExtent:arguments:](v3, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3), v9, v10, v11, v12);
    inputExtent = self->super.inputExtent;
    v18[0] = CFSTR("inputExtent");
    v18[1] = CFSTR("inputScale");
    inputScale = self->super.inputScale;
    v19[0] = inputExtent;
    v19[1] = inputScale;
    v18[2] = CFSTR("inputCount");
    v19[2] = self->super.inputCount;
    return -[CIImage imageByApplyingFilter:withInputParameters:](v13, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaHistogram"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3));
  }
}

- (NSNumber)inputMinimumStop
{
  return self->inputMinimumStop;
}

- (void)setInputMinimumStop:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSNumber)inputMaximumStop
{
  return self->inputMaximumStop;
}

- (void)setInputMaximumStop:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (void)outputImage
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = objc_msgSend((id)objc_opt_class(), "description");
  _os_log_error_impl(&dword_1921E4000, a2, OS_LOG_TYPE_ERROR, "%{public}@: inputMinimumStop must be greater than inputMaximumStop.", (uint8_t *)&v3, 0xCu);
}

@end
