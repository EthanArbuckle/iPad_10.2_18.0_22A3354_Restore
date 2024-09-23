@implementation VCVideoFeatureListStringHelper

+ (unsigned)hardwareSettingsModeFromFeatureListStringType:(unsigned __int8)a3
{
  unsigned __int8 v3;

  v3 = a3;
  if ((a3 - 1) >= 7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCVideoFeatureListStringHelper hardwareSettingsModeFromFeatureListStringType:].cold.1();
    }
    return 0;
  }
  return v3;
}

+ (id)retrieveVCPFeaturesStringWithType:(unsigned __int8)a3 version:(int64_t)a4
{
  uint64_t v5;
  id v7;
  __objc2_class *v8;
  void *v9;
  __objc2_class *v10;
  uint64_t v11;
  id v12;
  id v13;
  int v14;
  int v15;

  v5 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  switch((int)v5)
  {
    case 1:
    case 6:
      v8 = VCVideoRuleCollectionsCamera;
      goto LABEL_8;
    case 2:
      v9 = &unk_1E9EFAE38;
      break;
    case 3:
      v8 = VCVideoRuleCollectionsScreenSecondary;
      goto LABEL_8;
    case 4:
      v8 = VCVideoRuleCollectionsScreenAirplay;
      goto LABEL_8;
    case 5:
      v8 = VCVideoRuleCollectionsRemoteCamera;
LABEL_8:
      v10 = -[__objc2_class sharedInstance](v8, "sharedInstance");
      goto LABEL_9;
    case 7:
      v10 = (__objc2_class *)+[VCVideoRuleCollections newU1VideoRuleCollections](VCVideoRuleCollectionsFaceTexture, "newU1VideoRuleCollections");
LABEL_9:
      v9 = (void *)-[__objc2_class supportedPayloads](v10, "supportedPayloads");
      break;
    default:
      v9 = 0;
      break;
  }
  v11 = objc_msgSend(a1, "hardwareSettingsModeFromFeatureListStringType:", v5);
  v12 = +[VCHardwareSettings featureListStringForPayload:hardwareSettingsMode:version:](VCHardwareSettings, "featureListStringForPayload:hardwareSettingsMode:version:", 126, v11, a4);
  v13 = +[VCHardwareSettings featureListStringForPayload:hardwareSettingsMode:version:](VCHardwareSettings, "featureListStringForPayload:hardwareSettingsMode:version:", 100, v11, a4);
  v14 = objc_msgSend(v9, "containsObject:", &unk_1E9EF6C20);
  if (v12)
  {
    v15 = v14;
    if ((objc_msgSend(v12, "hasSuffix:", CFSTR(";")) & 1) == 0)
      v12 = (id)objc_msgSend(v12, "stringByAppendingString:", CFSTR(";"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, &unk_1E9EF6C50);
    if (v15)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, &unk_1E9EF6C20);
  }
  if (objc_msgSend(v9, "containsObject:", &unk_1E9EF6C38))
  {
    if (!v13 && v12)
      v13 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v12);
    if (v13)
    {
      if ((objc_msgSend(v13, "hasSuffix:", CFSTR(";")) & 1) == 0)
        v13 = (id)objc_msgSend(v13, "stringByAppendingString:", CFSTR(";"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, &unk_1E9EF6C38);
    }
  }
  return v7;
}

+ (void)fixInvalidAspectRatioPortrait:(CGSize *)a3 landscape:(CGSize *)a4
{
  if (a3->width == 512.0 && a3->height == 683.0)
    *a3 = (CGSize)xmmword_1D910F690;
  if (a4->width == 683.0 && a4->height == 512.0)
    *a4 = (CGSize)xmmword_1D910F6A0;
}

+ (void)aspectRatioPortrait:(CGSize *)a3 landscape:(CGSize *)a4 isMismatchedOrientation:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize v17;
  CGSize v18;
  uint64_t v19;

  v5 = a5;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton");
  if (v5)
  {
    objc_msgSend(v8, "localExpectedRatioForScreenOrientation:", 0);
    v10 = v9;
    v12 = v11;
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "localExpectedRatioForScreenOrientation:", 3);
  }
  else
  {
    objc_msgSend(v8, "localScreenRatioForScreenOrientation:", 0);
    v10 = v15;
    v12 = v16;
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "localScreenRatioForScreenOrientation:", 3);
  }
  v18.width = (double)(int)v10;
  v18.height = (double)(int)v12;
  v17.width = (double)(int)v13;
  v17.height = (double)(int)v14;
  SimplifyFixedPointRatio(&v18.width);
  +[VCVideoFeatureListStringHelper fixInvalidAspectRatioPortrait:landscape:](VCVideoFeatureListStringHelper, "fixInvalidAspectRatioPortrait:landscape:", &v18, &v17, SimplifyFixedPointRatio(&v17.width));
  if (a3)
    *a3 = v18;
  if (a4)
    *a4 = v17;
}

+ (id)deriveAspectRatioFLS
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v9 = NAN;
  v10 = NAN;
  v7 = NAN;
  v8 = NAN;
  v5 = NAN;
  v6 = NAN;
  v3 = NAN;
  v4 = NAN;
  +[VCVideoFeatureListStringHelper aspectRatioPortrait:landscape:isMismatchedOrientation:](VCVideoFeatureListStringHelper, "aspectRatioPortrait:landscape:isMismatchedOrientation:", &v9, &v7, 0);
  +[VCVideoFeatureListStringHelper aspectRatioPortrait:landscape:isMismatchedOrientation:](VCVideoFeatureListStringHelper, "aspectRatioPortrait:landscape:isMismatchedOrientation:", &v5, &v3, 1);
  return +[VCVideoFeatureListStringHelper deriveAspectRatioFLSWithPortraitRatio:landscapeRatio:expectedPortraitRatio:expectedLandscapeRatio:](VCVideoFeatureListStringHelper, "deriveAspectRatioFLSWithPortraitRatio:landscapeRatio:expectedPortraitRatio:expectedLandscapeRatio:", v9, v10, v7, v8, v5, v6, v3, v4);
}

+ (id)deriveAspectRatioFLSWithPortraitRatio:(CGSize)a3 landscapeRatio:(CGSize)a4 expectedPortraitRatio:(CGSize)a5 expectedLandscapeRatio:(CGSize)a6
{
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d/%d,%d/%d;%s:%d/%d,%d/%d;"),
                 "AR",
                 (int)a4.width,
                 (int)a4.height,
                 (int)a3.width,
                 (int)a3.height,
                 "XR",
                 (int)a6.width,
                 (int)a6.height,
                 (int)a5.width,
                 (int)a5.height);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v11 = v7;
      v12 = 2080;
      v13 = "+[VCVideoFeatureListStringHelper deriveAspectRatioFLSWithPortraitRatio:landscapeRatio:expectedPortraitRatio:"
            "expectedLandscapeRatio:]";
      v14 = 1024;
      v15 = 201;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Aspect ratio string: %@", buf, 0x26u);
    }
  }
  return v6;
}

+ (BOOL)findFeatureString:(const char *)a3 value:(char *)a4 valueLength:(unint64_t)a5 withPrefix:(const char *)a6
{
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v14;
  char __b[3200];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14 = (char *)0xAAAAAAAAAAAAAAAALL;
  memset(__b, 170, sizeof(__b));
  __strlcpy_chk();
  v9 = strtok_r(__b, ";", &v14);
  if (v9)
  {
    v10 = v9;
    while (1)
    {
      v11 = strchr(v10, 58);
      v12 = v11;
      if (v11)
        *v11 = 0;
      if (!strcmp(v10, a6))
        break;
      v9 = strtok_r(0, ";", &v14);
      v10 = v9;
      if (!v9)
        return (char)v9;
    }
    if (a4)
    {
      if (v12)
        strncpy(a4, v12 + 1, a5);
      else
        *a4 = 0;
    }
    LOBYTE(v9) = 1;
  }
  return (char)v9;
}

+ (id)newLocalFeaturesStringWithType:(unsigned __int8)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = a3;
  v4 = 0;
  if (a3 != 3 && a3 != 5)
    v4 = objc_msgSend(a1, "deriveAspectRatioFLS", a3, 0);
  return +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:aspectRatioFLS:version:](VCVideoFeatureListStringHelper, "newLocalFeaturesStringWithType:aspectRatioFLS:version:", v3, v4, 1);
}

+ (id)newLocalFeaturesStringFixedPositionWithType:(unsigned __int8)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = a3;
  v4 = 0;
  if (a3 <= 4u && a3 != 3)
    v4 = objc_msgSend(a1, "deriveAspectRatioFLS", a3, 0);
  return +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:aspectRatioFLS:version:](VCVideoFeatureListStringHelper, "newLocalFeaturesStringWithType:aspectRatioFLS:version:", v3, v4, 2);
}

+ (id)newLocalFeaturesStringWithType:(unsigned __int8)a3 aspectRatioFLS:(id)a4 version:(int64_t)a5
{
  unsigned int v6;
  void *v8;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  unsigned int v19;
  uint64_t v20;

  v6 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a1, "retrieveVCPFeaturesStringWithType:version:", a3, a5);
  if (v6 > 8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315906;
        v13 = v10;
        v14 = 2080;
        v15 = "+[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:aspectRatioFLS:version:]";
        v16 = 1024;
        v17 = 284;
        v18 = 1024;
        v19 = v6;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unexpected VCVideoFeatureListStringType=%d", (uint8_t *)&v12, 0x22u);
      }
    }
    return 0;
  }
  else if (((1 << v6) & 0x1E8) != 0)
  {
    return v8;
  }
  else
  {
    return (id)objc_msgSend(a1, "newLocalFeaturesStringWithVCP:aspectRatioFLS:", v8, a4);
  }
}

+ (id)newLocalFeaturesStringWithVCP:(id)a3 aspectRatioFLS:(id)a4
{
  id v6;
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__VCVideoFeatureListStringHelper_newLocalFeaturesStringWithVCP_aspectRatioFLS___block_invoke;
  v8[3] = &unk_1E9E56F40;
  v8[4] = a4;
  v8[5] = v6;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);
  return v6;
}

uint64_t __79__VCVideoFeatureListStringHelper_newLocalFeaturesStringWithVCP_aspectRatioFLS___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:");
  v5 = (uint64_t)v4;
  if (*(_QWORD *)(a1 + 32))
    v5 = objc_msgSend(v4, "stringByAppendingString:");
  return objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, a2);
}

+ (id)newEmptyFeatureStringWithPayload:(int)a3
{
  void *v3;
  id v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v7[0] = CFSTR("FLS;");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = v3;
  return v3;
}

+ (id)newEmptyFeatureString
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", CFSTR("FLS;"));
}

+ (BOOL)extractAspectRatios:(const char *)a3 prefix:(const char *)a4 landscapeX:(int *)a5 landscapeY:(int *)a6 portraitX:(int *)a7 portraitY:(int *)a8
{
  __int128 v14;
  _BOOL4 v15;
  uint64_t v16;
  NSObject *v17;
  _BYTE buf[38];
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v15)
        return v15;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "+[VCVideoFeatureListStringHelper extractAspectRatios:prefix:landscapeX:landscapeY:portraitX:portraitY:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 318;
      *(_WORD *)&buf[28] = 2080;
      *(_QWORD *)&buf[30] = a3;
      v20 = 2080;
      v21 = a4;
      _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid parameter(s): featureListStrings=%s, prefix=%s", buf, 0x30u);
    }
LABEL_9:
    LOBYTE(v15) = 0;
    return v15;
  }
  *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v14;
  *(_OWORD *)&buf[16] = v14;
  if (!+[VCVideoFeatureListStringHelper findFeatureString:value:valueLength:withPrefix:](VCVideoFeatureListStringHelper, "findFeatureString:value:valueLength:withPrefix:", a3, buf, 32, a4)|| sscanf(buf, "%d/%d,%d/%d", a5, a6, a7, a8) != 4)
  {
    goto LABEL_9;
  }
  LOBYTE(v15) = 1;
  return v15;
}

+ (BOOL)extractAspectRatios:(const char *)a3 landscapeX:(int *)a4 landscapeY:(int *)a5 portraitX:(int *)a6 portraitY:(int *)a7
{
  return +[VCVideoFeatureListStringHelper extractAspectRatios:prefix:landscapeX:landscapeY:portraitX:portraitY:](VCVideoFeatureListStringHelper, "extractAspectRatios:prefix:landscapeX:landscapeY:portraitX:portraitY:", a3, "AR", a4, a5, a6, a7);
}

+ (BOOL)extractExpectedAspectRatios:(const char *)a3 expectedLandscapeX:(int *)a4 expectedLandscapeY:(int *)a5 expectedPortraitX:(int *)a6 expectedPortraitY:(int *)a7
{
  return +[VCVideoFeatureListStringHelper extractAspectRatios:prefix:landscapeX:landscapeY:portraitX:portraitY:](VCVideoFeatureListStringHelper, "extractAspectRatios:prefix:landscapeX:landscapeY:portraitX:portraitY:", a3, "XR", a4, a5, a6, a7);
}

+ (id)extractKeyAndValueStringFromFeatureString:(id)a3 prefix:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(";"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v14;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v14 != v8)
      objc_enumerationMutation(v5);
    v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
    if ((objc_msgSend(v10, "hasPrefix:", a4) & 1) != 0)
      return v10;
    if (v7 == ++v9)
    {
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

+ (int)defaultPayload:(__CFDictionary *)a3
{
  CFIndex Count;
  size_t v5;
  CFNumberRef *v6;
  int result;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  Count = CFDictionaryGetCount(a3);
  if (Count)
  {
    v5 = 8 * Count;
    v6 = (CFNumberRef *)((char *)&v8 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
    memset(v6, 170, 8 * Count);
    memset(v6, 170, v5);
    CFDictionaryGetKeysAndValues(a3, (const void **)v6, (const void **)v6);
    HIDWORD(v8) = 128;
    if (!CFNumberGetValue(*v6, kCFNumberIntType, (char *)&v8 + 4) || (result = HIDWORD(v8), HIDWORD(v8) == 128))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          +[VCVideoFeatureListStringHelper defaultPayload:].cold.2();
      }
      return 128;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCVideoFeatureListStringHelper defaultPayload:].cold.1();
    }
    return 128;
  }
  return result;
}

+ (BOOL)featureListString:(char *)a3 maxSize:(int64_t)a4 payload:(int)a5 featureListStrings:(__CFDictionary *)a6
{
  CFNumberRef v9;
  const __CFString *Value;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  NSObject *v15;
  int valuePtr;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  valuePtr = a5;
  if (!a3 || !a6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v13)
        return v13;
      *(_DWORD *)buf = 136316162;
      v19 = v14;
      v20 = 2080;
      v21 = "+[VCVideoFeatureListStringHelper featureListString:maxSize:payload:featureListStrings:]";
      v22 = 1024;
      v23 = 394;
      v24 = 2048;
      v25 = a6;
      v26 = 2080;
      v27 = a3;
      _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid parameter(s): featureListStrings=%p, featureListString=%s", buf, 0x30u);
    }
    LOBYTE(v13) = 0;
    return v13;
  }
  v9 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
  Value = (const __CFString *)CFDictionaryGetValue(a6, v9);
  CFRelease(v9);
  if (CFStringGetCString(Value, a3, a4, 0x8000100u) && *a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v19 = v11;
        v20 = 2080;
        v21 = "+[VCVideoFeatureListStringHelper featureListString:maxSize:payload:featureListStrings:]";
        v22 = 1024;
        v23 = 403;
        v24 = 2080;
        v25 = a3;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Selected %s", buf, 0x26u);
      }
    }
    LOBYTE(v13) = 1;
  }
  else
  {
    LOBYTE(v13) = 0;
    *a3 = 0;
  }
  return v13;
}

+ (id)newScreenFeatureString
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("FLS;VRAE:0;SW:1;"),
               &unk_1E9EF6C38,
               CFSTR("FLS;SW:1;"),
               &unk_1E9EF6C20,
               0);
}

+ (id)newFeatureListStringsDictForGroupID:(unsigned int)a3 isOneToOne:(BOOL)a4
{
  uint64_t v4;
  uint64_t v6;

  if (a3 != 1935897189)
  {
    if (a3 == 1718909044)
    {
      v4 = 100;
      return +[VCVideoFeatureListStringHelper newEmptyFeatureStringWithPayload:](VCVideoFeatureListStringHelper, "newEmptyFeatureStringWithPayload:", v4, a4);
    }
    if (a3 == 1667329399)
    {
      v4 = 123;
      return +[VCVideoFeatureListStringHelper newEmptyFeatureStringWithPayload:](VCVideoFeatureListStringHelper, "newEmptyFeatureStringWithPayload:", v4, a4);
    }
    if (a4)
      v6 = 1;
    else
      v6 = 2;
    return +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:](VCVideoFeatureListStringHelper, "newLocalFeaturesStringWithType:", v6);
  }
  if (a4)
  {
    v6 = 6;
    return +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:](VCVideoFeatureListStringHelper, "newLocalFeaturesStringWithType:", v6);
  }
  return +[VCVideoFeatureListStringHelper newScreenFeatureString](VCVideoFeatureListStringHelper, "newScreenFeatureString");
}

+ (BOOL)isResizePIPSupportedInFeatureListString:(id)a3
{
  BOOL v4;

  v4 = +[VCVideoFeatureListStringHelper findFeatureString:value:valueLength:withPrefix:](VCVideoFeatureListStringHelper, "findFeatureString:value:valueLength:withPrefix:", objc_msgSend(a3, "UTF8String"), 0, 0, "PR");
  return v4 | +[VCVideoFeatureListStringHelper findFeatureString:value:valueLength:withPrefix:](VCVideoFeatureListStringHelper, "findFeatureString:value:valueLength:withPrefix:", objc_msgSend(a3, "UTF8String"), 0, 0, "FLS2");
}

+ (void)hardwareSettingsModeFromFeatureListStringType:.cold.1()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "+[VCVideoFeatureListStringHelper hardwareSettingsModeFromFeatureListStringType:]";
  v6 = 1024;
  v7 = 50;
  v8 = 1024;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unexpected featureListStringType=%hhu", v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

+ (void)defaultPayload:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d featureListStrings is empty", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)defaultPayload:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retrieve fist payload from featureListStrings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
