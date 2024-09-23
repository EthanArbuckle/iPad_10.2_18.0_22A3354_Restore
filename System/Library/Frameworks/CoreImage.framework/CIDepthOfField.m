@implementation CIDepthOfField

- (id)_CITiltShift
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_tiltShift);
}

- (id)_DistanceColored
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_distanceColored);
}

- (id)_CIAlphaNormalize
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_alphaNormalize);
}

- (id)outputImage
{
  CIImage *inputImage;
  float v4;
  float v5;
  CIFilter *v6;
  float v7;
  float v8;
  CIFilter *v9;
  CIFilter *v10;
  CIImage *v11;
  uint64_t v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  float v20;
  double v21;
  uint64_t v22;
  CIFilter *v23;
  CIImage *v24;
  uint64_t v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CIVector *inputPoint0;
  CIVector *inputPoint1;
  double v43;
  double v44;
  double v45;
  _QWORD v47[6];
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  if (v4 <= 0.0)
    return self->inputImage;
  -[NSNumber floatValue](self->inputSaturation, "floatValue");
  if (v5 != 1.0)
  {
    v6 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorControls"));
    -[CIFilter setDefaults](v6, "setDefaults");
    -[CIFilter setValue:forKey:](v6, "setValue:forKey:", self->inputSaturation, CFSTR("inputSaturation"));
    -[CIFilter setValue:forKey:](v6, "setValue:forKey:", inputImage, CFSTR("inputImage"));
    inputImage = -[CIFilter outputImage](v6, "outputImage");
  }
  -[NSNumber floatValue](self->inputUnsharpMaskRadius, "floatValue");
  if (v7 > 0.0)
  {
    -[NSNumber floatValue](self->inputUnsharpMaskIntensity, "floatValue");
    if (v8 > 0.0)
    {
      v9 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIUnsharpMask"));
      -[CIFilter setDefaults](v9, "setDefaults");
      -[CIFilter setValue:forKey:](v9, "setValue:forKey:", self->inputUnsharpMaskRadius, CFSTR("inputRadius"));
      -[CIFilter setValue:forKey:](v9, "setValue:forKey:", self->inputUnsharpMaskIntensity, CFSTR("inputIntensity"));
      -[CIFilter setValue:forKey:](v9, "setValue:forKey:", inputImage, CFSTR("inputImage"));
      inputImage = -[CIFilter outputImage](v9, "outputImage");
    }
  }
  v10 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIDiscBlur"));
  -[CIFilter setDefaults](v10, "setDefaults");
  -[CIFilter setValue:forKey:](v10, "setValue:forKey:", self->inputRadius, CFSTR("inputRadius"));
  -[CIFilter setValue:forKey:](v10, "setValue:forKey:", self->inputImage, CFSTR("inputImage"));
  v11 = -[CIFilter outputImage](v10, "outputImage");
  -[CIImage extent](self->inputImage, "extent");
  v12 = -[CIImage imageByCroppingToRect:](v11, "imageByCroppingToRect:");
  v13 = -[CIDepthOfField _CIAlphaNormalize](self, "_CIAlphaNormalize");
  -[CIImage extent](self->inputImage, "extent");
  v49[0] = v12;
  v18 = objc_msgSend(v13, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1), v14, v15, v16, v17);
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  *(float *)&v21 = v20 * 3.0;
  v22 = objc_msgSend(v19, "numberWithFloat:", v21);
  v23 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIDiscBlur"));
  -[CIFilter setDefaults](v23, "setDefaults");
  -[CIFilter setValue:forKey:](v23, "setValue:forKey:", v22, CFSTR("inputRadius"));
  -[CIFilter setValue:forKey:](v23, "setValue:forKey:", self->inputImage, CFSTR("inputImage"));
  v24 = -[CIFilter outputImage](v23, "outputImage");
  -[CIImage extent](self->inputImage, "extent");
  v25 = -[CIImage imageByCroppingToRect:](v24, "imageByCroppingToRect:");
  v26 = -[CIDepthOfField _CIAlphaNormalize](self, "_CIAlphaNormalize");
  -[CIImage extent](self->inputImage, "extent");
  v48 = v25;
  v31 = objc_msgSend(v26, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1), v27, v28, v29, v30);
  v32 = -[CIDepthOfField _CITiltShift](self, "_CITiltShift");
  -[CIImage extent](inputImage, "extent");
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  inputPoint0 = self->inputPoint0;
  v47[0] = inputImage;
  v47[1] = v18;
  inputPoint1 = self->inputPoint1;
  v47[2] = v31;
  v47[3] = inputPoint0;
  v47[4] = inputPoint1;
  -[CIImage extent](self->inputImage, "extent");
  v44 = v43;
  -[CIImage extent](self->inputImage, "extent");
  v47[5] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v44, v45);
  return (id)objc_msgSend(v32, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_15, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 6), v34, v36, v38, v40);
}

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[4];
  _QWORD v16[9];
  _QWORD v17[10];

  v17[9] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("CIAttributeFilterCategories");
  v15[0] = CFSTR("CICategoryStylize");
  v15[1] = CFSTR("CICategoryVideo");
  v15[2] = CFSTR("CICategoryStillImage");
  v15[3] = CFSTR("CICategoryBuiltIn");
  v17[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v17[1] = CFSTR("9");
  v16[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v16[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v17[2] = CFSTR("10.6");
  v16[3] = CFSTR("inputSaturation");
  v13[0] = CFSTR("CIAttributeMin");
  v13[1] = CFSTR("CIAttributeSliderMin");
  v14[0] = &unk_1E2F19350;
  v14[1] = &unk_1E2F19350;
  v13[2] = CFSTR("CIAttributeSliderMax");
  v13[3] = CFSTR("CIAttributeDefault");
  v14[2] = &unk_1E2F19360;
  v14[3] = &unk_1E2F19370;
  v13[4] = CFSTR("CIAttributeType");
  v14[4] = CFSTR("CIAttributeTypeScalar");
  v17[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v16[4] = CFSTR("inputUnsharpMaskRadius");
  v11[0] = CFSTR("CIAttributeMin");
  v11[1] = CFSTR("CIAttributeSliderMin");
  v12[0] = &unk_1E2F19350;
  v12[1] = &unk_1E2F19350;
  v11[2] = CFSTR("CIAttributeSliderMax");
  v11[3] = CFSTR("CIAttributeDefault");
  v12[2] = &unk_1E2F19360;
  v12[3] = &unk_1E2F19380;
  v11[4] = CFSTR("CIAttributeType");
  v12[4] = CFSTR("CIAttributeTypeScalar");
  v17[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v16[5] = CFSTR("inputUnsharpMaskIntensity");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = &unk_1E2F19350;
  v10[1] = &unk_1E2F19350;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeDefault");
  v10[2] = &unk_1E2F19360;
  v10[3] = &unk_1E2F19390;
  v9[4] = CFSTR("CIAttributeType");
  v10[4] = CFSTR("CIAttributeTypeScalar");
  v17[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v16[6] = CFSTR("inputRadius");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F19350;
  v8[1] = &unk_1E2F19350;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F193A0;
  v8[3] = &unk_1E2F193B0;
  v7[4] = CFSTR("CIAttributeType");
  v8[4] = CFSTR("CIAttributeTypeScalar");
  v17[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v16[7] = CFSTR("inputPoint0");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeType");
  v6[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 300.0);
  v6[1] = CFSTR("CIAttributeTypePosition");
  v17[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v16[8] = CFSTR("inputPoint1");
  v3[0] = CFSTR("CIAttributeDefault");
  v3[1] = CFSTR("CIAttributeType");
  v4[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 300.0, 300.0);
  v4[1] = CFSTR("CIAttributeTypePosition");
  v17[8] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 9);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

@end
