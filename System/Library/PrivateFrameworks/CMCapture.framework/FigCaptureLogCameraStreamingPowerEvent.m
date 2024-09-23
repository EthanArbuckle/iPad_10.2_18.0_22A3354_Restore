@implementation FigCaptureLogCameraStreamingPowerEvent

void __FigCaptureLogCameraStreamingPowerEvent_block_invoke(uint64_t a1)
{
  unint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  CFComparisonResult v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  int v25;
  void *v26;
  float v27;
  float v28;
  float v29;
  uint64_t v30;
  float v31;
  float v32;
  float v33;
  void *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const void *v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  do
    v2 = __ldxr((unint64_t *)&sPendingPowerEventsCount);
  while (__stxr(v2 - 1, (unint64_t *)&sPendingPowerEventsCount));
  v4 = *(unsigned int *)(a1 + 56);
  v3 = *(_DWORD *)(a1 + 60);
  v5 = *(unsigned __int8 *)(a1 + 104);
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_DWORD *)(a1 + 64);
  v9 = *(unsigned __int8 *)(a1 + 105);
  v10 = *(unsigned __int8 *)(a1 + 106);
  v11 = *(unsigned __int8 *)(a1 + 107);
  v12 = figCapturePowerLoggingCameraTypeForPortTypeAndDeviceType(*(const __CFString **)(a1 + 40), v3);
  v42 = v7;
  v41 = v9;
  if ((objc_msgSend(v6, "isEqualToString:", 0x1E493D838) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", 0x1E493D538))
  {
    if (v10)
      v13 = (v3 != 14) | 2u;
    else
      v13 = v3 != 14;
  }
  else
  {
    v13 = 0;
  }
  v14 = (void *)MEMORY[0x1E0C99E08];
  v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v5);
  v16 = (void *)objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v15, CFSTR("Streaming"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12), CFSTR("CameraType"), 0);
  if ((_DWORD)v5)
  {
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4), CFSTR("PID"));
    if (v11)
    {
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 68)), CFSTR("PixelFormatIsTenBit"));
      LODWORD(v18) = *(_DWORD *)(a1 + 72);
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18), CFSTR("MaximumSupportedFrameRate"));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 76)), CFSTR("SecondaryInterFrameReferenceEnabled"));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 80)), CFSTR("SensorWidth"));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 84)), CFSTR("SensorHeight"));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 88)), CFSTR("VideoCaptureWidth"));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 92)), CFSTR("VideoCaptureHeight"));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 96)), CFSTR("BackgroundBlurEnabled"));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 97)), CFSTR("StudioLightingEnabled"));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 98)), CFSTR("ReactionEffectsEnabled"));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 99)), CFSTR("BackgroundReplacementEnabled"));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 100)), CFSTR("CenterStageEnabled"));
    }
    if (v6)
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v6, CFSTR("ApplicationID"));
  }
  else
  {
    LODWORD(v17) = v8;
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17), CFSTR("AverageFramerate"));
    if (sCameraStillImageCaptureCounts)
    {
      v40 = v13;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v19 = (void *)objc_msgSend((id)sCameraStillImageCaptureCounts, "allKeys");
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v44 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
            v25 = objc_msgSend((id)objc_msgSend((id)sCameraStillImageCaptureCounts, "objectForKeyedSubscript:", v24), "intValue");
            v26 = (void *)MEMORY[0x1E0CB37E8];
            v27 = (float)v25;
            v28 = log10f((float)v25);
            v29 = __exp10f((float)(int)(vcvtms_s32_f32(v28) - 1));
            v30 = objc_msgSend(v26, "numberWithInt:", (int)(float)(v29 * roundf(v27 / v29)));
            objc_msgSend((id)sCameraStillImageCaptureCounts, "setObject:forKeyedSubscript:", v30, v24);
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        }
        while (v21);
      }
      v31 = (float)sCameraStillImageDeferredProcessingCaptureCounts;
      v32 = log10f((float)sCameraStillImageDeferredProcessingCaptureCounts);
      v33 = __exp10f((float)(int)(vcvtms_s32_f32(v32) - 1));
      sCameraStillImageDeferredProcessingCaptureCounts = (int)(float)(v33 * roundf(v31 / v33));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", sCameraStillImageCaptureCounts), CFSTR("StillImageCaptureCounts"));

      sCameraStillImageCaptureCounts = 0;
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", sCameraStillImageDeferredProcessingCaptureCounts), CFSTR("StillImageDeferredProcessingCount"));
      sCameraStillImageDeferredProcessingCaptureCounts = 0;
      v13 = v40;
    }
  }
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v41), CFSTR("ContinuityCameraIsWired"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13), CFSTR("ContinuityCameraType"));
  if (v42)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v42, CFSTR("Timestamp"));
  objc_msgSend((id)sCameraStreamingPowerEventsByPortType, "setObject:forKeyedSubscript:", v16, *(_QWORD *)(a1 + 40));
  cpls_logCameraStreamingPowerEvents((void *)objc_msgSend((id)sCameraStreamingPowerEventsByPortType, "allValues"));
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", 0x1E493D4D8) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", 0x1E493D5F8))
  {
    v34 = cpls_portTypesReportedStreamingForCameraApp();
    v35 = *(unsigned __int8 *)(a1 + 104);
    v36 = objc_msgSend(v34, "count");
    v37 = v36;
    if (v35)
    {
      if (*(_BYTE *)(a1 + 104))
      {
        if (v36 != 1)
          goto LABEL_36;
LABEL_33:
        -[FigCapturePowerLogMissingCameraStopEventObserver startObserving](sMissingCameraStopEventObserver);
        goto LABEL_36;
      }
      v38 = objc_msgSend(v34, "count");
      if (v37 == 1)
        goto LABEL_33;
      if (v38)
        goto LABEL_36;
    }
    else if (v36)
    {
      goto LABEL_36;
    }
    -[FigCapturePowerLogMissingCameraStopEventObserver stopObserving](sMissingCameraStopEventObserver);
  }
LABEL_36:
  v39 = *(const void **)(a1 + 32);
  if (v39)
    CFRelease(v39);
}

@end
