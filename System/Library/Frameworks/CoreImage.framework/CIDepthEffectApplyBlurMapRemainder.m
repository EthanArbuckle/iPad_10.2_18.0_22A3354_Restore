@implementation CIDepthEffectApplyBlurMapRemainder

+ (id)customAttributes
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CIDepthEffectApplyBlurMapRemainder;
  return objc_msgSendSuper2(&v3, sel_customAttributes);
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
  CIImage *inputBackground;
  CIImage *inputGainMap;
  NSString *inputCaptureFolderMiscPath;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;

  if (!a3)
    return 0;
  TypeID = CGImageMetadataGetTypeID();
  if (TypeID != CFGetTypeID(a3))
    return 0;
  inputImage = self->super.inputImage;
  RenderingParametersFromCGImageMetadata = getRenderingParametersFromCGImageMetadata(a3);
  if (!RenderingParametersFromCGImageMetadata)
    return 0;
  v8 = RenderingParametersFromCGImageMetadata;
  v9 = -[CIDepthEffectApplyBlurMap alterBlurmap](self, "alterBlurmap");
  -[NSNumber floatValue](self->super.inputAperture, "floatValue");
  v11 = v10;
  -[NSNumber floatValue](self->super.inputScale, "floatValue");
  v13 = v12;
  -[NSNumber floatValue](self->super.inputLumaNoiseScale, "floatValue");
  v15 = v14;
  inputMatteImage = self->super.inputMatteImage;
  inputBackground = self->inputBackground;
  inputGainMap = self->super.inputGainMap;
  inputCaptureFolderMiscPath = self->super.inputCaptureFolderMiscPath;
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
  v25 = (void *)objc_msgSend(objc_alloc((Class)envCCApplyBlurMapArgsClass()), "initWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v20));
  if (v25 && (v26 = objc_msgSend(objc_alloc((Class)envCCApplyBlurMapClass()), "initWithMetalQueue:", 0)) != 0)
  {
    v27 = (void *)v26;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v28 = (void *)objc_msgSend(v27, "imageUsingArgs:backgroundBlur:", v25, inputBackground);
    else
      v28 = 0;

  }
  else
  {
    v28 = 0;
  }

  return v28;
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
  uint8_t v15[16];
  CGRect v16;
  CGRect v17;

  result = self->super.inputImage;
  if (!result)
    return result;
  if (!self->super.inputBlurMap || !self->inputBackground)
    return 0;
  objc_msgSend(result, "extent");
  if (!CGRectIsInfinite(v16))
  {
    -[CIImage extent](self->super.inputBlurMap, "extent");
    if (!CGRectIsInfinite(v17))
    {
      v5 = (const CGImageMetadata *)metadataFromValue(self->super.inputAuxDataMetadata);
      if (v5)
        v6 = tuningParametersFromMetaData(v5);
      else
        v6 = tuningParametersFromImage(self->super.inputBlurMap);
      inputAuxDataMetadata = v6;
      if (self->super.inputAuxDataMetadata)
      {
        TypeID = CFDictionaryGetTypeID();
        if (TypeID == CFGetTypeID(self->super.inputAuxDataMetadata))
          inputAuxDataMetadata = self->super.inputAuxDataMetadata;
      }
      v9 = (void *)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Version"));
      v10 = (void *)MEMORY[0x1E0CB37E8];
      if (v9)
        v11 = objc_msgSend(v9, "unsignedIntegerValue");
      else
        v11 = 1;
      v12 = (void *)objc_msgSend(v10, "numberWithUnsignedInteger:", v11);
      v13 = objc_msgSend(v12, "intValue");
      if (v13 >= +[CIFilter minSDOFRenderingVersionSupported](CIFilter, "minSDOFRenderingVersionSupported"))
      {
        v14 = objc_msgSend(v12, "intValue");
        if (v14 <= +[CIFilter maxSDOFRenderingVersionSupported](CIFilter, "maxSDOFRenderingVersionSupported"))return -[CIDepthEffectApplyBlurMapRemainder unifiedRenderingOutputImage:](self, "unifiedRenderingOutputImage:", self->super.inputAuxDataMetadata);
      }
      return 0;
    }
  }
  v4 = ci_logger_api();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1921E4000, v4, OS_LOG_TYPE_INFO, "input image(s) to CIDepthBlurEffect apply is of inifite extent; returning input image",
      v15,
      2u);
  }
  return self->super.inputImage;
}

- (CIImage)inputBackground
{
  return (CIImage *)objc_getProperty(self, a2, 176, 1);
}

- (void)setInputBackground:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

@end
