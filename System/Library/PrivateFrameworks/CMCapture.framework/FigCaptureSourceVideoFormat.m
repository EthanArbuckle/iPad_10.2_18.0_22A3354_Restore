@implementation FigCaptureSourceVideoFormat

- (BOOL)hasSensorHDRCompanionIndex
{
  return !-[FigCaptureSourceVideoFormat isQuadraHighResStillImageSupported](self, "isQuadraHighResStillImageSupported")
      && -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SensorHDRCompanionIndex")) != 0;
}

- (BOOL)isCenterStageRectOfInterestSupported
{
  return objc_msgSend((id)objc_msgSend(-[FigCaptureSourceFormat formatDictionary](self->_cinematicFramingFormat, "formatDictionary"), "objectForKeyedSubscript:", CFSTR("CenterStageRectOfInterestSupported")), "BOOLValue");
}

- (BOOL)isManualFramingSupported
{
  return objc_msgSend((id)objc_msgSend(-[FigCaptureSourceFormat formatDictionary](self->_cinematicFramingFormat, "formatDictionary"), "objectForKeyedSubscript:", CFSTR("ManualFramingSupported")), "BOOLValue");
}

- (float)geometricDistortionCorrectedFieldOfView
{
  int v3;
  float result;
  unint64_t v5;
  float v6;
  __int128 v7;
  __int128 v8;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("StillImageGDCInDCProcessorOutputCropWidth")), "intValue");
  v7 = *MEMORY[0x1E0C9D628];
  v8 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  if (v3 || !FigCFDictionaryGetCGRectIfPresent() || *(double *)&v8 == 0.0)
  {
    -[FigCaptureSourceVideoFormat fieldOfView](self, "fieldOfView", v7);
  }
  else
  {
    v5 = -[FigCaptureSourceVideoFormat _nativeDimensionsWithoutCrop]((uint64_t)self);
    v6 = 1.0;
    if (*((double *)&v8 + 1) / (double)SHIDWORD(v5) <= 1.0)
      v6 = *((double *)&v8 + 1)
         / (double)(int)(-[FigCaptureSourceVideoFormat _nativeDimensionsWithoutCrop]((uint64_t)self) >> 32);
    return -[FigCaptureSourceVideoFormat _fieldOfViewWithCrop:]((uint64_t)self, v6);
  }
  return result;
}

- (float)_fieldOfViewWithCrop:(uint64_t)a1
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;

  if (!a1)
    return 0.0;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", *MEMORY[0x1E0D08820]), "floatValue");
  v5 = v4;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", CFSTR("AdditionalHorizontalFOVCropMultiplier")), "floatValue");
  if (v6 == 0.0)
    v6 = 1.0;
  v7 = v6 * a2;
  if (v7 != 1.0)
  {
    v8 = v5 * 3.14159265 / 360.0;
    v9 = tanf(v8);
    return (float)(atanf(v7 * v9) * 360.0) / 3.14159265;
  }
  return v5;
}

- (float)fieldOfView
{
  int v3;
  float v4;

  v3 = -[FigCaptureSourceVideoFormat _maxUseableSensorDimensions]((id *)&self->super.super.isa);
  if (v3)
    v4 = (float)v3 / (float)(int)-[FigCaptureSourceVideoFormat sensorDimensions](self, "sensorDimensions");
  else
    v4 = 1.0;
  return -[FigCaptureSourceVideoFormat _fieldOfViewWithCrop:]((uint64_t)self, v4);
}

- (unint64_t)_nativeDimensionsWithoutCrop
{
  id *v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  unint64_t v5;

  if (a1)
  {
    v1 = (id *)a1;
    v2 = *MEMORY[0x1E0D07E80];
    if (objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", *MEMORY[0x1E0D07E80])
      && (v3 = *MEMORY[0x1E0D07E78], objc_msgSend(v1[1], "objectForKeyedSubscript:", *MEMORY[0x1E0D07E78])))
    {
      v4 = objc_msgSend((id)objc_msgSend(v1[1], "objectForKeyedSubscript:", v2), "intValue");
      a1 = objc_msgSend((id)objc_msgSend(v1[1], "objectForKeyedSubscript:", v3), "intValue");
    }
    else
    {
      v5 = objc_msgSend(v1, "sensorDimensions");
      v4 = v5;
      a1 = HIDWORD(v5);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4 | (unint64_t)(a1 << 32);
}

- (BOOL)reactionEffectsSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("ReactionEffectsSupported")), "BOOLValue");
}

- (BOOL)reactionEffectsSupportedForContinuityCapture
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("ReactionEffectsSupportedForContinuityCapture")), "BOOLValue");
}

- (BOOL)isStudioLightingSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("StudioLightingSupported")), "BOOLValue");
}

- (BOOL)isStudioLightingSupportedForContinuityCapture
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("StudioLightingSupportedForContinuityCapture")), "BOOLValue");
}

- (BOOL)isBackgroundBlurSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("BackgroundBlurSupported")), "BOOLValue");
}

- (BOOL)isCinematicFramingSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("CinematicFramingSupported")), "BOOLValue");
}

- (BOOL)isCinematicFramingSupportedForContinuityCapture
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("CinematicFramingSupportedForContinuityCapture")), "BOOLValue");
}

- (BOOL)isBackgroundBlurSupportedForContinuityCapture
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("BackgroundBlurSupportedForContinuityCapture")), "BOOLValue");
}

- (BOOL)isWideColorSupported
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = -[FigCaptureSourceVideoFormat supportedColorSpaces](self, "supportedColorSpaces", 0);
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "intValue") - 5 > 0xFFFFFFFB)
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return v3;
}

- (NSArray)supportedColorSpaces
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[FigCaptureSourceFormat format](self, "format");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = v4;
  if (v3 == 2016686640)
  {
    v6 = &unk_1E49F9378;
    goto LABEL_11;
  }
  if (v3 == 2016686642)
  {
    objc_msgSend(v4, "addObject:", &unk_1E49F9390);
    if (-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("10BitVideoHDRSupportedForProRes")))
    {
      objc_msgSend(v5, "addObject:", &unk_1E49F9378);
    }
    if (-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("AppleLogSupportedForProRes")))
    {
      v6 = &unk_1E49F93A8;
LABEL_11:
      objc_msgSend(v5, "addObject:", v6);
    }
  }
  else
  {
    objc_msgSend(v4, "addObject:", &unk_1E49F9390);
    if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("WideColorSupported")), "BOOLValue")&& v3 == 875704422)
    {
      v6 = &unk_1E49F93C0;
      goto LABEL_11;
    }
  }
  return (NSArray *)(id)objc_msgSend(v5, "copy");
}

- (unsigned)mediaType
{
  id v3;

  v3 = -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("MediaType"));
  if (v3)
    return BWOSTypeForString(v3);
  if (-[FigCaptureSourceFormat format](self, "format") == 1785950320)
    return 1885564004;
  return 1986618469;
}

- (id)highResStillImageDimensions
{
  id *v3;
  unsigned int var0;
  uint64_t v5;
  $2825F4736939C4A6D3AD43837233062D v6;
  unint64_t v7;
  unint64_t v8;
  float v9;
  float v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = -[FigCaptureSourceVideoFormat _highResStillImageDimensions]((id *)&self->super.super.isa);
  if (!objc_msgSend(v3, "count"))
  {
    if (-[FigCaptureSourceVideoFormat isHighResStillImageSupported](self, "isHighResStillImageSupported"))
    {
      if (-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("HighResStillImageWidth"))&& -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("HighResStillImageHeight")))
      {
        var0 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("HighResStillImageWidth")), "intValue");
        v5 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("HighResStillImageHeight")), "intValue");
      }
      else
      {
        v8 = -[FigCaptureSourceVideoFormat _maxUseableSensorDimensions]((id *)&self->super.super.isa);
        var0 = v8;
        v5 = HIDWORD(v8);
        v9 = (float)-[FigCaptureSourceVideoFormat horizontalSensorBinningFactor](self, "horizontalSensorBinningFactor");
        v10 = v9
            / (float)-[FigCaptureSourceVideoFormat verticalSensorBinningFactor](self, "verticalSensorBinningFactor");
        if (v10 != 1.0)
        {
          if (v10 < 1.0)
            var0 = (int)(float)(v10 * (float)(int)var0);
          else
            v5 = (int)(float)(v10 * (float)(int)v5);
        }
      }
      if (-[FigCaptureSourceVideoFormat isDeferredPhotoProcessingSupported](self, "isDeferredPhotoProcessingSupported"))
        v7 = var0 | (unint64_t)(v5 << 32);
      else
        v7 = 0;
    }
    else
    {
      v6 = -[FigCaptureSourceFormat dimensions](self, "dimensions");
      v7 = 0;
      v5 = HIDWORD(*(unint64_t *)&v6);
      var0 = v6.var0;
    }
    v11 = var0 | (unint64_t)(v5 << 32);
    if (FigCaptureVideoDimensionsAreValid(v11))
    {
      v13[0] = -[FigCaptureSourceFormatDimensions initWithDimensions:deferredPhotoProxyDimensions:isPrivate:flavor:maxUpscalingDimensions:]([FigCaptureSourceFormatDimensions alloc], "initWithDimensions:deferredPhotoProxyDimensions:isPrivate:flavor:maxUpscalingDimensions:", v11, v7, 0, 0, 0);
      return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    }
  }
  return v3;
}

- (int)verticalSensorBinningFactor
{
  int v3;

  if (-[FigCaptureSourceVideoFormat isBinned](self, "isBinned"))
    v3 = 2;
  else
    v3 = 1;
  if (-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoBinningFactorVertical")))
  {
    return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoBinningFactorVertical")), "intValue");
  }
  else
  {
    return v3;
  }
}

- (int)horizontalSensorBinningFactor
{
  int v3;

  if (-[FigCaptureSourceVideoFormat isBinned](self, "isBinned"))
    v3 = 2;
  else
    v3 = 1;
  if (-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoBinningFactorHorizontal")))
  {
    return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoBinningFactorHorizontal")), "intValue");
  }
  else
  {
    return v3;
  }
}

- (BOOL)isBinned
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoIsBinned")), "BOOLValue");
}

- (void)_buildFESCompanionFormatsForType:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  FigCaptureSourceCompanionFormat *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", a2, 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (!v5)
          v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
        v9 = -[FigCaptureSourceCompanionFormat initWithCompanionFormatDictionary:]([FigCaptureSourceCompanionFormat alloc], "initWithCompanionFormatDictionary:", v8);
        objc_msgSend(v5, "addObject:", v9);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_41);
  return v5;
}

- (FigCaptureSourceVideoFormat)_resolveProperties
{
  FigCaptureSourceVideoFormat *v1;
  id v2;
  uint64_t v3;
  _QWORD *v4;
  NSArray *v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  FigCaptureSourceDepthDataFormat *v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  FigCaptureSourceDepthDataFormat *v15;
  FigCaptureSourceDepthDataFormat *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  FigCaptureSourceVideoFormat *v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    result->_frontEndScalerCompanionFormats = (NSArray *)-[FigCaptureSourceVideoFormat _buildFESCompanionFormatsForType:]((uint64_t)result, (uint64_t)CFSTR("FESCompanionFormats"));
    v2 = -[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SupportedDepthDataFormats"));
    v3 = objc_msgSend(v2, "count");
    v4 = (_QWORD *)MEMORY[0x1E0CA9040];
    if (v3)
    {
      v5 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v2, "count"));
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v25 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v25)
      {
        v24 = *(_QWORD *)v31;
        obj = v2;
        v23 = *MEMORY[0x1E0CA9040];
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v31 != v24)
              objc_enumerationMutation(obj);
            v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", objc_msgSend(v7, "objectForKeyedSubscript:", v23));
            objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AdditionalPixelFormats")));
            v28 = 0u;
            v29 = 0u;
            v26 = 0u;
            v27 = 0u;
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v9)
            {
              v10 = v9;
              v11 = 0;
              v12 = *(_QWORD *)v27;
              do
              {
                for (j = 0; j != v10; ++j)
                {
                  if (*(_QWORD *)v27 != v12)
                    objc_enumerationMutation(v8);
                  v14 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "intValue");
                  if (v11)
                  {
                    v15 = -[FigCaptureSourceDepthDataFormat copyWithNewPixelFormat:](v11, "copyWithNewPixelFormat:", v14);
                  }
                  else
                  {
                    v15 = -[FigCaptureSourceFormat initWithFigCaptureStreamFormatDictionary:]([FigCaptureSourceDepthDataFormat alloc], "initWithFigCaptureStreamFormatDictionary:", v7);
                    v11 = v15;
                  }
                  v16 = v15;
                  -[NSArray addObject:](v5, "addObject:", v15);

                }
                v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
              }
              while (v10);
            }
          }
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        }
        while (v25);
      }
      v1->_supportedDepthDataFormats = v5;
      v4 = (_QWORD *)MEMORY[0x1E0CA9040];
    }
    if (-[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("NonSIFRCompanionFormat")))
    {
      v1->_nonSIFRCompanionFormat = -[FigCaptureSourceCompanionFormat initWithCompanionFormatDictionary:]([FigCaptureSourceCompanionFormat alloc], "initWithCompanionFormatDictionary:", -[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("NonSIFRCompanionFormat")));
    }
    if (-[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("FullBinSIFRCompanionFormat")))
    {
      v1->_fullBinSIFRCompanionFormat = -[FigCaptureSourceCompanionFormat initWithCompanionFormatDictionary:]([FigCaptureSourceCompanionFormat alloc], "initWithCompanionFormatDictionary:", -[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("FullBinSIFRCompanionFormat")));
    }
    if (-[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("MidFrameSynchronizationOptimizedCompanionFormat")))
    {
      v1->_midFrameSynchronizationOptimizedCompanionFormat = -[FigCaptureSourceCompanionFormat initWithCompanionFormatDictionary:]([FigCaptureSourceCompanionFormat alloc], "initWithCompanionFormatDictionary:", -[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("MidFrameSynchronizationOptimizedCompanionFormat")));
    }
    if (-[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("ActionCameraCompanionFormat")))
    {
      v1->_actionCameraCompanionFormat = -[FigCaptureSourceCompanionFormat initWithCompanionFormatDictionary:]([FigCaptureSourceCompanionFormat alloc], "initWithCompanionFormatDictionary:", -[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("ActionCameraCompanionFormat")));
    }
    if (-[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("DepthCompanionFormat")))
    {
      v1->_depthCompanionFormat = -[FigCaptureSourceCompanionFormat initWithCompanionFormatDictionary:]([FigCaptureSourceCompanionFormat alloc], "initWithCompanionFormatDictionary:", -[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("DepthCompanionFormat")));
    }
    if (-[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("UltraHighResCompanionFormat")))
    {
      v1->_ultraHighResCompanionFormat = -[FigCaptureSourceCompanionFormat initWithCompanionFormatDictionary:]([FigCaptureSourceCompanionFormat alloc], "initWithCompanionFormatDictionary:", -[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("UltraHighResCompanionFormat")));
    }
    if (-[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("FSDNetCompanionFormat")))
    {
      v1->_fsdNetCompanionFormat = -[FigCaptureSourceCompanionFormat initWithCompanionFormatDictionary:]([FigCaptureSourceCompanionFormat alloc], "initWithCompanionFormatDictionary:", -[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("FSDNetCompanionFormat")));
    }
    if (-[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("StereoVideoCompanionFormat")))
    {
      v1->_stereoVideoCompanionFormat = -[FigCaptureSourceCompanionFormat initWithCompanionFormatDictionary:]([FigCaptureSourceCompanionFormat alloc], "initWithCompanionFormatDictionary:", -[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("StereoVideoCompanionFormat")));
    }
    v17 = (id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("GeometricDistortionCorrectionSourceFormat")), "mutableCopy");
    if (v17)
    {
      v18 = v17;
      objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FigCaptureSourceFormat format](v1, "format")), *v4);
      v1->_geometricDistortionCorrectionFormat = -[FigCaptureSourceVideoFormat initWithFigCaptureStreamFormatDictionary:]([FigCaptureSourceVideoFormat alloc], "initWithFigCaptureStreamFormatDictionary:", v18);
    }
    v19 = (id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("CinematicFramingSourceFormat")), "mutableCopy");
    if (v19)
    {
      v20 = v19;
      objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FigCaptureSourceFormat format](v1, "format")), *v4);
      v1->_cinematicFramingFormat = -[FigCaptureSourceVideoFormat initWithFigCaptureStreamFormatDictionary:]([FigCaptureSourceVideoFormat alloc], "initWithFigCaptureStreamFormatDictionary:", v20);
    }
    result = (FigCaptureSourceVideoFormat *)(id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("FastSwitchingMainCaptureStreamFormat")), "mutableCopy");
    if (result)
    {
      v21 = result;
      -[FigCaptureSourceVideoFormat setObject:forKeyedSubscript:](result, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FigCaptureSourceFormat format](v1, "format")), *v4);
      result = -[FigCaptureSourceVideoFormat initWithFigCaptureStreamFormatDictionary:]([FigCaptureSourceVideoFormat alloc], "initWithFigCaptureStreamFormatDictionary:", v21);
      v1->_fastSwitchingMainCaptureStreamFormat = result;
    }
  }
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)sourceCropAspectRatio
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  id *v6;
  unint64_t v7;

  v3 = -[FigCaptureSourceVideoFormat _outputDimensions]((unint64_t)self);
  v4 = -[FigCaptureSourceVideoFormat postGDCCropDimensions](self, "postGDCCropDimensions");
  if (FigCaptureVideoDimensionsAreValid(v4))
  {
    v5 = HIDWORD(v4);
  }
  else
  {
    v4 = objc_msgSend(-[NSArray lastObject](self->_frontEndScalerCompanionFormats, "lastObject"), "geometricDistortionCorrectedNativeDimensions");
    if (FigCaptureVideoDimensionsAreValid(v4))
    {
      v5 = HIDWORD(v4);
    }
    else
    {
      v6 = -[FigCaptureSourceVideoFormat _sourceDimensions]((id *)&self->super.super.isa);
      v7 = (unint64_t)v6 >> 32;
      LODWORD(v4) = -[FigCaptureSourceVideoFormat horizontalSensorBinningFactor](self, "horizontalSensorBinningFactor")
                  * (_DWORD)v6;
      LODWORD(v5) = -[FigCaptureSourceVideoFormat verticalSensorBinningFactor](self, "verticalSensorBinningFactor") * v7;
    }
  }
  if (vabds_f32((float)(int)v4 / (float)(int)v5, (float)(int)v3 / (float)SHIDWORD(v3)) <= 0.01)
    return ($2825F4736939C4A6D3AD43837233062D)0;
  else
    return ($2825F4736939C4A6D3AD43837233062D)v3;
}

- (unint64_t)_outputDimensions
{
  unint64_t v1;
  unsigned int v2;

  if (result)
  {
    v1 = result;
    v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]), "intValue");
    return v2 | (unint64_t)(objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]), "intValue") << 32);
  }
  return result;
}

- (id)_sourceDimensions
{
  id *v1;
  unint64_t v2;
  int v3;
  unint64_t v4;
  int v5;
  int v6;
  unsigned int v8;

  if (result)
  {
    v1 = result;
    if (FigCaptureVideoDimensionsAreValid(objc_msgSend(result, "sensorCropDimensions")))
      v2 = objc_msgSend(v1, "sensorCropDimensions");
    else
      v2 = objc_msgSend(v1, "sensorDimensions");
    v3 = v2;
    v4 = HIDWORD(v2);
    v5 = objc_msgSend((id)objc_msgSend(v1[1], "objectForKeyedSubscript:", CFSTR("HighQualitySensorWidth")), "intValue");
    v6 = objc_msgSend((id)objc_msgSend(v1[1], "objectForKeyedSubscript:", CFSTR("HighQualitySensorHeight")), "intValue");
    if (v5 > v3 || v5 == 0)
      v8 = v3;
    else
      v8 = v5;
    if (v6 > (int)v4 || v6 == 0)
      v6 = v4;
    return (id *)(v8 | ((unint64_t)v6 << 32));
  }
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)sensorCropDimensions
{
  unsigned int v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SensorCropWidth")), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SensorCropHeight")), "intValue") << 32));
}

- ($2825F4736939C4A6D3AD43837233062D)postGDCCropDimensions
{
  unsigned int v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("PostGDCCropWidth")), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("PostGDCCropHeight")), "intValue") << 32));
}

- (unint64_t)_maxUseableSensorDimensions
{
  id *v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  uint64_t v6;

  if (!a1)
    return 0;
  v2 = -[FigCaptureSourceVideoFormat _sourceDimensions](a1);
  v3 = objc_msgSend(a1, "sourceCropAspectRatio");
  v4 = v3;
  if ((int)v3 < 1)
    return (unint64_t)v2;
  v5 = HIDWORD(v3);
  if (SHIDWORD(v3) < 1)
    return (unint64_t)v2;
  if ((int)FigCapturePlatformIdentifier() <= 5)
    v6 = 0x200000002;
  else
    v6 = 0x200000004;
  return FigCaptureFitAspectInsideDimensions((uint64_t)v2, v6, (float)v4 / (float)(int)v5);
}

- (float)clientMaxContinuousZoomFactorForDepthDataDelivery
{
  float result;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("MaxContinuousZoomFactorForDepthDataDelivery")), "floatValue");
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)sensorDimensions
{
  unsigned int v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0D07ED0]), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EC8]), "intValue") << 32));
}

- (BOOL)isHighPhotoQualitySupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("HighPhotoQualitySupported")), "BOOLValue");
}

- (id)_highResStillImageDimensions
{
  id *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  id obj;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (void *)objc_msgSend(v1[1], "objectForKeyedSubscript:", CFSTR("HighResStillImageDimensions"));
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    obj = v2;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          objc_msgSend(v9, "addObject:", objc_autorelease(-[FigCaptureSourceFormatDimensions initWithDimensions:deferredPhotoProxyDimensions:isPrivate:flavor:maxUpscalingDimensions:]([FigCaptureSourceFormatDimensions alloc], "initWithDimensions:deferredPhotoProxyDimensions:isPrivate:flavor:maxUpscalingDimensions:", objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Width")), "intValue") | (unint64_t)(objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Height")), "intValue") << 32), objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DeferredPhotoProxyWidth")), "intValue") | (unint64_t)(objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DeferredPhotoProxyHeight")), "intValue") << 32), objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Private")), "BOOLValue"), objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Flavor")), "intValue"), objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MaxUpscalingWidth")),
                                "intValue") | (unint64_t)(objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MaxUpscalingHeight")), "intValue") << 32))));
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }
    return (id *)(id)objc_msgSend(v9, "copy");
  }
  return result;
}

- (BOOL)isHighResStillImageSupported
{
  return !-[FigCaptureSourceVideoFormat capturesStillsFromVideoStream](self, "capturesStillsFromVideoStream")
      || -[FigCaptureSourceVideoFormat isQuadraHighResStillImageSupported](self, "isQuadraHighResStillImageSupported");
}

- (BOOL)capturesStillsFromVideoStream
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("CaptureStillsFromVideoStream")), "BOOLValue");
}

- (BOOL)isDeferredPhotoProcessingSupported
{
  char v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("DeferredPhotoProcessingSupported")), "BOOLValue");
  -[FigCaptureSourceVideoFormat isPhotoFormat](self, "isPhotoFormat");
  return v3;
}

- (BOOL)isPhotoFormat
{
  unint64_t v3;
  BOOL v4;
  BOOL v5;

  v3 = -[FigCaptureSourceVideoFormat _outputDimensions]((unint64_t)self);
  if (v3 == 0x5E8000007E0 || v3 == 0x60000000800 || (_DWORD)v3 == 2592 && (HIDWORD(v3) & 0xFFFFFFF7) == 0x790)
    return 1;
  if (v3 == 0x80400000AB0)
    return 1;
  v4 = HIDWORD(v3) == 2320 || HIDWORD(v3) == 2316;
  v5 = v4;
  if ((_DWORD)v3 == 3088 && v5
    || v3 == 0x99000000CC0
    || v3 == 0xAC800000E60
    || v3 == 0xBD000000FC0
    || v3 == 0x3C000000500
    || v3 == 0x2D0000003C0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("AVCaptureSessionPresets")), "containsObject:", CFSTR("AVCaptureSessionPresetPhoto"));
  }
}

- (id)_avfcAttributes
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id *v10;
  void *v11;
  void *v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (_avfcAttributes_onceToken != -1)
    dispatch_once(&_avfcAttributes_onceToken, &__block_literal_global_524);
  v2 = (id)objc_msgSend(a1[1], "mutableCopy");
  objc_msgSend(v2, "removeObjectsForKeys:", _avfcAttributes_sInternalKeys);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a1, "format"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CA9040]);
  v4 = (void *)objc_msgSend(a1, "supportedDepthDataFormats");
  if (objc_msgSend(v4, "count"))
  {
    v14 = v2;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v4);
          v10 = *(id **)(*((_QWORD *)&v15 + 1) + 8 * i);
          v11 = (void *)objc_msgSend(v10[1], "objectForKeyedSubscript:", CFSTR("AdditionalPixelFormats"));
          if ((objc_msgSend(v11, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "format"))) & 1) == 0)
          {
            v12 = (void *)objc_msgSend(v10[1], "mutableCopy");
            objc_msgSend(v12, "removeObjectsForKeys:", _avfcAttributes_sInternalKeys);
            objc_msgSend(v5, "addObject:", v12);

          }
        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }
    v2 = v14;
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v5, CFSTR("SupportedDepthDataFormats"));
  }
  return v2;
}

- (NSArray)supportedDepthDataFormats
{
  return self->_supportedDepthDataFormats;
}

- (BOOL)isQuadraHighResStillImageSupported
{
  return 0;
}

- (id)copyWithNewPixelFormat:(unsigned int)a3
{
  if (self->super._formatDictionary)
    return -[FigCaptureSourceVideoFormat initWithFigCaptureStreamFormatDictionary:pixelFormatOverride:]([FigCaptureSourceVideoFormat alloc], "initWithFigCaptureStreamFormatDictionary:pixelFormatOverride:", self->super._formatDictionary, *(_QWORD *)&a3);
  else
    return 0;
}

- (FigCaptureSourceVideoFormat)initWithXPCEncoding:(id)a3
{
  FigXPCMessageCopyCFDictionary();
  fig_log_get_emitter();
  FigDebugAssert3();

  return 0;
}

- (FigCaptureSourceVideoFormat)initWithFigCaptureStreamFormatDictionary:(id)a3 pixelFormatOverride:(unsigned int)a4
{
  FigCaptureSourceVideoFormat *v4;
  FigCaptureSourceVideoFormat *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FigCaptureSourceVideoFormat;
  v4 = -[FigCaptureSourceFormat initWithFigCaptureStreamFormatDictionary:pixelFormatOverride:](&v7, sel_initWithFigCaptureStreamFormatDictionary_pixelFormatOverride_, a3, *(_QWORD *)&a4);
  v5 = v4;
  if (v4)
    -[FigCaptureSourceVideoFormat _resolveProperties](v4);
  return v5;
}

- (FigCaptureSourceVideoFormat)initWithFigCaptureStreamFormatDictionary:(id)a3
{
  return -[FigCaptureSourceVideoFormat initWithFigCaptureStreamFormatDictionary:pixelFormatOverride:](self, "initWithFigCaptureStreamFormatDictionary:pixelFormatOverride:", a3, 0);
}

- (BOOL)isStreamingDisparitySupported
{
  return -[FigCaptureSourceVideoFormat _supportsDepthDataFormatForDisparity:streaming:]((uint64_t)self, 1, 1);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSourceVideoFormat;
  -[FigCaptureSourceFormat dealloc](&v3, sel_dealloc);
}

- (BOOL)isStillImageDisparitySupported
{
  return -[FigCaptureSourceVideoFormat _supportsDepthDataFormatForDisparity:streaming:]((uint64_t)self, 1, 0);
}

- (NSArray)secondaryNativeResolutionZoomFactors
{
  return (NSArray *)-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SecondaryNativeResolutionZoomFactors"));
}

- (BOOL)isStreamingDepthSupported
{
  return -[FigCaptureSourceVideoFormat _supportsDepthDataFormatForDisparity:streaming:]((uint64_t)self, 0, 1);
}

- (BOOL)isStillImageDepthSupported
{
  return -[FigCaptureSourceVideoFormat _supportsDepthDataFormatForDisparity:streaming:]((uint64_t)self, 0, 0);
}

- (float)defaultMinFrameRateForSessionPreset:(id)a3
{
  id v5;
  float v6;
  float v7;
  _BOOL4 v8;
  float v9;
  float v10;
  float result;

  if (!a3
    || (v5 = -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoDefaultMinFrameRatesForPresets"))) == 0|| (objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", a3), "floatValue"), v6 == 0.0))
  {
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoDefaultMinFrameRate")), "floatValue");
  }
  v7 = v6;
  if (v6 != 0.0)
    return v7;
  v8 = -[FigCaptureSourceVideoFormat isPhotoFormat](self, "isPhotoFormat");
  -[FigCaptureSourceVideoFormat defaultMaxFrameRateForSessionPreset:](self, "defaultMaxFrameRateForSessionPreset:", a3);
  v7 = v9;
  if (!v8)
    return v7;
  v7 = v9 * 0.5;
  -[FigCaptureSourceFormat minSupportedFrameRate](self, "minSupportedFrameRate");
  if (v7 >= v10)
    return v7;
  -[FigCaptureSourceFormat minSupportedFrameRate](self, "minSupportedFrameRate");
  return result;
}

- (float)defaultMaxFrameRateForSessionPreset:(id)a3
{
  id v5;
  float result;

  if (!a3
    || (v5 = -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoDefaultMaxFrameRatesForPresets"))) == 0|| (objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", a3), "floatValue"), result == 0.0))
  {
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoDefaultMaxFrameRate")), "floatValue");
  }
  if (result == 0.0)
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoMaxFrameRate")), "floatValue");
  return result;
}

- (float)minSimulatedAperture
{
  float result;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("MinSimulatedAperture")), "floatValue");
  return result;
}

- (BOOL)isVideoStabilizationStrengthSupported:(int)a3
{
  char v5;
  BOOL v6;
  char v7;

  v5 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoStabilizationSupported")), "BOOLValue");
  if ((int)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoStabilizationMaxStrength")), "intValue") >= a3)v6 = v5;
  else
    v6 = 0;
  v7 = v5 ^ 1;
  if (a3)
    v7 = 0;
  if (a3 == 1)
    v7 = v5;
  if ((a3 - 2) >= 3)
    return v7;
  else
    return v6;
}

- (float)defaultSimulatedAperture
{
  float result;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("DefaultSimulatedAperture")), "floatValue");
  return result;
}

- (float)maxSimulatedAperture
{
  float result;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("MaxSimulatedAperture")), "floatValue");
  return result;
}

- (BOOL)isMultiCamSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("MultiCamSupported")), "BOOLValue");
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxExposureDuration
{
  int v5;
  float v6;
  CMTime v8;
  CMTime time1;
  CMTime v10;
  CMTime v11;

  v5 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0D08828]), "intValue");
  memset(&v11, 0, sizeof(v11));
  CMTimeMake(&v11, v5, 1000000);
  memset(&v10, 0, sizeof(v10));
  -[FigCaptureSourceFormat minSupportedFrameRate](self, "minSupportedFrameRate");
  CMTimeMake(&v10, 1, (int)v6);
  time1 = v11;
  v8 = v10;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMinimum((CMTime *)retstr, &time1, &v8);
}

- (float)maxContinuousZoomFactorForCinematicVideo
{
  float result;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("MaxContinuousZoomFactorForCinematicVideo")), "floatValue");
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minExposureDuration
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, (int)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0D08830]), "intValue"), 1000000);
}

- (BOOL)isDeepFusionSupported
{
  char v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("DeepFusionSupported")), "BOOLValue");
  -[FigCaptureSourceVideoFormat isPhotoFormat](self, "isPhotoFormat");
  return v3;
}

- (NSArray)AVCaptureSessionPresets
{
  return (NSArray *)-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("AVCaptureSessionPresets"));
}

- (BOOL)isPortraitAutoSuggestSupported
{
  char v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("PortraitAutoSuggestSupported")), "BOOLValue");
  -[FigCaptureSourceVideoFormat isPhotoFormat](self, "isPhotoFormat");
  return v3;
}

- (BOOL)isVideoSTFMetadataEnabled
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoSTFMetadataEnabled")), "BOOLValue");
}

- (int)configureForGreenGhostMitigationVersion
{
  NSDictionary *formatDictionary;

  formatDictionary = -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("FastSwitchingConfiguration"));
  if (!formatDictionary)
    formatDictionary = self->super._formatDictionary;
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](formatDictionary, "objectForKeyedSubscript:", CFSTR("ConfigureForGreenGhostMitigationVersion")), "intValue");
}

- (BOOL)configureForStillImageStabilizationSupport
{
  NSDictionary *formatDictionary;

  formatDictionary = -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("FastSwitchingConfiguration"));
  if (!formatDictionary)
    formatDictionary = self->super._formatDictionary;
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](formatDictionary, "objectForKeyedSubscript:", CFSTR("ConfigureForSISSupport")), "BOOLValue");
}

- (BOOL)configureForSoftISPSupport
{
  NSDictionary *formatDictionary;

  formatDictionary = -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("FastSwitchingConfiguration"));
  if (!formatDictionary)
    formatDictionary = self->super._formatDictionary;
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](formatDictionary, "objectForKeyedSubscript:", CFSTR("ConfigureForSoftISPSupport")), "BOOLValue");
}

- (BOOL)isHDROriginalImageDeliverySupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("HDROriginalImageDeliverySupported")), "BOOLValue");
}

- (BOOL)isConstantColorSupported
{
  return -[FigCaptureSourceVideoFormat constantColorVersion](self, "constantColorVersion") > 0;
}

- (int)constantColorVersion
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("ColorConstancyVersion")), "intValue");
}

- (BOOL)isSupplementalTimeOfFlightCameraSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SupplementalTimeOfFlightCameraSupported")), "BOOLValue");
}

- (BOOL)isIrisVideoStabilizationSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("IrisVideoStabilizationSupported")), "BOOLValue");
}

- (float)cinematicStabilizationExtendedLookAheadDuration
{
  float result;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("CinematicVideoStabilizationExtendedLookAheadDuration")), "floatValue");
  return result;
}

- (BOOL)distortionCompensationSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("DistortionCompensationSupported")), "BOOLValue");
}

- (FigCaptureSourceVideoFormat)geometricDistortionCorrectionFormat
{
  return self->_geometricDistortionCorrectionFormat;
}

- (FigCaptureSourceVideoFormat)cinematicFramingFormat
{
  return self->_cinematicFramingFormat;
}

- (BOOL)isValidDerivedSourceFormatForUnderlyingFormat:(id)a3
{
  return a3
      && -[NSString isEqualToString:](-[FigCaptureSourceFormat uniqueID](self, "uniqueID"), "isEqualToString:", objc_msgSend(a3, "uniqueID"));
}

- (BOOL)isCinematicFramingProvidedBySource
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("CinematicFramingProvidedBySource")), "BOOLValue");
}

- (BOOL)isVideoGreenGhostMitigationSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoGreenGhostMitigationSupported")), "BOOLValue");
}

- (BOOL)isZeroShutterLagSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("ZeroShutterLagSupported")), "BOOLValue");
}

- (BOOL)zeroShutterLagRequiresUserInitiatedCaptureRequestTime
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("ZeroShutterLagRequiresUserInitiatedCaptureRequestTime")), "BOOLValue");
}

- (float)maxISO
{
  float v3;
  float v4;
  float v5;
  float v6;

  -[FigCaptureSourceVideoFormat minISO](self, "minISO");
  v4 = v3;
  if (v3 > 0.0)
  {
    -[FigCaptureSourceVideoFormat aeMaxGain](self, "aeMaxGain");
    if (v5 == 0.0)
    {
      objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0D07E70]), "floatValue");
      v5 = v6 * 0.0039062;
    }
    return v4 * fmaxf(v5, 1.0);
  }
  return v4;
}

- (float)minISO
{
  float v2;
  float v3;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0D07E88]), "floatValue");
  v3 = v2;
  if (v2 == 0.0 && BWCaptureIsRunningInIOSAppOnMacEnvironment())
    return 50.0;
  return v3;
}

- (float)aeMaxGain
{
  float result;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("AEMaxGain")), "floatValue");
  return result;
}

- (float)zoomFactorUpscaleThreshold
{
  unint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[FigCaptureSourceVideoFormat _visibleSensorDimensionsIncludingCinematic:]((id *)&self->super.super.isa, 0);
  v4 = v3;
  v5 = HIDWORD(v3);
  v6 = -[FigCaptureSourceVideoFormat _outputDimensions]((unint64_t)self);
  return fmaxf(fminf((float)v4 / (float)(int)v6, (float)(int)v5 / (float)SHIDWORD(v6)), 1.0);
}

- (float)maxZoomFactor
{
  unint64_t v3;
  float result;
  BOOL v5;
  float v6;
  unint64_t v7;

  if (-[FigCaptureSourceVideoFormat stabilizationTypeOverrideForCinematic](self, "stabilizationTypeOverrideForCinematic") == 3|| -[FigCaptureSourceVideoFormat stabilizationTypeOverrideForStandard](self, "stabilizationTypeOverrideForStandard") == 3)
  {
    v3 = -[FigCaptureSourceVideoFormat _outputDimensions]((unint64_t)self);
    result = 32.0;
    if ((_DWORD)v3 != 960 && HIDWORD(v3) != 540)
    {
      result = 30.0;
      if ((_DWORD)v3 != 1024 && HIDWORD(v3) != 768)
      {
        result = 24.0;
        if ((_DWORD)v3 != 1280 && HIDWORD(v3) != 720)
        {
          result = 16.0;
          v5 = HIDWORD(v3) == 2160 || (_DWORD)v3 == 3840;
          v6 = 9.0;
          if (!v5)
            v6 = 16.0;
          if (HIDWORD(v3) == 1080)
            v6 = 16.0;
          if ((_DWORD)v3 != 1920)
            return v6;
        }
      }
    }
  }
  else
  {
    v7 = -[FigCaptureSourceVideoFormat _visibleSensorDimensionsIncludingCinematic:]((id *)&self->super.super.isa, 1);
    return fminf((float)(int)v7 * 0.0625, (float)SHIDWORD(v7) * 0.0625);
  }
  return result;
}

- (unint64_t)_visibleSensorDimensionsIncludingCinematic:(id *)a1
{
  unint64_t v4;
  uint64_t v5;
  float v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;

  if (!a1)
    return 0;
  v4 = -[FigCaptureSourceVideoFormat _maxUseableSensorDimensions](a1);
  if (a2 && objc_msgSend(a1, "isStabilizationModeSupported:", 2))
  {
    objc_msgSend(a1, "stabilizationOverscanPercentageOverrideForCinematic");
    v7 = v6 / 100.0;
    v8 = v7 + 1.0;
    v9 = v7 == 0.0;
    v10 = 1.2;
  }
  else
  {
    if (!objc_msgSend(a1, "isStabilizationModeSupported:", 1))
      return v4;
    objc_msgSend(a1, "stabilizationOverscanPercentageOverrideForStandard");
    v12 = v11 / 100.0;
    v8 = v12 + 1.0;
    v9 = v12 == 0.0;
    v10 = 1.1;
  }
  if (!v9)
    v10 = v8;
  v13 = v10;
  v14 = (float)(1.0 / v13);
  LODWORD(v5) = llround((double)SHIDWORD(v4) * v14 * 0.5);
  return (2 * llround((double)(int)v4 * v14 * 0.5)) | (unint64_t)(v5 << 33);
}

- (BOOL)isStabilizationModeSupported:(int)a3
{
  id v4;
  NSDictionary *formatDictionary;
  const __CFString *v6;
  NSDictionary *v7;
  const __CFString *v8;

  switch(a3)
  {
    case 0:
      LOBYTE(v4) = 1;
      return (char)v4;
    case 1:
      formatDictionary = self->super._formatDictionary;
      v6 = CFSTR("VideoStabilizationSupported");
      goto LABEL_11;
    case 2:
      LODWORD(v4) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoStabilizationSupported")), "BOOLValue");
      if (!(_DWORD)v4)
        return (char)v4;
      formatDictionary = self->super._formatDictionary;
      v6 = CFSTR("CinematicVideoStabilizationSupported");
LABEL_11:
      LOBYTE(v4) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](formatDictionary, "objectForKeyedSubscript:", v6), "BOOLValue");
      return (char)v4;
    case 3:
      LODWORD(v4) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoStabilizationSupported")), "BOOLValue");
      if (!(_DWORD)v4)
        return (char)v4;
      LODWORD(v4) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("CinematicVideoStabilizationSupported")), "BOOLValue");
      if (!(_DWORD)v4)
        return (char)v4;
      v7 = self->super._formatDictionary;
      v8 = CFSTR("CinematicVideoStabilizationExtendedLookAheadDuration");
      goto LABEL_15;
    case 4:
      formatDictionary = self->super._formatDictionary;
      v6 = CFSTR("PreviewStabilizationSupported");
      goto LABEL_11;
    case 5:
      LODWORD(v4) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoStabilizationSupported")), "BOOLValue");
      if (!(_DWORD)v4)
        return (char)v4;
      v4 = -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("CinematicVideoStabilizationExtendedLookAheadDuration"));
      if (!v4)
        return (char)v4;
      v7 = self->super._formatDictionary;
      v8 = CFSTR("CinematicVideoStabilizationExtendedEnhancedSupported");
LABEL_15:
      LOBYTE(v4) = -[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v8) != 0;
      return (char)v4;
    default:
      LOBYTE(v4) = 0;
      return (char)v4;
  }
}

- (int)stabilizationTypeOverrideForCinematic
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoStabilizationTypeOverrideForCinematic")), "intValue");
}

- (int)stabilizationTypeOverrideForStandard
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoStabilizationTypeOverrideForStandard")), "intValue");
}

- (float)stabilizationOverscanPercentageOverrideForCinematic
{
  float result;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoStabilizationOverscanPercentageOverrideForCinematic")), "floatValue");
  return result;
}

- (float)stabilizationOverscanPercentageOverrideForStandard
{
  float result;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoStabilizationOverscanPercentageOverrideForStandard")), "floatValue");
  return result;
}

- (BOOL)isVideoSTFSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoSTFSupported")), "BOOLValue");
}

- (BOOL)isIrisSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("IrisSupported")), "BOOLValue");
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  -[FigCaptureSourceVideoFormat _avfcAttributes]((id *)&self->super.super.isa);
  FigXPCMessageSetCFDictionary();
  return v3;
}

- (BOOL)usesPacked10BitFirmwareStillImageOutputPixelFormat
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("UsesPacked10BitFirmwareStillImageOutputPixelFormat")), "BOOLValue");
}

- (BOOL)isStillImageStabilizationSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SISSupported")), "BOOLValue");
}

- (uint64_t)_supportsDepthDataFormatForDisparity:(int)a3 streaming:
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = *(void **)(result + 136);
    result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (result)
    {
      v6 = result;
      v7 = *(_QWORD *)v12;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
          if (!a3 || (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "isStillImageOnlyDepthData") & 1) == 0)
          {
            v10 = objc_msgSend(v9, "format");
            if (a2)
            {
              if (FigDepthFormatIsDisparity(v10))
                return 1;
            }
            else if (FigDepthFormatIsDepth(v10))
            {
              return 1;
            }
          }
          ++v8;
        }
        while (v6 != v8);
        result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        v6 = result;
        if (result)
          continue;
        break;
      }
    }
  }
  return result;
}

- (float)minPortraitLightingEffectStrength
{
  id v2;
  float result;

  v2 = -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("MinPortraitLightingEffectStrength"));
  if (!v2)
    return NAN;
  objc_msgSend(v2, "floatValue");
  return result;
}

- (BOOL)isHDRSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("HDRSupported")), "BOOLValue");
}

- (id)fullBinSIFRCompanionFormat
{
  return self->_fullBinSIFRCompanionFormat;
}

- (BOOL)isZeroShutterLagWithDepthSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("ZeroShutterLagWithDepthSupported")), "BOOLValue");
}

- (BOOL)isNonDestructiveCropSupported
{
  return 1;
}

- (BOOL)isMomentCaptureMovieRecordingSupported
{
  return 1;
}

- (float)maxPortraitLightingEffectStrength
{
  id v2;
  float result;

  v2 = -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("MaxPortraitLightingEffectStrength"));
  if (!v2)
    return NAN;
  objc_msgSend(v2, "floatValue");
  return result;
}

- (BOOL)intelligentDistortionCorrectionSupported
{
  char v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("IntelligentDistortionCorrectionSupported")), "BOOLValue");
  -[FigCaptureSourceVideoFormat isPhotoFormat](self, "isPhotoFormat");
  return v3;
}

- (BOOL)isRedEyeReductionSupported
{
  return -[FigCaptureSourceVideoFormat redEyeReductionVersion](self, "redEyeReductionVersion") > 0;
}

- (int)redEyeReductionVersion
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("RedEyeReductionVersion")), "intValue");
}

- (BOOL)isVideoGreenGhostMitigationUsesLightSourceMaskAndKeypointDescriptorData
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoGreenGhostMitigationUsesLightSourceMaskAndKeypointDescriptorData")), "BOOLValue");
}

- (BOOL)configureForNonDisruptiveFullBinSIFRSwitching
{
  NSDictionary *formatDictionary;

  formatDictionary = -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("FastSwitchingConfiguration"));
  if (!formatDictionary)
    formatDictionary = self->super._formatDictionary;
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](formatDictionary, "objectForKeyedSubscript:", CFSTR("ConfigureForNonDisruptiveFullBinSIFRSwitching")), "BOOLValue");
}

- (int)maxIntegrationTimeOverride
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("MaxIntegrationTimeOverride")), "intValue");
}

- (float)variableFrameRateVideoCaptureFromFWAEMaxGain
{
  float result;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VariableFrameRateVideoCaptureFromFWAEMaxGain")), "floatValue");
  return result;
}

- (int)sifrBinningFactorOverrideForNondisruptiveSwitching
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SIFRBinningFactorOverrideForNondisruptiveSwitching")), "intValue");
}

- (float)lowLightVideoAEMaxGain
{
  float result;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("LowLightVideoAEMaxGain")), "floatValue");
  return result;
}

- (BOOL)ispChromaNoiseReductionEnabled
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("ISPChromaNoiseReduction")), "BOOLValue");
}

- (BOOL)isVideoHDRFusionSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoHDRFusionSupported")), "BOOLValue");
}

- (BOOL)isContentAwareEnhancementSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("ContentAwareEnhancementSupported")), "BOOLValue");
}

- (BOOL)isContentAwareAWBSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("ContentAwareAWBSupported")), "BOOLValue");
}

- (int)fesBinningFactorHorizontal
{
  int result;

  result = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("FESBinningFactorHorizontal")), "intValue");
  if (result <= 1)
    return 1;
  return result;
}

- (BOOL)gdcInStillImageSinkPipelineSupported
{
  return -[FigCaptureSourceVideoFormat stillImageGDCSourceMode](self, "stillImageGDCSourceMode") != 0;
}

- (int)stillImageGDCSourceMode
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("StillImageGDCSourceMode")), "intValue");
}

- (unsigned)supportedRawPixelFormat
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SupportedRawPixelFormat")), "intValue");
}

- (float)spatialOverCapturePercentage
{
  _BOOL4 v2;
  float result;

  v2 = -[FigCaptureSourceVideoFormat isSpatialOverCaptureSupported](self, "isSpatialOverCaptureSupported");
  result = 40.0;
  if (!v2)
    return 0.0;
  return result;
}

- (BOOL)isSpatialOverCaptureSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SpatialOverCaptureSupported")), "BOOLValue");
}

- (BOOL)isSIFRSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EA8]), "BOOLValue");
}

- (CGPoint)sensorCenterOffset
{
  double v3;
  double v4;
  double v5;
  CGPoint result;

  v3 = (double)(int)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SensorCenterOffsetX")), "intValue");
  v4 = (double)(int)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SensorCenterOffsetY")), "intValue");
  v5 = v3;
  result.y = v4;
  result.x = v5;
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)fesInputCropDimensions
{
  unsigned int v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("FESInputCropWidth")), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("FESInputCropHeight")), "intValue") << 32));
}

- (int)formatIndex
{
  id v2;

  v2 = -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("Index"));
  if (v2)
    return objc_msgSend(v2, "intValue");
  else
    return -1;
}

- ($2825F4736939C4A6D3AD43837233062D)cropDimensionsForFES
{
  unsigned int v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("CropWidthForFES")), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("CropHeightForFES")), "intValue") << 32));
}

- (id)ultraHighResCompanionFormat
{
  return self->_ultraHighResCompanionFormat;
}

- (id)frontEndScalerCompanionFormats
{
  return self->_frontEndScalerCompanionFormats;
}

- (id)nonSIFRCompanionFormat
{
  return self->_nonSIFRCompanionFormat;
}

- (int)greenGhostMitigationVersion
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("GreenGhostMitigationVersion")), "intValue");
}

- (BOOL)isVariableFrameRateVideoCaptureSupported
{
  char v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VariableFrameRateVideoCaptureSupported")), "BOOLValue");
  return v3 & ~FigCapturePixelFormatIs422(-[FigCaptureSourceFormat format](self, "format"));
}

- (CGSize)stabilizationOverscanFromSensorForFESCropDimensions:(id)a3 preferSIFRFormat:(BOOL)a4 geometricDistortionCorrection:(BOOL)a5 useFESCompanionIndex:(BOOL)a6
{
  int var0;
  int var1;
  $2825F4736939C4A6D3AD43837233062D v10;
  unint64_t v11;
  int v12;
  unint64_t v13;
  uint64_t v14;
  double *v15;
  $2825F4736939C4A6D3AD43837233062D v16;
  double v17;
  _BOOL4 v18;
  _BOOL4 v19;
  BOOL v20;
  int v21;
  int v22;
  double v23;
  CGSize result;

  var0 = a3.var0;
  var1 = a3.var1;
  v10 = -[FigCaptureSourceVideoFormat sensorCropDimensions](self, "sensorCropDimensions");
  v11 = HIDWORD(*(unint64_t *)&v10);
  v12 = v10.var0;
  v13 = -[FigCaptureSourceVideoFormat _highQualitySensorDimensions]((unint64_t)self);
  if (!a4)
  {
    if (-[FigCaptureSourceVideoFormat nonSIFRCompanionFormat](self, "nonSIFRCompanionFormat"))
    {
      v14 = objc_msgSend(-[FigCaptureSourceVideoFormat nonSIFRCompanionFormat](self, "nonSIFRCompanionFormat"), "sensorCropDimensions");
      if ((_DWORD)v14 != 0 && HIDWORD(v14) != 0)
      {
        v12 = v14;
        LODWORD(v11) = HIDWORD(v14);
      }
    }
  }
  v15 = (double *)MEMORY[0x1E0C9D820];
  if (!v12 || !(_DWORD)v11)
  {
    v16 = -[FigCaptureSourceVideoFormat sensorDimensions](self, "sensorDimensions");
    v12 = v16.var0;
    v11 = HIDWORD(*(unint64_t *)&v16);
  }
  v17 = *v15;
  v18 = var0 > 0;
  v19 = var1 > 0;
  v20 = !v18 || !v19;
  if (v18 && v19)
    v21 = var0;
  else
    v21 = v12;
  if (v20)
    v22 = v11;
  else
    v22 = var1;
  if ((int)v13 >= 1 && v21 > (int)v13)
    v17 = (double)v21 / (double)(int)v13 + -1.0;
  v23 = v15[1];
  if (SHIDWORD(v13) >= 1 && v22 > SHIDWORD(v13))
    v23 = (double)v22 / (double)SHIDWORD(v13) + -1.0;
  result.height = v23;
  result.width = v17;
  return result;
}

- (unint64_t)_highQualitySensorDimensions
{
  unint64_t v1;
  unsigned int v2;

  if (result)
  {
    v1 = result;
    v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "objectForKeyedSubscript:", CFSTR("HighQualitySensorWidth")), "intValue");
    return v2 | (unint64_t)(objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "objectForKeyedSubscript:", CFSTR("HighQualitySensorHeight")), "intValue") << 32);
  }
  return result;
}

- (float)maxContinuousZoomFactorForDepthDataDelivery
{
  float result;

  -[FigCaptureSourceVideoFormat clientMaxContinuousZoomFactorForDepthDataDelivery](self, "clientMaxContinuousZoomFactorForDepthDataDelivery");
  if (result > 0.0)
    return result + 0.1999;
  return result;
}

- (unsigned)supportedDemosaicedRawPixelFormat
{
  unsigned int v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SupportedDemosaicedRawPixelFormat")), "intValue");
  -[FigCaptureSourceVideoFormat isPhotoFormat](self, "isPhotoFormat");
  return v3;
}

- (unsigned)internalDemosaicedRawPixelFormat
{
  unsigned int v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("InternalDemosaicedRawPixelFormat")), "intValue");
  -[FigCaptureSourceVideoFormat isPhotoFormat](self, "isPhotoFormat");
  return v3;
}

- (BOOL)isResponsiveShutterSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("ResponsiveShutterSupported")), "BOOLValue");
}

- (BOOL)isCaptureTimePhotoCurationSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("CaptureTimePhotoCurationSupported")), "BOOLValue");
}

- (BOOL)isGainMapSupported
{
  char v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("GainMapSupported")), "BOOLValue");
  -[FigCaptureSourceVideoFormat isPhotoFormat](self, "isPhotoFormat");
  return v3;
}

- (BOOL)isDeepZoomSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("DeepZoomSupported")), "BOOLValue");
}

+ (void)initialize
{
  objc_opt_class();
}

- (int)previewImageQueueSyncStrategy
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("PreviewImageQueueSyncStrategy")), "intValue");
}

- (float)defaultPortraitLightingEffectStrength
{
  id v2;
  float result;

  v2 = -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("DefaultPortraitLightingEffectStrength"));
  if (!v2)
    return NAN;
  objc_msgSend(v2, "floatValue");
  return result;
}

- (BOOL)isStudioAndContourPreviewRenderingSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("StudioAndContourPreviewRenderingSupported")), "BOOLValue");
}

- (BOOL)isStagePreviewRenderingSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("StagePreviewRenderingSupported")), "BOOLValue");
}

- (BOOL)isSemanticStyleRenderingSupported
{
  int v3;

  if (-[FigCaptureSourceVideoFormat isPhotoFormat](self, "isPhotoFormat")
    || (v3 = -[FigCaptureSourceVideoFormat isLearnedNRSupported](self, "isLearnedNRSupported")) != 0)
  {
    v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SemanticStyleRenderingSupported")), "BOOLValue");
    if (v3)
      LOBYTE(v3) = !-[FigCaptureSourceVideoFormat isSmartStyleRenderingSupported](self, "isSmartStyleRenderingSupported");
  }
  return v3;
}

- (BOOL)isLearnedNRSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("LearnedNRSupported")), "BOOLValue");
}

- ($2825F4736939C4A6D3AD43837233062D)previewDimensions
{
  $2825F4736939C4A6D3AD43837233062D *p_previewDimensions;
  int v4;
  int v5;
  $2825F4736939C4A6D3AD43837233062D v6;

  p_previewDimensions = ($2825F4736939C4A6D3AD43837233062D *)&self->_previewDimensions;
  if (!self->_previewDimensions.width)
  {
    v4 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("PreferredPreviewWidth")), "intValue");
    v5 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("PreferredPreviewHeight")), "intValue");
    p_previewDimensions->var0 = v4;
    p_previewDimensions->var1 = v5;
    if (!v4)
    {
      v6 = -[FigCaptureSourceFormat dimensions](self, "dimensions");
      if (-[FigCaptureSourceVideoFormat cinematicFramingOutputDimensions](self, "cinematicFramingOutputDimensions")&& (unint64_t)-[FigCaptureSourceVideoFormat cinematicFramingOutputDimensions](self, "cinematicFramingOutputDimensions") >> 32)
      {
        v6 = -[FigCaptureSourceVideoFormat cinematicFramingOutputDimensions](self, "cinematicFramingOutputDimensions");
      }
      *p_previewDimensions = ($2825F4736939C4A6D3AD43837233062D)FigCaptureOptimalVideoPreviewDimensionsForSourceDimensions(*(_QWORD *)&v6, 0);
    }
  }
  return *p_previewDimensions;
}

- (id)depthCompanionFormat
{
  return self->_depthCompanionFormat;
}

- (BOOL)isDigitalFlashSupported
{
  char v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("DigitalFlashSupported")), "BOOLValue");
  -[FigCaptureSourceVideoFormat isPhotoFormat](self, "isPhotoFormat");
  return v3;
}

- (int)autoFocusSystem
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("AutoFocusSystem")), "intValue");
}

- (id)digitalFlashDetectedObjectTypes
{
  return -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("DigitalFlashDetectedObjectTypes"));
}

- (BOOL)isStereoFusionSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("StereoFusionSupported")), "BOOLValue");
}

- (int)temporalNoiseReductionMode
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("TemporalNoiseReductionMode")), "intValue");
}

- (BOOL)isWideDigitalFlashAvailableShallowDepthOfFieldEffectsEnabled
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("WideDigitalFlashAvailableShallowDepthOfFieldEffectsEnabled")), "BOOLValue");
}

- (BOOL)isWideAsStatsMasterEnabled
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("WideAsStatsMasterEnabled")), "intValue") != 0;
}

- (BOOL)isStillImageISPMultiBandNoiseReductionSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("StillImageISPMultiBandNoiseReductionSupported")), "BOOLValue");
}

- (BOOL)isSecondaryScalerUnavailable
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SecondaryScalerUnavailable")), "BOOLValue");
}

- (BOOL)fullBinSIFROnSecondaryCameraAllowed
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("FullBinSIFROnSecondaryCameraAllowed")), "BOOLValue");
}

- (BOOL)configureForDepthDataDelivery
{
  NSDictionary *formatDictionary;

  formatDictionary = -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("FastSwitchingConfiguration"));
  if (!formatDictionary)
    formatDictionary = self->super._formatDictionary;
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](formatDictionary, "objectForKeyedSubscript:", CFSTR("ConfigureForDepthDataDelivery")), "BOOLValue");
}

- ($2825F4736939C4A6D3AD43837233062D)nativeDimensions
{
  unsigned int var0;
  NSDictionary *formatDictionary;
  const __CFString *v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  $2825F4736939C4A6D3AD43837233062D v9;

  if (-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("CropWidthForFES"))&& -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("CropHeightForFES")))
  {
    var0 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("CropWidthForFES")), "intValue");
    formatDictionary = self->super._formatDictionary;
    v5 = CFSTR("CropHeightForFES");
  }
  else
  {
    v6 = *MEMORY[0x1E0D07E80];
    if (-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0D07E80])&& (v7 = (const __CFString *)*MEMORY[0x1E0D07E78], -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0D07E78])))
    {
      var0 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", v6), "intValue");
      formatDictionary = self->super._formatDictionary;
      v5 = v7;
    }
    else
    {
      if (!-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SensorCropWidth"))|| !-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SensorCropHeight")))
      {
        v9 = -[FigCaptureSourceVideoFormat sensorDimensions](self, "sensorDimensions");
        var0 = v9.var0;
        v8 = HIDWORD(*(unint64_t *)&v9);
        return ($2825F4736939C4A6D3AD43837233062D)(var0 | (unint64_t)(v8 << 32));
      }
      var0 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SensorCropWidth")), "intValue");
      formatDictionary = self->super._formatDictionary;
      v5 = CFSTR("SensorCropHeight");
    }
  }
  v8 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](formatDictionary, "objectForKeyedSubscript:", v5), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(var0 | (unint64_t)(v8 << 32));
}

- (BOOL)sushiRawSupported
{
  id v3;
  NSDictionary *formatDictionary;

  v3 = -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SushiRawSupported"));
  formatDictionary = self->super._formatDictionary;
  if (v3)
    return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](formatDictionary, "objectForKeyedSubscript:", CFSTR("SushiRawSupported")), "BOOLValue");
  else
    return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](formatDictionary, "objectForKeyedSubscript:", CFSTR("SupportedRawPixelFormat")), "intValue") != 0;
}

- (CGRect)maxVisibleSensorRect
{
  unint64_t v3;
  $2825F4736939C4A6D3AD43837233062D v4;
  unint64_t v5;
  double v6;
  double v7;
  int v8;
  double v9;
  double v10;
  CGRect result;

  v3 = -[FigCaptureSourceVideoFormat _maxUseableSensorDimensions]((id *)&self->super.super.isa);
  v4 = -[FigCaptureSourceVideoFormat sensorDimensions](self, "sensorDimensions");
  if (FigCaptureVideoDimensionsAreValid(-[FigCaptureSourceVideoFormat preGDCSensorCropDimensions](self, "preGDCSensorCropDimensions")))
    v3 = -[FigCaptureSourceVideoFormat preGDCSensorCropDimensions](self, "preGDCSensorCropDimensions");
  v5 = HIDWORD(v3);
  if (v4.var0 > (int)v3 || (v6 = 0.0, v4.var1 > SHIDWORD(v3)))
  {
    v7 = (double)((v4.var0 - (int)v3) / 2);
    v8 = v4.var1 - HIDWORD(v3);
    if (v4.var1 < SHIDWORD(v3))
      ++v8;
    v6 = (double)(v8 >> 1);
  }
  else
  {
    LODWORD(v5) = v4.var1;
    LODWORD(v3) = v4.var0;
    v7 = 0.0;
  }
  v9 = (double)(int)v3;
  v10 = (double)(int)v5;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v6;
  result.origin.x = v7;
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)preGDCSensorCropDimensions
{
  unsigned int v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("PreGDCSensorCropWidth")), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("PreGDCSensorCropHeight")), "intValue") << 32));
}

- (BOOL)isFocusPixelBlurScoreSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("FocusPixelBlurScoreSupported")), "BOOLValue");
}

- (BOOL)isSIFRStillImageCaptureWithDepthDataDisabled
{
  char v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SIFRStillImageCaptureWithDepthDataDisabled")), "BOOLValue");
  -[FigCaptureSourceVideoFormat isPhotoFormat](self, "isPhotoFormat");
  return v3;
}

- (BOOL)isStudioLightingProvidedBySource
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("StudioLightingProvidedBySource")), "BOOLValue");
}

- (BOOL)isBackgroundBlurProvidedBySource
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("BackgroundBlurProvidedBySource")), "BOOLValue");
}

- (BOOL)reactionEffectsProvidedBySource
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("ReactionEffectsProvidedBySource")), "BOOLValue");
}

- (BOOL)isLowLightVideoCaptureSupported
{
  char v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("LowLightVideoCaptureSupported")), "BOOLValue");
  return v3 & ~FigCapturePixelFormatIs422(-[FigCaptureSourceFormat format](self, "format"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCaptureSourceVideoFormat)initWithCoder:(id)a3
{
  return -[FigCaptureSourceVideoFormat initWithFigCaptureStreamFormatDictionary:](self, "initWithFigCaptureStreamFormatDictionary:", objc_msgSend(a3, "decodePropertyListForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "formatDictionary")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->super._formatDictionary, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "formatDictionary"));
}

- ($2825F4736939C4A6D3AD43837233062D)geometricDistortionCorrectedNativeDimensions
{
  unsigned int v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("GeometricDistortionCorrectedNativeWidth")), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("GeometricDistortionCorrectedNativeHeight")), "intValue") << 32));
}

- (BOOL)isPocketDetectionSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("PocketDetectionSupported")), "BOOLValue");
}

- (BOOL)temporalNoiseReductionBand0Disabled
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("TemporalNoiseReductionBand0Disabled")), "BOOLValue");
}

- (BOOL)temporalNoiseReductionRawEnabled
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("TemporalNoiseReductionRawEnabled")), "BOOLValue");
}

- (float)depthDataAEMaxGain
{
  float result;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("DepthDataAEMaxGain")), "floatValue");
  return result;
}

- (float)depthDataMaxIntegrationTimeOverride
{
  float result;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("DepthDataMaxIntegrationTimeOverride")), "floatValue");
  return result;
}

- (float)stereoVideoAEMaxGain
{
  float result;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("StereoVideoAEMaxGain")), "floatValue");
  return result;
}

- (BOOL)shouldPreferSIFRFormatWithHighlightRecoveryEnabled:(BOOL)a3
{
  _BOOL4 v5;

  v5 = -[FigCaptureSourceVideoFormat isSIFRSupported](self, "isSIFRSupported");
  if (v5 && !a3)
    LOBYTE(v5) = -[FigCaptureSourceVideoFormat nonSIFRCompanionFormat](self, "nonSIFRCompanionFormat") == 0;
  return v5;
}

- (id)midFrameSynchronizationOptimizedCompanionFormat
{
  return self->_midFrameSynchronizationOptimizedCompanionFormat;
}

- (id)actionCameraCompanionFormat
{
  return self->_actionCameraCompanionFormat;
}

- (id)fsdNetCompanionFormat
{
  return self->_fsdNetCompanionFormat;
}

- (id)stereoVideoCompanionFormat
{
  return self->_stereoVideoCompanionFormat;
}

- ($2825F4736939C4A6D3AD43837233062D)cinematicFramingOutputDimensions
{
  unsigned int v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("CinematicFramingOutputWidth")), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("CinematicFramingOutputHeight")), "intValue") << 32));
}

- (int)sensorHDRCompanionIndex
{
  if (-[FigCaptureSourceVideoFormat hasSensorHDRCompanionIndex](self, "hasSensorHDRCompanionIndex"))
    return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SensorHDRCompanionIndex")), "intValue");
  else
    return -1;
}

- (BOOL)prefersSensorHDREnabled
{
  if (-[FigCaptureSourceVideoFormat isQuadraHighResStillImageSupported](self, "isQuadraHighResStillImageSupported"))
    return 0;
  else
    return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("PrefersSensorHDR")), "BOOLValue");
}

- (float)stabilizationOverscanPercentageOverrideForCinematicExtendedEnhanced
{
  float result;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VideoStabilizationOverscanPercentageOverrideForCinematicExtendedEnhanced")), "floatValue");
  return result;
}

- (BOOL)configureForSpatialOverCaptureSupport
{
  NSDictionary *formatDictionary;

  formatDictionary = -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("FastSwitchingConfiguration"));
  if (!formatDictionary)
    formatDictionary = self->super._formatDictionary;
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](formatDictionary, "objectForKeyedSubscript:", CFSTR("ConfigureForSpatialOverCaptureSupport")), "BOOLValue");
}

- (BOOL)configureForDigitalFlashSupport
{
  NSDictionary *formatDictionary;

  formatDictionary = -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("FastSwitchingConfiguration"));
  if (!formatDictionary)
    formatDictionary = self->super._formatDictionary;
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](formatDictionary, "objectForKeyedSubscript:", CFSTR("ConfigureForDigitalFlashSupport")), "BOOLValue");
}

- (BOOL)configureForStereoPhotoCaptureSupport
{
  -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("FastSwitchingConfiguration"));
  return 0;
}

- (BOOL)configureForSupplementalTimeOfFlightCameraSupport
{
  NSDictionary *formatDictionary;

  formatDictionary = -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("FastSwitchingConfiguration"));
  if (!formatDictionary)
    formatDictionary = self->super._formatDictionary;
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](formatDictionary, "objectForKeyedSubscript:", CFSTR("ConfigureForSupplementalTimeOfFlightCameraSupport")), "BOOLValue");
}

- (BOOL)isFastSwitchingConfigurationRequired
{
  return -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("FastSwitchingConfiguration")) != 0;
}

- (id)fastSwitchingMainCaptureStreamFormat
{
  if (-[FigCaptureSourceVideoFormat isFastSwitchingConfigurationRequired](self, "isFastSwitchingConfigurationRequired"))
    return self->_fastSwitchingMainCaptureStreamFormat;
  else
    return 0;
}

- (BOOL)isGNRHDRSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("GNRHDRSupported")), "BOOLValue");
}

- (BOOL)isISPMultiBandNoiseReductionSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("ISPMultiBandNoiseReductionSupported")), "BOOLValue");
}

- (BOOL)isUltraHighResolutionZeroShutterLagSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("UltraHighResolutionZeroShutterLagSupported")), "BOOLValue");
}

- (BOOL)swfrSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SWFRSupported")), "BOOLValue");
}

- (BOOL)semanticRenderingSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SemanticRenderingSupported")), "BOOLValue");
}

- (int)semanticDevelopmentVersion
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SemanticDevelopmentVersion")), "intValue");
}

- (BOOL)isSmartStyleRenderingSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SmartStyleRenderingSupported")), "BOOLValue");
}

- (BOOL)isBackgroundReplacementSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("BackgroundReplacementSupported")), "BOOLValue");
}

- (BOOL)isBackgroundReplacementSupportedForContinuityCapture
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("BackgroundReplacementSupportedForContinuityCapture")), "BOOLValue");
}

- (BOOL)isBackgroundReplacementProvidedBySource
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("BackgroundReplacementProvidedBySource")), "BOOLValue");
}

- (BOOL)isDigitalFlashRawNightModeSupported
{
  char v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("DigitalFlashRawNightModeSupported")), "BOOLValue");
  -[FigCaptureSourceVideoFormat isPhotoFormat](self, "isPhotoFormat");
  return v3;
}

- (BOOL)isSphereAssistedAutoFocusEnabled
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SphereAssistedAutoFocusEnabled")), "BOOLValue");
}

- ($2825F4736939C4A6D3AD43837233062D)stillImageGDCInDCProcessorOutputCropDimensions
{
  unsigned int v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("StillImageGDCInDCProcessorOutputCropWidth")), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("StillImageGDCInDCProcessorOutputCropHeight")), "intValue") << 32));
}

- (BOOL)isStillImageISPChromaNoiseReductionEnabled
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("StillImageISPChromaNoiseReduction")), "BOOLValue");
}

- (id)rawLensShadingCorrection
{
  return -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("RawLensShadingCorrection"));
}

- (BOOL)sushiRawBlackBorderingEnabled
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SushiRawBlackBorderingEnabled")), "BOOLValue");
}

- (BOOL)isMultiIlluminantWhiteBalanceSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("MultiIlluminantWhiteBalanceSupported")), "BOOLValue");
}

- (float)hardwareCost
{
  float result;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("HardwareCost")), "floatValue");
  return result;
}

- (int)baseSensorPowerConsumption
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("BaseSensorPowerConsumption")), "intValue");
}

- (int)variableSensorPowerConsumption
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("VariableSensorPowerConsumption")), "intValue");
}

- (int)ispPowerConsumption
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("ISPPowerConsumption")), "intValue");
}

uint64_t __64__FigCaptureSourceVideoFormat__buildFESCompanionFormatsForType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5;
  int v6;
  unint64_t v8;
  unint64_t v9;

  v5 = objc_msgSend(a2, "fesDimensions");
  if (v5 > (int)objc_msgSend(a3, "fesDimensions"))
    return 1;
  v6 = objc_msgSend(a2, "fesDimensions");
  if (v6 < (int)objc_msgSend(a3, "fesDimensions"))
    return -1;
  v8 = (unint64_t)objc_msgSend(a2, "fesDimensions") >> 32;
  if ((int)v8 > (int)((unint64_t)objc_msgSend(a3, "fesDimensions") >> 32))
    return 1;
  v9 = (unint64_t)objc_msgSend(a2, "fesDimensions") >> 32;
  if ((int)v9 >= (int)((unint64_t)objc_msgSend(a3, "fesDimensions") >> 32))
    return 0;
  else
    return -1;
}

id __46__FigCaptureSourceVideoFormat__avfcAttributes__block_invoke()
{
  id result;
  _QWORD v1[91];

  v1[90] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("Index");
  v1[1] = CFSTR("TemporalNoiseReductionMode");
  v1[2] = CFSTR("TemporalNoiseReductionBand0Disabled");
  v1[3] = CFSTR("TemporalNoiseReductionRawEnabled");
  v1[4] = CFSTR("ISPChromaNoiseReduction");
  v1[5] = CFSTR("MaxIntegrationTimeOverride");
  v1[6] = CFSTR("DepthDataAEMaxGain");
  v1[7] = CFSTR("DepthDataMaxIntegrationTimeOverride");
  v1[8] = CFSTR("LowLightVideoAEMaxGain");
  v1[9] = CFSTR("DistortionCompensationSupported");
  v1[10] = CFSTR("NonSIFRCompanionFormat");
  v1[11] = CFSTR("FullBinSIFRCompanionFormat");
  v1[12] = CFSTR("MidFrameSynchronizationOptimizedCompanionFormat");
  v1[13] = CFSTR("ActionCameraCompanionFormat");
  v1[14] = CFSTR("SIFRBinningFactorOverrideForNondisruptiveSwitching");
  v1[15] = CFSTR("FullBinSIFROnSecondaryCameraAllowed");
  v1[16] = CFSTR("FESCompanionFormats");
  v1[17] = CFSTR("DepthCompanionFormat");
  v1[18] = CFSTR("UltraHighResCompanionFormat");
  v1[19] = CFSTR("FSDNetCompanionFormat");
  v1[20] = CFSTR("SensorCenterOffsetX");
  v1[21] = CFSTR("SensorCenterOffsetY");
  v1[22] = CFSTR("PreGDCSensorCropWidth");
  v1[23] = CFSTR("PreGDCSensorCropHeight");
  v1[24] = CFSTR("PostGDCCropWidth");
  v1[25] = CFSTR("PostGDCCropHeight");
  v1[26] = CFSTR("GeometricDistortionCorrectedNativeWidth");
  v1[27] = CFSTR("GeometricDistortionCorrectedNativeHeight");
  v1[28] = CFSTR("FESInputCropWidth");
  v1[29] = CFSTR("FESInputCropHeight");
  v1[30] = CFSTR("CropWidthForFES");
  v1[31] = CFSTR("CropHeightForFES");
  v1[32] = CFSTR("PreviewImageQueueSyncStrategy");
  v1[33] = CFSTR("FESBinningFactorHorizontal");
  v1[34] = CFSTR("SecondaryScalerUnavailable");
  v1[35] = CFSTR("StudioAndContourPreviewRenderingSupported");
  v1[36] = CFSTR("StagePreviewRenderingSupported");
  v1[37] = CFSTR("WideAsStatsMasterEnabled");
  v1[38] = CFSTR("VideoSTFSupported");
  v1[39] = CFSTR("VideoSTFMetadataEnabled");
  v1[40] = CFSTR("StillImageISPChromaNoiseReduction");
  v1[41] = CFSTR("RawLensShadingCorrection");
  v1[42] = CFSTR("SupplementalTimeOfFlightCameraSupported");
  v1[43] = CFSTR("ConfigureForSISSupport");
  v1[44] = CFSTR("ConfigureForSpatialOverCaptureSupport");
  v1[45] = CFSTR("ConfigureForDigitalFlashSupport");
  v1[46] = CFSTR("ConfigureForSoftISPSupport");
  v1[47] = CFSTR("ConfigureForNonDisruptiveFullBinSIFRSwitching");
  v1[48] = CFSTR("ConfigureForDepthDataDelivery");
  v1[49] = CFSTR("ConfigureForSupplementalTimeOfFlightCameraSupport");
  v1[50] = CFSTR("FastSwitchingConfiguration");
  v1[51] = CFSTR("FastSwitchingMainCaptureStreamFormat");
  v1[52] = CFSTR("GNRHDRSupported");
  v1[53] = CFSTR("ISPMultiBandNoiseReductionSupported");
  v1[54] = CFSTR("StillImageISPMultiBandNoiseReductionSupported");
  v1[55] = CFSTR("ZeroShutterLagRequiresUserInitiatedCaptureRequestTime");
  v1[56] = CFSTR("DigitalFlashRawNightModeSupported");
  v1[57] = CFSTR("DigitalFlashDetectedObjectTypes");
  v1[58] = CFSTR("StillImageGDCInDCProcessorOutputCropWidth");
  v1[59] = CFSTR("StillImageGDCInDCProcessorOutputCropHeight");
  v1[60] = CFSTR("SIFRStillImageCaptureWithDepthDataDisabled");
  v1[61] = CFSTR("SushiRawSupported");
  v1[62] = CFSTR("SushiRawBlackBorderingEnabled");
  v1[63] = CFSTR("SemanticDevelopmentVersion");
  v1[64] = CFSTR("DeepZoomSupported");
  v1[65] = CFSTR("GainMapSupported");
  v1[66] = CFSTR("CaptureTimePhotoCurationSupported");
  v1[67] = CFSTR("StillImageGDCSourceMode");
  v1[68] = CFSTR("GreenGhostMitigationVersion");
  v1[69] = CFSTR("ConfigureForGreenGhostMitigationVersion");
  v1[70] = CFSTR("UsesPacked10BitFirmwareStillImageOutputPixelFormat");
  v1[71] = CFSTR("WideDigitalFlashAvailableShallowDepthOfFieldEffectsEnabled");
  v1[72] = CFSTR("ContentAwareEnhancementSupported");
  v1[73] = CFSTR("ContentAwareAWBSupported");
  v1[74] = CFSTR("MultiIlluminantWhiteBalanceSupported");
  v1[75] = CFSTR("DepthEngineOutputWidth");
  v1[76] = CFSTR("DepthEngineOutputHeight");
  v1[77] = CFSTR("RGBIRStereoFusionSupported");
  v1[78] = CFSTR("VideoGreenGhostMitigationUsesLightSourceMaskAndKeypointDescriptorData");
  v1[79] = CFSTR("PocketDetectionSupported");
  v1[80] = CFSTR("VariableFrameRateVideoCaptureFromFWAEMaxGain");
  v1[81] = CFSTR("SphereAssistedAutoFocusEnabled");
  v1[82] = CFSTR("StereoVideoCompanionFormat");
  v1[83] = CFSTR("StereoVideoAEMaxGain");
  v1[84] = CFSTR("PreferredPreviewMaxFrameRate");
  v1[85] = CFSTR("AdditionalHorizontalFOVCropMultiplier");
  v1[86] = CFSTR("ActionCameraAEMaxGainScaleFactor");
  v1[87] = CFSTR("SWFRSupported");
  v1[88] = CFSTR("SemanticRenderingSupported");
  v1[89] = CFSTR("QuadraSubPixelSwitchingParameters");
  result = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 90);
  _avfcAttributes_sInternalKeys = (uint64_t)result;
  return result;
}

- (BOOL)isCompatibleWithInfraredFormat:(id)a3
{
  unsigned int v4;

  v4 = -[FigCaptureSourceFormat format](self, "format");
  return v4 == objc_msgSend(a3, "format");
}

- (BOOL)isStereoVideoCaptureSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("StereoVideoCaptureSupported")), "BOOLValue");
}

- (BOOL)isStereoPhotoCaptureSupported
{
  char v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("SambaSupported")), "BOOLValue");
  -[FigCaptureSourceVideoFormat isPhotoFormat](self, "isPhotoFormat");
  return v3;
}

- (int)preferredPreviewMaxFrameRate
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("PreferredPreviewMaxFrameRate")), "intValue");
}

- (float)actionCameraAEMaxGainScaleFactor
{
  float result;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("ActionCameraAEMaxGainScaleFactor")), "floatValue");
  if (result == 0.0)
    return 1.0;
  return result;
}

- (id)quadraSubPixelSwitchingParameters
{
  return -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("QuadraSubPixelSwitchingParameters"));
}

@end
