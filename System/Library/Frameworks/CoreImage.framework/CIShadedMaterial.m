@implementation CIShadedMaterial

- (id)_CIShadedmaterial
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_shadedmaterial);
}

- (id)_CIShadedmaterial_0
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_shadedmaterial_0);
}

- (id)outputImage
{
  id result;
  double v4;
  double v5;
  double v6;
  CIVector *v7;
  float v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CIImage *v24;
  uint64_t v25;
  _QWORD *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CIImage *inputShadingImage;
  double v44;
  _QWORD v45[8];
  _QWORD v46[4];
  _QWORD v47[4];

  v47[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  result = self->inputShadingImage;
  if (result)
  {
    objc_msgSend(result, "extent");
    v5 = v4;
    -[CIImage extent](self->inputShadingImage, "extent");
    v7 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v5, v6);
    -[NSNumber floatValue](self->inputScale, "floatValue");
    v9 = fabsf(v8);
    -[CIImage extent](self->inputShadingImage, "extent");
    v14 = v13;
    if (v9 >= 0.001)
    {
      v32 = v10;
      v33 = v11;
      v34 = v12;
      v35 = -[CIShadedMaterial _CIShadedmaterial](self, "_CIShadedmaterial");
      -[CIImage extent](self->inputImage, "extent");
      v44 = v36;
      v38 = v37;
      v40 = v39;
      v42 = v41;
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __31__CIShadedMaterial_outputImage__block_invoke_2;
      v45[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      v45[4] = v14;
      v45[5] = v32;
      v45[6] = v33;
      v45[7] = v34;
      inputShadingImage = self->inputShadingImage;
      v46[0] = self->inputImage;
      v46[1] = inputShadingImage;
      v46[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0 / v9)));
      v46[3] = v7;
      v25 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
      v26 = v45;
      v27 = v35;
      v28 = v44;
      v29 = v38;
      v30 = v40;
      v31 = v42;
    }
    else
    {
      v15 = -[CIShadedMaterial _CIShadedmaterial](self, "_CIShadedmaterial");
      -[CIImage extent](self->inputImage, "extent");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v24 = self->inputShadingImage;
      v47[0] = self->inputImage;
      v47[1] = v24;
      v47[2] = v7;
      v25 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3);
      v26 = &__block_literal_global_63;
      v27 = v15;
      v28 = v17;
      v29 = v19;
      v30 = v21;
      v31 = v23;
    }
    return (id)objc_msgSend(v27, "applyWithExtent:roiCallback:arguments:", v26, v25, v28, v29, v30, v31);
  }
  return result;
}

double __31__CIShadedMaterial_outputImage__block_invoke_2(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  double result;

  if (a2)
    return *(double *)(a1 + 32);
  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a3, -1.0, -1.0);
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
  v5[0] = CFSTR("CICategoryStylize");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryHighDynamicRange");
  v5[4] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  v7[1] = CFSTR("9");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.4");
  v6[3] = CFSTR("inputScale");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F1AA40;
  v4[1] = &unk_1E2F1AA50;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1AA60;
  v4[3] = &unk_1E2F1AA70;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeDistance");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputShadingImage
{
  return self->inputShadingImage;
}

- (void)setInputShadingImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
