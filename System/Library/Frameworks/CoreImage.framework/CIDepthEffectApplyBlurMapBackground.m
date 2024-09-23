@implementation CIDepthEffectApplyBlurMapBackground

+ (id)customAttributes
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CIDepthEffectApplyBlurMapBackground;
  return objc_msgSendSuper2(&v3, sel_customAttributes);
}

- (id)unifiedRenderingOutputImage:(CGImageMetadata *)a3
{
  CFTypeID TypeID;
  CIImage *inputImage;
  id RenderingParametersFromCGImageMetadata;
  void *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  CIImage *inputBlurMap;
  CIImage *inputMatteImage;
  CIImage *inputGainMap;
  NSString *inputCaptureFolderMiscPath;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
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
  -[NSNumber floatValue](self->super.inputAperture, "floatValue");
  v10 = v9;
  -[NSNumber floatValue](self->super.inputScale, "floatValue");
  v12 = v11;
  -[NSNumber floatValue](self->super.inputLumaNoiseScale, "floatValue");
  v14 = v13;
  inputBlurMap = self->super.inputBlurMap;
  inputMatteImage = self->super.inputMatteImage;
  inputGainMap = self->super.inputGainMap;
  inputCaptureFolderMiscPath = self->super.inputCaptureFolderMiscPath;
  v19 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA70], CFSTR("options"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v8, CFSTR("metadata"));
  LODWORD(v20) = v10;
  objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20), CFSTR("simulatedAperture"));
  LODWORD(v21) = 1022739087;
  objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21), CFSTR("maxBlur"));
  LODWORD(v22) = v12;
  objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22), CFSTR("inputScale"));
  LODWORD(v23) = v14;
  objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23), CFSTR("lumaNoiseAmplitude"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", inputBlurMap, CFSTR("inputBlurMap"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", inputMatteImage, CFSTR("inputAlpha"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", inputImage, CFSTR("inputImage"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", 0, CFSTR("inputImageLuma"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", 0, CFSTR("inputImageChroma"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", inputGainMap, CFSTR("inputGainMap"));
  if (inputCaptureFolderMiscPath)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", inputCaptureFolderMiscPath, CFSTR("captureFolderMiscPath"));
  v24 = objc_msgSend(objc_alloc((Class)envCCApplyBlurMapArgsClass()), "initWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v19));
  if (v24)
  {
    v25 = (void *)v24;
    v26 = objc_msgSend(objc_alloc((Class)envCCApplyBlurMapClass()), "initWithMetalQueue:", 0);
    if (v26)
    {
      v27 = (void *)v26;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v28 = (void *)objc_msgSend(v27, "backgroundImageUsingArgs:", v25);
      else
        v28 = 0;

    }
    else
    {
      v28 = 0;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)outputImage
{
  CIImage *inputImage;
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
  uint8_t v16[16];
  CGRect v17;
  CGRect v18;

  inputImage = self->super.inputImage;
  if (!inputImage || !self->super.inputBlurMap)
    return 0;
  -[CIImage extent](inputImage, "extent");
  if (CGRectIsInfinite(v17) || (-[CIImage extent](self->super.inputBlurMap, "extent"), CGRectIsInfinite(v18)))
  {
    v4 = ci_logger_api();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1921E4000, v4, OS_LOG_TYPE_INFO, "input image(s) to CIDepthBlurEffect apply is of inifite extent; returning nil image",
        v16,
        2u);
    }
    return 0;
  }
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
  if (v13 < +[CIFilter minSDOFRenderingVersionSupported](CIFilter, "minSDOFRenderingVersionSupported"))
    return 0;
  v14 = objc_msgSend(v12, "intValue");
  if (v14 > +[CIFilter maxSDOFRenderingVersionSupported](CIFilter, "maxSDOFRenderingVersionSupported"))
    return 0;
  return -[CIDepthEffectApplyBlurMapBackground unifiedRenderingOutputImage:](self, "unifiedRenderingOutputImage:", self->super.inputAuxDataMetadata);
}

@end
