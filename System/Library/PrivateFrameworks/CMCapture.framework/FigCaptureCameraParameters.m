@implementation FigCaptureCameraParameters

- (NSDictionary)photoEncoderParameters
{
  return self->_photoEncoderParameters;
}

- (int)portraitSceneMonitorVersionForPortType:(id)a3 sensorIDString:(id)a4
{
  double v4;
  id v5;
  void *v6;

  LODWORD(v4) = 1.0;
  v5 = -[FigCaptureCameraParameters portraitSceneMonitoringParametersForPortType:sensorIDString:zoomFactorRelativeToWidePortType:](self, "portraitSceneMonitoringParametersForPortType:sensorIDString:zoomFactorRelativeToWidePortType:", a3, a4, v4);
  if (v5 && (v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Version"))) != 0)
    return objc_msgSend(v6, "intValue");
  else
    return 0;
}

- (id)portraitSceneMonitoringParametersForPortType:(id)a3 sensorIDString:(id)a4 zoomFactorRelativeToWidePortType:(float)a5
{
  id v7;
  void *v8;
  NSDictionary *portraitSceneMonitoringParametersByZoomFactor;
  id v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  int v15;
  double v16;
  unsigned int v17;
  BOOL v18;
  float v19;
  int v20;

  if (!a3)
    goto LABEL_24;
  if (!a4)
    goto LABEL_24;
  v7 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:");
  if (!v7)
    goto LABEL_24;
  v8 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PortraitSceneMonitoringParameters"));
  if (v8)
    return v8;
  portraitSceneMonitoringParametersByZoomFactor = self->_portraitSceneMonitoringParametersByZoomFactor;
  if (!portraitSceneMonitoringParametersByZoomFactor)
    return 0;
  if (a5 == 0.0)
  {
LABEL_24:
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  v10 = -[NSDictionary objectForKeyedSubscript:](portraitSceneMonitoringParametersByZoomFactor, "objectForKeyedSubscript:", CFSTR("ZoomSpecificParameters"));
  v11 = (void *)objc_msgSend((id)objc_msgSend(v10, "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_108);
  objc_msgSend((id)objc_msgSend(v11, "firstObject"), "floatValue");
  if (v12 != 1.0)
    return 0;
  v13 = fmaxf(a5, 1.0);
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", -[NSDictionary objectForKeyedSubscript:](self->_portraitSceneMonitoringParametersByZoomFactor, "objectForKeyedSubscript:", CFSTR("Common")));
  v15 = objc_msgSend(v11, "count");
  v17 = v15 - 1;
  while (1)
  {
    v18 = __OFSUB__(v15--, 1);
    if (v15 < 0 != v18)
      break;
    objc_msgSend((id)objc_msgSend(v11, "objectAtIndexedSubscript:", v17), "floatValue");
    v19 = v13 - *(float *)&v16;
    if ((float)(v13 - *(float *)&v16) < 0.0)
      v19 = -(float)(v13 - *(float *)&v16);
    if (v13 <= *(float *)&v16)
    {
      v16 = v19;
      --v17;
      if (v19 >= 0.001)
        continue;
    }
    goto LABEL_16;
  }
  v15 = -1;
LABEL_16:
  if (v15 == -1)
    v20 = 0;
  else
    v20 = v15;
  objc_msgSend(v14, "addEntriesFromDictionary:", objc_msgSend(v10, "objectForKeyedSubscript:", objc_msgSend(v11, "objectAtIndexedSubscript:", v20, v16)));
  return v14;
}

- (id)quadraSubPixelSwitchingParametersForPortType:(id)a3 sensorIDString:(id)a4
{
  id v4;

  if (a3)
  {
    if (a4)
    {
      v4 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:");
      if (v4)
        return (id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("QuadraSubPixelSwitchingParameters"));
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return 0;
}

- (id)sensorIDDictionaryForPortType:(id)a3 sensorIDString:(id)a4
{
  void *v7;
  NSDictionary *v8;
  NSDictionary *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;

  if (!a3 || !a4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  v7 = (void *)MEMORY[0x1A858DD40](self, a2);
  v8 = -[FigCaptureCameraParameters cameraTuningParameters](self, "cameraTuningParameters");
  if (v8)
  {
    v9 = v8;
    v10 = -[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v10, "count"))
      {
        v11 = (void *)objc_msgSend(v10, "objectForKey:", a4);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
          if (v12)
            goto LABEL_16;
        }
        v13 = -[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("DefaultSensorIDs"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = objc_msgSend(v13, "objectForKeyedSubscript:", a3);
          if ((objc_msgSend((id)objc_msgSend(v10, "allKeys"), "containsObject:", v14) & 1) == 0)
            v14 = objc_msgSend((id)objc_msgSend(v10, "allKeys"), "objectAtIndexedSubscript:", 0);
          if (v14)
          {
            v12 = (id)objc_msgSend(v10, "objectForKeyedSubscript:", v14);
            goto LABEL_16;
          }
        }
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
    }
  }
  v12 = 0;
LABEL_16:
  objc_autoreleasePoolPop(v7);
  return v12;
}

- (NSDictionary)cameraTuningParameters
{
  return (NSDictionary *)-[NSDictionary objectForKeyedSubscript:](self->_cameraParameters, "objectForKeyedSubscript:", CFSTR("TuningParameters"));
}

- (id)sensorIDDictionaryForStream:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  if (a3)
  {
    v5 = objc_msgSend(a3, "portType");
    v6 = objc_msgSend((id)objc_opt_class(), "sensorIDStringFromModuleInfo:", objc_msgSend(a3, "getProperty:error:", *MEMORY[0x1E0D076B8], 0));
    if (v5)
    {
      if (v6)
        return -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:", v5, v6);
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return 0;
}

+ (int)stillImageMaxLossyCompressionLevel
{
  return FigCapturePlatformSupportsUniversalLossyCompression() != 0;
}

- ($2ACC23B9A21F50F5CC728381CA870116)landmarksVersionForInferenceType:(int)a3
{
  NSDictionary *landmarksParameters;
  const __CFString *v4;
  uint64_t v5;

  if (a3 == 802)
  {
    landmarksParameters = self->_landmarksParameters;
    if (!landmarksParameters)
    {
      v5 = 1;
      return ($2ACC23B9A21F50F5CC728381CA870116)BWInferenceVersionMakeMajor(v5);
    }
    v4 = CFSTR("InferenceTypeFaceSegmentsWithLandmarks");
LABEL_7:
    v5 = -[NSDictionary objectForKeyedSubscript:](landmarksParameters, "objectForKeyedSubscript:", v4);
    if (v5)
    {
      v5 = objc_msgSend((id)v5, "objectForKeyedSubscript:", CFSTR("InferenceVersion"));
      if (v5)
        return ($2ACC23B9A21F50F5CC728381CA870116)BWInferenceVersionMakeMajor(objc_msgSend((id)v5, "intValue"));
    }
    return ($2ACC23B9A21F50F5CC728381CA870116)BWInferenceVersionMakeMajor(v5);
  }
  if (a3 != 801)
    return ($2ACC23B9A21F50F5CC728381CA870116)BWInferenceVersionMakeMajor(0);
  landmarksParameters = self->_landmarksParameters;
  if (landmarksParameters)
  {
    v4 = CFSTR("InferenceTypeLandmarks");
    goto LABEL_7;
  }
  if (+[BWInferenceEngine isNeuralEngineSupported](BWInferenceEngine, "isNeuralEngineSupported"))
    return ($2ACC23B9A21F50F5CC728381CA870116)BWInferenceVersionMakeMajor(2);
  else
    return ($2ACC23B9A21F50F5CC728381CA870116)BWInferenceVersionMakeMajor(1);
}

- (int)landmarksConstellationPointCountForInferenceType:(int)a3
{
  NSDictionary *landmarksParameters;
  const __CFString *v4;
  id v5;
  int v6;
  int v7;

  if (a3 == 802)
  {
    landmarksParameters = self->_landmarksParameters;
    if (!landmarksParameters)
    {
      LODWORD(v5) = 76;
      return (int)v5;
    }
    v4 = CFSTR("InferenceTypeFaceSegmentsWithLandmarks");
  }
  else
  {
    if (a3 != 801)
    {
      LODWORD(v5) = 0;
      return (int)v5;
    }
    landmarksParameters = self->_landmarksParameters;
    if (!landmarksParameters)
    {
      LODWORD(v5) = 65;
      return (int)v5;
    }
    v4 = CFSTR("InferenceTypeLandmarks");
  }
  v5 = -[NSDictionary objectForKeyedSubscript:](landmarksParameters, "objectForKeyedSubscript:", v4);
  if (v5)
  {
    v5 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ConstellationPointCount"));
    if (v5)
    {
      v6 = objc_msgSend(v5, "intValue");
      if (v6 == 65)
        v7 = 65;
      else
        v7 = 0;
      if (v6 == 76)
        LODWORD(v5) = 76;
      else
        LODWORD(v5) = v7;
    }
  }
  return (int)v5;
}

+ (int)videoDataMaxLossyCompressionLevel
{
  return FigCapturePlatformSupportsUniversalLossyCompression() != 0;
}

+ (int)movieFileMaxLossyCompressionLevelForPixelFormat:(unsigned int)a3
{
  int v4;

  if (FigCapturePixelFormatIsTenBit(a3))
  {
    if (FigCapturePixelFormatIs422(a3))
      v4 = 1;
    else
      v4 = 3;
  }
  else
  {
    v4 = 1;
  }
  if (FigCapturePlatformSupportsUniversalLossyCompression())
    return v4;
  else
    return 0;
}

- (int)mattingVersion
{
  NSDictionary *commonMattingParameters;

  commonMattingParameters = self->_commonMattingParameters;
  if (commonMattingParameters)
    LODWORD(commonMattingParameters) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](commonMattingParameters, "objectForKeyedSubscript:", CFSTR("Version")), "intValue");
  return (int)commonMattingParameters;
}

uint64_t __123__FigCaptureCameraParameters_portraitSceneMonitoringParametersForPortType_sensorIDString_zoomFactorRelativeToWidePortType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  float v4;
  float v5;
  float v6;

  objc_msgSend(a2, "floatValue");
  v5 = v4;
  objc_msgSend(a3, "floatValue");
  if (v5 > v6)
    return 1;
  else
    return -1;
}

- (BOOL)chromaticDefringingEnabledForVideoForPortType:(id)a3 sensorIDString:(id)a4
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:", a3, a4), "objectForKeyedSubscript:", CFSTR("ChromaticDefringing")), "objectForKeyedSubscript:", CFSTR("Video")), "objectForKeyedSubscript:", CFSTR("CorrectionEnabled")), "BOOLValue");
}

+ (id)sensorIDStringFromModuleInfo:(id)a3
{
  id result;

  result = (id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05B78]);
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%04x"), objc_msgSend(result, "intValue"));
  return result;
}

+ (id)sharedInstance
{
  FigCaptureCameraParameters *v2;
  FigCaptureCameraParameters *v3;

  pthread_mutex_lock((pthread_mutex_t *)gCaptureCameraParametersLock);
  v2 = (FigCaptureCameraParameters *)gCaptureCameraParameters;
  if (!gCaptureCameraParameters)
  {
    v2 = objc_alloc_init(FigCaptureCameraParameters);
    gCaptureCameraParameters = (uint64_t)v2;
  }
  v3 = v2;
  pthread_mutex_unlock((pthread_mutex_t *)gCaptureCameraParametersLock);
  return v3;
}

- (FigCaptureCameraParameters)init
{
  const __CFString *ModelSpecificName;

  ModelSpecificName = (const __CFString *)FigCaptureGetModelSpecificName();
  return (FigCaptureCameraParameters *)-[FigCaptureCameraParameters _initWithModelSpecificName:fromFile:](self, ModelSpecificName, 0);
}

- (id)_initWithModelSpecificName:(void *)a3 fromFile:
{
  id *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  if (!a1)
    return 0;
  v27.receiver = a1;
  v27.super_class = (Class)FigCaptureCameraParameters;
  v5 = (id *)objc_msgSendSuper2(&v27, sel_init);
  v6 = v5;
  if (!v5)
    return v6;
  if ((-[FigCaptureCameraParameters _readAndPreprocessCameraParametersForModelSpecificName:fromFile:]((uint64_t)v5, a2, a3) & 1) == 0|| (v7 = (void *)objc_msgSend(v6[1], "objectForKeyedSubscript:", CFSTR("TuningParameters")), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  v8 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Common"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NRFParameters"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6[2] = v9;
    v10 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DistortionCorrectionParameters"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6[3] = v10;
    v11 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Meteor"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6[4] = v11;
    v12 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MotionAttachments"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6[5] = v12;
    v13 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VideoStabilization"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6[6] = v13;
    v14 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("StereoDisparity"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6[7] = v14;
    v15 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DepthProcessingParameters"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6[8] = v15;
    v16 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VideoGreenGhostMitigationParameters"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6[14] = v16;
    v17 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Landmarks"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6[9] = v17;
    v18 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MattingParameters"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6[10] = v18;
    v19 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("LearnedMattingParameters"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6[11] = v19;
    v20 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PersonSemantics"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6[12] = v20;
    v21 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CoreImagePortraitFilter"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6[13] = v21;
    v22 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DeepZoomParameters"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6[15] = v22;
    v23 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PhotoEncoderParameters"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6[16] = v23;
    v24 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PortraitSceneMonitoringParametersByZoomFactor"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6[17] = v24;
    v25 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TemporalNoiseReductionParameters"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6[18] = v25;
  }
  if (!v6[5])
    v6[5] = objc_alloc_init(MEMORY[0x1E0C99D80]);
  if (!v6[6])
    v6[6] = objc_alloc_init(MEMORY[0x1E0C99D80]);
  return v6;
}

- (int)nrfVersion
{
  id v2;

  v2 = -[NSDictionary objectForKeyedSubscript:](self->_commonNRFParameters, "objectForKeyedSubscript:", CFSTR("Version"));
  if (v2)
    LODWORD(v2) = objc_msgSend(v2, "intValue");
  return (int)v2;
}

- (uint64_t)_readAndPreprocessCameraParametersForModelSpecificName:(void *)a3 fromFile:
{
  void *v5;
  FigCaptureFlatPlist *v6;
  FigCaptureFlatPlist *v7;
  uint64_t v8;
  FigCaptureFlatPlist *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  uint64_t v29;
  FigCaptureFlatPlist *v30;
  FigCaptureFlatPlist *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  FigCaptureFlatPlist **v37;
  FigCaptureFlatPlist *v38;
  uint64_t v39;
  void *v40;
  uint64_t v42;
  FigCaptureFlatPlist *v43;
  id v44;
  void *v45;
  void *context;
  id obj;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _QWORD v75[8];

  v75[6] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5 = (void *)MEMORY[0x1A858DD40]();
  if (a3)
  {
    v6 = +[FigCaptureFlatPlist flatPlistWithContentsOfFile:](FigCaptureFlatPlist, "flatPlistWithContentsOfFile:", a3);
    if (v6)
    {
      v7 = v6;
      if (objc_msgSend(a3, "hasSuffix:", CFSTR("CameraSetup.plist")))
        v8 = objc_msgSend(a3, "substringWithRange:", 0, objc_msgSend(a3, "length") - objc_msgSend(CFSTR("CameraSetup.plist"), "length"));
      else
        v8 = objc_msgSend((id)objc_msgSend(a3, "stringByDeletingLastPathComponent"), "stringByAppendingString:", CFSTR("/"));
      v10 = v8;
      goto LABEL_10;
    }
LABEL_65:
    v39 = 0;
    goto LABEL_62;
  }
  v9 = FigCaptureCFCreatePropertyListForModel((uint64_t)CFSTR("CameraSetup.plist"), a2, 1);
  if (!v9)
    goto LABEL_65;
  v7 = v9;
  v10 = 0;
LABEL_10:
  v50 = (void *)-[FigCaptureFlatPlist objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("TuningParameters"));
  v11 = *MEMORY[0x1E0D05A18];
  v75[0] = *MEMORY[0x1E0D05A28];
  v75[1] = v11;
  v12 = *MEMORY[0x1E0D05A50];
  v75[2] = *MEMORY[0x1E0D05A30];
  v75[3] = v12;
  v13 = *MEMORY[0x1E0D05A40];
  v75[4] = *MEMORY[0x1E0D05A38];
  v75[5] = v13;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 6);
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
  if (!v48)
  {
    v40 = *(void **)(a1 + 8);
    v37 = (FigCaptureFlatPlist **)(a1 + 8);

    goto LABEL_60;
  }
  v42 = a1;
  v43 = v7;
  v45 = 0;
  context = v5;
  v44 = 0;
  v49 = *(_QWORD *)v69;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v69 != v49)
      {
        v15 = v14;
        objc_enumerationMutation(obj);
        v14 = v15;
      }
      v54 = v14;
      v16 = (void *)objc_msgSend(v50, "objectForKeyedSubscript:");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v17 = (void *)objc_msgSend(v16, "allKeys");
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
        if (v18)
        {
          v19 = v18;
          v55 = 0;
          v20 = *(_QWORD *)v65;
          v52 = v17;
          v53 = v16;
          v51 = *(_QWORD *)v65;
          while (1)
          {
            v21 = 0;
            v56 = v19;
            do
            {
              if (*(_QWORD *)v65 != v20)
                objc_enumerationMutation(v17);
              v57 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v21);
              v58 = v21;
              v22 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:");
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_45;
              v62 = 0u;
              v63 = 0u;
              v60 = 0u;
              v61 = 0u;
              v23 = objc_msgSend(&unk_1E4A01A90, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
              if (!v23)
              {
                v19 = v56;
LABEL_45:
                v32 = v58;
                goto LABEL_46;
              }
              v24 = v23;
              v25 = 0;
              v26 = *(_QWORD *)v61;
              while (2)
              {
                for (i = 0; i != v24; ++i)
                {
                  if (*(_QWORD *)v61 != v26)
                    objc_enumerationMutation(&unk_1E4A01A90);
                  v28 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
                  v29 = objc_msgSend(v22, "objectForKeyedSubscript:", v28);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    if (v10)
                      v30 = +[FigCaptureFlatPlist flatPlistWithContentsOfFile:](FigCaptureFlatPlist, "flatPlistWithContentsOfFile:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v10, v29));
                    else
                      v30 = FigCaptureCFCreatePropertyListForModel(v29, a2, 1);
                    v31 = v30;
                    if (!v30)
                      goto LABEL_58;
                    if (!v25)
                      v25 = (id)objc_msgSend(v22, "mutableCopy");
                    objc_msgSend(v25, "setObject:forKeyedSubscript:", 0, v28);
                    objc_msgSend(v25, "addEntriesFromDictionary:", v31);
                  }
                }
                v24 = objc_msgSend(&unk_1E4A01A90, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
                if (v24)
                  continue;
                break;
              }
              v19 = v56;
              v32 = v58;
              if (!v25)
              {
                v17 = v52;
                v16 = v53;
                v20 = v51;
                goto LABEL_46;
              }
              v17 = v52;
              v16 = v53;
              v33 = v55;
              v20 = v51;
              if (!v55)
                v33 = (id)objc_msgSend(v53, "mutableCopy");
              v55 = v33;
              objc_msgSend(v33, "setObject:forKeyedSubscript:", v25, v57);
              if (objc_msgSend(v57, "isEqualToString:", CFSTR("0x0803")))
              {
                if ((objc_msgSend((id)objc_msgSend(v53, "allKeys"), "containsObject:", CFSTR("0x0853")) & 1) == 0)
                {
                  objc_msgSend(v55, "setObject:forKeyedSubscript:", v25, CFSTR("0x0853"));
                  goto LABEL_46;
                }
LABEL_58:
                v39 = 0;
                v5 = context;
                goto LABEL_62;
              }
LABEL_46:
              v21 = v32 + 1;
            }
            while (v21 != v19);
            v34 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
            v19 = v34;
            if (!v34)
            {
              if (v55)
              {
                v35 = v45;
                if (!v45)
                {
                  v36 = (id)objc_msgSend(v50, "mutableCopy");
                  v44 = (id)-[FigCaptureFlatPlist mutableCopy](v43, "mutableCopy");
                  objc_msgSend(v44, "setObject:forKeyedSubscript:", v36, CFSTR("TuningParameters"));
                  v35 = v36;
                }
                v45 = v35;
                objc_msgSend(v35, "setObject:forKeyedSubscript:");
              }
              break;
            }
          }
        }
      }
      v14 = v54 + 1;
    }
    while (v54 + 1 != v48);
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
  }
  while (v48);
  v37 = (FigCaptureFlatPlist **)(v42 + 8);

  if (v44)
  {
    v38 = (FigCaptureFlatPlist *)objc_msgSend(v44, "copy");
    v5 = context;
    goto LABEL_61;
  }
  v5 = context;
  v7 = v43;
LABEL_60:
  v38 = v7;
LABEL_61:
  *v37 = v38;
  v39 = 1;
LABEL_62:
  objc_autoreleasePoolPop(v5);
  return v39;
}

- (NSDictionary)videoStabilizationParameters
{
  return self->_videoStabilizationParameters;
}

- (int)videoStabilizationProcessorVersion
{
  NSDictionary *videoStabilizationParameters;

  videoStabilizationParameters = self->_videoStabilizationParameters;
  if (videoStabilizationParameters)
    LODWORD(videoStabilizationParameters) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](videoStabilizationParameters, "objectForKeyedSubscript:", CFSTR("Version")), "intValue");
  return (int)videoStabilizationParameters;
}

+ (int)previewMaxLossyCompressionLevel
{
  int v2;

  if (BWDeviceIsiPhone())
    v2 = 3;
  else
    v2 = 1;
  if (FigCapturePlatformSupportsUniversalLossyCompression())
    return v2;
  else
    return 0;
}

uint64_t __83__FigCaptureCameraParameters_sdofTuningParametersForSensorIDDictionary_zoomFactor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  float v4;
  float v5;
  float v6;

  objc_msgSend(a2, "floatValue");
  v5 = v4;
  objc_msgSend(a3, "floatValue");
  if (v5 > v6)
    return 1;
  else
    return -1;
}

- (int)distortionCorrectionVersion
{
  id v2;

  v2 = -[NSDictionary objectForKeyedSubscript:](self->_commonDistortionCorrectionParameters, "objectForKeyedSubscript:", CFSTR("Version"));
  if (v2)
    LODWORD(v2) = objc_msgSend(v2, "intValue");
  return (int)v2;
}

- (int)deepZoomVersion
{
  id v2;

  v2 = -[NSDictionary objectForKeyedSubscript:](self->_commonDeepZoomParameters, "objectForKeyedSubscript:", CFSTR("Version"));
  if (v2)
    LODWORD(v2) = objc_msgSend(v2, "intValue");
  return (int)v2;
}

- (BOOL)portraitPreviewForegroundBlurEnabledForPortType:(id)a3 sensorIDString:(id)a4 zoomFactor:(float)a5
{
  id v9;
  double v10;
  id v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  BOOL v23;

  if (!a3
    || !a4
    || (v9 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:")) == 0|| (v11 = v9, *(float *)&v10 = a5, v12 = -[FigCaptureCameraParameters sdofRenderingVersionForPortType:sensorIDString:zoomFactor:](self, "sdofRenderingVersionForPortType:sensorIDString:zoomFactor:", a3, a4, v10), !(_DWORD)v12)|| (v14 = v12, *(float *)&v13 = a5, (v15 = +[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:zoomFactor:](FigCaptureCameraParameters, "sdofTuningParametersForSensorIDDictionary:zoomFactor:", v11, v13)) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  v16 = v15;
  v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RenderingV%d"), v14);
  if (!v17
    || (v18 = v17, (v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RenderingV%d_NMP"), v14)) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    return 0;
  }
  v20 = v19;
  v21 = (void *)objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v18), "objectForKeyedSubscript:", CFSTR("fgNRings"));
  v22 = (void *)objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v20), "objectForKeyedSubscript:", CFSTR("fgNRings"));
  if (v21 && objc_msgSend(v21, "unsignedIntValue"))
  {
    v23 = 1;
  }
  else if (v22)
  {
    v23 = objc_msgSend(v22, "unsignedIntValue") != 0;
  }
  else
  {
    v23 = 0;
  }
  return v23 & (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v18), "objectForKeyedSubscript:", CFSTR("disablePortraitPreviewForegroundBlur")), "BOOLValue") ^ 1);
}

- (int)sdofRenderingVersionForPortType:(id)a3 sensorIDString:(id)a4 zoomFactor:(float)a5
{
  id v9;
  double v10;

  if (a3 && (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A20]) & 1) == 0)
  {
    if (a4)
    {
      v9 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:", a3, a4);
      if (v9)
      {
        *(float *)&v10 = a5;
        return objc_msgSend((id)objc_msgSend(+[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:zoomFactor:](FigCaptureCameraParameters, "sdofTuningParametersForSensorIDDictionary:zoomFactor:", v9, v10), "objectForKeyedSubscript:", CFSTR("Version")), "intValue");
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return 0;
}

+ (id)sdofTuningParametersForSensorIDDictionary:(id)a3 zoomFactor:(float)a4
{
  uint64_t v4;
  uint64_t v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  void *v13;
  float v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  float v20;
  float v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  float v26;
  float v27;
  float v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[7];
  float v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    fig_log_get_emitter();
    v32 = v4;
    LODWORD(v31) = 0;
    FigDebugAssert3();
    v13 = 0;
    v8 = 1.0;
    goto LABEL_14;
  }
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SDOFRenderingParameters"));
  v8 = 1.0;
  if (v7)
  {
    v13 = (void *)v7;
    goto LABEL_14;
  }
  v9 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SDOFRenderingParametersByZoomFactor"));
  if (!v9)
    goto LABEL_28;
  if (a4 == 0.0)
  {
    fig_log_get_emitter();
    v32 = v4;
    LODWORD(v31) = 0;
    FigDebugAssert3();
    goto LABEL_28;
  }
  v10 = v9;
  v11 = (void *)objc_msgSend((id)objc_msgSend(v9, "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_162);
  objc_msgSend((id)objc_msgSend(v11, "firstObject"), "floatValue");
  if (v12 != 1.0)
  {
LABEL_28:
    v13 = 0;
    goto LABEL_14;
  }
  a4 = fmaxf(a4, 1.0);
  v13 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", objc_msgSend(v11, "firstObject"));
  objc_msgSend((id)objc_msgSend(v11, "firstObject"), "floatValue");
  v8 = v14;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v34;
LABEL_8:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v17)
        objc_enumerationMutation(v11);
      v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v18);
      objc_msgSend(v19, "floatValue");
      if (v20 > a4)
        break;
      v13 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", v19);
      objc_msgSend(v19, "floatValue");
      v8 = v21;
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        if (v16)
          goto LABEL_8;
        break;
      }
    }
  }
LABEL_14:
  if (a4 != v8)
  {
    v22 = (void *)objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("InterpolableParameters"));
    if (v22)
    {
      v23 = v22;
      v24 = objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("TargetValues"));
      if (v24)
      {
        v25 = (void *)v24;
        objc_msgSend((id)objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("ZoomFactorForTargetValues")), "floatValue");
        if (v26 != 0.0)
        {
          v27 = (float)(v26 - a4) / (float)(v26 - v8);
          if (v27 > 1.0)
            v27 = 1.0;
          if (v27 >= 0.0)
            v28 = v27;
          else
            v28 = 0.0;
          v29 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v13, v31, v32);
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __fccp_fineTuneSDOFTuningParametersForContinuousZoom_block_invoke;
          v37[3] = &unk_1E49269F0;
          v37[4] = v13;
          v37[5] = 0;
          v38 = v28;
          v37[6] = v29;
          objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v37);
          return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v29);
        }
      }
    }
  }
  return v13;
}

- (NSDictionary)motionAttachmentsParameters
{
  return self->_motionAttachmentsParameters;
}

- (int)personSemanticsVersion
{
  NSDictionary *personSemanticsParameters;

  personSemanticsParameters = self->_personSemanticsParameters;
  if (personSemanticsParameters)
    LODWORD(personSemanticsParameters) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](personSemanticsParameters, "objectForKeyedSubscript:", CFSTR("Version")), "intValue");
  return (int)personSemanticsParameters;
}

- (int)learnedMattingVersion
{
  NSDictionary *learnedMattingParameters;

  learnedMattingParameters = self->_learnedMattingParameters;
  if (learnedMattingParameters)
    LODWORD(learnedMattingParameters) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](learnedMattingParameters, "objectForKeyedSubscript:", CFSTR("Version")), "intValue");
  return (int)learnedMattingParameters;
}

- (int)gainMapVersion
{
  if (-[FigCaptureCameraParameters nrfVersion](self, "nrfVersion") == 4)
    return 0x20000;
  else
    return 0x10000;
}

- (int)disparityVersion
{
  NSDictionary *stereoDisparityParameters;

  stereoDisparityParameters = self->_stereoDisparityParameters;
  if (stereoDisparityParameters)
    LODWORD(stereoDisparityParameters) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](stereoDisparityParameters, "objectForKeyedSubscript:", CFSTR("Version")), "intValue");
  return (int)stereoDisparityParameters;
}

- (BOOL)complementMatteSuppressionDecisionWithISPDetectedFaces
{
  NSDictionary *v2;
  id v3;

  v2 = -[FigCaptureCameraParameters cameraTuningParameters](self, "cameraTuningParameters");
  if (v2
    && (v3 = -[NSDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", CFSTR("Common")),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    return objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ComplementMatteSuppressionDecisionWithISPDetectedFaces")), "BOOLValue");
  }
  else
  {
    return 0;
  }
}

- (BOOL)panoramaRequiresLTMLockingForPortType:(id)a3 sensorIDString:(id)a4
{
  id v4;

  if (a3)
  {
    if (a4)
    {
      v4 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:");
      if (v4)
        return objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("panoramaDoNotLockLTM")), "BOOLValue") ^ 1;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return 1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    gCaptureCameraParametersLock = FigSimpleMutexCreate();
}

- (NSDictionary)commonNRFParameters
{
  return self->_commonNRFParameters;
}

+ (unsigned)sensorIDFromSensorIDString:(id)a3
{
  unsigned int v4;

  v4 = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", a3), "scanHexInt:", &v4);
  return v4;
}

- (FigCaptureCameraParameters)initWithContentsOfFile:(id)a3
{
  const __CFString *ModelSpecificName;

  ModelSpecificName = (const __CFString *)FigCaptureGetModelSpecificName();
  return (FigCaptureCameraParameters *)-[FigCaptureCameraParameters _initWithModelSpecificName:fromFile:](self, ModelSpecificName, a3);
}

- (FigCaptureCameraParameters)initWithModelSpecificName:(id)a3
{
  return (FigCaptureCameraParameters *)-[FigCaptureCameraParameters _initWithModelSpecificName:fromFile:](self, (const __CFString *)a3, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureCameraParameters;
  -[FigCaptureCameraParameters dealloc](&v3, sel_dealloc);
}

- (NSDictionary)stereoDisparityParameters
{
  return (NSDictionary *)-[NSDictionary objectForKeyedSubscript:](self->_stereoDisparityParameters, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("V%d"), -[FigCaptureCameraParameters disparityVersion](self, "disparityVersion")));
}

- (int)deviceGeneration
{
  id v2;

  v2 = -[NSDictionary objectForKeyedSubscript:](self->_commonNRFParameters, "objectForKeyedSubscript:", CFSTR("DeviceGeneration"));
  if (v2)
    LODWORD(v2) = objc_msgSend(v2, "intValue");
  return (int)v2;
}

- (int)videoGreenGhostBrightLightMitigationVersion
{
  void *v2;

  v2 = (void *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_commonVideoGreenGhostMitigationParameters, "objectForKeyedSubscript:", CFSTR("BrightLightMitigationParameters")), "objectForKeyedSubscript:", CFSTR("Version"));
  if (v2)
    LODWORD(v2) = objc_msgSend(v2, "intValue");
  return (int)v2;
}

- (int)videoGreenGhostLowLightMitigationVersion
{
  void *v2;

  v2 = (void *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_commonVideoGreenGhostMitigationParameters, "objectForKeyedSubscript:", CFSTR("LowLightMitigationParameters")), "objectForKeyedSubscript:", CFSTR("Version"));
  if (v2)
    LODWORD(v2) = objc_msgSend(v2, "intValue");
  return (int)v2;
}

- (int)meteorHeadroomProcessingType
{
  NSDictionary *meteorParameters;

  meteorParameters = self->_meteorParameters;
  if (meteorParameters)
    LODWORD(meteorParameters) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](meteorParameters, "objectForKeyedSubscript:", CFSTR("HeadroomProcessingType")), "intValue");
  return (int)meteorParameters;
}

- (id)focalLengthCharacterizationForStream:(id)a3
{
  id v3;

  if (a3)
  {
    v3 = -[FigCaptureCameraParameters sensorIDDictionaryForStream:](self, "sensorIDDictionaryForStream:");
    if (v3)
      return (id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FocalLengthCharacterization"));
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return 0;
}

- (int)disparityVersionForPortType:(id)a3 sensorIDString:(id)a4
{
  id v4;

  if (a3)
  {
    if (a4)
    {
      v4 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:");
      if (v4)
        return objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DisparityParameters")), "objectForKeyedSubscript:", CFSTR("Version")), "intValue");
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return 0;
}

- (int)fsdNetStereoImagesAlignmentForPortType:(id)a3 sensorIDString:(id)a4
{
  id v4;
  void *v5;

  if (a3
    && a4
    && (v4 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:")) != 0)
  {
    v5 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FSDNetStereoImagesAlignment"));
    if (v5)
      return objc_msgSend(v5, "intValue");
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return -1;
}

- (int)focusPixelDisparityVersionForPortType:(id)a3 sensorIDString:(id)a4
{
  id v4;

  if (a3)
  {
    if (a4)
    {
      v4 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:");
      if (v4)
        return objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FocusPixelDisparityParameters")), "objectForKeyedSubscript:", CFSTR("Version")), "intValue");
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return 0;
}

- (int)depthProcessorVersion
{
  NSDictionary *depthProcessingParameters;

  depthProcessingParameters = self->_depthProcessingParameters;
  if (depthProcessingParameters)
    LODWORD(depthProcessingParameters) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](depthProcessingParameters, "objectForKeyedSubscript:", CFSTR("Version")), "intValue");
  return (int)depthProcessingParameters;
}

- (int)mattingVersionForPortType:(id)a3 sensorIDString:(id)a4
{
  id v5;
  id v6;

  if (a3
    && a4
    && (v5 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:")) != 0)
  {
    v6 = (id)objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MattingParameters")), "objectForKeyedSubscript:", CFSTR("Version"));
    if (!v6)
      v6 = -[NSDictionary objectForKeyedSubscript:](self->_commonMattingParameters, "objectForKeyedSubscript:", CFSTR("Version"));
    return objc_msgSend(v6, "intValue");
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (BOOL)deepZoomTransferWithZoomedImageEnabledForPortType:(id)a3 sensorIDString:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:", a3, a4);
  if (v4 && (v5 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeepZoomParameters"))) != 0)
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Transfer")), "objectForKeyedSubscript:", CFSTR("ProWithZoomedImageEnabled"));
    if (v6)
      return objc_msgSend(v6, "BOOLValue");
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return 0;
}

- (int)coreImagePortraitFilterVersion
{
  NSDictionary *coreImagePortraitFilterParameters;
  id v3;

  coreImagePortraitFilterParameters = self->_coreImagePortraitFilterParameters;
  if (coreImagePortraitFilterParameters
    && (v3 = -[NSDictionary objectForKeyedSubscript:](coreImagePortraitFilterParameters, "objectForKeyedSubscript:", CFSTR("Version"))) != 0)
  {
    return objc_msgSend(v3, "intValue");
  }
  else
  {
    return 1;
  }
}

- (int)disparityRefinementTypeForPortType:(id)a3 sensorIDString:(id)a4 zoomFactor:(float)a5
{
  id v9;
  double v10;
  id v11;
  double v12;
  id v13;
  int result;

  if (a3
    && a4
    && (v9 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:")) != 0&& (v11 = v9, *(float *)&v10 = a5, -[FigCaptureCameraParameters sdofRenderingVersionForPortType:sensorIDString:zoomFactor:](self, "sdofRenderingVersionForPortType:sensorIDString:zoomFactor:", a3, a4, v10)))
  {
    *(float *)&v12 = a5;
    v13 = +[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:zoomFactor:](FigCaptureCameraParameters, "sdofTuningParametersForSensorIDDictionary:zoomFactor:", v11, v12);
    result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("version")), "intValue");
    if (result)
    {
      if ((int)objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Version")), "intValue") < 5)
        return 1;
      else
        return 2;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return result;
}

- (id)actionCameraSceneMonitoringParametersForPortType:(id)a3 sensorIDString:(id)a4
{
  id v4;

  if (a3)
  {
    if (a4)
    {
      v4 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:");
      if (v4)
        return (id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ActionCameraSceneMonitoringParameters"));
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return 0;
}

- (id)stereoVideoCaptureSceneMonitoringParametersForPortType:(id)a3 sensorIDString:(id)a4
{
  id v4;

  if (a3)
  {
    if (a4)
    {
      v4 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:");
      if (v4)
        return (id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StereoVideoCaptureSceneMonitoringParameters"));
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return 0;
}

- (id)stereoPhotoCaptureSceneMonitoringParametersForPortType:(id)a3 sensorIDString:(id)a4
{
  id v4;

  if (a3)
  {
    if (a4)
    {
      v4 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:");
      if (v4)
        return (id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SambaMonitoringParameters"));
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return 0;
}

+ (id)sensorIDStringFromMetadata:(id)a3
{
  id result;

  result = (id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D06DE8]);
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%04x"), objc_msgSend(result, "intValue"));
  return result;
}

- (BOOL)chromaticDefringingEnabledForSlomoForPortType:(id)a3 sensorIDString:(id)a4
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:", a3, a4), "objectForKeyedSubscript:", CFSTR("ChromaticDefringing")), "objectForKeyedSubscript:", CFSTR("Slomo")), "objectForKeyedSubscript:", CFSTR("CorrectionEnabled")), "BOOLValue");
}

- (id)chromaticDefringingParametersForPortType:(id)a3 sensorIDString:(id)a4
{
  id v4;
  id result;

  v4 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:", a3, a4);
  if (!v4 || (result = (id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ChromaticDefringing"))) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return result;
}

- (NSDictionary)videoStabilizationSTFParameters
{
  return (NSDictionary *)-[NSDictionary objectForKeyedSubscript:](self->_videoStabilizationParameters, "objectForKeyedSubscript:", CFSTR("VideoSTFParameters"));
}

+ (id)cinematicFramingVirtualCameraConfigurationForPortType:(id)a3 sensorIDString:(id)a4
{
  void *v4;

  if (a3)
  {
    if (a4)
    {
      v4 = (void *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[FigCaptureCameraParameters cameraTuningParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "cameraTuningParameters"), "objectForKeyedSubscript:", a3), "objectForKeyedSubscript:", a4);
      if (v4)
        return (id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CinematicFramingVirtualCameraConfiguration"));
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return 0;
}

+ (id)temporalFilterSessionConfigurationForPortType:(id)a3 sensorIDString:(id)a4
{
  void *v4;

  if (a3)
  {
    if (a4)
    {
      v4 = (void *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[FigCaptureCameraParameters cameraTuningParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "cameraTuningParameters"), "objectForKeyedSubscript:", a3), "objectForKeyedSubscript:", a4);
      if (v4)
        return (id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MotionCompensatedTemporalFilterNoiseReductionConfiguration"));
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return 0;
}

- (NSDictionary)cameraParameters
{
  return self->_cameraParameters;
}

- (NSDictionary)commonVideoGreenGhostMitigationParameters
{
  return self->_commonVideoGreenGhostMitigationParameters;
}

- (NSDictionary)temporalNoiseReductionParameters
{
  return self->_temporalNoiseReductionParameters;
}

@end
