@implementation CIDepthEffectApplyBlurMap

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[4];
  _QWORD v6[4];
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  _QWORD v11[4];
  _QWORD v12[4];
  _QWORD v13[6];
  _QWORD v14[6];
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[5];
  _QWORD v18[10];
  _QWORD v19[12];

  v19[10] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("CIAttributeFilterCategories");
  v17[0] = CFSTR("CICategoryColorAdjustment");
  v17[1] = CFSTR("CICategoryVideo");
  v17[2] = CFSTR("CICategoryStillImage");
  v17[3] = CFSTR("CICategoryBuiltIn");
  v17[4] = CFSTR("CICategoryApplePrivate");
  v19[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
  v19[1] = CFSTR("11");
  v18[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v18[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v19[2] = CFSTR("10.13");
  v18[3] = CFSTR("inputAperture");
  v15[0] = CFSTR("CIAttributeSliderMin");
  v15[1] = CFSTR("CIAttributeSliderMax");
  v16[0] = &unk_1E2F1B260;
  v16[1] = &unk_1E2F1B270;
  v15[2] = CFSTR("CIAttributeMin");
  v15[3] = CFSTR("CIAttributeMax");
  v16[2] = &unk_1E2F1B250;
  v16[3] = &unk_1E2F1B270;
  v15[4] = CFSTR("CIAttributeDefault");
  v15[5] = CFSTR("CIAttributeType");
  v16[4] = &unk_1E2F1B250;
  v16[5] = CFSTR("CIAttributeTypeScalar");
  v19[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
  v18[4] = CFSTR("inputLumaNoiseScale");
  v13[0] = CFSTR("CIAttributeSliderMin");
  v13[1] = CFSTR("CIAttributeSliderMax");
  v14[0] = &unk_1E2F1B250;
  v14[1] = &unk_1E2F1B2A0;
  v13[2] = CFSTR("CIAttributeMin");
  v13[3] = CFSTR("CIAttributeMax");
  v14[2] = &unk_1E2F1B250;
  v14[3] = &unk_1E2F1B2A0;
  v13[4] = CFSTR("CIAttributeDefault");
  v13[5] = CFSTR("CIAttributeType");
  v14[4] = &unk_1E2F1B250;
  v14[5] = CFSTR("CIAttributeTypeScalar");
  v19[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v18[5] = CFSTR("inputScale");
  v11[0] = CFSTR("CIAttributeType");
  v11[1] = CFSTR("CIAttributeSliderMin");
  v12[0] = CFSTR("CIAttributeTypeScalar");
  v12[1] = &unk_1E2F1B280;
  v11[2] = CFSTR("CIAttributeSliderMax");
  v11[3] = CFSTR("CIAttributeDefault");
  v12[2] = &unk_1E2F1B260;
  v12[3] = &unk_1E2F1B260;
  v19[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v18[6] = CFSTR("inputAuxDataMetadata");
  v9 = CFSTR("CIAttributeClass");
  v10 = CFSTR("CGImageMetadataRef");
  v19[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v18[7] = CFSTR("inputShape");
  v7 = CFSTR("CIAttributeClass");
  v8 = CFSTR("NSString");
  v19[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v18[8] = CFSTR("inputDraftMode");
  v5[0] = CFSTR("CIAttributeType");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = CFSTR("CIAttributeTypeInteger");
  v6[1] = &unk_1E2F1BFB0;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F1BFC8;
  v6[3] = &unk_1E2F1BFB0;
  v19[8] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v18[9] = CFSTR("inputBestHairQuality");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = MEMORY[0x1E0C9AAA0];
  v4[1] = MEMORY[0x1E0C9AAA0];
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeMax");
  v4[2] = MEMORY[0x1E0C9AAB0];
  v4[3] = MEMORY[0x1E0C9AAB0];
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = MEMORY[0x1E0C9AAB0];
  v4[5] = CFSTR("CIAttributeTypeBoolean");
  v19[9] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 10);
}

- (id)alterBlurmap
{
  CIImage *inputBlurMap;
  NSNumber *inputBestHairQuality;
  BOOL v4;
  CIColorKernel *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  inputBlurMap = self->inputBlurMap;
  inputBestHairQuality = self->inputBestHairQuality;
  v4 = inputBestHairQuality == (NSNumber *)MEMORY[0x1E0C9AAA0] || inputBestHairQuality == (NSNumber *)&unk_1E2F1BFB0;
  if (v4
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && !-[NSNumber BOOLValue](inputBestHairQuality, "BOOLValue"))
  {
    v5 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_onlyRG_);
    -[CIImage extent](inputBlurMap, "extent");
    v11[0] = inputBlurMap;
    return -[CIColorKernel applyWithExtent:arguments:](v5, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1), v6, v7, v8, v9);
  }
  return inputBlurMap;
}

- (id)unifiedRenderingOutputImage:(CGImageMetadata *)a3
{
  CFTypeID TypeID;
  CIImage *inputImage;
  id RenderingParametersFromCGImageMetadata;
  void *v8;
  id v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  CIImage *inputMatteImage;
  CIImage *inputGainMap;
  NSString *inputCaptureFolderMiscPath;
  CIImage *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;

  if (!a3)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  TypeID = CGImageMetadataGetTypeID();
  if (TypeID != CFGetTypeID(a3))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  inputImage = self->inputImage;
  RenderingParametersFromCGImageMetadata = getRenderingParametersFromCGImageMetadata(a3);
  if (!RenderingParametersFromCGImageMetadata)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v8 = RenderingParametersFromCGImageMetadata;
  v9 = -[CIDepthEffectApplyBlurMap alterBlurmap](self, "alterBlurmap");
  -[NSNumber floatValue](self->inputAperture, "floatValue");
  v11 = v10;
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v13 = v12;
  -[NSNumber floatValue](self->inputLumaNoiseScale, "floatValue");
  v15 = v14;
  inputMatteImage = self->inputMatteImage;
  inputGainMap = self->inputGainMap;
  inputCaptureFolderMiscPath = self->inputCaptureFolderMiscPath;
  v19 = +[CIImage emptyImage](CIImage, "emptyImage");
  v20 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA70], CFSTR("options"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v8, CFSTR("metadata"));
  LODWORD(v21) = v11;
  objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21), CFSTR("simulatedAperture"));
  LODWORD(v22) = 1022739087;
  objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22), CFSTR("maxBlur"));
  LODWORD(v23) = v13;
  objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23), CFSTR("inputScale"));
  LODWORD(v24) = v15;
  objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24), CFSTR("lumaNoiseAmplitude"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v9, CFSTR("inputBlurMap"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", inputMatteImage, CFSTR("inputAlpha"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", inputImage, CFSTR("inputImage"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", 0, CFSTR("inputImageLuma"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", 0, CFSTR("inputImageChroma"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", inputGainMap, CFSTR("inputGainMap"));
  if (inputCaptureFolderMiscPath)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", inputCaptureFolderMiscPath, CFSTR("captureFolderMiscPath"));
  v25 = objc_msgSend(objc_alloc((Class)envCCApplyBlurMapArgsClass()), "initWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v20));
  if (v25)
  {
    v26 = (void *)v25;
    v27 = (void *)objc_msgSend(objc_alloc((Class)envCCApplyBlurMapClass()), "initWithMetalQueue:", 0);
    if (v27)
    {
      v28 = v27;
      v19 = (CIImage *)objc_msgSend(v27, "imageUsingArgs:", v26);

    }
  }

  if (v19)
    return v19;
  else
    return +[CIImage emptyImage](CIImage, "emptyImage");
}

- (id)outputImage
{
  id result;
  NSObject *v4;
  const CGImageMetadata *v5;
  const CGImageMetadata *v6;
  id inputAuxDataMetadata;
  CFTypeID TypeID;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  CIImage *v16;
  CIImage *inputBlurMap;
  NSNumber *inputLumaNoiseScale;
  NSNumber *inputScale;
  NSNumber *inputAperture;
  const __CFString *inputShape;
  CIFilter *v22;
  const CGImageMetadata *v23;
  double *v24;
  double v25;
  double v26;
  CFTypeID v27;
  CGImageMetadataTag *v28;
  CGImageMetadataTag *v29;
  CFTypeRef v30;
  CFTypeRef v31;
  CIImage *inputMatteImage;
  double v33;
  double v34;
  uint8_t v35[8];
  _QWORD v36[7];
  _QWORD v37[8];
  CGRect v38;
  CGRect v39;

  v37[7] = *MEMORY[0x1E0C80C00];
  result = self->inputImage;
  if (!result)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  if (self->inputBlurMap)
  {
    objc_msgSend(result, "extent");
    if (CGRectIsInfinite(v38) || (-[CIImage extent](self->inputBlurMap, "extent"), CGRectIsInfinite(v39)))
    {
      v4 = ci_logger_api();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_1921E4000, v4, OS_LOG_TYPE_INFO, "input image(s) to CIDepthBlurEffect apply is of inifite extent; returning input image",
          v35,
          2u);
      }
      return self->inputImage;
    }
    v5 = (const CGImageMetadata *)metadataFromValue(self->inputAuxDataMetadata);
    if (v5)
      v6 = tuningParametersFromMetaData(v5);
    else
      v6 = tuningParametersFromImage(self->inputBlurMap);
    inputAuxDataMetadata = v6;
    if (self->inputAuxDataMetadata)
    {
      TypeID = CFDictionaryGetTypeID();
      if (TypeID == CFGetTypeID(self->inputAuxDataMetadata))
        inputAuxDataMetadata = self->inputAuxDataMetadata;
    }
    v9 = (void *)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Version"));
    v10 = (void *)MEMORY[0x1E0CB37E8];
    if (v9)
      v11 = objc_msgSend(v9, "unsignedIntegerValue");
    else
      v11 = 1;
    v12 = (void *)objc_msgSend(v10, "numberWithUnsignedInteger:", v11);
    v13 = objc_msgSend(v12, "intValue");
    v14 = +[CIFilter minSDOFRenderingVersionSupported](CIFilter, "minSDOFRenderingVersionSupported");
    v15 = objc_msgSend(v12, "intValue");
    if (v13 >= v14)
    {
      if (v15 <= +[CIFilter maxSDOFRenderingVersionSupported](CIFilter, "maxSDOFRenderingVersionSupported"))return -[CIDepthEffectApplyBlurMap unifiedRenderingOutputImage:](self, "unifiedRenderingOutputImage:", self->inputAuxDataMetadata);
      return self->inputImage;
    }
    if (!v15)
      return self->inputImage;
    v16 = -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](self->inputImage, "imageByColorMatchingWorkingSpaceToColorSpace:", linearP3ColorSpace());
    inputBlurMap = self->inputBlurMap;
    v36[0] = CFSTR("inputBlurmapImage");
    v36[1] = CFSTR("inputLumaNoiseScale");
    inputLumaNoiseScale = self->inputLumaNoiseScale;
    v37[0] = inputBlurMap;
    v37[1] = inputLumaNoiseScale;
    inputScale = self->inputScale;
    v36[2] = CFSTR("inputScale");
    v36[3] = CFSTR("inputAperture");
    inputAperture = self->inputAperture;
    v37[2] = inputScale;
    v37[3] = inputAperture;
    v36[4] = CFSTR("inputImage");
    v36[5] = CFSTR("inputShape");
    inputShape = (const __CFString *)self->inputShape;
    if (!inputShape)
      inputShape = &stru_1E2ECD1B0;
    v37[4] = v16;
    v37[5] = inputShape;
    v36[6] = CFSTR("inputDraftMode");
    v37[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", +[CIDepthBlurEffect getDraftMode:](CIDepthBlurEffect, "getDraftMode:", -[CIDepthEffectApplyBlurMap inputDraftMode](self, "inputDraftMode")));
    v22 = +[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", CFSTR("CIPortraitBlur"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 7));
    v23 = (const CGImageMetadata *)self->inputAuxDataMetadata;
    v24 = (double *)MEMORY[0x1E0C9D820];
    v26 = *MEMORY[0x1E0C9D820];
    v25 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (v23)
    {
      v27 = CFGetTypeID(self->inputAuxDataMetadata);
      if (CGImageMetadataGetTypeID() == v27)
      {
        v28 = CGImageMetadataCopyTagWithPath(v23, 0, CFSTR("depthData:IntrinsicMatrixReferenceWidth"));
        v29 = CGImageMetadataCopyTagWithPath(v23, 0, CFSTR("depthData:IntrinsicMatrixReferenceHeight"));
        if (v28)
        {
          v30 = CGImageMetadataTagCopyValue(v28);
          v26 = (double)objc_msgSend((id)(id)CFMakeCollectable(v30), "integerValue");
          CFRelease(v28);
        }
        if (v29)
        {
          v31 = CGImageMetadataTagCopyValue(v29);
          v25 = (double)objc_msgSend((id)(id)CFMakeCollectable(v31), "integerValue");
          CFRelease(v29);
        }
      }
    }
    if (v26 != *v24 || v25 != v24[1])
    {
      inputAuxDataMetadata = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", inputAuxDataMetadata);
      objc_msgSend(inputAuxDataMetadata, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26), CFSTR("SensorWidth"));
      objc_msgSend(inputAuxDataMetadata, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25), CFSTR("SensorHeight"));
    }
    if (inputAuxDataMetadata)
      -[CIFilter setValue:forKey:](v22, "setValue:forKey:", inputAuxDataMetadata, CFSTR("inputTuningParameters"));
    inputMatteImage = self->inputMatteImage;
    if (inputMatteImage)
    {
      -[CIImage extent](inputMatteImage, "extent");
      if (v33 > 1.0)
      {
        -[CIImage extent](self->inputMatteImage, "extent");
        if (v34 > 1.0)
          -[CIFilter setValue:forKey:](v22, "setValue:forKey:", self->inputMatteImage, CFSTR("inputMatteImage"));
      }
    }
    return -[CIImage imageByColorMatchingColorSpaceToWorkingSpace:](-[CIFilter outputImage](v22, "outputImage"), "imageByColorMatchingColorSpaceToWorkingSpace:", linearP3ColorSpace());
  }
  return result;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CIImage)inputBlurMap
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputBlurMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (CIImage)inputMatteImage
{
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputMatteImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (CIImage)inputGainMap
{
  return (CIImage *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputGainMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSNumber)inputAperture
{
  return self->inputAperture;
}

- (void)setInputAperture:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)inputLumaNoiseScale
{
  return self->inputLumaNoiseScale;
}

- (void)setInputLumaNoiseScale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (id)inputAuxDataMetadata
{
  return self->inputAuxDataMetadata;
}

- (void)setInputAuxDataMetadata:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSString)inputShape
{
  return self->inputShape;
}

- (void)setInputShape:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (NSNumber)inputDraftMode
{
  return self->inputDraftMode;
}

- (void)setInputDraftMode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (NSNumber)inputBestHairQuality
{
  return self->inputBestHairQuality;
}

- (void)setInputBestHairQuality:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (NSString)inputCaptureFolderMiscPath
{
  return self->inputCaptureFolderMiscPath;
}

- (void)setInputCaptureFolderMiscPath:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

@end
