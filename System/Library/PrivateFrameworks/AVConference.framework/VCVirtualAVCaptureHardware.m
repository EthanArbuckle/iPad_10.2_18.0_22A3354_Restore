@implementation VCVirtualAVCaptureHardware

- (id)initForDevice:(id)a3
{
  VCVirtualAVCaptureHardware *v4;
  VCVirtualAVCaptureHardware *v5;
  uint64_t v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VCVirtualAVCaptureHardware;
  v4 = -[VCVirtualAVCaptureHardware init](&v8, sel_init);
  v5 = v4;
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureHardware initForDevice:].cold.1();
    }
    goto LABEL_10;
  }
  v6 = -[VCVirtualAVCaptureHardware newVirtualHardwareForDevice:](v4, "newVirtualHardwareForDevice:", a3);
  v5->_virtualHardware = (NSDictionary *)v6;
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureHardware initForDevice:].cold.2();
    }
LABEL_10:

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCVirtualAVCaptureHardware;
  -[VCVirtualAVCaptureHardware dealloc](&v3, sel_dealloc);
}

- (id)defaultFormatForDeviceID:(id)a3
{
  return (id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_virtualHardware, "objectForKeyedSubscript:", a3), "firstObject");
}

- (NSDictionary)devices
{
  return (NSDictionary *)(id)-[NSDictionary copy](self->_virtualHardware, "copy");
}

- (opaqueCMFormatDescription)newFormatDescription:(id)a3
{
  void *v4;
  char *v5;
  CMVideoCodecType v6;
  int32_t v7;
  int32_t v8;
  CMVideoFormatDescriptionRef v10[2];

  v10[1] = *(CMVideoFormatDescriptionRef *)MEMORY[0x1E0C80C00];
  v10[0] = 0;
  v4 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", kVCVirtualDeviceFormatPixelFormat);
  if (v4)
    v5 = (char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
  else
    v5 = "<nil>";
  v6 = CStrToFourcc(v5);
  v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", kVCVirtualDeviceFormatCaptureWidth), "intValue");
  v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", kVCVirtualDeviceFormatCaptureHeight), "intValue");
  CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6, v7, v8, 0, v10);
  if (!v10[0] && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVirtualAVCaptureHardware newFormatDescription:].cold.1();
  }
  return v10[0];
}

- (id)videoSupportedFrameRateRangesWithFormatDict:(id)a3
{
  float v4;
  double v5;
  float v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", kVCVirtualDeviceFormatMinFrameRate), "floatValue");
  v5 = v4;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", kVCVirtualDeviceFormatMaxFrameRate), "floatValue");
  v8[0] = -[VCVirtualAVFrameRateRange initWithMinFrameRate:maxFrameRate:]([VCVirtualAVFrameRateRange alloc], "initWithMinFrameRate:maxFrameRate:", v5, v6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
}

- ($2825F4736939C4A6D3AD43837233062D)highResolutionStillImageDimensionsWithFormatDict:(id)a3
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", kVCVirtualDeviceFormatPhotoDimensions), "lastObject");
  v4 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", 0), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v4 | (unint64_t)(objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", 1), "intValue") << 32));
}

- (id)supportedMaxPhotoDimensionsWithFormatDict:(id)a3
{
  $2825F4736939C4A6D3AD43837233062D v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = -[VCVirtualAVCaptureHardware highResolutionStillImageDimensionsWithFormatDict:](self, "highResolutionStillImageDimensionsWithFormatDict:", a3);
  v5[0] = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v4, "{?=ii}");
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
}

- (id)newDeviceFormatsFromJsonList:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  VCVirtualAVCaptureDeviceFormat *v12;
  VCVirtualAVCaptureDeviceFormat *v13;
  opaqueCMFormatDescription *v14;
  opaqueCMFormatDescription *v15;
  float v16;
  uint64_t v17;
  id obj;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v21)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    if (v5)
    {
      v6 = v5;
      v20 = *(_QWORD *)v29;
      v7 = *MEMORY[0x1E0C8A808];
      v8 = (__int128 *)MEMORY[0x1E0CA2E18];
      v9 = MEMORY[0x1E0C9AA60];
      obj = a3;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v12 = [VCVirtualAVCaptureDeviceFormat alloc];
          if (!v12)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCVirtualAVCaptureHardware newDeviceFormatsFromJsonList:].cold.2();
            }
            goto LABEL_18;
          }
          v13 = v12;
          v14 = -[VCVirtualAVCaptureHardware newFormatDescription:](self, "newFormatDescription:", v11);
          if (!v14)
          {

            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCVirtualAVCaptureHardware newDeviceFormatsFromJsonList:].cold.3();
            }
            goto LABEL_18;
          }
          v15 = v14;
          -[VCVirtualAVCaptureDeviceFormat setMediaType:](v13, "setMediaType:", v7);
          -[VCVirtualAVCaptureDeviceFormat setFormatDescription:](v13, "setFormatDescription:", v15);
          -[VCVirtualAVCaptureDeviceFormat setVideoSupportedFrameRateRanges:](v13, "setVideoSupportedFrameRateRanges:", -[VCVirtualAVCaptureHardware videoSupportedFrameRateRangesWithFormatDict:](self, "videoSupportedFrameRateRangesWithFormatDict:", v11));
          objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", kVCVirtualDeviceFormatFOV), "floatValue");
          -[VCVirtualAVCaptureDeviceFormat setVideoFieldOfView:](v13, "setVideoFieldOfView:");
          -[VCVirtualAVCaptureDeviceFormat setVideoBinned:](v13, "setVideoBinned:", objc_msgSend(v11, "objectForKeyedSubscript:", kVCVirtualDeviceFormatBinned) != 0);
          -[VCVirtualAVCaptureDeviceFormat setVideoStabilizationSupported:](v13, "setVideoStabilizationSupported:", 0);
          objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", kVCVirtualDeviceFormatMaxZoom), "floatValue");
          -[VCVirtualAVCaptureDeviceFormat setVideoMaxZoomFactor:](v13, "setVideoMaxZoomFactor:", v16);
          -[VCVirtualAVCaptureDeviceFormat setVideoZoomFactorUpscaleThreshold:](v13, "setVideoZoomFactorUpscaleThreshold:", 0.0);
          v25 = *v8;
          v22 = v25;
          v26 = *((_QWORD *)v8 + 2);
          v17 = v26;
          -[VCVirtualAVCaptureDeviceFormat setMinExposureDuration:](v13, "setMinExposureDuration:", &v25);
          v23 = v22;
          v24 = v17;
          -[VCVirtualAVCaptureDeviceFormat setMaxExposureDuration:](v13, "setMaxExposureDuration:", &v23);
          objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", kVCVirtualDeviceFormatISOMin), "floatValue");
          -[VCVirtualAVCaptureDeviceFormat setMinISO:](v13, "setMinISO:");
          objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", kVCVirtualDeviceFormatISOMax), "floatValue");
          -[VCVirtualAVCaptureDeviceFormat setMaxISO:](v13, "setMaxISO:");
          -[VCVirtualAVCaptureDeviceFormat setGlobalToneMappingSupported:](v13, "setGlobalToneMappingSupported:", 0);
          -[VCVirtualAVCaptureDeviceFormat setVideoHDRSupported:](v13, "setVideoHDRSupported:", objc_msgSend(v11, "objectForKeyedSubscript:", kVCVirtualDeviceFormatHDR) != 0);
          -[VCVirtualAVCaptureDeviceFormat setHighResolutionStillImageDimensions:](v13, "setHighResolutionStillImageDimensions:", -[VCVirtualAVCaptureHardware highResolutionStillImageDimensionsWithFormatDict:](self, "highResolutionStillImageDimensionsWithFormatDict:", v11));
          -[VCVirtualAVCaptureDeviceFormat setHighPhotoQualitySupported:](v13, "setHighPhotoQualitySupported:", objc_msgSend(v11, "objectForKeyedSubscript:", kVCVirtualDeviceFormatHighPhotoQuality) != 0);
          -[VCVirtualAVCaptureDeviceFormat setHighestPhotoQualitySupported:](v13, "setHighestPhotoQualitySupported:", objc_msgSend(v11, "objectForKeyedSubscript:", kVCVirtualDeviceFormatSupportsHighestPhotoQuality) != 0);
          -[VCVirtualAVCaptureDeviceFormat setPortraitEffectSupported:](v13, "setPortraitEffectSupported:", objc_msgSend(v11, "objectForKeyedSubscript:", kVCVirtualDeviceFormatPortrait) != 0);
          -[VCVirtualAVCaptureDeviceFormat setAutoFocusSystem:](v13, "setAutoFocusSystem:", objc_msgSend(v11, "objectForKeyedSubscript:", kVCVirtualDeviceFormatAFSystem));
          -[VCVirtualAVCaptureDeviceFormat setSupportedColorSpaces:](v13, "setSupportedColorSpaces:", v9);
          -[VCVirtualAVCaptureDeviceFormat setVideoMinZoomFactorForDepthDataDelivery:](v13, "setVideoMinZoomFactorForDepthDataDelivery:", 0.0);
          -[VCVirtualAVCaptureDeviceFormat setVideoMaxZoomFactorForDepthDataDelivery:](v13, "setVideoMaxZoomFactorForDepthDataDelivery:", 0.0);
          -[VCVirtualAVCaptureDeviceFormat setSupportedVideoZoomFactorsForDepthDataDelivery:](v13, "setSupportedVideoZoomFactorsForDepthDataDelivery:", v9);
          -[VCVirtualAVCaptureDeviceFormat setSupportedDepthDataFormats:](v13, "setSupportedDepthDataFormats:", v9);
          -[VCVirtualAVCaptureDeviceFormat setUnsupportedCaptureOutputClasses:](v13, "setUnsupportedCaptureOutputClasses:", v9);
          -[VCVirtualAVCaptureDeviceFormat setSupportedMaxPhotoDimensions:](v13, "setSupportedMaxPhotoDimensions:", -[VCVirtualAVCaptureHardware supportedMaxPhotoDimensionsWithFormatDict:](self, "supportedMaxPhotoDimensionsWithFormatDict:", v11));
          -[VCVirtualAVCaptureDeviceFormat setSecondaryNativeResolutionZoomFactors:](v13, "setSecondaryNativeResolutionZoomFactors:", v9);
          -[VCVirtualAVCaptureDeviceFormat setCenterStageSupported:](v13, "setCenterStageSupported:", objc_msgSend(v11, "objectForKeyedSubscript:", kVCVirtualDeviceFormatCenterStage) != 0);
          CFRelease(v15);
          objc_msgSend(v21, "addObject:", v13);

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
        if (v6)
          continue;
        break;
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureHardware newDeviceFormatsFromJsonList:].cold.1();
    }
LABEL_18:

    return 0;
  }
  return v21;
}

- (id)newVirtualHardwareForDevice:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureHardware newVirtualHardwareForDevice:].cold.1();
    }
    goto LABEL_25;
  }
  v5 = +[VCDefaults copyStringValueForKey:](VCDefaults, "copyStringValueForKey:", CFSTR("virtualCaptureFormatJSONPath"));
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureHardware newVirtualHardwareForDevice:].cold.2();
    }
LABEL_25:
    v17 = 0;
    v6 = 0;
    goto LABEL_18;
  }
  v6 = v5;
  v7 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v5);
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureHardware newVirtualHardwareForDevice:].cold.3();
    }
    goto LABEL_17;
  }
  v8 = (void *)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, 0);
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureHardware newVirtualHardwareForDevice:].cold.4();
    }
LABEL_17:
    v17 = 0;
    goto LABEL_18;
  }
  v9 = v8;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v15 = -[VCVirtualAVCaptureHardware newDeviceFormatsFromJsonList:](self, "newDeviceFormatsFromJsonList:", objc_msgSend(v9, "objectForKeyedSubscript:", v14));
        if (!v15)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCVirtualAVCaptureHardware newVirtualHardwareForDevice:].cold.5();
          }
          goto LABEL_17;
        }
        v16 = v15;
        objc_msgSend(v4, "setValue:forKey:", v15, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
      if (v11)
        continue;
      break;
    }
  }
  v17 = (void *)objc_msgSend(v4, "copy");
LABEL_18:

  return v17;
}

- (void)initForDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to init self", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initForDevice:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create virtual hardware", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newFormatDescription:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create format description", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newDeviceFormatsFromJsonList:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate device format list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newDeviceFormatsFromJsonList:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate virtual device format", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newDeviceFormatsFromJsonList:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create format description", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVirtualHardwareForDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate hardware dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVirtualHardwareForDevice:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retrieve virtual device resource path from bundle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVirtualHardwareForDevice:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retrieve virtual device data from resource path=%@");
  OUTLINED_FUNCTION_3();
}

- (void)newVirtualHardwareForDevice:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to get hardware JSON", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVirtualHardwareForDevice:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to get device formats for device:%@");
  OUTLINED_FUNCTION_3();
}

@end
