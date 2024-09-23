@implementation CISmartColorFilter

+ (id)customAttributes
{
  uint64_t v2;
  _QWORD v4[4];
  _QWORD v5[4];
  _QWORD v6[7];
  _QWORD v7[7];
  _QWORD v8[7];
  _QWORD v9[7];
  _QWORD v10[7];
  _QWORD v11[7];
  _QWORD v12[5];
  _QWORD v13[6];
  _QWORD v14[8];

  v14[6] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("CIAttributeFilterCategories");
  v12[0] = CFSTR("CICategoryStylize");
  v12[1] = CFSTR("CICategoryVideo");
  v12[2] = CFSTR("CICategoryStillImage");
  v12[3] = CFSTR("CICategoryBuiltIn");
  v12[4] = CFSTR("CICategoryApplePrivate");
  v14[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 5);
  v13[1] = CFSTR("inputVibrancy");
  v10[0] = CFSTR("CIAttributeMin");
  v10[1] = CFSTR("CIAttributeSliderMin");
  v11[0] = &unk_1E2F1AC00;
  v11[1] = &unk_1E2F1AC00;
  v10[2] = CFSTR("CIAttributeSliderMax");
  v10[3] = CFSTR("CIAttributeMax");
  v11[2] = &unk_1E2F1AC10;
  v11[3] = &unk_1E2F1AC20;
  v10[4] = CFSTR("CIAttributeDefault");
  v10[5] = CFSTR("CIAttributeIdentity");
  v11[4] = &unk_1E2F1AC30;
  v11[5] = &unk_1E2F1AC30;
  v10[6] = CFSTR("CIAttributeType");
  v11[6] = CFSTR("CIAttributeTypeScalar");
  v14[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 7);
  v13[2] = CFSTR("inputContrast");
  v8[0] = CFSTR("CIAttributeMin");
  v8[1] = CFSTR("CIAttributeSliderMin");
  v9[0] = &unk_1E2F1AC00;
  v9[1] = &unk_1E2F1AC00;
  v8[2] = CFSTR("CIAttributeSliderMax");
  v8[3] = CFSTR("CIAttributeMax");
  v9[2] = &unk_1E2F1AC10;
  v9[3] = &unk_1E2F1AC20;
  v8[4] = CFSTR("CIAttributeDefault");
  v8[5] = CFSTR("CIAttributeIdentity");
  v9[4] = &unk_1E2F1AC30;
  v9[5] = &unk_1E2F1AC30;
  v8[6] = CFSTR("CIAttributeType");
  v9[6] = CFSTR("CIAttributeTypeScalar");
  v14[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 7);
  v13[3] = CFSTR("inputCast");
  v6[0] = CFSTR("CIAttributeMin");
  v6[1] = CFSTR("CIAttributeSliderMin");
  v7[0] = &unk_1E2F1AC00;
  v7[1] = &unk_1E2F1AC00;
  v6[2] = CFSTR("CIAttributeSliderMax");
  v6[3] = CFSTR("CIAttributeMax");
  v7[2] = &unk_1E2F1AC10;
  v7[3] = &unk_1E2F1AC10;
  v6[4] = CFSTR("CIAttributeDefault");
  v6[5] = CFSTR("CIAttributeIdentity");
  v7[4] = &unk_1E2F1AC30;
  v7[5] = &unk_1E2F1AC30;
  v6[6] = CFSTR("CIAttributeType");
  v7[6] = CFSTR("CIAttributeTypeScalar");
  v14[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 7);
  v13[4] = CFSTR("inputUseCube");
  v4[0] = CFSTR("CIAttributeMin");
  v4[1] = CFSTR("CIAttributeMax");
  v5[0] = &unk_1E2F1BED8;
  v5[1] = &unk_1E2F1BEF0;
  v4[2] = CFSTR("CIAttributeDefault");
  v4[3] = CFSTR("CIAttributeType");
  v5[2] = &unk_1E2F1BED8;
  v5[3] = CFSTR("CIAttributeTypeInteger");
  v2 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  v13[5] = CFSTR("inputUseCubeColorSpace");
  v14[4] = v2;
  v14[5] = MEMORY[0x1E0C9AA70];
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
}

- (BOOL)_isIdentity
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL result;

  -[NSNumber doubleValue](self->inputVibrancy, "doubleValue");
  v4 = v3;
  -[NSNumber doubleValue](self->inputContrast, "doubleValue");
  v6 = v5;
  -[NSNumber doubleValue](self->inputCast, "doubleValue");
  result = 0;
  if (fabs(v4) < 1.0e-10 && fabs(v6) < 1.0e-10)
    return fabs(v7) < 1.0e-10;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_cubeImage = 0;
  v3.receiver = self;
  v3.super_class = (Class)CISmartColorFilter;
  -[CIFilter dealloc](&v3, sel_dealloc);
}

- (id)_kernelCPos
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_smartcolor_contrast);
}

- (id)_kernelCNeg
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_smartcolor_contrast_darken);
}

- (id)_kernelV_gt1
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_smartcolor_vibrancy_gt1);
}

- (id)_kernelV_lt1
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_smartcolor_vibrancy_lt1);
}

- (id)_kernelCast
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_smartcolor_cast);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  objc_super v7;

  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("inputImage")) & 1) == 0)
  {

    self->_cubeImage = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)CISmartColorFilter;
  -[CISmartColorFilter setValue:forKey:](&v7, sel_setValue_forKey_, a3, a4);
}

- (id)outputImage
{
  CIImage *inputImage;
  id result;
  uint64_t v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  CGColorSpace *v19;
  CGColorSpaceRef DeviceRGB;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  _QWORD *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  float v48;
  double v49;
  float64x2_t v50;
  float v51;
  float64x2_t v52;
  float v53;
  CGColorSpace *v54;
  CIFilter *v55;
  float v56;
  double v57;
  double v58;
  double v59;
  float64x2_t v60;
  float64x2_t v61;
  float v62;
  float v63;
  float v64;
  void *v65;
  id v66;
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
  _QWORD v77[5];
  _QWORD v78[2];
  const __CFString *v79;
  uint64_t v80;
  _QWORD v81[2];
  _QWORD v82[2];
  void *v83;
  const __CFString *v84;
  _QWORD v85[2];

  v85[1] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  if (-[CISmartColorFilter _isIdentity](self, "_isIdentity"))
  {
    inputImage = self->inputImage;
    return inputImage;
  }
  LODWORD(v5) = -[NSNumber intValue](-[CISmartColorFilter inputUseCube](self, "inputUseCube"), "intValue");
  if (CI_SMART_COLOR_USE_CUBE(void)::didCheck != -1)
    dispatch_once(&CI_SMART_COLOR_USE_CUBE(void)::didCheck, &__block_literal_global_236);
  if ((CI_SMART_COLOR_USE_CUBE(void)::v & 0x80000000) == 0 && (v5 & 0x80000000) == 0)
    LODWORD(v5) = CI_SMART_COLOR_USE_CUBE(void)::v;
  if ((int)v5 < 1)
  {
    -[NSNumber doubleValue](self->inputVibrancy, "doubleValue");
    v8 = fmin(fmax(v7, -1.0), 2.0);
    -[NSNumber doubleValue](self->inputContrast, "doubleValue");
    v10 = fmin(fmax(v9, -1.0), 2.0);
    -[NSNumber doubleValue](self->inputCast, "doubleValue");
    v12 = fmax(v11, -1.0);
    result = self->inputImage;
    if (fabs(v8) >= 1.0e-10)
    {
      if (v8 <= 0.0)
        v13 = v8 + 1.0;
      else
        v13 = v8 * 3.0 + 1.0;
      v14 = (void *)objc_msgSend(result, "imageByUnpremultiplyingAlpha");
      if (v13 >= 1.0)
        v15 = -[CISmartColorFilter _kernelV_gt1](self, "_kernelV_gt1");
      else
        v15 = -[CISmartColorFilter _kernelV_lt1](self, "_kernelV_lt1");
      v21 = v15;
      objc_msgSend(v14, "extent");
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v82[0] = v14;
      v82[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
      result = (id)objc_msgSend((id)objc_msgSend(v21, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2), v23, v25, v27, v29), "imageByPremultiplyingAlpha");
    }
    v30 = fmin(v12, 1.0);
    if (fabs(v10) >= 1.0e-10)
    {
      v31 = v10 + v10;
      v32 = (void *)objc_msgSend(result, "imageByUnpremultiplyingAlpha");
      if (v10 + v10 <= 0.0)
      {
        v79 = CFSTR("inputAmount");
        v80 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmax(v31 / 6.0, -0.4));
        v43 = (void *)objc_msgSend(v32, "imageByApplyingFilter:withInputParameters:", CFSTR("CIVibrance"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1));
        v33 = -[CISmartColorFilter _kernelCNeg](self, "_kernelCNeg");
        objc_msgSend(v43, "extent");
        v35 = v44;
        v37 = v45;
        v39 = v46;
        v41 = v47;
        v78[0] = v43;
        v78[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -v31);
        v42 = v78;
      }
      else
      {
        v33 = -[CISmartColorFilter _kernelCPos](self, "_kernelCPos");
        objc_msgSend(v32, "extent");
        v35 = v34;
        v37 = v36;
        v39 = v38;
        v41 = v40;
        v81[0] = v32;
        v81[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10 + v10);
        v42 = v81;
      }
      result = (id)objc_msgSend((id)objc_msgSend(v33, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2), v35, v37, v39, v41), "imageByPremultiplyingAlpha");
    }
    if (fabs(v30) < 1.0e-10)
      return result;
    if (v30 <= 0.0)
    {
      if (v30 > -0.5)
      {
        v51 = v30 * -2.0;
        v49 = v51;
        v50 = (float64x2_t)xmmword_192498000;
        goto LABEL_41;
      }
      v62 = (v30 + 0.5) * -2.0;
      v57 = v62;
      v58 = 1.0;
      v59 = 1.0 - v62;
      v60 = vmulq_n_f64((float64x2_t)xmmword_192497FF0, v62);
      v61 = (float64x2_t)xmmword_192498000;
    }
    else
    {
      if (v30 < 0.5)
      {
        v48 = v30 + v30;
        v49 = v48;
        v50 = (float64x2_t)xmmword_192498020;
LABEL_41:
        v52 = vmulq_n_f64(v50, v49);
        v53 = 0.3;
LABEL_47:
        v63 = v52.f64[1];
        v64 = v52.f64[0];
        v65 = (void *)objc_msgSend(result, "imageByUnpremultiplyingAlpha");
        v66 = -[CISmartColorFilter _kernelCast](self, "_kernelCast");
        objc_msgSend(v65, "extent");
        v68 = v67;
        v70 = v69;
        v72 = v71;
        v74 = v73;
        v77[0] = v65;
        v77[1] = &unk_1E2F1AC20;
        *(float *)&v67 = v64;
        v77[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v67);
        *(float *)&v75 = v63;
        v77[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v75);
        *(float *)&v76 = v53;
        v77[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v76);
        return (id)objc_msgSend((id)objc_msgSend(v66, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 5), v68, v70, v72, v74), "imageByPremultiplyingAlpha");
      }
      v56 = v30 + -0.5 + v30 + -0.5;
      v57 = v56;
      v58 = 1.0;
      v59 = 1.0 - v56;
      v60 = vmulq_n_f64((float64x2_t)xmmword_192498010, v56);
      v61 = (float64x2_t)xmmword_192498020;
    }
    v52 = vmlaq_n_f64(v60, v61, v59);
    v53 = (v58 + v57 * -0.6) * 0.300000012;
    goto LABEL_47;
  }
  if (v5 > 0x20 || (_DWORD)v5 == 1)
    v5 = 32;
  else
    v5 = v5;
  inputImage = self->_cubeImage;
  if (inputImage)
    return inputImage;
  v16 = (void *)-[CISmartColorFilter copy](self, "copy");
  objc_msgSend(v16, "setValue:forKey:", &unk_1E2F1BF08, CFSTR("inputUseCube"));
  v84 = CFSTR("working_format");
  v85[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2056);
  v17 = +[CIContext _cachedContext:options:](CIContext, "_cachedContext:options:", CFSTR("CISmartColorFilter-cubeContext"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, &v84, 1));
  v83 = v16;
  v18 = objc_msgSend(v17, "createColorCubeDataForFilters:dimension:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1), v5);

  v19 = -[CISmartColorFilter inputUseCubeColorSpace](self, "inputUseCubeColorSpace");
  if (v19)
    DeviceRGB = CGColorSpaceRetain(v19);
  else
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v54 = DeviceRGB;
  v55 = +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CIColorCubeWithColorSpace"), CFSTR("inputImage"), self->inputImage, CFSTR("inputCubeData"), v18, CFSTR("inputColorSpace"), DeviceRGB, CFSTR("inputCubeDimension"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5), 0);
  CGColorSpaceRelease(v54);
  result = -[CIFilter outputImage](v55, "outputImage");
  self->_cubeImage = (CIImage *)result;
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputVibrancy
{
  return self->inputVibrancy;
}

- (void)setInputVibrancy:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputContrast
{
  return self->inputContrast;
}

- (void)setInputContrast:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputCast
{
  return self->inputCast;
}

- (void)setInputCast:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputUseCube
{
  return self->inputUseCube;
}

- (void)setInputUseCube:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (id)inputUseCubeColorSpace
{
  return self->inputUseCubeColorSpace;
}

- (void)setInputUseCubeColorSpace:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

@end
