@implementation AVDepthData

+ (void)initialize
{
  objc_opt_class();
}

- (id)debugDescription
{
  uint64_t v3;
  AVDepthDataInternal *internal;
  __CVBuffer *pixelBuffer;
  size_t Width;
  __CVBuffer *v7;
  size_t Height;
  _BOOL4 filtered;
  int64_t quality;
  AVCameraCalibrationData *calibrationData;
  int64_t accuracy;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;

  -[AVDepthData depthDataType](self, "depthDataType");
  v3 = AVStringForOSType();
  internal = self->_internal;
  pixelBuffer = internal->pixelBuffer;
  if (pixelBuffer)
  {
    Width = CVPixelBufferGetWidth(pixelBuffer);
    internal = self->_internal;
    v7 = internal->pixelBuffer;
    if (v7)
    {
      Height = CVPixelBufferGetHeight(v7);
      internal = self->_internal;
      goto LABEL_6;
    }
  }
  else
  {
    Width = 0;
  }
  Height = 0;
LABEL_6:
  filtered = internal->filtered;
  quality = internal->quality;
  accuracy = internal->accuracy;
  calibrationData = internal->calibrationData;
  if (calibrationData)
    v13 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" calibration:{%@}"), -[AVCameraCalibrationData debugDescription](calibrationData, "debugDescription"));
  else
    v13 = &stru_1E421DB28;
  v14 = CFSTR("abs");
  if (accuracy != 1)
    v14 = CFSTR("rel");
  v15 = CFSTR("low");
  if (quality)
    v15 = CFSTR("high");
  if (filtered)
    v16 = &stru_1E421DB28;
  else
    v16 = CFSTR(" (unfiltered)");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %zux%zu (%@/%@)%@%@%@"), v3, Width, Height, v15, v14, v16, v13, &stru_1E421DB28);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVDepthData debugDescription](self, "debugDescription"));
}

- (void)dealloc
{
  AVDepthDataInternal *internal;
  __CVBuffer *pixelBuffer;
  objc_super v5;

  internal = self->_internal;
  if (internal)
  {
    pixelBuffer = internal->pixelBuffer;
    if (pixelBuffer)
    {
      CFRelease(pixelBuffer);
      internal = self->_internal;
    }

  }
  v5.receiver = self;
  v5.super_class = (Class)AVDepthData;
  -[AVDepthData dealloc](&v5, sel_dealloc);
}

+ (AVDepthData)depthDataFromDictionaryRepresentation:(NSDictionary *)imageSourceAuxDataInfoDictionary error:(NSError *)outError
{
  id v7;
  id v8;
  id v9;
  BOOL v10;
  int v11;
  id v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  BOOL v18;
  BOOL v19;
  int64_t v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFDictionary *v26;
  CVReturn v27;
  CVPixelBufferRef v28;
  size_t BytesPerRow;
  size_t v30;
  char *v31;
  char *BaseAddress;
  uint64_t v33;
  char *v34;
  unint64_t v35;
  char *v36;
  AVDepthData *v37;
  AVDepthData *v38;
  NSError *v39;
  CVPixelBufferRef pixelBufferOut;

  pixelBufferOut = 0;
  v7 = -[NSDictionary objectForKeyedSubscript:](imageSourceAuxDataInfoDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6C0]);
  v8 = -[NSDictionary objectForKeyedSubscript:](imageSourceAuxDataInfoDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6C8]);
  v9 = -[NSDictionary objectForKeyedSubscript:](imageSourceAuxDataInfoDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6D0]);
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  v11 = v10;
  if (v11 == 1 && v9 == 0)
    goto LABEL_41;
  v13 = v9;
  if ((v11 & 1) != 0)
    goto LABEL_32;
  v14 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD030]), "intValue");
  v15 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD128]), "intValue");
  v16 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCEA8]), "intValue");
  v17 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC888]), "intValue");
  v18 = !(_DWORD)v14 || v15 == 0;
  v19 = v18 || v16 == 0;
  if (v19 || v17 == 0)
  {
LABEL_41:
    fig_log_get_emitter();
    FigDebugAssert3();
    v38 = 0;
    v27 = -11865;
    goto LABEL_34;
  }
  LODWORD(v21) = v17;
  v22 = (void *)objc_msgSend(a1, "_allSupportedDepthDataPixelFormatTypes");
  if ((objc_msgSend(v22, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14)) & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v38 = 0;
    v27 = -11864;
    goto LABEL_34;
  }
  v23 = v16;
  v24 = (int)v21;
  v25 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", (int)v21);
  v26 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", MEMORY[0x1E0C9AA70], *MEMORY[0x1E0CA8FF0], v25, *MEMORY[0x1E0CA8F68], 0);
  v27 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v15, v16, v14, v26, &pixelBufferOut);
  v28 = pixelBufferOut;
  if (v27)
  {
    v38 = 0;
    if (!pixelBufferOut)
      goto LABEL_34;
    goto LABEL_33;
  }
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
  v30 = BytesPerRow;
  if (BytesPerRow >= (int)v21)
    v21 = (int)v21;
  else
    v21 = BytesPerRow;
  v31 = (char *)objc_msgSend(v7, "bytes");
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBufferOut);
  v33 = objc_msgSend(v7, "length");
  if (v21 <= v33)
  {
    v34 = &v31[v33];
    v35 = 1;
    do
    {
      memcpy(BaseAddress, v31, v21);
      if (v35 >= v23)
        break;
      v36 = &v31[v21 + v24];
      v31 += v24;
      BaseAddress += v30;
      ++v35;
    }
    while (v36 <= v34);
  }
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
LABEL_32:
  v37 = [AVDepthData alloc];
  v38 = -[AVDepthData initWithPixelBuffer:auxiliaryMetadata:](v37, "initWithPixelBuffer:auxiliaryMetadata:", pixelBufferOut, v13);
  v27 = 0;
  v28 = pixelBufferOut;
  if (pixelBufferOut)
LABEL_33:
    CFRelease(v28);
LABEL_34:
  if (outError && v27)
  {
    if (ErrorIsAVFoundationError())
      v39 = (NSError *)AVLocalizedError();
    else
      v39 = (NSError *)AVLocalizedErrorWithUnderlyingOSStatus();
    *outError = v39;
  }
  return v38;
}

- (AVDepthData)depthDataByApplyingExifOrientation:(CGImagePropertyOrientation)exifOrientation
{
  AVCameraCalibrationData *v5;
  __CVBuffer *pixelBuffer;
  size_t Width;
  size_t Height;
  OSType PixelFormatType;
  size_t v10;
  const __CFDictionary *v11;
  int v12;
  AVDepthData *v13;
  CVPixelBufferRef v14;
  void *v15;
  AVDepthData *v17;
  CVPixelBufferRef pixelBufferOut;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  pixelBufferOut = 0;
  if (exifOrientation - 1 < 8)
  {
    v5 = -[AVCameraCalibrationData cameraCalibrationDataWithExifOrientation:](self->_internal->calibrationData, "cameraCalibrationDataWithExifOrientation:");
    pixelBuffer = self->_internal->pixelBuffer;
    if (!pixelBuffer)
      goto LABEL_13;
    Width = CVPixelBufferGetWidth(pixelBuffer);
    Height = CVPixelBufferGetHeight(self->_internal->pixelBuffer);
    PixelFormatType = CVPixelBufferGetPixelFormatType(self->_internal->pixelBuffer);
    v10 = exifOrientation - 5 >= 4 ? Width : Height;
    if (exifOrientation - 5 >= 4)
      Width = Height;
    v19 = *MEMORY[0x1E0CA8FF0];
    v20[0] = MEMORY[0x1E0C9AA70];
    v11 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v10, Width, PixelFormatType, v11, &pixelBufferOut))
    {
LABEL_13:
      v13 = [AVDepthData alloc];
    }
    else
    {
      v12 = FigDepthRotateBuffer();
      v13 = [AVDepthData alloc];
      if (v12)
      {
        v14 = 0;
LABEL_15:
        v17 = -[AVDepthData initWithPixelBuffer:depthMetadataDictionary:](v13, "initWithPixelBuffer:depthMetadataDictionary:", v14, 0);
        v17->_internal->calibrationData = v5;
        v17->_internal->version = self->_internal->version;
        v17->_internal->quality = self->_internal->quality;
        v17->_internal->filtered = self->_internal->filtered;
        v17->_internal->accuracy = self->_internal->accuracy;
        v17->_internal->depthBlurEffectSimulatedAperture = self->_internal->depthBlurEffectSimulatedAperture;
        v17->_internal->depthBlurEffectRenderingParameters = (NSData *)-[NSData copy](self->_internal->depthBlurEffectRenderingParameters, "copy");
        v17->_internal->portraitScoreIsHigh = self->_internal->portraitScoreIsHigh;
        v17->_internal->portraitScore = self->_internal->portraitScore;
        v17->_internal->portraitLightingEffectStrength = self->_internal->portraitLightingEffectStrength;
        CVPixelBufferRelease(pixelBufferOut);
        return v17;
      }
    }
    v14 = pixelBufferOut;
    goto LABEL_15;
  }
  v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v15);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v15);
  return 0;
}

- (AVDepthData)depthDataByConvertingToDepthDataType:(OSType)depthDataType
{
  uint64_t v3;
  NSArray *v5;
  __CVBuffer *v6;
  AVDepthData *v7;
  float v8;
  float v9;
  float v10;
  void *v12;

  v3 = *(_QWORD *)&depthDataType;
  v5 = -[AVDepthData availableDepthDataTypes](self, "availableDepthDataTypes");
  if (-[NSArray containsObject:](v5, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3)))
  {
    v6 = -[AVDepthData _copyPixelBufferRepresentationWithPixelFormatType:](self, "_copyPixelBufferRepresentationWithPixelFormatType:", v3);
    v7 = -[AVDepthData initWithPixelBuffer:depthMetadataDictionary:]([AVDepthData alloc], "initWithPixelBuffer:depthMetadataDictionary:", v6, 0);
    CVPixelBufferRelease(v6);
    v7->_internal->calibrationData = -[AVDepthData cameraCalibrationData](self, "cameraCalibrationData");
    LODWORD(v6) = -[AVDepthData depthDataVersionMajor](self, "depthDataVersionMajor");
    v7->_internal->version = -[AVDepthData depthDataVersionMinor](self, "depthDataVersionMinor") | ((_DWORD)v6 << 16);
    v7->_internal->quality = -[AVDepthData depthDataQuality](self, "depthDataQuality");
    v7->_internal->filtered = -[AVDepthData isDepthDataFiltered](self, "isDepthDataFiltered");
    v7->_internal->accuracy = -[AVDepthData depthDataAccuracy](self, "depthDataAccuracy");
    -[AVDepthData depthBlurEffectSimulatedAperture](self, "depthBlurEffectSimulatedAperture");
    v7->_internal->depthBlurEffectSimulatedAperture = v8;
    v7->_internal->depthBlurEffectRenderingParameters = (NSData *)-[AVDepthData depthBlurEffectRenderingParameters](self, "depthBlurEffectRenderingParameters");
    v7->_internal->portraitScoreIsHigh = -[AVDepthData portraitScoreIsHigh](self, "portraitScoreIsHigh");
    -[AVDepthData portraitScore](self, "portraitScore");
    v7->_internal->portraitScore = v9;
    -[AVDepthData portraitLightingEffectStrength](self, "portraitLightingEffectStrength");
    v7->_internal->portraitLightingEffectStrength = v10;
    return v7;
  }
  else
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v12);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v12);
    return 0;
  }
}

- (AVDepthData)depthDataByReplacingDepthDataMapWithPixelBuffer:(CVPixelBufferRef)pixelBuffer error:(NSError *)outError
{
  uint64_t PixelFormatType;
  NSArray *v8;
  AVDepthData *v9;
  NSError *v11;

  PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  v8 = -[AVDepthData availableDepthDataTypes](self, "availableDepthDataTypes");
  if (-[NSArray containsObject:](v8, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", PixelFormatType)))
  {
    v9 = -[AVDepthData initWithPixelBuffer:depthMetadataDictionary:]([AVDepthData alloc], "initWithPixelBuffer:depthMetadataDictionary:", pixelBuffer, 0);
    v9->_internal->quality = -[AVDepthData depthDataQuality](self, "depthDataQuality");
    v9->_internal->filtered = -[AVDepthData isDepthDataFiltered](self, "isDepthDataFiltered");
    v9->_internal->accuracy = -[AVDepthData depthDataAccuracy](self, "depthDataAccuracy");
    v9->_internal->portraitScore = NAN;
    v9->_internal->portraitLightingEffectStrength = NAN;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    if (outError)
    {
      if (ErrorIsAVFoundationError())
        v11 = (NSError *)AVLocalizedError();
      else
        v11 = (NSError *)AVLocalizedErrorWithUnderlyingOSStatus();
      v9 = 0;
      *outError = v11;
    }
    else
    {
      v9 = 0;
    }
  }
  return v9;
}

- (NSArray)availableDepthDataTypes
{
  return (NSArray *)+[AVDepthData _allSupportedDepthDataPixelFormatTypes](AVDepthData, "_allSupportedDepthDataPixelFormatTypes");
}

- (NSDictionary)dictionaryRepresentationForAuxiliaryDataType:(NSString *)outAuxDataType
{
  uint64_t v5;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t v9;
  uint64_t v10;
  void *v11;
  __CVBuffer *v12;
  void *BaseAddress;
  NSDictionary *v14;
  uint64_t v15;
  CGImageMetadata *v16;
  CGImageMetadata *v17;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v5 = -[AVDepthData depthDataType](self, "depthDataType");
  Width = CVPixelBufferGetWidth(-[AVDepthData depthDataMap](self, "depthDataMap"));
  Height = CVPixelBufferGetHeight(-[AVDepthData depthDataMap](self, "depthDataMap"));
  BytesPerRow = CVPixelBufferGetBytesPerRow(-[AVDepthData depthDataMap](self, "depthDataMap"));
  if (!(_DWORD)v5
    || !Width
    || !Height
    || (v9 = BytesPerRow) == 0
    || (v10 = objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", BytesPerRow * Height)) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  v11 = (void *)v10;
  v12 = -[AVDepthData depthDataMap](self, "depthDataMap");
  if (CVPixelBufferLockBaseAddress(v12, 1uLL))
    return 0;
  BaseAddress = CVPixelBufferGetBaseAddress(v12);
  memcpy((void *)objc_msgSend(v11, "mutableBytes"), BaseAddress, v9 * Height);
  CVPixelBufferUnlockBaseAddress(v12, 1uLL);
  v14 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  -[NSDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CBC6C0]);
  v19[0] = *MEMORY[0x1E0CBD030];
  v20[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v19[1] = *MEMORY[0x1E0CBD128];
  v20[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", Width);
  v19[2] = *MEMORY[0x1E0CBCEA8];
  v20[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", Height);
  v19[3] = *MEMORY[0x1E0CBC888];
  v20[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v9);
  v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  -[NSDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CBC6C8]);
  v16 = -[AVDepthData copyAuxiliaryMetadata](self, "copyAuxiliaryMetadata");
  if (v16)
  {
    v17 = v16;
    -[NSDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CBC6D0]);
    CFRelease(v17);
  }
  if (outAuxDataType)
    *outAuxDataType = (NSString *)-[AVDepthData auxiliaryImageType](self, "auxiliaryImageType");
  return v14;
}

- (OSType)depthDataType
{
  __CVBuffer *pixelBuffer;

  pixelBuffer = self->_internal->pixelBuffer;
  if (pixelBuffer)
    LODWORD(pixelBuffer) = CVPixelBufferGetPixelFormatType(pixelBuffer);
  return pixelBuffer;
}

- (CVPixelBufferRef)depthDataMap
{
  return self->_internal->pixelBuffer;
}

- (AVDepthDataQuality)depthDataQuality
{
  return self->_internal->quality;
}

- (BOOL)isDepthDataFiltered
{
  return self->_internal->filtered;
}

- (AVDepthDataAccuracy)depthDataAccuracy
{
  return self->_internal->accuracy;
}

- (AVCameraCalibrationData)cameraCalibrationData
{
  return self->_internal->calibrationData;
}

- (signed)depthDataVersionMajor
{
  return HIWORD(self->_internal->version);
}

- (signed)depthDataVersionMinor
{
  return self->_internal->version;
}

- (float)depthBlurEffectSimulatedAperture
{
  return self->_internal->depthBlurEffectSimulatedAperture;
}

- (id)depthBlurEffectRenderingParameters
{
  return self->_internal->depthBlurEffectRenderingParameters;
}

- (BOOL)portraitScoreIsHigh
{
  return self->_internal->portraitScoreIsHigh;
}

- (float)portraitScore
{
  return self->_internal->portraitScore;
}

- (float)portraitLightingEffectStrength
{
  return self->_internal->portraitLightingEffectStrength;
}

- (AVDepthData)initWithPixelBuffer:(__CVBuffer *)a3 auxiliaryMetadata:(CGImageMetadata *)a4
{
  AVDepthData *v5;
  AVDepthData *v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  id v15;
  int v16;

  v5 = -[AVDepthData initWithPixelBuffer:depthMetadataDictionary:](self, "initWithPixelBuffer:depthMetadataDictionary:", a3, 0);
  v6 = v5;
  if (a4 && v5)
  {
    v7 = *MEMORY[0x1E0D05210];
    v5->_internal->version = objc_msgSend(AVAuxiliaryMetadataStringTagWithPrefixedKey(a4, *MEMORY[0x1E0D05210], *MEMORY[0x1E0D05290]), "intValue");
    v6->_internal->quality = objc_msgSend(AVAuxiliaryMetadataStringTagWithPrefixedKey(a4, v7, *MEMORY[0x1E0D05270]), "isEqualToString:", CFSTR("low")) ^ 1;
    v6->_internal->filtered = objc_msgSend(AVAuxiliaryMetadataStringTagWithPrefixedKey(a4, v7, *MEMORY[0x1E0D05228]), "BOOLValue");
    v6->_internal->accuracy = objc_msgSend(AVAuxiliaryMetadataStringTagWithPrefixedKey(a4, v7, *MEMORY[0x1E0D05218]), "isEqualToString:", CFSTR("absolute"));
    v6->_internal->calibrationData = -[AVCameraCalibrationData initWithAuxiliaryMetadata:]([AVCameraCalibrationData alloc], "initWithAuxiliaryMetadata:", a4);
    v8 = *MEMORY[0x1E0D051F0];
    objc_msgSend(AVAuxiliaryMetadataStringTagWithPrefixedKey(a4, *MEMORY[0x1E0D051F0], *MEMORY[0x1E0D05200]), "floatValue");
    v6->_internal->depthBlurEffectSimulatedAperture = v9;
    v10 = AVAuxiliaryMetadataStringTagWithPrefixedKey(a4, v8, *MEMORY[0x1E0D051F8]);
    if (v10)
      v6->_internal->depthBlurEffectRenderingParameters = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v10, 0);
    v11 = AVAuxiliaryMetadataStringTagWithPrefixedKey(a4, v7, *MEMORY[0x1E0D052A0]);
    v12 = v11;
    if (v11)
      v6->_internal->portraitScoreIsHigh = objc_msgSend(v11, "BOOLValue");
    v13 = AVAuxiliaryMetadataStringTagWithPrefixedKey(a4, v7, *MEMORY[0x1E0D05298]);
    LODWORD(v14) = 2143289344;
    if (v12 && v13)
      objc_msgSend(v13, "floatValue", v14);
    v6->_internal->portraitScore = *(float *)&v14;
    v15 = AVAuxiliaryMetadataStringTagWithPrefixedKey(a4, *MEMORY[0x1E0D05280], *MEMORY[0x1E0D05288]);
    if (v15)
      objc_msgSend(v15, "floatValue");
    else
      v16 = 2143289344;
    LODWORD(v6->_internal->portraitLightingEffectStrength) = v16;
  }
  return v6;
}

- (AVDepthData)initWithPixelBuffer:(__CVBuffer *)a3 depthMetadataDictionary:(id)a4
{
  AVDepthData *v6;
  AVDepthDataInternal *internal;
  __CVBuffer *v8;
  float v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  float v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)AVDepthData;
  v6 = -[AVDepthData init](&v18, sel_init);
  if (v6)
  {
    internal = objc_alloc_init(AVDepthDataInternal);
    v6->_internal = internal;
    if (internal)
    {
      if (a3)
      {
        v8 = (__CVBuffer *)CFRetain(a3);
        internal = v6->_internal;
      }
      else
      {
        v8 = 0;
      }
      internal->pixelBuffer = v8;
      if (a4)
      {
        v6->_internal->version = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D052F8]), "intValue");
        v6->_internal->quality = (int)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D052F0]), "intValue");
        v6->_internal->filtered = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D052B8]), "BOOLValue");
        v6->_internal->accuracy = (int)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D052A8]), "intValue");
        v6->_internal->calibrationData = -[AVCameraCalibrationData initWithDepthMetadataDictionary:]([AVCameraCalibrationData alloc], "initWithDepthMetadataDictionary:", a4);
        objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D051E0]), "floatValue");
        v6->_internal->depthBlurEffectSimulatedAperture = v9;
        v10 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D051D8]);
        if (v10)
          v6->_internal->depthBlurEffectRenderingParameters = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v10, 0);
        v11 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D05308]);
        v12 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D05300]);
        LODWORD(v13) = 2143289344;
        if (v11)
        {
          v14 = (void *)v12;
          if (v12)
          {
            v6->_internal->portraitScoreIsHigh = objc_msgSend(v11, "BOOLValue", v13);
            objc_msgSend(v14, "floatValue");
          }
        }
        v6->_internal->portraitScore = *(float *)&v13;
        v15 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D05448]);
        if (v15)
        {
          objc_msgSend(v15, "floatValue");
          v6->_internal->portraitLightingEffectStrength = v16;
        }
        else
        {
          v6->_internal->portraitLightingEffectStrength = NAN;
        }
      }
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (CGImageMetadata)copyAuxiliaryMetadata
{
  CGImageMetadata *v3;
  CGImageMetadata *v4;
  const __CFString *v5;
  const __CFString *v6;
  CGImageMetadata *Mutable;
  const __CFString *v8;
  __CFString *v9;
  double v10;
  AVDepthDataInternal *internal;
  double v12;
  const __CFString *v13;
  const __CFString *v14;
  double v15;
  NSString *v16;
  const __CFString *v17;
  const __CFString *v18;
  double v19;

  v3 = -[AVCameraCalibrationData copyAuxiliaryMetadata](self->_internal->calibrationData, "copyAuxiliaryMetadata");
  if (v3)
  {
    v4 = v3;
    v5 = (const __CFString *)*MEMORY[0x1E0D05208];
    v6 = (const __CFString *)*MEMORY[0x1E0D05210];
  }
  else
  {
    Mutable = CGImageMetadataCreateMutable();
    v4 = Mutable;
    if (!Mutable)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return v4;
    }
    v5 = (const __CFString *)*MEMORY[0x1E0D05208];
    v6 = (const __CFString *)*MEMORY[0x1E0D05210];
    if (!CGImageMetadataRegisterNamespaceForPrefix(Mutable, (CFStringRef)*MEMORY[0x1E0D05208], (CFStringRef)*MEMORY[0x1E0D05210], 0))goto LABEL_37;
  }
  if (self->_internal->quality)
    v8 = CFSTR("high");
  else
    v8 = CFSTR("low");
  if (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E0D05270], v8)
    || !AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E0D05228], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_internal->filtered)))
  {
    goto LABEL_37;
  }
  v9 = self->_internal->accuracy == 1 ? CFSTR("absolute") : CFSTR("relative");
  if (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E0D05218], v9))
    goto LABEL_37;
  internal = self->_internal;
  if (internal->version)
  {
    if (AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E0D05290], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:")))
    {
      internal = self->_internal;
      goto LABEL_17;
    }
LABEL_37:
    fig_log_get_emitter();
    FigDebugAssert3();
    CFRelease(v4);
    return 0;
  }
LABEL_17:
  *(float *)&v10 = internal->portraitScore;
  if (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E0D052A0], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", internal->portraitScoreIsHigh, v10)))goto LABEL_37;
  *(float *)&v12 = self->_internal->portraitScore;
  if (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E0D05298], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12)))goto LABEL_37;
  if (self->_internal->depthBlurEffectRenderingParameters)
  {
    v13 = (const __CFString *)*MEMORY[0x1E0D051E8];
    v14 = (const __CFString *)*MEMORY[0x1E0D051F0];
    if (!CGImageMetadataRegisterNamespaceForPrefix(v4, (CFStringRef)*MEMORY[0x1E0D051E8], (CFStringRef)*MEMORY[0x1E0D051F0], 0))goto LABEL_37;
    *(float *)&v15 = self->_internal->depthBlurEffectSimulatedAperture;
    if (!AVAuxiliaryMetadataAddValue(v4, v13, v14, (CFStringRef)*MEMORY[0x1E0D05200], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15)))goto LABEL_37;
    v16 = -[NSData base64EncodedStringWithOptions:](self->_internal->depthBlurEffectRenderingParameters, "base64EncodedStringWithOptions:", 0);
    if (!AVAuxiliaryMetadataAddValue(v4, v13, v14, (CFStringRef)*MEMORY[0x1E0D051F8], v16))
      goto LABEL_37;
  }
  v17 = (const __CFString *)*MEMORY[0x1E0D05278];
  v18 = (const __CFString *)*MEMORY[0x1E0D05280];
  if (!CGImageMetadataRegisterNamespaceForPrefix(v4, (CFStringRef)*MEMORY[0x1E0D05278], (CFStringRef)*MEMORY[0x1E0D05280], 0))goto LABEL_37;
  *(float *)&v19 = self->_internal->portraitLightingEffectStrength;
  if (!AVAuxiliaryMetadataAddValue(v4, v17, v18, (CFStringRef)*MEMORY[0x1E0D05288], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19)))goto LABEL_37;
  return v4;
}

- (__CFString)auxiliaryImageType
{
  __CFString **v2;

  if (((-[AVDepthData depthDataType](self, "depthDataType") - 1717855600) & 0xFDFFFFFF) != 0)
    v2 = (__CFString **)MEMORY[0x1E0CBC708];
  else
    v2 = (__CFString **)MEMORY[0x1E0CBC700];
  return *v2;
}

+ (id)_allSupportedDepthDataPixelFormatTypes
{
  return &unk_1E424D7C8;
}

- (__CVBuffer)_copyPixelBufferRepresentationWithPixelFormatType:(unsigned int)a3
{
  size_t Width;
  size_t Height;
  const __CFDictionary *v7;
  OSType v8;
  AVDepthDataInternal *internal;
  __CVBuffer *pixelBuffer;
  __CVBuffer *v11;
  size_t v12;
  size_t BytesPerRow;
  size_t v14;
  size_t v15;
  size_t v16;
  char *BaseAddress;
  char *v18;
  char *v19;
  CVPixelBufferRef pixelBufferOut;

  pixelBufferOut = 0;
  Width = CVPixelBufferGetWidth(self->_internal->pixelBuffer);
  Height = CVPixelBufferGetHeight(self->_internal->pixelBuffer);
  v7 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", MEMORY[0x1E0C9AA70], *MEMORY[0x1E0CA8FF0], 0);
  v8 = -[AVDepthData depthDataType](self, "depthDataType");
  if (!CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Width, Height, a3, v7, &pixelBufferOut))
  {
    internal = self->_internal;
    pixelBuffer = internal->pixelBuffer;
    v11 = pixelBufferOut;
    if (v8 == a3)
    {
      if (CVPixelBufferLockBaseAddress(internal->pixelBuffer, 1uLL))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      else
      {
        if (!CVPixelBufferLockBaseAddress(v11, 0))
        {
          v12 = CVPixelBufferGetHeight(pixelBuffer);
          BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
          v14 = CVPixelBufferGetBytesPerRow(v11);
          v15 = v14;
          if (BytesPerRow >= v14)
            v16 = v14;
          else
            v16 = BytesPerRow;
          BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
          v18 = (char *)CVPixelBufferGetBaseAddress(v11);
          if (v12)
          {
            v19 = v18;
            do
            {
              memcpy(v19, BaseAddress, v16);
              BaseAddress += BytesPerRow;
              v19 += v15;
              --v12;
            }
            while (v12);
          }
          CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
          CVPixelBufferUnlockBaseAddress(v11, 0);
          return pixelBufferOut;
        }
        fig_log_get_emitter();
        FigDebugAssert3();
        CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
      }
    }
    else if (!FigDepthConvertBuffer())
    {
      return pixelBufferOut;
    }
  }
  CVPixelBufferRelease(pixelBufferOut);
  return 0;
}

@end
