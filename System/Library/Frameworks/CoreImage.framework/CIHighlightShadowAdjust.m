@implementation CIHighlightShadowAdjust

+ (id)customAttributes
{
  _QWORD v3[7];
  _QWORD v4[7];
  _QWORD v5[7];
  _QWORD v6[7];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[5];
  _QWORD v10[6];
  _QWORD v11[8];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryStylize");
  v9[1] = CFSTR("CICategoryVideo");
  v9[2] = CFSTR("CICategoryStillImage");
  v9[3] = CFSTR("CICategoryHighDynamicRange");
  v9[4] = CFSTR("CICategoryBuiltIn");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v11[1] = CFSTR("5");
  v10[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v10[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v11[2] = CFSTR("10.7");
  v10[3] = CFSTR("inputRadius");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F19E70;
  v8[1] = &unk_1E2F19E70;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F19E80;
  v8[3] = &unk_1E2F19E70;
  v7[4] = CFSTR("CIAttributeIdentity");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F19E70;
  v8[5] = CFSTR("CIAttributeTypeScalar");
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v10[4] = CFSTR("inputShadowAmount");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeMax");
  v6[0] = &unk_1E2F19E90;
  v6[1] = &unk_1E2F19EA0;
  v5[2] = CFSTR("CIAttributeSliderMin");
  v5[3] = CFSTR("CIAttributeSliderMax");
  v6[2] = &unk_1E2F19E90;
  v6[3] = &unk_1E2F19EA0;
  v5[4] = CFSTR("CIAttributeDefault");
  v5[5] = CFSTR("CIAttributeIdentity");
  v6[4] = &unk_1E2F19E70;
  v6[5] = &unk_1E2F19E70;
  v5[6] = CFSTR("CIAttributeType");
  v6[6] = CFSTR("CIAttributeTypeScalar");
  v11[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 7);
  v10[5] = CFSTR("inputHighlightAmount");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeMax");
  v4[0] = &unk_1E2F19E70;
  v4[1] = &unk_1E2F19EA0;
  v3[2] = CFSTR("CIAttributeSliderMin");
  v3[3] = CFSTR("CIAttributeSliderMax");
  v4[2] = &unk_1E2F19EB0;
  v4[3] = &unk_1E2F19EA0;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeIdentity");
  v4[4] = &unk_1E2F19EA0;
  v4[5] = &unk_1E2F19EA0;
  v3[6] = CFSTR("CIAttributeType");
  v4[6] = CFSTR("CIAttributeTypeScalar");
  v11[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 7);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
}

- (int)_maxVersion
{
  return 2;
}

- (int)_defaultVersion
{
  return 2;
}

- (void)setDefaults
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CIHighlightShadowAdjust;
  -[CIFilter setDefaults](&v3, sel_setDefaults);
  -[CIHighlightShadowAdjust setValue:forKey:](self, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CIHighlightShadowAdjust _defaultVersion](self, "_defaultVersion")), CFSTR("__inputVersion"));
}

- (BOOL)_isIdentity
{
  double v3;
  double v4;
  double v5;
  BOOL result;

  -[NSNumber doubleValue](self->inputShadowAmount, "doubleValue");
  v4 = fmin(fmax(v3, -1.0), 1.0);
  -[NSNumber doubleValue](self->inputHighlightAmount, "doubleValue");
  result = 0;
  if (v4 > -0.05 && v4 < 0.05)
    return fmin(fmax(v5, 0.0), 1.0) > 0.95;
  return result;
}

- (id)_kernelSH_v2
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_highlightsAndShadows2);
}

- (id)_kernelSHnoB_v2
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_highlightsAndShadows_noblur2);
}

- (id)_kernelSH_v1
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_highlightsAndShadows1);
}

- (id)_kernelSHnoB_v1
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_highlightsAndShadows_noblur1);
}

- (id)_kernelSH_v0
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_highlightsAndShadows0);
}

- (id)_kernelSHnoB_v0
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_highlightsAndShadows_noblur0);
}

- (id)_kernelSnoB_v0
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_shadows_noblur);
}

- (id)outputImage
{
  void *v3;
  void *v4;
  int v5;
  int v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CIImage *v16;
  double v17;
  CIVector *v18;
  CIImage *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  _QWORD *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  _QWORD v52[3];
  _QWORD v53[2];
  _QWORD v54[3];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[3];

  v57[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  v3 = (void *)-[CIHighlightShadowAdjust valueForKey:](self, "valueForKey:", CFSTR("__inputVersion"));
  if (v3)
  {
    v4 = v3;
    if ((int)objc_msgSend(v3, "intValue") < 1)
      v5 = 0;
    else
      v5 = objc_msgSend(v4, "intValue");
    if (v5 >= -[CIHighlightShadowAdjust _maxVersion](self, "_maxVersion"))
    {
      v7 = -[CIHighlightShadowAdjust _maxVersion](self, "_maxVersion");
    }
    else
    {
      if ((int)objc_msgSend(v4, "intValue") < 1)
      {
        v8 = 0;
        goto LABEL_13;
      }
      v7 = objc_msgSend(v4, "intValue");
    }
  }
  else
  {
    v7 = -[CIHighlightShadowAdjust _defaultVersion](self, "_defaultVersion");
  }
  v8 = v7;
LABEL_13:
  -[NSNumber doubleValue](self->inputShadowAmount, "doubleValue");
  v10 = fmin(fmax(v9, -1.0), 1.0);
  -[NSNumber doubleValue](self->inputHighlightAmount, "doubleValue");
  v12 = fmin(fmax(v11, 0.0), 1.0);
  if (v10 > -0.05 && v10 < 0.05 && v12 > 0.95)
    return self->inputImage;
  -[NSNumber doubleValue](self->inputRadius, "doubleValue");
  v14 = fmax(v13, 0.0);
  if (v8)
    v15 = v14;
  else
    v15 = 0.0;
  v16 = -[CIImage imageByUnpremultiplyingAlpha](-[CIImage imageByApplyingGaussianBlurWithSigma:](self->inputImage, "imageByApplyingGaussianBlurWithSigma:", v15), "imageByUnpremultiplyingAlpha");
  v17 = fmin(fmax(1.0 - pow(fabs(v10 / 0.3), 1.6), 0.0), 1.0);
  v18 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v10, v12, v17, 1.0 / fmax(1.997 - 1.0 / (exp(v12 * -6.0) + 1.0), 1.0));
  v19 = -[CIImage imageByUnpremultiplyingAlpha](self->inputImage, "imageByUnpremultiplyingAlpha");
  if (!v8)
  {
    if (v12 <= 0.9999)
    {
      v20 = -[CIHighlightShadowAdjust _kernelSHnoB_v0](self, "_kernelSHnoB_v0");
      -[CIImage extent](v19, "extent");
      v22 = v39;
      v24 = v40;
      v26 = v41;
      v28 = v42;
      v56[0] = v19;
      v56[1] = v18;
      v29 = (void *)MEMORY[0x1E0C99D20];
      v30 = v56;
    }
    else
    {
      v20 = -[CIHighlightShadowAdjust _kernelSnoB_v0](self, "_kernelSnoB_v0");
      -[CIImage extent](v19, "extent");
      v22 = v31;
      v24 = v32;
      v26 = v33;
      v28 = v34;
      v57[0] = v19;
      v57[1] = v18;
      v29 = (void *)MEMORY[0x1E0C99D20];
      v30 = v57;
    }
    goto LABEL_30;
  }
  if (v8 != 1)
  {
    if (v14 == 0.0)
    {
      v20 = -[CIHighlightShadowAdjust _kernelSHnoB_v2](self, "_kernelSHnoB_v2");
      -[CIImage extent](v19, "extent");
      v22 = v35;
      v24 = v36;
      v26 = v37;
      v28 = v38;
      v53[0] = v19;
      v53[1] = v18;
      v29 = (void *)MEMORY[0x1E0C99D20];
      v30 = v53;
      goto LABEL_30;
    }
    v20 = -[CIHighlightShadowAdjust _kernelSH_v2](self, "_kernelSH_v2");
    -[CIImage extent](v19, "extent");
    v22 = v48;
    v24 = v49;
    v26 = v50;
    v28 = v51;
    v52[0] = v19;
    v52[1] = v16;
    v52[2] = v18;
    v29 = (void *)MEMORY[0x1E0C99D20];
    v30 = v52;
LABEL_33:
    v43 = 3;
    return (id)objc_msgSend((id)objc_msgSend(v20, "applyWithExtent:arguments:", objc_msgSend(v29, "arrayWithObjects:count:", v30, v43), v22, v24, v26, v28), "imageByPremultiplyingAlpha");
  }
  if (v14 != 0.0)
  {
    v20 = -[CIHighlightShadowAdjust _kernelSH_v1](self, "_kernelSH_v1");
    -[CIImage extent](v19, "extent");
    v22 = v44;
    v24 = v45;
    v26 = v46;
    v28 = v47;
    v54[0] = v19;
    v54[1] = v16;
    v54[2] = v18;
    v29 = (void *)MEMORY[0x1E0C99D20];
    v30 = v54;
    goto LABEL_33;
  }
  v20 = -[CIHighlightShadowAdjust _kernelSHnoB_v1](self, "_kernelSHnoB_v1");
  -[CIImage extent](v19, "extent");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v55[0] = v19;
  v55[1] = v18;
  v29 = (void *)MEMORY[0x1E0C99D20];
  v30 = v55;
LABEL_30:
  v43 = 2;
  return (id)objc_msgSend((id)objc_msgSend(v20, "applyWithExtent:arguments:", objc_msgSend(v29, "arrayWithObjects:count:", v30, v43), v22, v24, v26, v28), "imageByPremultiplyingAlpha");
}

- (id)_outputProperties
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v8;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  -[NSNumber doubleValue](self->inputShadowAmount, "doubleValue");
  v4 = fmin(fmax(v3, -1.0), 1.0);
  -[NSNumber doubleValue](self->inputHighlightAmount, "doubleValue");
  v6 = fmin(fmax(v5, 0.0), 1.0);
  if (v4 > -0.005 && v4 < 0.005 && v6 > 0.995)
    return 0;
  v9[0] = metadataPropertyWithBool();
  v9[1] = metadataPropertyWithDouble(v4);
  v9[2] = metadataPropertyWithDouble(v6);
  v8 = v4 * 25.0;
  if (v4 <= 0.0)
    v8 = 0.0;
  v9[3] = metadataPropertyWithDouble(v8);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
}

- (id)_initFromProperties:(id)a3
{
  double v6;
  double v7;

  v6 = 0.0;
  v7 = 0.0;
  if (metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("Shadows"), &v7)&& metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("Highlights"), &v6))
  {
    -[CIHighlightShadowAdjust setInputShadowAmount:](self, "setInputShadowAmount:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7));
    -[CIHighlightShadowAdjust setInputHighlightAmount:](self, "setInputHighlightAmount:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6));
    -[CIHighlightShadowAdjust setValue:forKey:](self, "setValue:forKey:", &unk_1E2F1B980, CFSTR("__inputVersion"));
  }
  else
  {

    return 0;
  }
  return self;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputShadowAmount
{
  return self->inputShadowAmount;
}

- (void)setInputShadowAmount:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputHighlightAmount
{
  return self->inputHighlightAmount;
}

- (void)setInputHighlightAmount:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
