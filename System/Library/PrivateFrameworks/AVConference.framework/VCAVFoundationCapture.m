@implementation VCAVFoundationCapture

- (id)cameraFormatForWidthWithList:(int)a3 height:(int)a4 frameRate:(int)a5 formatList:(id)a6
{
  uint64_t v7;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  int lastClientRequestedFrameRate;
  CMVideoDimensions Dimensions;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  float v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  BOOL v39;
  uint64_t v40;
  id v41;
  int v42;
  int v43;
  id obj;
  _QWORD v45[2];
  uint8_t buf[24];
  int v47;
  __int16 v48;
  _BYTE v49[10];
  _BYTE v50[6];
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;

  v7 = *(_QWORD *)&a5;
  v63 = *MEMORY[0x1E0C80C00];
  obj = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = a3;
  v43 = a4;
  v59 = 0u;
  v60 = 0u;
  v11 = (double)a3 / (double)a4;
  v61 = 0u;
  v62 = 0u;
  v12 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v59, v58, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v60 != v14)
          objc_enumerationMutation(a6);
        v16 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        if (-[VCAVFoundationCapture hasRequiredAttributes:](self, "hasRequiredAttributes:", v16))
        {
          if (!(_DWORD)v7)
            goto LABEL_13;
          memset(buf, 170, sizeof(buf));
          v17 = v7;
          if (self->_effectsApplied)
          {
            lastClientRequestedFrameRate = self->_lastClientRequestedFrameRate;
            if (lastClientRequestedFrameRate <= (int)v7)
              v17 = v7;
            else
              v17 = lastClientRequestedFrameRate;
          }
          -[VCAVFoundationCapture frameDurationForVideoDeviceFormat:frameRate:](self, "frameDurationForVideoDeviceFormat:frameRate:", v16, v17);
          if ((buf[12] & 1) != 0)
          {
LABEL_13:
            Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v16, "formatDescription"));
            if (Dimensions.width == v42 && Dimensions.height == a4)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
              {
                v21 = VRTraceErrorLogLevelToCSTR();
                v22 = *MEMORY[0x1E0CF2758];
                v23 = *MEMORY[0x1E0CF2758];
                if (*MEMORY[0x1E0CF2748])
                {
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315906;
                    *(_QWORD *)&buf[4] = v21;
                    *(_WORD *)&buf[12] = 2080;
                    *(_QWORD *)&buf[14] = "-[VCAVFoundationCapture cameraFormatForWidthWithList:height:frameRate:formatList:]";
                    *(_WORD *)&buf[22] = 1024;
                    v47 = 2878;
                    v48 = 2112;
                    *(_QWORD *)v49 = v16;
                    _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Perfect match format=%@", buf, 0x26u);
                  }
                }
                else if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315906;
                  *(_QWORD *)&buf[4] = v21;
                  *(_WORD *)&buf[12] = 2080;
                  *(_QWORD *)&buf[14] = "-[VCAVFoundationCapture cameraFormatForWidthWithList:height:frameRate:formatList:]";
                  *(_WORD *)&buf[22] = 1024;
                  v47 = 2878;
                  v48 = 2112;
                  *(_QWORD *)v49 = v16;
                  _os_log_debug_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Perfect match format=%@", buf, 0x26u);
                }
              }
              objc_msgSend(v41, "addObject:", v16);
            }
            objc_msgSend(obj, "addObject:", v16);
          }
        }
      }
      v13 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v59, v58, 16);
    }
    while (v13);
  }
  *(double *)&v45[1] = v11;
  v45[0] = self;
  if (objc_msgSend(v41, "count"))
  {
    objc_msgSend(v41, "sortUsingFunction:context:", _VCAVFoundationCapture_compare, v45);
    v24 = (void *)objc_msgSend(v41, "firstObject");
  }
  else
  {
    objc_msgSend(obj, "sortUsingFunction:context:", _VCAVFoundationCapture_compare, v45);
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
    if (v28)
    {
      v29 = v28;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v40 = *(_QWORD *)v55;
      v33 = v11;
      do
      {
        v34 = 0;
        v24 = v30;
        v35 = v31;
        do
        {
          if (*(_QWORD *)v55 != v40)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v34);
          v31 = _VCAVFoundationCapture_effectiveResolution(v30, v33);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            v36 = VRTraceErrorLogLevelToCSTR();
            v37 = *MEMORY[0x1E0CF2758];
            v38 = *MEMORY[0x1E0CF2758];
            if (*MEMORY[0x1E0CF2748])
            {
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136316162;
                *(_QWORD *)&buf[4] = v36;
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "-[VCAVFoundationCapture cameraFormatForWidthWithList:height:frameRate:formatList:]";
                *(_WORD *)&buf[22] = 1024;
                v47 = 2898;
                v48 = 2112;
                *(_QWORD *)v49 = v30;
                *(_WORD *)&v49[8] = 1024;
                *(_DWORD *)v50 = v31 == v35;
                _os_log_impl(&dword_1D8A54000, v37, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d format %@. sameTierToPrevious = %d", buf, 0x2Cu);
              }
            }
            else if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136316162;
              *(_QWORD *)&buf[4] = v36;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "-[VCAVFoundationCapture cameraFormatForWidthWithList:height:frameRate:formatList:]";
              *(_WORD *)&buf[22] = 1024;
              v47 = 2898;
              v48 = 2112;
              *(_QWORD *)v49 = v30;
              *(_WORD *)&v49[8] = 1024;
              *(_DWORD *)v50 = v31 == v35;
              _os_log_debug_impl(&dword_1D8A54000, v37, OS_LOG_TYPE_DEBUG, " [%s] %s:%d format %@. sameTierToPrevious = %d", buf, 0x2Cu);
            }
          }
          if (v31 == v35)
          {
            v30 = v24;
          }
          else
          {
            v39 = v32 >= v43 * (uint64_t)v42;
            v32 = v31;
            if (v39)
              goto LABEL_30;
          }
          ++v34;
          v24 = v30;
          v35 = v31;
        }
        while (v29 != v34);
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
        v24 = v30;
      }
      while (v29);
    }
    else
    {
      v24 = 0;
    }
  }
LABEL_30:

  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCaptureDeviceFormat-cameraFormatForWidth");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAVFoundationCapture cameraFormatForWidthWithList:height:frameRate:formatList:]";
      *(_WORD *)&buf[22] = 1024;
      v47 = 2913;
      v48 = 1024;
      *(_DWORD *)v49 = v42;
      *(_WORD *)&v49[4] = 1024;
      *(_DWORD *)&v49[6] = v43;
      *(_WORD *)v50 = 1024;
      *(_DWORD *)&v50[2] = v7;
      v51 = 2112;
      v52 = v24;
      _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCaptureDeviceFormat-cameraFormatForWidth width=%d height=%d frameRate=%d cameraFormat=%@", buf, 0x38u);
    }
  }
  return v24;
}

- (BOOL)hasRequiredAttributes:(id)a3
{
  FourCharCode MediaSubType;
  int v7;
  int captureSIFRPreferredOverride;
  uint64_t v10;
  NSObject *v11;
  int v12;
  NSString *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend(a3, "formatDescription"));
  v7 = !self->_deviceSupportVideoEffects && MediaSubType == 875704438;
  if (self->_deviceSupportVideoEffects && MediaSubType == 875704438)
    v7 = +[VCAVFoundationCapture captureDeviceformatSupportsVideoEffects:](VCAVFoundationCapture, "captureDeviceformatSupportsVideoEffects:", a3);
  captureSIFRPreferredOverride = self->_captureSIFRPreferredOverride;
  switch(captureSIFRPreferredOverride)
  {
    case 0:
      goto LABEL_22;
    case 2:
      v7 &= objc_msgSend(a3, "isVideoHDRSupported") ^ 1;
      break;
    case 1:
      v7 &= objc_msgSend(a3, "isVideoHDRSupported");
      break;
    default:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = self->_captureSIFRPreferredOverride;
          v15 = 136315906;
          v16 = v10;
          v17 = 2080;
          v18 = "-[VCAVFoundationCapture hasRequiredAttributes:]";
          v19 = 1024;
          v20 = 2787;
          v21 = 1024;
          v22 = v12;
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unknown default value %d, do not overwrite capture SIFR preference", (uint8_t *)&v15, 0x22u);
        }
      }
      break;
  }
  if (self->_captureSIFRPreferredOverride != 2)
  {
LABEL_22:
    v13 = -[AVCaptureDevice deviceType](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "deviceType");
    if (v13 == (NSString *)*MEMORY[0x1E0C89F90]
      && !objc_msgSend((id)objc_msgSend(a3, "supportedDepthDataFormats"), "count"))
    {
      v7 = 0;
    }
  }
  if (self->_captureFormatNonBinOnlyOverride)
    return v7 & ~objc_msgSend(a3, "isVideoBinned");
  return v7;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDurationForVideoDeviceFormat:(SEL)a3 frameRate:(id)a4
{
  uint64_t v5;
  void *v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[24];
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v5 = *(_QWORD *)&a5;
  v28 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = (void *)objc_msgSend(a4, "videoSupportedFrameRateRanges");
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
  if (result)
  {
    v9 = result;
    v10 = *(_QWORD *)v25;
    v11 = (double)(int)v5;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v10)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v12);
      objc_msgSend(v13, "minFrameRate");
      if (v14 + -1.0 <= v11)
      {
        result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)objc_msgSend(v13, "maxFrameRate");
        if (v15 + 1.0 >= v11)
          break;
      }
      if (v9 == ($3CC8671D27C23BF42ADDB32F2B5E48AE *)++v12)
      {
        result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
        v9 = result;
        if (result)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
    if (!v13)
      goto LABEL_13;
    objc_msgSend(v13, "minFrameRate");
    v17 = v16;
    objc_msgSend(v13, "maxFrameRate");
    v19 = v18;
    objc_msgSend(v13, "minFrameDuration");
    objc_msgSend(v13, "maxFrameDuration");
    return +[VCAVFoundationCapture frameDurationForFrameRateRangeWithMinFrameRate:maxFrameRate:minFrameDuration:maxFrameDuration:desiredFrameRate:](VCAVFoundationCapture, "frameDurationForFrameRateRangeWithMinFrameRate:maxFrameRate:minFrameDuration:maxFrameDuration:desiredFrameRate:", v22, &v21, v5, v17, v19);
  }
  else
  {
LABEL_13:
    v20 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
    retstr->var3 = *(_QWORD *)(v20 + 16);
  }
  return result;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDurationForFrameRateRangeWithMinFrameRate:(SEL)a3 maxFrameRate:(double)a4 minFrameDuration:(double)a5 maxFrameDuration:(id *)a6 desiredFrameRate:(id *)a7
{
  double v12;
  float v14;
  float v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  int64_t var3;
  double v18;
  double v19;
  uint64_t v21;

  v12 = a4;
  v14 = a4;
  v15 = a5;
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)VCMU_CompareWithAccuracy(v14, v15, 0.0001);
  if ((_DWORD)result)
    goto LABEL_2;
  v18 = (double)a8;
  if ((double)a8 < v12
    || (result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)VCMU_CompareWithAccuracy(v14, (float)a8, 0.1), (_DWORD)result))
  {
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&a7->var0;
    var3 = a7->var3;
    goto LABEL_6;
  }
  if (v18 > a5
    || (result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)VCMU_CompareWithAccuracy(v15, (float)a8, 0.1),
        (result & 1) != 0))
  {
LABEL_2:
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&a6->var0;
    var3 = a6->var3;
LABEL_6:
    retstr->var3 = var3;
    return result;
  }
  do
  {
    v19 = v12;
    v12 = v12 + 1.0;
  }
  while (v19 <= a5 + -1.0 && v12 <= v18);
  if (v19 == 0.0)
  {
    v21 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
    var3 = *(_QWORD *)(v21 + 16);
    goto LABEL_6;
  }
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, llround((double)a6->var1 / v19 * 10.0), 10 * a6->var1);
}

uint64_t __60__VCAVFoundationCapture_processReactionStatus_oldReactions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setReactionActive:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)isPortraitResolutionCaptureActive
{
  return 0;
}

- (void)initializeOutputs
{
  -[VCAVFoundationCapture initializeVideoCaptureOutput](self, "initializeVideoCaptureOutput");
  -[VCAVFoundationCapture initializeMetadataOutput](self, "initializeMetadataOutput");
  -[VCAVFoundationCapture resetDepthDataOutput](self, "resetDepthDataOutput");
}

- (void)initializeVideoCaptureOutput
{
  AVCaptureVideoDataOutput *v3;
  uint64_t v4;
  NSObject *v5;
  AVCaptureVideoDataOutput *videoCaptureOutput;
  char *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  AVCaptureVideoDataOutput *v15;
  __int16 v16;
  char *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = +[VCAVFoundationCapture newVideoCaptureOutput](VCAVFoundationCapture, "newVideoCaptureOutput");
  self->_videoCaptureOutput = v3;
  -[AVCaptureVideoDataOutput setAllLossyVideoCVPixelFormatTypesEnabled:](v3, "setAllLossyVideoCVPixelFormatTypesEnabled:", 1);
  v18 = *MEMORY[0x1E0CA9040];
  v19[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_capturePixelFormat);
  -[AVCaptureVideoDataOutput setVideoSettings:](self->_videoCaptureOutput, "setVideoSettings:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1));
  -[AVCaptureVideoDataOutput setAlwaysDiscardsLateVideoFrames:](self->_videoCaptureOutput, "setAlwaysDiscardsLateVideoFrames:", 1);
  -[VCAVFoundationCapture setVideoCaptureOutputDelegate](self, "setVideoCaptureOutputDelegate");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      videoCaptureOutput = self->_videoCaptureOutput;
      v7 = FourccToCStr(self->_capturePixelFormat);
      v8 = 136316162;
      v9 = v4;
      v10 = 2080;
      v11 = "-[VCAVFoundationCapture initializeVideoCaptureOutput]";
      v12 = 1024;
      v13 = 550;
      v14 = 2112;
      v15 = videoCaptureOutput;
      v16 = 2080;
      v17 = v7;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _captureSession addOutput=%@ pixelFormat=%s", (uint8_t *)&v8, 0x30u);
    }
  }
  -[AVCaptureSession addOutput:](self->_captureSession, "addOutput:", self->_videoCaptureOutput);
  -[VCAVFoundationCapture applyVideoRetainedBufferCountHint](self, "applyVideoRetainedBufferCountHint");
  -[VCAVFoundationCapture configCaptureConnectionForDevice:](self, "configCaptureConnectionForDevice:", -[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"));
}

- (void)setVideoCaptureOutputDelegate
{
  _BOOL4 useAVConferenced;
  int ErrorLogLevelForModule;
  uint64_t v5;
  NSObject *v6;
  OS_dispatch_queue *captureSessionQueue;
  uint64_t v8;
  NSObject *v9;
  AVCaptureVideoDataOutput *videoCaptureOutput;
  VCAVFoundationCapture *v11;
  OS_dispatch_queue *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  OS_dispatch_queue *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_isServerProcess)
  {
    useAVConferenced = self->_useAVConferenced;
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (useAVConferenced)
    {
      if (ErrorLogLevelForModule > 6)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          captureSessionQueue = self->_captureSessionQueue;
          v13 = 136315906;
          v14 = v5;
          v15 = 2080;
          v16 = "-[VCAVFoundationCapture setVideoCaptureOutputDelegate]";
          v17 = 1024;
          v18 = 505;
          v19 = 2048;
          v20 = captureSessionQueue;
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _captureSessionQueue=%p", (uint8_t *)&v13, 0x26u);
        }
      }
      videoCaptureOutput = self->_videoCaptureOutput;
      v12 = self->_captureSessionQueue;
      v11 = self;
    }
    else
    {
      if (ErrorLogLevelForModule >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v13 = 136315650;
          v14 = v8;
          v15 = 2080;
          v16 = "-[VCAVFoundationCapture setVideoCaptureOutputDelegate]";
          v17 = 1024;
          v18 = 508;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d setSampleBufferDelegate queue is set to nil.", (uint8_t *)&v13, 0x1Cu);
        }
      }
      videoCaptureOutput = self->_videoCaptureOutput;
      v11 = self;
      v12 = 0;
    }
    -[AVCaptureVideoDataOutput setSampleBufferDelegate:queue:](videoCaptureOutput, "setSampleBufferDelegate:queue:", v11, v12);
  }
  else
  {
    -[AVCaptureVideoDataOutput setSampleBufferDelegate:queue:](self->_videoCaptureOutput, "setSampleBufferDelegate:queue:", 0, 0);
  }
}

- (void)initializeMetadataOutput
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Cannot add metadata output to the capture session.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)resetDepthDataOutput
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  AVCaptureDepthDataOutput *depthDataOutput;
  uint64_t v7;
  NSObject *v8;
  AVCaptureDepthDataOutput *v9;
  AVCaptureDepthDataOutput *v10;
  _BOOL4 v11;
  int ErrorLogLevelForModule;
  uint64_t v13;
  NSObject *v14;
  AVCaptureDepthDataOutput *v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _WORD v25[17];

  *(_QWORD *)&v25[13] = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[VCAVFoundationCapture shouldAddDepthData](self, "shouldAddDepthData");
      depthDataOutput = self->_depthDataOutput;
      v18 = 136316162;
      v19 = v3;
      v20 = 2080;
      v21 = "-[VCAVFoundationCapture resetDepthDataOutput]";
      v22 = 1024;
      v23 = 561;
      v24 = 1024;
      *(_DWORD *)v25 = v5;
      v25[2] = 2048;
      *(_QWORD *)&v25[3] = depthDataOutput;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d shouldAddDepthData=%d, _depthDataOutput=%p", (uint8_t *)&v18, 0x2Cu);
    }
  }
  if (!-[VCAVFoundationCapture shouldAddDepthData](self, "shouldAddDepthData") && self->_depthDataOutput)
  {
    if (-[NSArray containsObject:](-[AVCaptureSession outputs](self->_captureSession, "outputs"), "containsObject:", self->_depthDataOutput))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v9 = self->_depthDataOutput;
          v18 = 136315906;
          v19 = v7;
          v20 = 2080;
          v21 = "-[VCAVFoundationCapture resetDepthDataOutput]";
          v22 = 1024;
          v23 = 566;
          v24 = 2112;
          *(_QWORD *)v25 = v9;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _captureSession removeOutput _depthDataOutput=%@", (uint8_t *)&v18, 0x26u);
        }
      }
      -[AVCaptureSession removeOutput:](self->_captureSession, "removeOutput:", self->_depthDataOutput);
    }

    self->_depthDataOutput = 0;
  }
  if (-[VCAVFoundationCapture shouldAddDepthData](self, "shouldAddDepthData") && !self->_depthDataOutput)
  {
    v10 = (AVCaptureDepthDataOutput *)objc_alloc_init(MEMORY[0x1E0C8B098]);
    self->_depthDataOutput = v10;
    v11 = -[AVCaptureSession canAddOutput:](self->_captureSession, "canAddOutput:", v10);
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v11)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v15 = self->_depthDataOutput;
          v18 = 136315906;
          v19 = v13;
          v20 = 2080;
          v21 = "-[VCAVFoundationCapture resetDepthDataOutput]";
          v22 = 1024;
          v23 = 577;
          v24 = 2112;
          *(_QWORD *)v25 = v15;
          _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _captureSession addOutput _depthDataOutput=%@", (uint8_t *)&v18, 0x26u);
        }
      }
      -[AVCaptureSession addOutput:](self->_captureSession, "addOutput:", self->_depthDataOutput);
      -[AVCaptureDepthDataOutput setAlwaysDiscardsLateDepthData:](self->_depthDataOutput, "setAlwaysDiscardsLateDepthData:", 1);
      -[AVCaptureDepthDataOutput setFilteringEnabled:](self->_depthDataOutput, "setFilteringEnabled:", 0);
      -[VCAVFoundationCapture configureCaptureDeviceDepthFormat](self, "configureCaptureDeviceDepthFormat");
    }
    else
    {
      if (ErrorLogLevelForModule >= 5)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v18 = 136315650;
          v19 = v16;
          v20 = 2080;
          v21 = "-[VCAVFoundationCapture resetDepthDataOutput]";
          v22 = 1024;
          v23 = 583;
          _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Cannot add depth data output", (uint8_t *)&v18, 0x1Cu);
        }
      }

      self->_depthDataOutput = 0;
    }
  }
}

- (BOOL)shouldAddDepthData
{
  NSString *v3;

  v3 = -[AVCaptureDevice deviceType](self->_captureDevice, "deviceType");
  return v3 == (NSString *)*MEMORY[0x1E0C89F90] && !self->_cframingEnabled;
}

- (void)configureMetadataTypesForOutput:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = (void *)objc_msgSend(a3, "availableMetadataObjectTypes");
    v6 = (void *)objc_opt_new();
    v7 = *MEMORY[0x1E0C8AA68];
    if (objc_msgSend(v5, "containsObject:", *MEMORY[0x1E0C8AA68])
      && -[VCAVFoundationCapture shouldAddTrackedFacesData](self, "shouldAddTrackedFacesData"))
    {
      objc_msgSend(v6, "addObject:", v7);
    }
    v8 = *MEMORY[0x1E0C8AA38];
    if (objc_msgSend(v5, "containsObject:", *MEMORY[0x1E0C8AA38]))
      objc_msgSend(v6, "addObject:", v8);
    if (objc_msgSend(v6, "count"))
      objc_msgSend(a3, "setMetadataObjectTypes:", v6);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315906;
        v12 = v9;
        v13 = 2080;
        v14 = "-[VCAVFoundationCapture configureMetadataTypesForOutput:]";
        v15 = 1024;
        v16 = 623;
        v17 = 2112;
        v18 = v6;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d setMetadataObjectTypes %@", (uint8_t *)&v11, 0x26u);
      }
    }

  }
}

- (BOOL)shouldAddTrackedFacesData
{
  NSString *v3;

  v3 = -[AVCaptureDevice deviceType](self->_captureDevice, "deviceType");
  return v3 == (NSString *)*MEMORY[0x1E0C89F90] && !self->_cframingEnabled;
}

- (void)setMetaDataObjectsDelegate
{
  uint64_t v3;
  NSObject *v4;
  OS_dispatch_queue *captureSessionQueue;
  AVCaptureMetadataOutput *metadataOutput;
  VCAVFoundationCapture *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  OS_dispatch_queue *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_isServerProcess)
  {
    metadataOutput = self->_metadataOutput;
    v7 = 0;
LABEL_8:
    -[AVCaptureMetadataOutput setMetadataObjectsDelegate:queue:](metadataOutput, "setMetadataObjectsDelegate:queue:", v7, 0);
    return;
  }
  if (!self->_useAVConferenced)
  {
    metadataOutput = self->_metadataOutput;
    v7 = self;
    goto LABEL_8;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      captureSessionQueue = self->_captureSessionQueue;
      v8 = 136315906;
      v9 = v3;
      v10 = 2080;
      v11 = "-[VCAVFoundationCapture setMetaDataObjectsDelegate]";
      v12 = 1024;
      v13 = 631;
      v14 = 2048;
      v15 = captureSessionQueue;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _captureSessionQueue=%p", (uint8_t *)&v8, 0x26u);
    }
  }
  -[AVCaptureMetadataOutput setMetadataObjectsDelegate:queue:](self->_metadataOutput, "setMetadataObjectsDelegate:queue:", self, self->_captureSessionQueue);
}

+ (id)newVideoCaptureOutput
{
  _BOOL4 v2;
  Class *v3;

  v2 = -[VCDefaults useVirtualCapture](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "useVirtualCapture");
  v3 = (Class *)&off_1E9E4D6B0;
  if (!v2)
    v3 = (Class *)0x1E0C8B168;
  return objc_alloc_init(*v3);
}

+ (id)newVideoDeviceInput:(id)a3 error:(id *)a4
{
  _BOOL4 v6;
  Class *v7;

  v6 = -[VCDefaults useVirtualCapture](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "useVirtualCapture");
  v7 = (Class *)off_1E9E4D6A8;
  if (!v6)
    v7 = (Class *)0x1E0C8B0B0;
  return (id)objc_msgSend(objc_alloc(*v7), "initWithDevice:error:", a3, a4);
}

- (void)captureSessionNotification:(id)a3
{
  NSObject *captureSessionQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (-[VCVideoCapture captureServer](self, "captureServer"))
  {
    captureSessionQueue = self->_captureSessionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__VCAVFoundationCapture_captureSessionNotification___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = a3;
    block[5] = self;
    dispatch_async(captureSessionQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAVFoundationCapture captureSessionNotification:].cold.1();
  }
}

- (void)applyVideoRetainedBufferCountHint
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  int *v16;
  AVCaptureSession *captureSession;
  AVCaptureVideoDataOutput *videoCaptureOutput;
  int v19;
  uint64_t v20;
  NSObject *v21;
  __int128 v22;
  void *v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  AVCaptureSession *v32;
  __int16 v33;
  AVCaptureVideoDataOutput *v34;
  __int16 v35;
  int v36;
  _BYTE v37[128];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (+[VCHardwareSettings retainPixelBufferForMediaRecordingEnabled](VCHardwareSettings, "retainPixelBufferForMediaRecordingEnabled"))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v3 = (void *)-[AVCaptureVideoDataOutput connections](self->_videoCaptureOutput, "connections");
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
    if (v4)
    {
      v6 = v4;
      v7 = *(_QWORD *)v39;
      v8 = &OBJC_IVAR___VCCallSession_packetLossRate;
      *(_QWORD *)&v5 = 136316418;
      v22 = v5;
      v23 = v3;
      do
      {
        v9 = 0;
        v24 = v6;
        do
        {
          if (*(_QWORD *)v39 != v7)
            objc_enumerationMutation(v3);
          v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v9);
          if (objc_msgSend(v10, "isVideoRetainedBufferCountHintSupported", v22, v23))
          {
            v11 = *(_DWORD *)((char *)&self->super.super.isa + v8[419]);
            -[VCVideoCapture captureServer](self, "captureServer");
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v12 = -[VCVideoCaptureServer bestCameraCaptureFrameRate](-[VCVideoCapture captureServer](self, "captureServer"), "bestCameraCaptureFrameRate");
              if (v12 > v11)
                v11 = v12;
            }
            objc_msgSend(v10, "setVideoRetainedBufferCountHint:", (3 * v11));
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v13 = VRTraceErrorLogLevelToCSTR();
              v14 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                v15 = v7;
                v16 = v8;
                captureSession = self->_captureSession;
                videoCaptureOutput = self->_videoCaptureOutput;
                v19 = objc_msgSend(v10, "videoRetainedBufferCountHint");
                *(_DWORD *)buf = v22;
                v26 = v13;
                v27 = 2080;
                v28 = "-[VCAVFoundationCapture applyVideoRetainedBufferCountHint]";
                v29 = 1024;
                v30 = 533;
                v31 = 2112;
                v32 = captureSession;
                v8 = v16;
                v7 = v15;
                v6 = v24;
                v33 = 2112;
                v34 = videoCaptureOutput;
                v3 = v23;
                v35 = 1024;
                v36 = v19;
                _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _captureSession=%@ videoCaptureOutput=%@ videoRetainedBufferCountHint=%d", buf, 0x36u);
              }
            }
          }
          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
      }
      while (v6);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v26 = v20;
      v27 = 2080;
      v28 = "-[VCAVFoundationCapture applyVideoRetainedBufferCountHint]";
      v29 = 1024;
      v30 = 523;
      _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoRetainedBufferCountHint is not supported on this platform", buf, 0x1Cu);
    }
  }
}

void __37__VCAVFoundationCapture_startPreview__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 337))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -2146893775;
  }
  else
  {
    *(_BYTE *)(v2 + 337) = 1;
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    v4 = (os_log_t *)MEMORY[0x1E0CF2758];
    if (ErrorLogLevelForModule >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315650;
        v10 = v5;
        v11 = 2080;
        v12 = "-[VCAVFoundationCapture startPreview]_block_invoke";
        v13 = 1024;
        v14 = 1381;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _captureSession startRunning", (uint8_t *)&v9, 0x1Cu);
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "startRunning");
    *(double *)(*(_QWORD *)(a1 + 32) + 288) = micro();
    objc_msgSend(*(id *)(a1 + 32), "unlockAVCaptureDeviceInputForConfiguration");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315650;
        v10 = v7;
        v11 = 2080;
        v12 = "-[VCAVFoundationCapture startPreview]_block_invoke";
        v13 = 1024;
        v14 = 1385;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v9, 0x1Cu);
      }
    }
  }
}

- (void)unlockAVCaptureDeviceInputForConfiguration
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 avCaptureDeviceInputLocked;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      avCaptureDeviceInputLocked = self->_avCaptureDeviceInputLocked;
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCAVFoundationCapture unlockAVCaptureDeviceInputForConfiguration]";
      v10 = 1024;
      v11 = 2382;
      v12 = 1024;
      v13 = avCaptureDeviceInputLocked;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unlock AVCaptureInputDevice for configuration, _avCaptureDeviceInputLocked=%d", (uint8_t *)&v6, 0x22u);
    }
  }
  if (self->_avCaptureDeviceInputLocked)
  {
    -[AVCaptureDevice unlockForConfiguration](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "unlockForConfiguration");
    self->_avCaptureDeviceInputLocked = 0;
  }
}

- (void)lockAVCaptureDeviceInputForConfiguration
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCaptureInputDevice lockForConfiguration failed, _avCaptureDeviceInputLocked=%d", v2, v3, v4, 2376);
  OUTLINED_FUNCTION_3();
}

uint64_t __38__VCAVFoundationCapture_setFrameRate___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "getMaxAllowedFrameRate:", *(unsigned int *)(a1 + 48));
  result = objc_msgSend(*(id *)(a1 + 32), "setFrameRateInternal:forceSourceFrameRateDidChange:");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 268) = *(_DWORD *)(a1 + 52);
  return result;
}

- (void)setCameraZoomFactor:(double)a3
{
  AVCaptureDeviceInput **p_videoDeviceInput;
  double v6;
  double v7;
  double v8;

  if (-[VCAVFoundationCapture isBackCamera](self, "isBackCamera"))
  {
    p_videoDeviceInput = &self->_videoDeviceInput;
    if (-[AVCaptureDevice lockForConfiguration:](-[AVCaptureDeviceInput device](*p_videoDeviceInput, "device"), "lockForConfiguration:", 0))
    {
      -[AVCaptureDeviceFormat videoMaxZoomFactor](-[AVCaptureDevice activeFormat](-[AVCaptureDeviceInput device](*p_videoDeviceInput, "device"), "activeFormat"), "videoMaxZoomFactor");
      v7 = 1.0;
      if (a3 >= 1.0)
        v7 = a3;
      if (v6 >= v7)
        v8 = v7;
      else
        v8 = v6;
      -[AVCaptureDevice setVideoZoomFactor:](-[AVCaptureDeviceInput device](*p_videoDeviceInput, "device"), "setVideoZoomFactor:", v8);
      -[AVCaptureDevice unlockForConfiguration](-[AVCaptureDeviceInput device](*p_videoDeviceInput, "device"), "unlockForConfiguration");
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAVFoundationCapture setCameraZoomFactor:].cold.1();
    }
  }
}

- (int)setFrameRateInternal:(int)a3 forceSourceFrameRateDidChange:(BOOL)a4
{
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v7;
  NSObject *v8;
  AVCaptureDeviceFormat *v9;
  int v10;
  int activeFrameRate;
  AVCaptureDevice *v12;
  AVCaptureDevice *v13;
  uint64_t v14;
  NSObject *v15;
  _BYTE v17[24];
  uint64_t v18;
  _BYTE buf[24];
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  AVCaptureDeviceFormat *v24;
  uint64_t v25;

  v4 = *(_QWORD *)&a3;
  v25 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  if (a3 <= 0)
  {
    v10 = -2146893823;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAVFoundationCapture setFrameRateInternal:forceSourceFrameRateDidChange:].cold.1();
    }
  }
  else
  {
    v5 = a4;
    if (-[AVCaptureDevice lockForConfiguration:](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "lockForConfiguration:", &v18))
    {
      memset(v17, 170, sizeof(v17));
      -[VCAVFoundationCapture frameDurationForVideoDeviceFormat:frameRate:](self, "frameDurationForVideoDeviceFormat:frameRate:", -[AVCaptureDevice activeFormat](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "activeFormat"), v4);
      if ((v17[12] & 1) != 0)
      {
        activeFrameRate = self->_activeFrameRate;
        self->_activeFrameRate = v4;
        v12 = -[AVCaptureDeviceInput device](self->_videoDeviceInput, "device");
        *(_OWORD *)buf = *(_OWORD *)v17;
        *(_QWORD *)&buf[16] = *(_QWORD *)&v17[16];
        -[AVCaptureDevice setActiveVideoMaxFrameDuration:](v12, "setActiveVideoMaxFrameDuration:", buf);
        v13 = -[AVCaptureDeviceInput device](self->_videoDeviceInput, "device");
        *(_OWORD *)buf = *(_OWORD *)v17;
        *(_QWORD *)&buf[16] = *(_QWORD *)&v17[16];
        -[AVCaptureDevice setActiveVideoMinFrameDuration:](v13, "setActiveVideoMinFrameDuration:", buf);
        -[VCAVFoundationCapture setCaptureDeviceMinFrameRateIfNeeded:](self, "setCaptureDeviceMinFrameRateIfNeeded:", v4);
        -[AVCaptureDevice unlockForConfiguration](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "unlockForConfiguration");
        if (activeFrameRate != (_DWORD)v4 || v5)
          -[VCVideoCaptureServer sourceFrameRateDidChange:](-[VCVideoCapture captureServer](self, "captureServer"), "sourceFrameRateDidChange:", v4);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v14 = VRTraceErrorLogLevelToCSTR();
          v15 = *MEMORY[0x1E0CF2758];
          v10 = 0;
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            return v10;
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = v14;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCAVFoundationCapture setFrameRateInternal:forceSourceFrameRateDidChange:]";
          *(_WORD *)&buf[22] = 1024;
          v20 = 1558;
          v21 = 1024;
          v22 = v4;
          _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Frame rate set to %d", buf, 0x22u);
        }
        return 0;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v9 = -[AVCaptureDevice activeFormat](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "activeFormat");
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v7;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCAVFoundationCapture setFrameRateInternal:forceSourceFrameRateDidChange:]";
          *(_WORD *)&buf[22] = 1024;
          v20 = 1561;
          v21 = 1024;
          v22 = v4;
          v23 = 2112;
          v24 = v9;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Frame rate %d is not found in format %@ active ", buf, 0x2Cu);
        }
      }
      -[AVCaptureDevice unlockForConfiguration](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "unlockForConfiguration");
      return -2146893820;
    }
    else
    {
      v10 = -2146893818;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          -[VCAVFoundationCapture setFrameRateInternal:forceSourceFrameRateDidChange:].cold.2();
          return -2146893818;
        }
      }
    }
  }
  return v10;
}

- (void)updateCameraZoomCapability
{
  _BOOL8 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = -[VCAVFoundationCapture isBackCamera](self, "isBackCamera");
  v4 = 0.0;
  v5 = 0.0;
  if (v3)
  {
    -[AVCaptureDevice videoZoomFactor](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "videoZoomFactor");
    v4 = v6;
    -[AVCaptureDeviceFormat videoMaxZoomFactor](-[AVCaptureDevice activeFormat](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "activeFormat"), "videoMaxZoomFactor");
    v5 = v7;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136316418;
      v11 = v8;
      v12 = 2080;
      v13 = "-[VCAVFoundationCapture updateCameraZoomCapability]";
      v14 = 1024;
      v15 = 2290;
      v16 = 1024;
      v17 = v3;
      v18 = 2048;
      v19 = v4;
      v20 = 2048;
      v21 = v5;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d cameraZoomAvailable=%d, currentZoomFactor=%f, maxZoomFactor=%f", (uint8_t *)&v10, 0x36u);
    }
  }
  -[VCVideoCaptureServer setCameraZoomAvailable:currentZoomFactor:maxZoomFactor:](-[VCVideoCapture captureServer](self, "captureServer"), "setCameraZoomAvailable:currentZoomFactor:maxZoomFactor:", v3, v4, v5);
}

- (BOOL)isBackCamera
{
  return -[VCAVFoundationCapture captureDevicePosition](self, "captureDevicePosition") == 1;
}

- (void)configureCaptureDeviceDepthFormat
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retain lock for capture deivce %@");
  OUTLINED_FUNCTION_3();
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  __CVBuffer *ImageBuffer;
  __IOSurface *IOSurface;
  NSObject *captureSessionQueue;
  _QWORD v11[7];
  CMTime v12;
  CMTime time;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  CFRetain(a4);
  ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  memset(&v12, 170, sizeof(v12));
  CMSampleBufferGetPresentationTimeStamp(&v12, a4);
  IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
  if (IOSurface)
    IOSurfaceGetID(IOSurface);
  time = v12;
  CMTimeGetSeconds(&time);
  kdebug_trace();
  if (self->_useAVConferenced)
  {
    _VCAVFoundationCapture_ProcessSampleBufferWithCaptureOutput((CVImageBufferRef)self, a4, a3);
    FigSampleBufferRelease();
  }
  else
  {
    captureSessionQueue = self->_captureSessionQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __76__VCAVFoundationCapture_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke;
    v11[3] = &unk_1E9E53820;
    v11[5] = a3;
    v11[6] = a4;
    v11[4] = self;
    dispatch_async(captureSessionQueue, v11);
  }
}

- (int64_t)captureDevicePosition
{
  return -[AVCaptureDevice position](self->_captureDevice, "position");
}

- (void)updateDepthFrameRate
{
  unsigned int v3;
  uint64_t *v4;
  uint64_t v5;
  _QWORD *v6;
  AVCaptureDevice *captureDevice;
  uint64_t v8;
  NSObject *v9;
  AVCaptureDevice *v10;
  Float64 Seconds;
  CMTime v12;
  _QWORD v13[3];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  Float64 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = !self->_faceMeshTrackingEnabled;
  v4 = (uint64_t *)(MEMORY[0x1E0CA2E30] + 16);
  if (self->_faceMeshTrackingEnabled)
    v4 = (uint64_t *)(MEMORY[0x1E0CA2E18] + 16);
  v5 = *v4;
  if (self->_faceMeshTrackingEnabled)
    v6 = (_QWORD *)MEMORY[0x1E0CA2E18];
  else
    v6 = (_QWORD *)MEMORY[0x1E0CA2E30];
  captureDevice = self->_captureDevice;
  v13[0] = *v6;
  v13[1] = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v3), 0x1FuLL)), *(int8x8_t *)(MEMORY[0x1E0CA2E30] + 8), *(int8x8_t *)(MEMORY[0x1E0CA2E18] + 8));
  v13[2] = v5;
  -[AVCaptureDevice setActiveDepthDataMinFrameDuration:](captureDevice, "setActiveDepthDataMinFrameDuration:", v13);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_captureDevice;
      if (v10)
        -[AVCaptureDevice activeDepthDataMinFrameDuration](v10, "activeDepthDataMinFrameDuration");
      else
        memset(&v12, 0, sizeof(v12));
      Seconds = CMTimeGetSeconds(&v12);
      *(_DWORD *)buf = 136315906;
      v15 = v8;
      v16 = 2080;
      v17 = "-[VCAVFoundationCapture updateDepthFrameRate]";
      v18 = 1024;
      v19 = 2338;
      v20 = 2048;
      v21 = Seconds;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting depth frame rate to %f", buf, 0x26u);
    }
  }
}

- (int)frameBecameAvailableCount:(int *)a3 figBufferQueueEmptyCount:(int *)a4 figBufferQueueErrorCount:(int *)a5
{
  NSObject *captureSessionQueue;
  _QWORD block[9];

  block[8] = *MEMORY[0x1E0C80C00];
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__VCAVFoundationCapture_frameBecameAvailableCount_figBufferQueueEmptyCount_figBufferQueueErrorCount___block_invoke;
  block[3] = &unk_1E9E556E0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  dispatch_sync(captureSessionQueue, block);
  return 0;
}

- (int)frameCount:(BOOL)a3
{
  NSObject *captureSessionQueue;
  int v4;
  _QWORD v6[6];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__VCAVFoundationCapture_frameCount___block_invoke;
  v6[3] = &unk_1E9E56258;
  v6[4] = self;
  v6[5] = &v8;
  v7 = a3;
  dispatch_sync(captureSessionQueue, v6);
  v4 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v4;
}

+ (id)newCaptureSession
{
  id v3;

  if (-[VCDefaults useVirtualCapture](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "useVirtualCapture"))
  {
    return objc_alloc_init(VCVirtualAVCaptureSession);
  }
  v3 = objc_alloc_init(MEMORY[0x1E0C8B108]);
  AVCaptureSessionSetAuthorizedToUseCameraInMultipleForegroundAppLayout();
  return v3;
}

- (int)startPreview
{
  NSObject *captureSessionQueue;
  int v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__VCAVFoundationCapture_startPreview__block_invoke;
  block[3] = &unk_1E9E522B0;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(captureSessionQueue, block);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)setFrameRate:(int)a3
{
  int lastClientRequestedFrameRate;
  NSObject *captureSessionQueue;
  int v5;
  _QWORD v7[6];
  int v8;
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  lastClientRequestedFrameRate = a3;
  if (self->_effectsApplied)
    lastClientRequestedFrameRate = self->_lastClientRequestedFrameRate;
  captureSessionQueue = self->_captureSessionQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__VCAVFoundationCapture_setFrameRate___block_invoke;
  v7[3] = &unk_1E9E55810;
  v7[4] = self;
  v7[5] = &v10;
  v8 = a3;
  v9 = lastClientRequestedFrameRate;
  dispatch_sync(captureSessionQueue, v7);
  v5 = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v5;
}

- (void)resetViewPointLogging
{
  self->_VPCProcessedFrameCount = 0;
  self->_VPCModifiedFrameCount = 0;
  self->_viewpointProcessTime = 0.0;
}

- (void)setUpBackgroundBlurObserver:(BOOL)a3
{
  _BOOL4 v3;
  int isBackgroundBlurActive;
  AVCaptureDevice *captureDevice;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BYTE v24[10];
  VCAVFoundationCapture *v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v3 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  isBackgroundBlurActive = self->_isBackgroundBlurActive;
  if (isBackgroundBlurActive != -[AVCaptureDevice isBackgroundBlurActive](self->_captureDevice, "isBackgroundBlurActive"))
  {
    -[VCVideoCapture captureServer](self, "captureServer");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[VCVideoCaptureServer portraitBlurEnabledDidChange:](-[VCVideoCapture captureServer](self, "captureServer"), "portraitBlurEnabledDidChange:", -[AVCaptureDevice isBackgroundBlurActive](self->_captureDevice, "isBackgroundBlurActive"));
  }
  self->_isBackgroundBlurActive = -[AVCaptureDevice isBackgroundBlurActive](self->_captureDevice, "isBackgroundBlurActive");
  captureDevice = self->_captureDevice;
  if (v3)
    -[AVCaptureDevice addObserver:forKeyPath:options:context:](captureDevice, "addObserver:forKeyPath:options:context:", self, CFSTR("backgroundBlurActive"), 1, self);
  else
    -[AVCaptureDevice removeObserver:forKeyPath:context:](captureDevice, "removeObserver:forKeyPath:context:", self, CFSTR("backgroundBlurActive"), self);
  if ((VCAVFoundationCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = self->_isBackgroundBlurActive;
        v17 = 136316162;
        v18 = v8;
        v19 = 2080;
        v20 = "-[VCAVFoundationCapture setUpBackgroundBlurObserver:]";
        v21 = 1024;
        v22 = 2527;
        v23 = 1024;
        *(_DWORD *)v24 = v10;
        *(_WORD *)&v24[4] = 1024;
        *(_DWORD *)&v24[6] = v3;
        v11 = " [%s] %s:%d _isBackgroundBlurActive=%d, observe=%d";
        v12 = v9;
        v13 = 40;
LABEL_17:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCAVFoundationCapture performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = self->_isBackgroundBlurActive;
        v17 = 136316674;
        v18 = v14;
        v19 = 2080;
        v20 = "-[VCAVFoundationCapture setUpBackgroundBlurObserver:]";
        v21 = 1024;
        v22 = 2527;
        v23 = 2112;
        *(_QWORD *)v24 = v7;
        *(_WORD *)&v24[8] = 2048;
        v25 = self;
        v26 = 1024;
        v27 = v16;
        v28 = 1024;
        v29 = v3;
        v11 = " [%s] %s:%d %@(%p) _isBackgroundBlurActive=%d, observe=%d";
        v12 = v15;
        v13 = 60;
        goto LABEL_17;
      }
    }
  }
}

- (int)getMaxAllowedFrameRate:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  AVCaptureDevice *v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v3 = *(_QWORD *)&a3;
  v31 = *MEMORY[0x1E0C80C00];
  if (self->_effectsApplied)
  {
    if (a3 >= 0x10 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = 136316162;
        v20 = v5;
        v21 = 2080;
        v22 = "-[VCAVFoundationCapture getMaxAllowedFrameRate:]";
        v23 = 1024;
        v24 = 1598;
        v25 = 1024;
        v26 = 15;
        v27 = 2080;
        v28 = "Effect";
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d framerate throttled to %3d by %-20s", (uint8_t *)&v19, 0x2Cu);
      }
    }
    if ((int)v3 >= 15)
      v3 = 15;
    else
      v3 = v3;
  }
  if (self->_deviceSupportCinematicFraming && v3 >= 0x1F && self->_cframingEnabled)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    {
      v3 = 30;
    }
    else
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      v3 = 30;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = 136316162;
        v20 = v7;
        v21 = 2080;
        v22 = "-[VCAVFoundationCapture getMaxAllowedFrameRate:]";
        v23 = 1024;
        v24 = 1607;
        v25 = 1024;
        v26 = 30;
        v27 = 2080;
        v28 = "Center Stage";
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d framerate throttled to %3d by %-20s", (uint8_t *)&v19, 0x2Cu);
      }
    }
  }
  if (-[AVCaptureDevice isBackgroundBlurActive](self->_captureDevice, "isBackgroundBlurActive"))
  {
    v9 = +[VCHardwareSettings maxFrameRateSupportedBackgroundBlur](VCHardwareSettings, "maxFrameRateSupportedBackgroundBlur");
    if (v3 > v9)
    {
      v10 = v9;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v19 = 136316162;
          v20 = v11;
          v21 = 2080;
          v22 = "-[VCAVFoundationCapture getMaxAllowedFrameRate:]";
          v23 = 1024;
          v24 = 1617;
          v25 = 1024;
          v26 = v10;
          v27 = 2080;
          v28 = "Blur";
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d framerate throttled to %3d by %-20s", (uint8_t *)&v19, 0x2Cu);
        }
      }
      if (v3 >= v10)
        v3 = v10;
      else
        v3 = v3;
    }
  }
  v13 = -[VCAVFoundationCapture getSupportedMaxDeviceFrameRateWithFrameRateCap:](self, "getSupportedMaxDeviceFrameRateWithFrameRateCap:", v3);
  if (v13 < 1)
    return v3;
  v14 = v13;
  if (v13 >= (int)v3)
    return v3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = -[AVCaptureDeviceInput device](self->_videoDeviceInput, "device");
      v19 = 136316418;
      v20 = v15;
      v21 = 2080;
      v22 = "-[VCAVFoundationCapture getMaxAllowedFrameRate:]";
      v23 = 1024;
      v24 = 1625;
      v25 = 1024;
      v26 = v3;
      v27 = 2112;
      v28 = (const char *)v17;
      v29 = 1024;
      v30 = v14;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d frameRate=%d is not supported by device=%@. Using frameRate=%d instead", (uint8_t *)&v19, 0x32u);
    }
  }
  return v14;
}

- (int)getSupportedMaxDeviceFrameRateWithFrameRateCap:(int)a3
{
  int v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  double v14;
  int v15;
  double v16;
  id obj;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = -[VCAVFoundationCapture getCaptureFormatList](self, "getCaptureFormatList");
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
  v5 = 0;
  if (v19)
  {
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (-[VCAVFoundationCapture hasRequiredAttributes:](self, "hasRequiredAttributes:", v7))
        {
          v24 = 0u;
          v25 = 0u;
          v22 = 0u;
          v23 = 0u;
          v8 = (void *)objc_msgSend(v7, "videoSupportedFrameRateRanges");
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v23;
            while (2)
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v23 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
                objc_msgSend(v13, "minFrameRate");
                v15 = (int)v14;
                objc_msgSend(v13, "maxFrameRate");
                if (v15 <= a3)
                {
                  if ((int)v16 >= a3)
                    return a3;
                  if (v5 <= (int)v16)
                    v5 = (int)v16;
                }
              }
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
              if (v10)
                continue;
              break;
            }
          }
        }
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
    }
    while (v19);
  }
  return v5;
}

- (id)getCaptureFormatList
{
  return -[AVCaptureDevice formats](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "formats");
}

- (int)setVideoDeviceToSelectedDevice:(id)a3
{
  int v3;
  uint64_t v6;
  NSObject *v7;
  AVCaptureDeviceInput *videoDeviceInput;
  void **p_cache;
  AVCaptureDeviceInput *v10;
  AVCaptureDeviceInput *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  char *v24;
  os_log_t *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  NSObject *v31;
  AVCaptureDeviceInput *v32;
  _BOOL4 deviceSupportVideoEffects;
  _BOOL8 v34;
  uint64_t v35;
  NSObject *v36;
  _BOOL4 needCenterStageMetadataForViewpointCorrection;
  _BOOL4 viewPointCorrectionEnabled;
  char *__lasts;
  char *__str;
  uint64_t v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  _BYTE v50[10];
  _QWORD v51[3];
  _BYTE v52[128];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[5];

  v57[2] = *MEMORY[0x1E0C80C00];
  v3 = -2146893792;
  if (!a3)
    return -2146893823;
  -[AVCaptureSession beginConfiguration](self->_captureSession, "beginConfiguration");
  if (self->_videoDeviceInput)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        videoDeviceInput = self->_videoDeviceInput;
        *(_DWORD *)buf = 136315906;
        v44 = v6;
        v45 = 2080;
        v46 = "-[VCAVFoundationCapture setVideoDeviceToSelectedDevice:]";
        v47 = 1024;
        v48 = 2398;
        v49 = 2112;
        *(_QWORD *)v50 = videoDeviceInput;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _captureSession removeInput:%@", buf, 0x26u);
      }
    }
    -[VCAVFoundationCapture unlockAVCaptureDeviceInputForConfiguration](self, "unlockAVCaptureDeviceInputForConfiguration");
    -[AVCaptureSession removeInput:](self->_captureSession, "removeInput:", self->_videoDeviceInput);
    self->_videoDeviceInput = 0;
  }
  v42 = 0;
  p_cache = AVCQoSMonitor.cache;
  v10 = +[VCAVFoundationCapture newVideoDeviceInput:error:](VCAVFoundationCapture, "newVideoDeviceInput:error:", a3, &v42);
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAVFoundationCapture setVideoDeviceToSelectedDevice:].cold.1();
    }
    goto LABEL_46;
  }
  v11 = v10;
  if ((objc_msgSend(a3, "supportsAVCaptureSessionPreset:", -[AVCaptureSession sessionPreset](self->_captureSession, "sessionPreset")) & 1) == 0)
  {
    v12 = *MEMORY[0x1E0C8A198];
    v57[0] = *MEMORY[0x1E0C8A178];
    v57[1] = v12;
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v52, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v54;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v54 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
          if (objc_msgSend(a3, "supportsAVCaptureSessionPreset:", v18))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v19 = VRTraceErrorLogLevelToCSTR();
              v20 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                v44 = v19;
                v45 = 2080;
                v46 = "-[VCAVFoundationCapture setVideoDeviceToSelectedDevice:]";
                v47 = 1024;
                v48 = 2412;
                v49 = 2112;
                *(_QWORD *)v50 = v18;
                _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _captureSession setSessionPreset=%@", buf, 0x26u);
              }
            }
            -[AVCaptureSession setSessionPreset:](self->_captureSession, "setSessionPreset:", v18);
            p_cache = (void **)(AVCQoSMonitor + 16);
            goto LABEL_26;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v52, 16);
        p_cache = (void **)(AVCQoSMonitor + 16);
        if (v15)
          continue;
        break;
      }
    }
  }
LABEL_26:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v44 = v21;
      v45 = 2080;
      v46 = "-[VCAVFoundationCapture setVideoDeviceToSelectedDevice:]";
      v47 = 1024;
      v48 = 2418;
      v49 = 2112;
      *(_QWORD *)v50 = v11;
      _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _captureSession addInput:%@", buf, 0x26u);
    }
  }
  -[AVCaptureSession addInput:](self->_captureSession, "addInput:", v11);
  self->_videoDeviceInput = v11;
  -[VCAVFoundationCapture lockAVCaptureDeviceInputForConfiguration](self, "lockAVCaptureDeviceInputForConfiguration");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str = 0;
    v23 = -[AVCaptureDevice formats](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "formats")
        ? -[NSString UTF8String](-[NSArray description](-[AVCaptureDevice formats](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "formats"), "description"), "UTF8String"): "<nil>";
    asprintf(&__str, "%s", v23);
    if (__str)
    {
      __lasts = 0;
      v24 = strtok_r(__str, "\n", &__lasts);
      v25 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v26 = VRTraceErrorLogLevelToCSTR();
          v27 = *v25;
          if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v44 = v26;
            v45 = 2080;
            v46 = "-[VCAVFoundationCapture setVideoDeviceToSelectedDevice:]";
            v47 = 1024;
            v48 = 2422;
            v49 = 2080;
            *(_QWORD *)v50 = "AVCaptureDevice:";
            *(_WORD *)&v50[8] = 2080;
            v51[0] = v24;
            _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v24 = strtok_r(0, "\n", &__lasts);
      }
      while (v24);
      free(__str);
      p_cache = AVCQoSMonitor.cache;
    }
  }
  v28 = objc_msgSend(p_cache + 243, "deviceInputSupportsCenterStage:", self->_videoDeviceInput);
  v29 = v28;
  if (self->_deviceSupportCinematicFraming != (_DWORD)v28)
  {
    self->_deviceSupportCinematicFraming = v28;
    -[VCVideoCaptureServer setCFAvailabilityChange:](-[VCVideoCapture captureServer](self, "captureServer"), "setCFAvailabilityChange:", v28);
  }
  self->_deviceSupportVideoEffects = objc_msgSend(p_cache + 243, "deviceInputSupportsVideoEffects:", self->_videoDeviceInput);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v30 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E0CF2758];
    v3 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_46;
    v32 = self->_videoDeviceInput;
    deviceSupportVideoEffects = self->_deviceSupportVideoEffects;
    *(_DWORD *)buf = 136316418;
    v44 = v30;
    v45 = 2080;
    v46 = "-[VCAVFoundationCapture setVideoDeviceToSelectedDevice:]";
    v47 = 1024;
    v48 = 2434;
    v49 = 2112;
    *(_QWORD *)v50 = v32;
    *(_WORD *)&v50[8] = 1024;
    LODWORD(v51[0]) = v29;
    WORD2(v51[0]) = 1024;
    *(_DWORD *)((char *)v51 + 6) = deviceSupportVideoEffects;
    _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Set camera to %@, CFraming support=%d, _deviceSupportVideoEffects=%d", buf, 0x32u);
  }
  v3 = 0;
LABEL_46:
  -[VCAVFoundationCapture configCaptureConnectionForDevice:](self, "configCaptureConnectionForDevice:", -[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"));
  -[VCAVFoundationCapture resetDepthDataOutput](self, "resetDepthDataOutput");
  if (-[AVCaptureDevice isCenterStageMetadataDeliverySupported](self->_captureDevice, "isCenterStageMetadataDeliverySupported"))
  {
    v34 = self->_needCenterStageMetadataForViewpointCorrection && (unint64_t)self->_viewPointCorrectionEnabled;
    -[AVCaptureDevice setCenterStageMetadataDeliveryEnabled:](self->_captureDevice, "setCenterStageMetadataDeliveryEnabled:", v34);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v35 = VRTraceErrorLogLevelToCSTR();
      v36 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        needCenterStageMetadataForViewpointCorrection = self->_needCenterStageMetadataForViewpointCorrection;
        viewPointCorrectionEnabled = self->_viewPointCorrectionEnabled;
        *(_DWORD *)buf = 136316162;
        v44 = v35;
        v45 = 2080;
        v46 = "-[VCAVFoundationCapture setVideoDeviceToSelectedDevice:]";
        v47 = 1024;
        v48 = 2446;
        v49 = 1024;
        *(_DWORD *)v50 = needCenterStageMetadataForViewpointCorrection;
        *(_WORD *)&v50[4] = 1024;
        *(_DWORD *)&v50[6] = viewPointCorrectionEnabled;
        _os_log_impl(&dword_1D8A54000, v36, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _needCenterStageMetadataForViewpointCorrection=%d, _viewPointCorrectionEnabled=%d", buf, 0x28u);
      }
    }
  }
  -[AVCaptureSession commitConfiguration](self->_captureSession, "commitConfiguration");
  -[VCAVFoundationCapture updateCaptureDeviceProperties](self, "updateCaptureDeviceProperties");
  -[VCVideoCapture captureServer](self, "captureServer");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[VCVideoCaptureServer handleCaptureSourcePositionDidChange:](-[VCVideoCapture captureServer](self, "captureServer"), "handleCaptureSourcePositionDidChange:", -[VCAVFoundationCapture isFrontCamera](self, "isFrontCamera"));
  return v3;
}

- (BOOL)isFrontCamera
{
  return (-[VCAVFoundationCapture captureDevicePosition](self, "captureDevicePosition") & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (void)configCaptureConnectionForDevice:(id)a3
{
  uint64_t v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = -[AVCaptureVideoDataOutput connectionWithMediaType:](self->_videoCaptureOutput, "connectionWithMediaType:", *MEMORY[0x1E0C8A808]);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = -[VCAVFoundationCapture videoOrientationForDevice:](self, "videoOrientationForDevice:", a3);
    if (objc_msgSend(v6, "videoOrientation") != v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136315906;
          v13 = v8;
          v14 = 2080;
          v15 = "-[VCAVFoundationCapture configCaptureConnectionForDevice:]";
          v16 = 1024;
          v17 = 3000;
          v18 = 1024;
          v19 = v7;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d orientation=%d", (uint8_t *)&v12, 0x22u);
        }
      }
      objc_msgSend(v6, "setVideoOrientation:", v7);
    }
    objc_msgSend(v6, "setVideoMirrored:", 0);
    if (objc_msgSend(v6, "isCameraIntrinsicMatrixDeliverySupported"))
      objc_msgSend(v6, "setCameraIntrinsicMatrixDeliveryEnabled:", 1);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315650;
      v13 = v10;
      v14 = 2080;
      v15 = "-[VCAVFoundationCapture configCaptureConnectionForDevice:]";
      v16 = 1024;
      v17 = 2986;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d no AVCaptureConnection found, failed to set", (uint8_t *)&v12, 0x1Cu);
    }
  }
}

- (int64_t)videoOrientationForDevice:(id)a3
{
  uint64_t v4;
  int64_t v5;

  v4 = objc_msgSend(a3, "position");
  if (v4)
  {
    v5 = 0xAAAAAAAAAAAAAAAALL;
    if (v4 == 1)
      v5 = 3;
    if (v4 == 2)
      return 4;
    else
      return v5;
  }
  else if (self->_shouldRemoveExtraRotation)
  {
    return 3;
  }
  else
  {
    return 4;
  }
}

- (void)updateCaptureDeviceProperties
{
  self->_supportPortraitResolution = 0;
}

- (int)setCamera:(_VCVideoSourceToken)a3 width:(int)a4 height:(int)a5 frameRate:(int)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  NSString *v15;
  AVCaptureDevice *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  AVCaptureSession *captureSession;
  uint64_t v26;
  NSObject *v27;
  NSString *v28;
  int v30;
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  _BYTE v37[20];
  _BYTE v38[6];
  _BYTE v39[6];
  int v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (a3.var0.var0)
  {
    v8 = *(_QWORD *)&a6;
    v9 = *(_QWORD *)&a5;
    v10 = *(_QWORD *)&a4;
    v11 = (void *)objc_msgSend(+[VCVideoSourceTokenManager sharedManager](VCVideoSourceTokenManager, "sharedManager"), "deviceNameForToken:", a3.var0.var1);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v30 = 136316930;
        v31 = v12;
        v32 = 2080;
        v33 = "-[VCAVFoundationCapture setCamera:width:height:frameRate:]";
        v34 = 1024;
        v35 = 2218;
        v36 = 1024;
        *(_VCVideoSourceToken *)v37 = a3;
        *(_WORD *)&v37[4] = 2112;
        *(_QWORD *)&v37[6] = v11;
        *(_WORD *)&v37[14] = 1024;
        *(_DWORD *)&v37[16] = v10;
        *(_WORD *)v38 = 1024;
        *(_DWORD *)&v38[2] = v9;
        *(_WORD *)v39 = 1024;
        *(_DWORD *)&v39[2] = v8;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sourceToken=0x%x, camera=%@, width=%d, height=%d, frameRate=%d", (uint8_t *)&v30, 0x3Eu);
      }
    }
    v14 = -2146893792;
    if (-[AVCaptureDevice uniqueID](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "uniqueID")
      && (objc_msgSend(v11, "isEqualToString:", -[AVCaptureDevice uniqueID](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "uniqueID")) & 1) != 0)
    {
      return -2146893775;
    }
    else
    {
      v15 = -[AVCaptureDevice uniqueID](self->_captureDevice, "uniqueID");
      if (self->_captureDevice)
      {
        -[VCAVFoundationCapture setUpCaptureDevicePropertyObserver:](self, "setUpCaptureDevicePropertyObserver:", 0);

      }
      v16 = -[VCAVFoundationCapture newCaptureDevice:](self, "newCaptureDevice:", v11);
      self->_captureDevice = v16;
      if (v16)
      {
        if (-[NSString isEqualToString:](v15, "isEqualToString:", v11))
        {
          -[VCAVFoundationCapture setFrameRateInternal:forceSourceFrameRateDidChange:](self, "setFrameRateInternal:forceSourceFrameRateDidChange:", v8, 0);
        }
        else
        {
          v19 = +[VCEffectsManager sharedManager](VCEffectsManager, "sharedManager");
          if (VCEffectsManager_IsEffectsOn((uint64_t)v19))
            objc_msgSend(v19, "flushRemoteQueue");
          -[AVCaptureSession beginConfiguration](self->_captureSession, "beginConfiguration");
          if (-[VCAVFoundationCapture setVideoDeviceToSelectedDevice:](self, "setVideoDeviceToSelectedDevice:", self->_captureDevice))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCAVFoundationCapture setCamera:width:height:frameRate:].cold.2();
            }
          }
          v14 = -[VCAVFoundationCapture setVideoDeviceToWidth:height:frameRate:](self, "setVideoDeviceToWidth:height:frameRate:", v10, v9, v8);
          -[VCAVFoundationCapture configureMetadataTypesForOutput:](self, "configureMetadataTypesForOutput:", self->_metadataOutput);
          v20 = -[VCAVFoundationCapture shouldUseCameraVideoStabilization](self, "shouldUseCameraVideoStabilization");
          -[VCAVFoundationCapture setVideoStabilization:](self, "setVideoStabilization:", v20);
          -[VCAVFoundationCapture setUpVideoZoomFactor](self, "setUpVideoZoomFactor");
          v22 = v21;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v23 = VRTraceErrorLogLevelToCSTR();
            v24 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              captureSession = self->_captureSession;
              v30 = 136317186;
              v31 = v23;
              v32 = 2080;
              v33 = "-[VCAVFoundationCapture setCamera:width:height:frameRate:]";
              v34 = 1024;
              v35 = 2259;
              v36 = 2048;
              *(_QWORD *)v37 = captureSession;
              *(_WORD *)&v37[8] = 2048;
              *(_QWORD *)&v37[10] = v22;
              *(_WORD *)&v37[18] = 1024;
              *(_DWORD *)v38 = v20;
              *(_WORD *)&v38[4] = 1024;
              *(_DWORD *)v39 = v10;
              *(_WORD *)&v39[4] = 1024;
              v40 = v9;
              v41 = 1024;
              v42 = v8;
              _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d captureSession=%p zoomFactor=%f, stabilization=%d, width=%d, height=%d, frameRate=%d", (uint8_t *)&v30, 0x48u);
            }
          }
          -[AVCaptureSession commitConfiguration](self->_captureSession, "commitConfiguration");
        }
        -[VCAVFoundationCapture setUpCaptureDevicePropertyObserver:](self, "setUpCaptureDevicePropertyObserver:", 1);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v26 = VRTraceErrorLogLevelToCSTR();
          v27 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v28 = -[AVCaptureDevice uniqueID](self->_captureDevice, "uniqueID");
            v30 = 136315906;
            v31 = v26;
            v32 = 2080;
            v33 = "-[VCAVFoundationCapture setCamera:width:height:frameRate:]";
            v34 = 1024;
            v35 = 2267;
            v36 = 2112;
            *(_QWORD *)v37 = v28;
            _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Camera is set to %@", (uint8_t *)&v30, 0x26u);
          }
        }
        -[VCAVFoundationCapture updateCameraZoomCapability](self, "updateCameraZoomCapability");
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAVFoundationCapture setCamera:width:height:frameRate:].cold.1();
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v30 = 136315650;
        v31 = v17;
        v32 = 2080;
        v33 = "-[VCAVFoundationCapture setCamera:width:height:frameRate:]";
        v34 = 1024;
        v35 = 2212;
        _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCVideoSourceToken is invalid!", (uint8_t *)&v30, 0x1Cu);
      }
    }
    -[VCVideoCaptureServer handleCaptureEvent:](-[VCVideoCapture captureServer](self, "captureServer"), "handleCaptureEvent:", CFSTR("avCaptureSetCameraWithUIDFail"));
    return -2146893823;
  }
  return v14;
}

- (BOOL)shouldUseCameraVideoStabilization
{
  return -[VCDefaults cameraVideoStablization](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "cameraVideoStablization");
}

- (void)setVideoStabilization:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)-[AVCaptureVideoDataOutput connectionWithMediaType:](self->_videoCaptureOutput, "connectionWithMediaType:", *MEMORY[0x1E0C8A808]);
  if (objc_msgSend(v4, "isVideoStabilizationSupported"))
  {
    objc_msgSend(v4, "setPreferredVideoStabilizationMode:", v3);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315906;
        v8 = v5;
        v9 = 2080;
        v10 = "-[VCAVFoundationCapture setVideoStabilization:]";
        v11 = 1024;
        v12 = 3036;
        v13 = 1024;
        v14 = objc_msgSend(v4, "preferredVideoStabilizationMode");
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d preferred stabilization mode %d", (uint8_t *)&v7, 0x22u);
      }
    }
  }
}

- (int)setVideoDeviceToWidth:(int)a3 height:(int)a4 frameRate:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  BOOL v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  int ErrorLogLevelForModule;
  uint64_t v27;
  NSObject *v28;
  int v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  AVCaptureDevice *v33;
  AVCaptureDevice *v34;
  uint64_t v35;
  NSObject *v36;
  int v37;
  unint64_t Dimensions;
  int32_t v39;
  unint64_t v40;
  uint64_t v42;
  NSObject *v43;
  int activeWidth;
  uint64_t v46;
  _BYTE v47[24];
  _BYTE buf[24];
  int v49;
  __int16 v50;
  _BYTE v51[10];
  __int16 v52;
  int v53;
  __int16 v54;
  _QWORD v55[4];

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  v55[3] = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAVFoundationCapture setVideoDeviceToWidth:height:frameRate:]";
      *(_WORD *)&buf[22] = 1024;
      v49 = 2594;
      v50 = 1024;
      *(_DWORD *)v51 = v7;
      *(_WORD *)&v51[4] = 1024;
      *(_DWORD *)&v51[6] = v6;
      v52 = 1024;
      v53 = v5;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d width=%d, height=%d, frameRate=%d", buf, 0x2Eu);
    }
  }
  -[VCAVFoundationCapture getOptimizedCameraCaptureWidth:height:](self, "getOptimizedCameraCaptureWidth:height:", v7, v6);
  v12 = (int)v11;
  HIDWORD(v46) = (int)v13;
  v14 = -[VCAVFoundationCapture cameraFormatForWidth:height:frameRate:](self, "cameraFormatForWidth:height:frameRate:", (int)v13, v12, -[VCAVFoundationCapture getSupportedMaxDeviceFrameRateWithFrameRateCap:](self, "getSupportedMaxDeviceFrameRateWithFrameRateCap:", v5));
  v15 = -[VCAVFoundationCapture getMaxAllowedFrameRate:](self, "getMaxAllowedFrameRate:", v5);
  if (!v14)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCAVFoundationCapture setVideoDeviceToWidth:height:frameRate:]";
        *(_WORD *)&buf[22] = 1024;
        v49 = 2656;
        v50 = 1024;
        *(_DWORD *)v51 = HIDWORD(v46);
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = v12;
        v52 = 1024;
        v53 = v5;
        _os_log_error_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d camera doesn't support resolution=%dx%d@%d", buf, 0x2Eu);
      }
    }
    goto LABEL_33;
  }
  v16 = v15;
  v17 = -[VCAVFoundationCapture isFrameRateActive:captureFormat:](self, "isFrameRateActive:captureFormat:", v15, v14);
  if (objc_msgSend(v14, "isEqual:", -[AVCaptureDevice activeFormat](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "activeFormat")))v18 = !v17;
  else
    v18 = 1;
  if (!v18)
  {
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (ErrorLogLevelForModule >= 7)
    {
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCAVFoundationCapture setVideoDeviceToWidth:height:frameRate:]";
        *(_WORD *)&buf[22] = 1024;
        v49 = 2613;
        v50 = 2112;
        *(_QWORD *)v51 = v14;
        _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Same device format and frame rate. Skip configuration. cameraFormat=%@", buf, 0x26u);
      }
    }
    self->_activeFrameRate = v16;
    if ((_DWORD)v16 != (_DWORD)v5)
      -[VCVideoCaptureServer sourceFrameRateDidChange:](-[VCVideoCapture captureServer](self, "captureServer"), "sourceFrameRateDidChange:", v16);
    v29 = 0;
    goto LABEL_54;
  }
  memset(v47, 170, sizeof(v47));
  -[VCAVFoundationCapture frameDurationForVideoDeviceFormat:frameRate:](self, "frameDurationForVideoDeviceFormat:frameRate:", v14, v16);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316930;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAVFoundationCapture setVideoDeviceToWidth:height:frameRate:]";
      *(_WORD *)&buf[22] = 1024;
      v49 = 2622;
      v50 = 1024;
      *(_DWORD *)v51 = HIDWORD(v46);
      *(_WORD *)&v51[4] = 1024;
      *(_DWORD *)&v51[6] = v12;
      v52 = 1024;
      v53 = v16;
      v54 = 1024;
      LODWORD(v55[0]) = *(_DWORD *)v47;
      WORD2(v55[0]) = 1024;
      *(_DWORD *)((char *)v55 + 6) = *(_DWORD *)&v47[8];
      _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d for cameraFormat %dx%d/%d, found frameDuration = %d / %d", buf, 0x3Au);
    }
  }
  if (!-[AVCaptureDevice lockForConfiguration:](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "lockForConfiguration:", 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAVFoundationCapture setVideoDeviceToWidth:height:frameRate:].cold.1();
    }
LABEL_33:
    v29 = 0;
LABEL_34:
    if ((int)VRTraceGetErrorLogLevelForModule() > 4)
    {
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (-[AVCaptureDevice activeFormat](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "activeFormat"))
        {
          v32 = (const char *)objc_msgSend((id)-[AVCaptureDeviceFormat description](-[AVCaptureDevice activeFormat](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "activeFormat"), "description"), "UTF8String");
        }
        else
        {
          v32 = "<nil>";
        }
        *(_DWORD *)buf = 136316674;
        *(_QWORD *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCAVFoundationCapture setVideoDeviceToWidth:height:frameRate:]";
        *(_WORD *)&buf[22] = 1024;
        v49 = 2661;
        v50 = 1024;
        *(_DWORD *)v51 = HIDWORD(v46);
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = v12;
        v52 = 1024;
        v53 = v5;
        v54 = 2080;
        v55[0] = v32;
        _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d failed to set video device format to %dx%d/%d. Using format %s", buf, 0x38u);
      }
    }
    goto LABEL_54;
  }
  if (self->_beginCommitConfigForFormatSwitch)
    -[AVCaptureSession beginConfiguration](self->_captureSession, "beginConfiguration");
  -[AVCaptureDevice setActiveFormat:](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "setActiveFormat:", v14);
  LODWORD(v46) = *(_DWORD *)&v47[12];
  if ((v47[12] & 1) != 0)
  {
    v23 = !v17;
    v33 = -[AVCaptureDeviceInput device](self->_videoDeviceInput, "device");
    *(_OWORD *)buf = *(_OWORD *)v47;
    *(_QWORD *)&buf[16] = *(_QWORD *)&v47[16];
    -[AVCaptureDevice setActiveVideoMaxFrameDuration:](v33, "setActiveVideoMaxFrameDuration:", buf);
    v34 = -[AVCaptureDeviceInput device](self->_videoDeviceInput, "device");
    *(_OWORD *)buf = *(_OWORD *)v47;
    *(_QWORD *)&buf[16] = *(_QWORD *)&v47[16];
    -[AVCaptureDevice setActiveVideoMinFrameDuration:](v34, "setActiveVideoMinFrameDuration:", buf);
    -[VCAVFoundationCapture setCaptureDeviceMinFrameRateIfNeeded:](self, "setCaptureDeviceMinFrameRateIfNeeded:", v16);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCAVFoundationCapture setVideoDeviceToWidth:height:frameRate:]";
        *(_WORD *)&buf[22] = 1024;
        v49 = 2639;
        v50 = 1024;
        *(_DWORD *)v51 = HIDWORD(v46);
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = v12;
        v52 = 1024;
        v53 = v16;
        _os_log_error_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_ERROR, " [%s] %s:%d %dx%d/%d, frameRateInRange not found!", buf, 0x2Eu);
      }
    }
    v23 = 0;
  }
  -[VCAVFoundationCapture configureCaptureDeviceDepthFormat](self, "configureCaptureDeviceDepthFormat", v46);
  if (-[AVCaptureDevice isFaceDetectionSupported](self->_captureDevice, "isFaceDetectionSupported"))
    -[AVCaptureDevice setFaceDetectionDrivenImageProcessingEnabled:](self->_captureDevice, "setFaceDetectionDrivenImageProcessingEnabled:", 1);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v35 = VRTraceErrorLogLevelToCSTR();
    v36 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v35;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAVFoundationCapture setVideoDeviceToWidth:height:frameRate:]";
      *(_WORD *)&buf[22] = 1024;
      v49 = 2646;
      v50 = 2112;
      *(_QWORD *)v51 = v14;
      _os_log_impl(&dword_1D8A54000, v36, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d set video device format to %@", buf, 0x26u);
    }
  }
  if ((_DWORD)v16 == (_DWORD)v5)
    v37 = v23;
  else
    v37 = 1;
  if (v37 == 1)
    -[VCVideoCaptureServer sourceFrameRateDidChange:](-[VCVideoCapture captureServer](self, "captureServer"), "sourceFrameRateDidChange:", v16);
  self->_activeFrameRate = v16;
  v29 = 1;
  if ((v46 & 1) == 0)
    goto LABEL_34;
LABEL_54:
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(-[AVCaptureDeviceFormat formatDescription](-[AVCaptureDevice activeFormat](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "activeFormat"), "formatDescription"));
  v39 = Dimensions;
  v40 = HIDWORD(Dimensions);
  *(_QWORD *)&self->_activeWidth = Dimensions;
  if ((int)Dimensions < SHIDWORD(v46) && SHIDWORD(Dimensions) < (int)v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v42 = VRTraceErrorLogLevelToCSTR();
      v43 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        *(_QWORD *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCAVFoundationCapture setVideoDeviceToWidth:height:frameRate:]";
        *(_WORD *)&buf[22] = 1024;
        v49 = 2670;
        v50 = 1024;
        *(_DWORD *)v51 = v39;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = v40;
        v52 = 1024;
        v53 = HIDWORD(v46);
        v54 = 1024;
        LODWORD(v55[0]) = v12;
        _os_log_impl(&dword_1D8A54000, v43, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d video device format resolution (%dx%d) is lower than requested (%dx%d)", buf, 0x34u);
      }
    }
    LODWORD(v40) = self->_activeHeight;
  }
  activeWidth = self->_activeWidth;
  self->_captureSize.width = (double)activeWidth;
  self->_captureSize.height = (double)(int)v40;
  if (self->_requestSize.width == 1088.0
    && self->_requestSize.height == 1088.0
    && activeWidth != 1920
    && (_DWORD)v40 != 1080)
  {
    self->_requestSize = (CGSize)vdupq_n_s64(0x4086800000000000uLL);
  }
  self->_resize = -[VCAVFoundationCapture shouldResizeWithCaptureSize:requestSize:](self, "shouldResizeWithCaptureSize:requestSize:");
  -[VCAVFoundationCapture updateCenterStageRegionOfInterestWithLock:](self, "updateCenterStageRegionOfInterestWithLock:", v29 ^ 1u);
  if (((v29 ^ 1) & 1) == 0)
  {
    if (self->_beginCommitConfigForFormatSwitch)
      -[AVCaptureSession commitConfiguration](self->_captureSession, "commitConfiguration");
    -[AVCaptureDevice unlockForConfiguration](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "unlockForConfiguration");
  }
  return 0;
}

- (void)updateCenterStageRegionOfInterestWithLock:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  NSString *v22;
  uint64_t v23;
  NSRect v24;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_deviceSupportCinematicFraming)
  {
    v3 = a3;
    if (objc_msgSend(MEMORY[0x1E0C8B0A0], "isCenterStageEnabled"))
    {
      if (v3
        && !-[AVCaptureDevice lockForConfiguration:](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "lockForConfiguration:", 0))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAVFoundationCapture updateCenterStageRegionOfInterestWithLock:].cold.1();
        }
      }
      else
      {
        if (self->_resize)
        {
          +[VCAVFoundationCapture calculateRegionOfInterest:requestSize:](VCAVFoundationCapture, "calculateRegionOfInterest:requestSize:", self->_captureSize.width, self->_captureSize.height, self->_requestSize.width, self->_requestSize.height);
          v6 = v5;
          v8 = v7;
          v10 = v9;
          v12 = v11;
        }
        else
        {
          v10 = 1.0;
          v6 = 0.0;
          v8 = 0.0;
          v12 = 1.0;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v13 = VRTraceErrorLogLevelToCSTR();
          v14 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v24.origin.x = v6;
            v24.origin.y = v8;
            v24.size.width = v10;
            v24.size.height = v12;
            v15 = 136315906;
            v16 = v13;
            v17 = 2080;
            v18 = "-[VCAVFoundationCapture updateCenterStageRegionOfInterestWithLock:]";
            v19 = 1024;
            v20 = 813;
            v21 = 2112;
            v22 = NSStringFromRect(v24);
            _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d centerStageRectOfInterest=%@", (uint8_t *)&v15, 0x26u);
          }
        }
        -[AVCaptureDevice setCenterStageRectOfInterest:](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "setCenterStageRectOfInterest:", v6, v8, v10, v12);
        if (v3)
          -[AVCaptureDevice unlockForConfiguration](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "unlockForConfiguration");
      }
    }
  }
}

- (BOOL)shouldResizeWithCaptureSize:(CGSize)a3 requestSize:(CGSize)a4
{
  double height;
  double width;
  CGFloat v6;
  CGFloat v7;
  float v9;
  float v10;
  _BOOL4 v11;
  unint64_t v12;
  unint64_t v13;
  VCImageResizingConverter *v14;
  uint64_t v15;
  NSObject *v16;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BYTE v28[24];
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  height = a4.height;
  width = a4.width;
  v6 = a3.height;
  v7 = a3.width;
  v33 = *MEMORY[0x1E0C80C00];
  v9 = a4.width / a4.height;
  v10 = a3.width / a3.height;
  if (VCMU_CompareWithAccuracy(v9, v10, 0.01)
    || self->_supportPortraitResolution && VCMU_CompareWithAccuracy(v9, 1.0 / v10, 0.01))
  {
    v11 = 0;
LABEL_10:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136316930;
        v22 = v15;
        v23 = 2080;
        v24 = "-[VCAVFoundationCapture shouldResizeWithCaptureSize:requestSize:]";
        v25 = 1024;
        v26 = 778;
        v27 = 1024;
        *(_DWORD *)v28 = v11;
        *(_WORD *)&v28[4] = 2048;
        *(CGFloat *)&v28[6] = v7;
        *(_WORD *)&v28[14] = 2048;
        *(CGFloat *)&v28[16] = v6;
        v29 = 2048;
        v30 = width;
        v31 = 2048;
        v32 = height;
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [AR_TX] Frame Transform resize. shouldResize=%d, catpure=%4.0fx%4.0f, request=%4.0fx%4.0f,", (uint8_t *)&v21, 0x4Au);
      }
    }
    return v11;
  }
  if (-[VCDefaults forceMultiwayHWI](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceMultiwayHWI"))
  {
    v12 = -[VCDefaults forceEncodeWidth](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeWidth");
    v13 = -[VCDefaults forceEncodeHeight](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeHeight");
  }
  else
  {
    v12 = (unint64_t)width;
    v13 = (unint64_t)height;
  }

  v14 = -[VCImageResizingConverter initWithOutputWidth:outputHeight:formatType:]([VCImageResizingConverter alloc], "initWithOutputWidth:outputHeight:formatType:", v12, v13, self->_capturePixelFormat);
  self->_imageResizingConverter = v14;
  if (v14)
  {
    v11 = 1;
    goto LABEL_10;
  }
  if ((VCAVFoundationCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAVFoundationCapture shouldResizeWithCaptureSize:requestSize:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = (const __CFString *)-[VCAVFoundationCapture performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v18 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v21 = 136316162;
        v22 = v19;
        v23 = 2080;
        v24 = "-[VCAVFoundationCapture shouldResizeWithCaptureSize:requestSize:]";
        v25 = 1024;
        v26 = 775;
        v27 = 2112;
        *(_QWORD *)v28 = v18;
        *(_WORD *)&v28[8] = 2048;
        *(_QWORD *)&v28[10] = self;
        _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Allocating VCResizeImageBuffer failed", (uint8_t *)&v21, 0x30u);
      }
    }
  }
  LOBYTE(v11) = 0;
  return v11;
}

- (void)setUpCaptureDevicePropertyObserver:(BOOL)a3
{
  _BOOL8 v3;
  AVCaptureDevice *captureDevice;
  VCAVFoundationCapture *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  _BYTE v23[24];
  __int128 v24;
  VCAVFoundationCapture *v25;
  uint64_t v26;
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  captureDevice = self->_captureDevice;
  v6 = (VCAVFoundationCapture *)objc_opt_class();
  if (captureDevice)
  {
    if (v6 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_16;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      *(_DWORD *)v23 = 136315906;
      *(_QWORD *)&v23[4] = v9;
      *(_WORD *)&v23[12] = 2080;
      *(_QWORD *)&v23[14] = "-[VCAVFoundationCapture setUpCaptureDevicePropertyObserver:]";
      *(_WORD *)&v23[22] = 1024;
      LODWORD(v24) = 2544;
      WORD2(v24) = 1024;
      *(_DWORD *)((char *)&v24 + 6) = v3;
      v11 = " [%s] %s:%d observe=%d";
      v12 = v10;
      v13 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCAVFoundationCapture performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_16;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      *(_DWORD *)v23 = 136316418;
      *(_QWORD *)&v23[4] = v14;
      *(_WORD *)&v23[12] = 2080;
      *(_QWORD *)&v23[14] = "-[VCAVFoundationCapture setUpCaptureDevicePropertyObserver:]";
      *(_WORD *)&v23[22] = 1024;
      LODWORD(v24) = 2544;
      WORD2(v24) = 2112;
      *(_QWORD *)((char *)&v24 + 6) = v7;
      HIWORD(v24) = 2048;
      v25 = self;
      LOWORD(v26) = 1024;
      *(_DWORD *)((char *)&v26 + 2) = v3;
      v11 = " [%s] %s:%d %@(%p) observe=%d";
      v12 = v15;
      v13 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, v23, v13);
LABEL_16:
    -[VCAVFoundationCapture setUpReactionObserver:](self, "setUpReactionObserver:", v3, *(_OWORD *)v23, *(_QWORD *)&v23[16], v24, v25, v26, v27);
    -[VCAVFoundationCapture setUpBackgroundBlurObserver:](self, "setUpBackgroundBlurObserver:", v3);
    return;
  }
  if (v6 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v23 = 136315650;
        *(_QWORD *)&v23[4] = v16;
        *(_WORD *)&v23[12] = 2080;
        *(_QWORD *)&v23[14] = "-[VCAVFoundationCapture setUpCaptureDevicePropertyObserver:]";
        *(_WORD *)&v23[22] = 1024;
        LODWORD(v24) = 2541;
        v18 = " [%s] %s:%d _captureDevice is Null";
        v19 = v17;
        v20 = 28;
LABEL_25:
        _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v18, v23, v20);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCAVFoundationCapture performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v23 = 136316162;
        *(_QWORD *)&v23[4] = v21;
        *(_WORD *)&v23[12] = 2080;
        *(_QWORD *)&v23[14] = "-[VCAVFoundationCapture setUpCaptureDevicePropertyObserver:]";
        *(_WORD *)&v23[22] = 1024;
        LODWORD(v24) = 2541;
        WORD2(v24) = 2112;
        *(_QWORD *)((char *)&v24 + 6) = v8;
        HIWORD(v24) = 2048;
        v25 = self;
        v18 = " [%s] %s:%d %@(%p) _captureDevice is Null";
        v19 = v22;
        v20 = 48;
        goto LABEL_25;
      }
    }
  }
}

- (void)setUpReactionObserver:(BOOL)a3
{
  _BOOL4 v3;
  AVCaptureDevice *captureDevice;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCAVFoundationCapture *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  captureDevice = self->_captureDevice;
  if (a3)
    -[AVCaptureDevice addObserver:forKeyPath:options:context:](captureDevice, "addObserver:forKeyPath:options:context:", self, CFSTR("reactionEffectsInProgress"), 7, self);
  else
    -[AVCaptureDevice removeObserver:forKeyPath:context:](captureDevice, "removeObserver:forKeyPath:context:", self, CFSTR("reactionEffectsInProgress"), self);
  if ((VCAVFoundationCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136316162;
        v15 = v7;
        v16 = 2080;
        v17 = "-[VCAVFoundationCapture setUpReactionObserver:]";
        v18 = 1024;
        v19 = 2536;
        v20 = 2112;
        v21 = CFSTR("reactionEffectsInProgress");
        v22 = 1024;
        LODWORD(v23) = v3;
        v9 = " [%s] %s:%d key=%@, observe=%d";
        v10 = v8;
        v11 = 44;
LABEL_14:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCAVFoundationCapture performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136316674;
        v15 = v12;
        v16 = 2080;
        v17 = "-[VCAVFoundationCapture setUpReactionObserver:]";
        v18 = 1024;
        v19 = 2536;
        v20 = 2112;
        v21 = v6;
        v22 = 2048;
        v23 = self;
        v24 = 2112;
        v25 = CFSTR("reactionEffectsInProgress");
        v26 = 1024;
        v27 = v3;
        v9 = " [%s] %s:%d %@(%p) key=%@, observe=%d";
        v10 = v13;
        v11 = 64;
        goto LABEL_14;
      }
    }
  }
}

- (void)setBufferStatsBuffer:(tagVCVideoBufferStatistics *)a3
{
  self->_statsBuffer = a3;
}

- (id)newCaptureDevice:(id)a3
{
  if (-[VCDefaults useVirtualCapture](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "useVirtualCapture"))
  {
    return -[VCVirtualAVCaptureDevice initWithUniqueID:orientation:]([VCVirtualAVCaptureDevice alloc], "initWithUniqueID:orientation:", a3, self->_orientation);
  }
  else
  {
    return (id)objc_msgSend(MEMORY[0x1E0C8B0A0], "deviceWithUniqueID:", a3);
  }
}

- (BOOL)isFrameRateActive:(int)a3 captureFormat:(id)a4
{
  AVCaptureDevice *v5;
  _BOOL4 v6;
  AVCaptureDevice *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  AVCaptureDevice *v11;
  int v12;
  AVCaptureDevice *v13;
  int v14;
  AVCaptureDevice *v15;
  int v16;
  AVCaptureDevice *v17;
  int v18;
  AVCaptureDevice *v19;
  int v20;
  AVCaptureDevice *v22;
  int v23;
  AVCaptureDevice *v24;
  int v25;
  AVCaptureDevice *v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  CMTime v36;
  CMTime time2;
  CMTime v38;
  CMTime time1;
  int v40;
  __int16 v41;
  _BOOL4 v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  memset(&v38, 170, sizeof(v38));
  if (self)
    -[VCAVFoundationCapture frameDurationForVideoDeviceFormat:frameRate:](self, "frameDurationForVideoDeviceFormat:frameRate:", a4, *(_QWORD *)&a3);
  else
    memset(&v38, 0, sizeof(v38));
  v5 = -[AVCaptureDeviceInput device](self->_videoDeviceInput, "device");
  if (v5)
    -[AVCaptureDevice activeVideoMinFrameDuration](v5, "activeVideoMinFrameDuration");
  else
    memset(&time2, 0, sizeof(time2));
  time1 = v38;
  if (CMTimeCompare(&time1, &time2))
  {
    v6 = 0;
  }
  else
  {
    v7 = -[AVCaptureDeviceInput device](self->_videoDeviceInput, "device");
    if (v7)
      -[AVCaptureDevice activeVideoMaxFrameDuration](v7, "activeVideoMaxFrameDuration");
    else
      memset(&v36, 0, sizeof(v36));
    time1 = v38;
    v6 = CMTimeCompare(&time1, &v36) == 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    v10 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = -[AVCaptureDeviceInput device](self->_videoDeviceInput, "device");
        if (v11)
        {
          -[AVCaptureDevice activeVideoMinFrameDuration](v11, "activeVideoMinFrameDuration");
          v12 = v35;
        }
        else
        {
          v12 = 0;
        }
        v15 = -[AVCaptureDeviceInput device](self->_videoDeviceInput, "device");
        if (v15)
        {
          -[AVCaptureDevice activeVideoMinFrameDuration](v15, "activeVideoMinFrameDuration");
          v16 = v34;
        }
        else
        {
          v16 = 0;
        }
        v17 = -[AVCaptureDeviceInput device](self->_videoDeviceInput, "device");
        if (v17)
        {
          -[AVCaptureDevice activeVideoMaxFrameDuration](v17, "activeVideoMaxFrameDuration");
          v18 = v33;
        }
        else
        {
          v18 = 0;
        }
        v19 = -[AVCaptureDeviceInput device](self->_videoDeviceInput, "device");
        if (v19)
        {
          -[AVCaptureDevice activeVideoMaxFrameDuration](v19, "activeVideoMaxFrameDuration");
          v20 = v32;
        }
        else
        {
          v20 = 0;
        }
        LODWORD(time1.value) = 136316930;
        *(CMTimeValue *)((char *)&time1.value + 4) = v8;
        LOWORD(time1.flags) = 2080;
        *(_QWORD *)((char *)&time1.flags + 2) = "-[VCAVFoundationCapture isFrameRateActive:captureFormat:]";
        HIWORD(time1.epoch) = 1024;
        v40 = 2585;
        v41 = 1024;
        v42 = v6;
        v43 = 1024;
        v44 = v12;
        v45 = 1024;
        v46 = v16;
        v47 = 1024;
        v48 = v18;
        v49 = 1024;
        v50 = v20;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sameFrameDuration=%d, activeVideoMinFrameDuration.value=%d, activeVideoMinFrameDuration.timescale=%d,  activeVideoMaxFrameDuration.value=%d, activeVideoMaxFrameDuration.timescale=%d", (uint8_t *)&time1, 0x3Au);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v13 = -[AVCaptureDeviceInput device](self->_videoDeviceInput, "device");
      if (v13)
      {
        -[AVCaptureDevice activeVideoMinFrameDuration](v13, "activeVideoMinFrameDuration");
        v14 = v31;
      }
      else
      {
        v14 = 0;
      }
      v22 = -[AVCaptureDeviceInput device](self->_videoDeviceInput, "device");
      if (v22)
      {
        -[AVCaptureDevice activeVideoMinFrameDuration](v22, "activeVideoMinFrameDuration");
        v23 = v30;
      }
      else
      {
        v23 = 0;
      }
      v24 = -[AVCaptureDeviceInput device](self->_videoDeviceInput, "device");
      if (v24)
      {
        -[AVCaptureDevice activeVideoMaxFrameDuration](v24, "activeVideoMaxFrameDuration");
        v25 = v29;
      }
      else
      {
        v25 = 0;
      }
      v26 = -[AVCaptureDeviceInput device](self->_videoDeviceInput, "device");
      if (v26)
      {
        -[AVCaptureDevice activeVideoMaxFrameDuration](v26, "activeVideoMaxFrameDuration");
        v27 = v28;
      }
      else
      {
        v27 = 0;
      }
      LODWORD(time1.value) = 136316930;
      *(CMTimeValue *)((char *)&time1.value + 4) = v8;
      LOWORD(time1.flags) = 2080;
      *(_QWORD *)((char *)&time1.flags + 2) = "-[VCAVFoundationCapture isFrameRateActive:captureFormat:]";
      HIWORD(time1.epoch) = 1024;
      v40 = 2585;
      v41 = 1024;
      v42 = v6;
      v43 = 1024;
      v44 = v14;
      v45 = 1024;
      v46 = v23;
      v47 = 1024;
      v48 = v25;
      v49 = 1024;
      v50 = v27;
      _os_log_debug_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEBUG, " [%s] %s:%d sameFrameDuration=%d, activeVideoMinFrameDuration.value=%d, activeVideoMinFrameDuration.timescale=%d,  activeVideoMaxFrameDuration.value=%d, activeVideoMaxFrameDuration.timescale=%d", (uint8_t *)&time1, 0x3Au);
    }
  }
  return v6;
}

- (CGSize)getOptimizedCameraCaptureWidth:(int)a3 height:(int)a4
{
  double v6;
  double v7;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  double v15;
  uint64_t v16;
  NSObject *v17;
  double v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;
  CGSize result;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = (double)a3;
  v7 = (double)a4;
  if (!a3 || !a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_25;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    v19 = 136316162;
    v20 = v9;
    v21 = 2080;
    v22 = "-[VCAVFoundationCapture getOptimizedCameraCaptureWidth:height:]";
    v23 = 1024;
    v24 = 2554;
    v25 = 1024;
    v26 = a3;
    v27 = 1024;
    v28 = a4;
    v11 = " [%s] %s:%d Unexpected request width=%d, height=%d";
    v12 = v10;
    goto LABEL_24;
  }
  if (a3 == a4)
  {
    if (self->_supportPortraitResolution
      && -[VCAVFoundationCapture cameraSupportsNoQueueFormatWidth:height:](self, "cameraSupportsNoQueueFormatWidth:height:", 1552, 1552))
    {
      v6 = 1552.0;
      v7 = 1552.0;
    }
    else if (self->_captureFormatPrefer16By9ForSquare)
    {
      if (a3 == 1088)
        v6 = 1920.0;
      else
        v6 = 1280.0;
      v7 = dbl_1D910D670[a3 == 1088];
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_25;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    v19 = 136316162;
    v20 = v16;
    v21 = 2080;
    v22 = "-[VCAVFoundationCapture getOptimizedCameraCaptureWidth:height:]";
    v23 = 1024;
    v24 = 2570;
    v25 = 1024;
    v26 = (int)v6;
    v27 = 1024;
    v28 = (int)v7;
    v11 = " [%s] %s:%d square video, capture request %dx%d";
    v12 = v17;
LABEL_24:
    _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v19, 0x28u);
LABEL_25:
    v15 = v6;
    goto LABEL_26;
  }
  if (!self->_supportPortraitResolution
    || !-[VCAVFoundationCapture shouldAdjustCaptureWithOrientation:](self, "shouldAdjustCaptureWithOrientation:", self->_orientation))
  {
    goto LABEL_25;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136316162;
      v20 = v13;
      v21 = 2080;
      v22 = "-[VCAVFoundationCapture getOptimizedCameraCaptureWidth:height:]";
      v23 = 1024;
      v24 = 2575;
      v25 = 1024;
      v26 = a4;
      v27 = 1024;
      v28 = a3;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d optimize capture for orientation, request %dx%d instead", (uint8_t *)&v19, 0x28u);
    }
  }
  v15 = v7;
  v7 = v6;
LABEL_26:
  v18 = v7;
  result.height = v18;
  result.width = v15;
  return result;
}

- (id)cameraFormatForWidth:(int)a3 height:(int)a4 frameRate:(int)a5
{
  return -[VCAVFoundationCapture cameraFormatForWidthWithList:height:frameRate:formatList:](self, "cameraFormatForWidthWithList:height:frameRate:formatList:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, -[VCAVFoundationCapture getCaptureFormatList](self, "getCaptureFormatList"));
}

uint64_t __36__VCAVFoundationCapture_frameCount___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 344);
  if (*(_BYTE *)(result + 48))
    *(_DWORD *)(*(_QWORD *)(result + 32) + 344) = 0;
  return result;
}

+ (BOOL)isServerProcess
{
  void *v2;

  v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName");
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("avconferenced")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(v2, "isEqualToString:", CFSTR("mediaserverd"));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v9;
  int isBackgroundBlurActive;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  os_log_t *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("backgroundBlurActive"), a4, a5, a6))
  {
    v9 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    isBackgroundBlurActive = self->_isBackgroundBlurActive;
    if (isBackgroundBlurActive != objc_msgSend(v9, "BOOLValue"))
    {
      -[VCVideoCapture captureServer](self, "captureServer");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[VCVideoCaptureServer portraitBlurEnabledDidChange:](-[VCVideoCapture captureServer](self, "captureServer"), "portraitBlurEnabledDidChange:", objc_msgSend(v9, "BOOLValue"));
    }
    self->_isBackgroundBlurActive = objc_msgSend(v9, "BOOLValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = self->_isBackgroundBlurActive;
        v24 = 136315906;
        v25 = v11;
        v26 = 2080;
        v27 = "-[VCAVFoundationCapture observeValueForKeyPath:ofObject:change:context:]";
        v28 = 1024;
        v29 = 2500;
        v30 = 1024;
        LODWORD(v31) = v13;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _isBackgroundBlurActive=%d", (uint8_t *)&v24, 0x22u);
      }
    }
    v14 = -[VCAVFoundationCapture getMaxAllowedFrameRate:](self, "getMaxAllowedFrameRate:", self->_lastClientRequestedFrameRate);
    if (self->_activeFrameRate == (_DWORD)v14)
      -[VCAVFoundationCapture setFrameRateInternal:forceSourceFrameRateDidChange:](self, "setFrameRateInternal:forceSourceFrameRateDidChange:", v14, 0);
  }
  else if (objc_msgSend(a3, "isEqualToString:", CFSTR("reactionEffectsInProgress")))
  {
    v15 = (os_log_t *)MEMORY[0x1E0CF2758];
    if (!a5 && (int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *v15;
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 136315906;
        v25 = v16;
        v26 = 2080;
        v27 = "-[VCAVFoundationCapture observeValueForKeyPath:ofObject:change:context:]";
        v28 = 1024;
        v29 = 2507;
        v30 = 2112;
        v31 = CFSTR("reactionEffectsInProgress");
        _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d key=%@, change is nil", (uint8_t *)&v24, 0x26u);
      }
    }
    v18 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v19 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *v15;
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 136315906;
        v25 = v20;
        v26 = 2080;
        v27 = "-[VCAVFoundationCapture observeValueForKeyPath:ofObject:change:context:]";
        v28 = 1024;
        v29 = 2511;
        v30 = 2112;
        v31 = (const __CFString *)v18;
        _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d newReactionArray=%@", (uint8_t *)&v24, 0x26u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *v15;
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 136315906;
        v25 = v22;
        v26 = 2080;
        v27 = "-[VCAVFoundationCapture observeValueForKeyPath:ofObject:change:context:]";
        v28 = 1024;
        v29 = 2512;
        v30 = 2112;
        v31 = (const __CFString *)v19;
        _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d oldReactionsArray=%@", (uint8_t *)&v24, 0x26u);
      }
    }
    -[VCAVFoundationCapture processReactionStatus:oldReactions:](self, "processReactionStatus:oldReactions:", v18, v19);
  }
}

- (void)processReactionStatus:(id)a3 oldReactions:(id)a4
{
  BOOL v7;
  NSObject *captureSessionQueue;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  __int128 v23;
  VCAVFoundationCapture *v24;
  id obj;
  CMTime time2;
  CMTime time1;
  _QWORD block[5];
  BOOL v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a3, "count") != 0;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__VCAVFoundationCapture_processReactionStatus_oldReactions___block_invoke;
  block[3] = &unk_1E9E521E8;
  v24 = self;
  block[4] = self;
  v29 = v7;
  dispatch_async(captureSessionQueue, block);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = a3;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v45;
    *(_QWORD *)&v10 = 136315906;
    v23 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v45 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v15 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v39, v38, 16, v23);
        if (!v15)
          goto LABEL_20;
        v16 = v15;
        v17 = *(_QWORD *)v40;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v40 != v17)
              objc_enumerationMutation(a4);
            v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
            v20 = objc_msgSend(v14, "reactionType");
            if (v20 != objc_msgSend(v19, "reactionType"))
              continue;
            if (v14)
            {
              objc_msgSend(v14, "startTime");
              if (v19)
                goto LABEL_14;
            }
            else
            {
              memset(&time1, 0, sizeof(time1));
              if (v19)
              {
LABEL_14:
                objc_msgSend(v19, "startTime");
                goto LABEL_17;
              }
            }
            memset(&time2, 0, sizeof(time2));
LABEL_17:
            if (!CMTimeCompare(&time1, &time2))
              goto LABEL_24;
          }
          v16 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
        }
        while (v16);
LABEL_20:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v21 = VRTraceErrorLogLevelToCSTR();
          v22 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v23;
            v31 = v21;
            v32 = 2080;
            v33 = "-[VCAVFoundationCapture processReactionStatus:oldReactions:]";
            v34 = 1024;
            v35 = 2486;
            v36 = 2112;
            v37 = v14;
            _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d reaction start=%@", buf, 0x26u);
          }
        }
        -[VCVideoCaptureServer reactionDidStart:](-[VCVideoCapture captureServer](v24, "captureServer"), "reactionDidStart:", objc_msgSend(v14, "reactionType"));
LABEL_24:
        ;
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
    }
    while (v11);
  }
}

void __52__VCAVFoundationCapture_captureSessionNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  id *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  _BOOL4 v27;
  const __CFString *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  int v35;
  int v36;
  int v37;
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "name");
      v37 = 136315906;
      v38 = v2;
      v39 = 2080;
      v40 = "-[VCAVFoundationCapture captureSessionNotification:]_block_invoke";
      v41 = 1024;
      v42 = 1333;
      v43 = 2112;
      v44 = (const __CFString *)v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d notification.name=%@", (uint8_t *)&v37, 0x26u);
    }
  }
  v5 = (id *)(a1 + 32);
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "name");
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8A1C8]);
  v8 = *(void **)(a1 + 32);
  if (v7)
  {
    v9 = (void *)objc_msgSend(v8, "userInfo");
    v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A148]), "stringValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v37 = 136315906;
        v38 = v11;
        v39 = 2080;
        v40 = "-[VCAVFoundationCapture captureSessionNotification:]_block_invoke";
        v41 = 1024;
        v42 = 1337;
        v43 = 2112;
        v44 = (const __CFString *)v10;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d session interrupted. reason=%@", (uint8_t *)&v37, 0x26u);
      }
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "captureServer"), "handleCaptureEvent:subType:", CFSTR("avCaptureCameraInterrupted"), v10);
    return;
  }
  v13 = (void *)objc_msgSend(v8, "name");
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0C8A140]))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v37 = 136315650;
        v38 = v14;
        v39 = 2080;
        v40 = "-[VCAVFoundationCapture captureSessionNotification:]_block_invoke";
        v41 = 1024;
        v42 = 1340;
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d session interruption ended", (uint8_t *)&v37, 0x1Cu);
      }
    }
    v16 = (void *)objc_msgSend(*(id *)(a1 + 40), "captureServer");
    v17 = CFSTR("avCaptureCameraBecameAvailable");
LABEL_35:
    objc_msgSend(v16, "handleCaptureEvent:", v17);
    return;
  }
  v18 = (void *)objc_msgSend(*v5, "name");
  v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0C8A1B8]);
  v20 = *v5;
  if (v19)
  {
    v21 = (void *)objc_msgSend(v20, "userInfo");
    v22 = (void *)objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0C8A138]);
    v23 = VCFeatureFlagManager_DaemonCrashRecovery();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v35 = objc_msgSend(v22, "code");
        v36 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 337);
        v37 = 136316674;
        v38 = v24;
        v39 = 2080;
        v40 = "-[VCAVFoundationCapture captureSessionNotification:]_block_invoke";
        v41 = 1024;
        v42 = 1346;
        v43 = 2112;
        v44 = CFSTR("avCaptureFail");
        v45 = 1024;
        v46 = v23;
        v47 = 1024;
        v48 = v35;
        v49 = 1024;
        v50 = v36;
        _os_log_error_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d eventType=%@, daemonCrashRecoveryEnabled=%d, error.code=%d, _isPreviewing=%d", (uint8_t *)&v37, 0x38u);
      }
    }
    if (objc_msgSend(v22, "code") == -11819)
    {
      v26 = *(_QWORD *)(a1 + 40);
      if (*(_BYTE *)(v26 + 337))
        v27 = v23;
      else
        v27 = 0;
      if (v27)
      {
        objc_msgSend(*(id *)(v26 + 176), "stopRunning");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "startRunning");
      }
      v28 = CFSTR("avCaptureServerDied");
    }
    else
    {
      v28 = CFSTR("avCaptureFail");
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __52__VCAVFoundationCapture_captureSessionNotification___block_invoke_cold_1();
    }
    v16 = (void *)objc_msgSend(*(id *)(a1 + 40), "captureServer");
    v17 = v28;
    goto LABEL_35;
  }
  v29 = (void *)objc_msgSend(v20, "name");
  if (objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0C8A128]))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v37 = 136315650;
        v38 = v30;
        v39 = 2080;
        v40 = "-[VCAVFoundationCapture captureSessionNotification:]_block_invoke";
        v41 = 1024;
        v42 = 1359;
        _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d session started running", (uint8_t *)&v37, 0x1Cu);
      }
    }
    v16 = (void *)objc_msgSend(*(id *)(a1 + 40), "captureServer");
    v17 = CFSTR("avCaptureCameraDidStart");
    goto LABEL_35;
  }
  v32 = (void *)objc_msgSend(*v5, "name");
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0C8A130]))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v33 = VRTraceErrorLogLevelToCSTR();
      v34 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v37 = 136315650;
        v38 = v33;
        v39 = 2080;
        v40 = "-[VCAVFoundationCapture captureSessionNotification:]_block_invoke";
        v41 = 1024;
        v42 = 1362;
        _os_log_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d session stopped running", (uint8_t *)&v37, 0x1Cu);
      }
    }
  }
}

_QWORD *__101__VCAVFoundationCapture_frameBecameAvailableCount_figBufferQueueEmptyCount_figBufferQueueErrorCount___block_invoke(_QWORD *result)
{
  _DWORD *v1;
  _DWORD *v2;
  _DWORD *v3;

  v1 = (_DWORD *)result[5];
  if (v1)
    *v1 = *(_DWORD *)(result[4] + 344);
  v2 = (_DWORD *)result[6];
  if (v2)
    *v2 = 0;
  v3 = (_DWORD *)result[7];
  if (v3)
    *v3 = 0;
  return result;
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  id v6;
  NSObject *captureSessionQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_useAVConferenced)
  {
    -[VCAVFoundationCapture processMetadataObjects:](self, "processMetadataObjects:", a4);

  }
  else
  {
    captureSessionQueue = self->_captureSessionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__VCAVFoundationCapture_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = a4;
    dispatch_async(captureSessionQueue, block);
  }
}

- (void)processMetadataObjects:(id)a3
{
  if (-[NSMutableArray count](self->_cachedDataArray, "count") == 5)
    -[NSMutableArray removeObjectAtIndex:](self->_cachedDataArray, "removeObjectAtIndex:", 0);
  -[NSMutableArray addObject:](self->_cachedDataArray, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", a3));
}

- (void)setReactionActive:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_isReactionActive != a3)
  {
    v3 = a3;
    self->_isReactionActive = a3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136316162;
        v8 = v5;
        v9 = 2080;
        v10 = "-[VCAVFoundationCapture setReactionActive:]";
        v11 = 1024;
        v12 = 2463;
        v13 = 2112;
        v14 = CFSTR("reactionEffectsInProgress");
        v15 = 1024;
        v16 = v3;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d key=%@, active=%d", (uint8_t *)&v7, 0x2Cu);
      }
    }
    if (!self->_isReactionActive)
      -[VCVideoCaptureServer didStopReacting](-[VCVideoCapture captureServer](self, "captureServer"), "didStopReacting");
  }
}

- (void)setOrientation:(int)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_orientation != a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315906;
        v8 = v5;
        v9 = 2080;
        v10 = "-[VCAVFoundationCapture setOrientation:]";
        v11 = 1024;
        v12 = 2110;
        v13 = 1024;
        v14 = a3;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d orientation=%d", (uint8_t *)&v7, 0x22u);
      }
    }
    self->_orientation = a3;
    if (self->_supportPortraitResolution)
      -[VCAVFoundationCapture setVideoDeviceToWidth:height:frameRate:](self, "setVideoDeviceToWidth:height:frameRate:", (int)self->_requestSize.width, (int)self->_requestSize.height, self->_lastClientRequestedFrameRate);
  }
}

- (VCAVFoundationCapture)initWithCaptureServer:(id)a3 protocolFunctions:(const tagVCVideoCaptureServerProtocolRealtimeInstanceVTable *)a4 width:(int)a5 height:(int)a6 frameRate:(int)a7 videoSourceToken:(_VCVideoSourceToken)a8 cinematicFramingEnabled:(BOOL)a9 videoOrientation:(int)a10 capturePixelFormat:(unsigned int)a11
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  VCAVFoundationCapture *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *CustomRootQueue;
  BOOL v25;
  uint64_t v26;
  NSObject *v27;
  _BOOL4 isServerProcess;
  int IntValueForKey;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  int deviceMinFrameRate;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  uint64_t v37;
  NSObject *v38;
  int v39;
  const __CFString *v40;
  uint64_t v41;
  NSObject *v42;
  const char *v43;
  NSObject *v44;
  uint32_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  float v49;
  uint64_t v50;
  NSObject *v51;
  objc_super v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  _BYTE v61[10];
  VCAVFoundationCapture *v62;
  _BYTE v63[6];
  _BYTE v64[6];
  _BYTE v65[6];
  __int16 v66;
  $948446A44E2BC96870B572155DF52E0B var0;
  __int16 v68;
  _BOOL4 v69;
  __int16 v70;
  int v71;
  uint64_t v72;

  v12 = *(_QWORD *)&a7;
  v13 = *(_QWORD *)&a6;
  v14 = *(_QWORD *)&a5;
  v72 = *MEMORY[0x1E0C80C00];
  v53.receiver = self;
  v53.super_class = (Class)VCAVFoundationCapture;
  v15 = -[VCVideoCapture initWithCaptureServer:protocolFunctions:](&v53, sel_initWithCaptureServer_protocolFunctions_, a3, a4);
  if (!v15)
    return v15;
  if ((VCAVFoundationCapture *)objc_opt_class() == v15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317186;
        v55 = v17;
        v56 = 2080;
        v57 = "-[VCAVFoundationCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:ci"
              "nematicFramingEnabled:videoOrientation:capturePixelFormat:]";
        v58 = 1024;
        v59 = 351;
        v60 = 1024;
        *(_DWORD *)v61 = v14;
        *(_WORD *)&v61[4] = 1024;
        *(_DWORD *)&v61[6] = v13;
        LOWORD(v62) = 1024;
        *(_DWORD *)((char *)&v62 + 2) = v12;
        HIWORD(v62) = 1024;
        *(_VCVideoSourceToken *)v63 = a8;
        *(_WORD *)&v63[4] = 1024;
        *(_DWORD *)v64 = a9;
        *(_WORD *)&v64[4] = 1024;
        *(_DWORD *)v65 = a10;
        v19 = " [%s] %s:%d width=%d, height=%d, frameRate=%d, sourceToken=0x%x, cinematicFramingEnabled=%d, orientation=%d";
        v20 = v18;
        v21 = 64;
LABEL_12:
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = (const __CFString *)-[VCAVFoundationCapture performSelector:](v15, "performSelector:", sel_logPrefix);
    else
      v16 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317698;
        v55 = v22;
        v56 = 2080;
        v57 = "-[VCAVFoundationCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:ci"
              "nematicFramingEnabled:videoOrientation:capturePixelFormat:]";
        v58 = 1024;
        v59 = 351;
        v60 = 2112;
        *(_QWORD *)v61 = v16;
        *(_WORD *)&v61[8] = 2048;
        v62 = v15;
        *(_WORD *)v63 = 1024;
        *(_DWORD *)&v63[2] = v14;
        *(_WORD *)v64 = 1024;
        *(_DWORD *)&v64[2] = v13;
        *(_WORD *)v65 = 1024;
        *(_DWORD *)&v65[2] = v12;
        v66 = 1024;
        var0 = a8.var0.var0;
        v68 = 1024;
        v69 = a9;
        v70 = 1024;
        v71 = a10;
        v19 = " [%s] %s:%d %@(%p) width=%d, height=%d, frameRate=%d, sourceToken=0x%x, cinematicFramingEnabled=%d, orientation=%d";
        v20 = v23;
        v21 = 84;
        goto LABEL_12;
      }
    }
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  v15->_captureSessionQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCAVCaptureSession.captureSessionQueue", 0, CustomRootQueue);
  v15->_viewPointCorrectionQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCViewPointcorrection.viewPointCorrectionQueue", 0, CustomRootQueue);
  if (VCAllocatorFirstCome_Create((const __CFAllocator *)*MEMORY[0x1E0C9AE00], (uint64_t)"VCAVFCaptureNumberPropertyAllocator", &v15->_numberPropertyAllocator))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAVFoundationCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:cinematicFramingEnabled:videoOrientation:capturePixelFormat:].cold.1();
    }
  }
  v15->_captureSession = (AVCaptureSession *)+[VCAVFoundationCapture newCaptureSession](VCAVFoundationCapture, "newCaptureSession");
  v15->_capturePixelFormat = a11;
  v25 = (objc_msgSend((id)objc_opt_class(), "isServerProcess") & 1) != 0
     || -[VCDefaults forceUseAvconferenced](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceUseAvconferenced");
  v15->_isServerProcess = v25;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      isServerProcess = v15->_isServerProcess;
      *(_DWORD *)buf = 136315906;
      v55 = v26;
      v56 = 2080;
      v57 = "-[VCAVFoundationCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:cine"
            "maticFramingEnabled:videoOrientation:capturePixelFormat:]";
      v58 = 1024;
      v59 = 363;
      v60 = 1024;
      *(_DWORD *)v61 = isServerProcess;
      _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _isServerProcess=%d", buf, 0x22u);
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v15, sel_captureSessionNotification_, 0, v15->_captureSession);
  v15->_lastClientRequestedFrameRate = v12;
  v15->_faceMeshTrackingEnabled = 0;
  v15->_isCaptureSIFRPreferred = +[VCHardwareSettings isCaptureSIFRPreferred](VCHardwareSettings, "isCaptureSIFRPreferred");
  v15->_captureSIFRPreferredOverride = VCDefaults_GetIntValueForKey(CFSTR("overrideAVCaptureSIFR"), 0);
  v15->_captureFormatNonBinOnlyOverride = VCDefaults_GetIntValueForKey(CFSTR("overrideAVCaptureNonBinnedOnly"), 0) != 0;
  IntValueForKey = VCDefaults_GetIntValueForKey(CFSTR("captureDeviceFrameRateMin"), 0);
  v15->_deviceMinFrameRate = IntValueForKey;
  if (IntValueForKey)
  {
    if ((VCAVFoundationCapture *)objc_opt_class() == v15)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v31 = VRTraceErrorLogLevelToCSTR();
        v32 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          deviceMinFrameRate = v15->_deviceMinFrameRate;
          *(_DWORD *)buf = 136315906;
          v55 = v31;
          v56 = 2080;
          v57 = "-[VCAVFoundationCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:"
                "cinematicFramingEnabled:videoOrientation:capturePixelFormat:]";
          v58 = 1024;
          v59 = 373;
          v60 = 1024;
          *(_DWORD *)v61 = deviceMinFrameRate;
          v34 = " [%s] %s:%d kVCDefaultCaptureDeviceFrameRateMin is set to %d";
          v35 = v32;
          v36 = 34;
LABEL_34:
          _os_log_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v30 = (const __CFString *)-[VCAVFoundationCapture performSelector:](v15, "performSelector:", sel_logPrefix);
      else
        v30 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v37 = VRTraceErrorLogLevelToCSTR();
        v38 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v39 = v15->_deviceMinFrameRate;
          *(_DWORD *)buf = 136316418;
          v55 = v37;
          v56 = 2080;
          v57 = "-[VCAVFoundationCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:"
                "cinematicFramingEnabled:videoOrientation:capturePixelFormat:]";
          v58 = 1024;
          v59 = 373;
          v60 = 2112;
          *(_QWORD *)v61 = v30;
          *(_WORD *)&v61[8] = 2048;
          v62 = v15;
          *(_WORD *)v63 = 1024;
          *(_DWORD *)&v63[2] = v39;
          v34 = " [%s] %s:%d %@(%p) kVCDefaultCaptureDeviceFrameRateMin is set to %d";
          v35 = v38;
          v36 = 54;
          goto LABEL_34;
        }
      }
    }
  }
  if (v15->_captureFormatNonBinOnlyOverride)
  {
    if ((VCAVFoundationCapture *)objc_opt_class() == v15)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_47;
      v41 = VRTraceErrorLogLevelToCSTR();
      v42 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_47;
      *(_DWORD *)buf = 136315650;
      v55 = v41;
      v56 = 2080;
      v57 = "-[VCAVFoundationCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:cine"
            "maticFramingEnabled:videoOrientation:capturePixelFormat:]";
      v58 = 1024;
      v59 = 376;
      v43 = " [%s] %s:%d Pick only non binned AVCaptureDeviceFormat";
      v44 = v42;
      v45 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v40 = (const __CFString *)-[VCAVFoundationCapture performSelector:](v15, "performSelector:", sel_logPrefix);
      else
        v40 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_47;
      v46 = VRTraceErrorLogLevelToCSTR();
      v47 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_47;
      *(_DWORD *)buf = 136316162;
      v55 = v46;
      v56 = 2080;
      v57 = "-[VCAVFoundationCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:cine"
            "maticFramingEnabled:videoOrientation:capturePixelFormat:]";
      v58 = 1024;
      v59 = 376;
      v60 = 2112;
      *(_QWORD *)v61 = v40;
      *(_WORD *)&v61[8] = 2048;
      v62 = v15;
      v43 = " [%s] %s:%d %@(%p) Pick only non binned AVCaptureDeviceFormat";
      v44 = v47;
      v45 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v44, OS_LOG_TYPE_DEFAULT, v43, buf, v45);
  }
LABEL_47:
  v15->_captureFormatPrefer16By9ForSquare = +[VCHardwareSettings captureFormatPrefer16by9ForSquare](VCHardwareSettings, "captureFormatPrefer16by9ForSquare");
  v15->_needCenterStageMetadataForViewpointCorrection = VCDefaults_GetBoolValueForKey(CFSTR("VPCCenterStageMetadata"), 1);
  v15->_requestSize.width = (double)(int)v14;
  v15->_requestSize.height = (double)(int)v13;
  v15->_orientation = a10;
  v15->_useAVConferenced = VCFeatureFlagManager_UseAvconferenced();
  v15->_beginCommitConfigForFormatSwitch = 1;
  -[AVCaptureSession beginConfiguration](v15->_captureSession, "beginConfiguration");
  -[VCAVFoundationCapture setCamera:width:height:frameRate:](v15, "setCamera:width:height:frameRate:", a8.var0.var1, v14, v13, v12);
  -[VCAVFoundationCapture initializeOutputs](v15, "initializeOutputs");
  -[VCAVFoundationCapture initializeViewpointCorrection](v15, "initializeViewpointCorrection");
  -[VCAVFoundationCapture updateCenterStageEnabled:requestCaptureChange:](v15, "updateCenterStageEnabled:requestCaptureChange:", a9, 1);
  -[AVCaptureSession commitConfiguration](v15->_captureSession, "commitConfiguration");
  objc_msgSend(+[VCEffectsManager sharedManager](VCEffectsManager, "sharedManager"), "setDelegate:", v15);
  if (objc_msgSend(+[VCEffectsManager sharedManager](VCEffectsManager, "sharedManager"), "isFaceMeshTrackingEnabled"))-[VCAVFoundationCapture setFaceMeshTrackingEnabled:](v15, "setFaceMeshTrackingEnabled:", 1);
  v48 = VCEffectsManager_SharedManager();
  if (VCEffectsManager_IsEffectsOn(v48))
    -[VCAVFoundationCapture setEffectsApplied:](v15, "setEffectsApplied:", 1);
  v15->_cachedDataArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15->_renderFrameTimes = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", CFSTR("effectsProcessWindow"), 60));
  v15->_processTimeSum = 0.0;
  v15->_imageCopyingConverter = -[VCImageResizingConverter initWithOutputWidth:outputHeight:formatType:]([VCImageResizingConverter alloc], "initWithOutputWidth:outputHeight:formatType:", (int)v14, (int)v13, v15->_capturePixelFormat);
  v15->_imageRotationConverter = -[VCImageRotationConverter initWithRotationAngle:width:height:formatType:]([VCImageRotationConverter alloc], "initWithRotationAngle:width:height:formatType:", 90, (int)v14, (int)v13, v15->_capturePixelFormat);
  v15->_imageMirroringConverter = -[VCImageMirroringConverter initWithWidth:height:formatType:]([VCImageMirroringConverter alloc], "initWithWidth:height:formatType:", (int)v14, (int)v13, v15->_capturePixelFormat);
  v15->_forceMirrorCapture = -[VCDefaults forceMirroredCapture](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceMirroredCapture");
  v15->_forceDynamicEffectsFramerate = -[VCDefaults forceDynamicEffectsFramerate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDynamicEffectsFramerate");
  -[VCDefaults depthFrameRateMultiplier](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "depthFrameRateMultiplier");
  v15->_depthFrameRateMultplier = 1.0 / v49;
  v15->_forcePearlCamera = -[VCDefaults forceEnablePearlCamera](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEnablePearlCamera");
  -[VCAVFoundationCapture resetViewPointLogging](v15, "resetViewPointLogging");
  v15->_enableBufferStatsDump = VCDefaults_GetBoolValueForKey(CFSTR("enableVideoCaptureStatistics"), 0);
  +[VCVisualAlert start](VCVisualAlert, "start");
  v15->_shouldRemoveExtraRotation = _os_feature_enabled_impl();
  v15->_shouldUseCompressedPixelFormat = VCVideoUtil_ShouldUseCompressedPixelFormat();
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAVFoundationCapture-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v50 = VRTraceErrorLogLevelToCSTR();
    v51 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v55 = v50;
      v56 = 2080;
      v57 = "-[VCAVFoundationCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:cine"
            "maticFramingEnabled:videoOrientation:capturePixelFormat:]";
      v58 = 1024;
      v59 = 430;
      v60 = 2048;
      *(_QWORD *)v61 = v15;
      _os_log_impl(&dword_1D8A54000, v51, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAVFoundationCapture-init (%p)", buf, 0x26u);
    }
  }
  return v15;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFAllocator *numberPropertyAllocator;
  OpaqueVTPixelTransferSession *uncompressTransferSession;
  OpaqueVTPixelTransferSession *v17;
  __CVPixelBufferPool *uncompressedPixelFormatBufferPool;
  OpaqueVTPixelTransferSession *compressTransferSession;
  OpaqueVTPixelTransferSession *v20;
  __CVPixelBufferPool *compressedPixelFormatBufferPool;
  objc_super v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  VCAVFoundationCapture *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAVFoundationCapture-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v34 = v3;
      v35 = 2080;
      v36 = "-[VCAVFoundationCapture dealloc]";
      v37 = 1024;
      v38 = 436;
      v39 = 2048;
      v40 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAVFoundationCapture-dealloc (%p)", buf, 0x26u);
    }
  }
  +[VCVisualAlert stop](VCVisualAlert, "stop");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = -[AVCaptureSession inputs](self->_captureSession, "inputs");
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        -[AVCaptureSession removeInput:](self->_captureSession, "removeInput:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
    }
    while (v7);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = -[AVCaptureSession outputs](self->_captureSession, "outputs");
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        -[AVCaptureSession removeOutput:](self->_captureSession, "removeOutput:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
    }
    while (v12);
  }
  -[VCAVFoundationCapture unlockAVCaptureDeviceInputForConfiguration](self, "unlockAVCaptureDeviceInputForConfiguration");

  -[AVCaptureVideoDataOutput setSampleBufferDelegate:queue:](self->_videoCaptureOutput, "setSampleBufferDelegate:queue:", 0, 0);
  dispatch_release((dispatch_object_t)self->_captureSessionQueue);
  dispatch_release((dispatch_object_t)self->_viewPointCorrectionQueue);
  numberPropertyAllocator = self->_numberPropertyAllocator;
  if (numberPropertyAllocator)
  {
    CFRelease(numberPropertyAllocator);
    self->_numberPropertyAllocator = 0;
  }
  uncompressTransferSession = self->_uncompressTransferSession;
  if (uncompressTransferSession)
  {
    VTPixelTransferSessionInvalidate(uncompressTransferSession);
    v17 = self->_uncompressTransferSession;
    if (v17)
    {
      CFRelease(v17);
      self->_uncompressTransferSession = 0;
    }
  }
  uncompressedPixelFormatBufferPool = self->_uncompressedPixelFormatBufferPool;
  if (uncompressedPixelFormatBufferPool)
    CVPixelBufferPoolRelease(uncompressedPixelFormatBufferPool);
  compressTransferSession = self->_compressTransferSession;
  if (compressTransferSession)
  {
    VTPixelTransferSessionInvalidate(compressTransferSession);
    v20 = self->_compressTransferSession;
    if (v20)
    {
      CFRelease(v20);
      self->_compressTransferSession = 0;
    }
  }
  compressedPixelFormatBufferPool = self->_compressedPixelFormatBufferPool;
  if (compressedPixelFormatBufferPool)
    CVPixelBufferPoolRelease(compressedPixelFormatBufferPool);
  v22.receiver = self;
  v22.super_class = (Class)VCAVFoundationCapture;
  -[VCVideoCapture dealloc](&v22, sel_dealloc);
}

- (void)tearDownSynchronizer
{

  self->_outputSynchronizer = 0;
  self->_outputSynchronizerOutputs = 0;
  -[VCAVFoundationCapture setVideoCaptureOutputDelegate](self, "setVideoCaptureOutputDelegate");
  -[VCAVFoundationCapture setMetaDataObjectsDelegate](self, "setMetaDataObjectsDelegate");
}

- (void)initializeSynchronizedOutputs
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Video device input not in capture session inputs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (CGRect)calculateRegionOfInterest:(CGSize)a3 requestSize:(CGSize)a4
{
  float v4;
  float v5;
  double v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v4 = a4.width / a4.height;
  v5 = a3.width / a3.height;
  v6 = v4;
  v7 = v4 < v5;
  v8 = a3.width / v4;
  v9 = v8 / a3.height;
  v10 = a3.width - a3.height * v6;
  v11 = a3.height * v6 / a3.width;
  if (v7)
    v12 = v10 * 0.5 / a3.width;
  else
    v12 = 0.0;
  if (v7)
    v13 = 0.0;
  else
    v13 = (a3.height - v8) * 0.5 / a3.height;
  if (v7)
    v14 = v11;
  else
    v14 = 1.0;
  if (v7)
    v15 = 1.0;
  else
    v15 = v9;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setFaceMeshTrackingEnabled:(BOOL)a3
{
  NSObject *captureSessionQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__VCAVFoundationCapture_setFaceMeshTrackingEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(captureSessionQueue, block);
}

void __52__VCAVFoundationCapture_setFaceMeshTrackingEnabled___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 224) = *(_BYTE *)(a1 + 40);
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[224])
    objc_msgSend(v2, "initializeSynchronizedOutputs");
  else
    objc_msgSend(v2, "tearDownSynchronizer");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      v15 = v3;
      v16 = 2080;
      v17 = "-[VCAVFoundationCapture setFaceMeshTrackingEnabled:]_block_invoke";
      v18 = 1024;
      v19 = 883;
      v20 = 1024;
      LODWORD(v21) = v5;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Face mesh tracking enabled %d", buf, 0x22u);
    }
  }
  v12 = 15;
  if (-[VCDefaults shouldOverrideEffectsFramerate:](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "shouldOverrideEffectsFramerate:", &v12))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v15 = v6;
        v16 = 2080;
        v17 = "-[VCAVFoundationCapture setFaceMeshTrackingEnabled:]_block_invoke";
        v18 = 1024;
        v19 = 887;
        v20 = 1024;
        LODWORD(v21) = v12;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing Effects frame rate: %d", buf, 0x22u);
      }
    }
  }
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "deviceType");
  if (v8 == *MEMORY[0x1E0C89F90])
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "lockForConfiguration:", &v13))
    {
      objc_msgSend(*(id *)(a1 + 32), "updateDepthFrameRate");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "unlockForConfiguration");
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216);
        *(_DWORD *)buf = 136316162;
        v15 = v9;
        v16 = 2080;
        v17 = "-[VCAVFoundationCapture setFaceMeshTrackingEnabled:]_block_invoke";
        v18 = 1024;
        v19 = 895;
        v20 = 2112;
        v21 = v11;
        v22 = 2112;
        v23 = v13;
        _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to retain lock for capture device=%@. Error=%@", buf, 0x30u);
      }
    }
  }
}

- (void)setEffectsApplied:(BOOL)a3
{
  NSObject *captureSessionQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__VCAVFoundationCapture_setEffectsApplied___block_invoke;
  block[3] = &unk_1E9E521E8;
  v5 = a3;
  block[4] = self;
  dispatch_async(captureSessionQueue, block);
}

uint64_t __43__VCAVFoundationCapture_setEffectsApplied___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = *(unsigned __int8 *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 227))
  {
    v3 = result;
    *(_BYTE *)(v2 + 227) = v1;
    v4 = *(_QWORD *)(result + 32);
    if (*(_BYTE *)(v4 + 227))
    {
      v11 = 15;
      if (-[VCDefaults shouldOverrideEffectsFramerate:](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "shouldOverrideEffectsFramerate:", &v11))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v5 = VRTraceErrorLogLevelToCSTR();
          v6 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v13 = v5;
            v14 = 2080;
            v15 = "-[VCAVFoundationCapture setEffectsApplied:]_block_invoke";
            v16 = 1024;
            v17 = 907;
            v18 = 1024;
            v19 = v11;
            _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing Effects frame rate: %d", buf, 0x22u);
          }
        }
      }
    }
    else
    {
      v11 = *(_DWORD *)(v4 + 268);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(unsigned __int8 *)(v3 + 40);
        *(_DWORD *)buf = 136316162;
        v13 = v7;
        v14 = 2080;
        v15 = "-[VCAVFoundationCapture setEffectsApplied:]_block_invoke";
        v16 = 1024;
        v17 = 909;
        v18 = 1024;
        v19 = v9;
        v20 = 1024;
        v21 = v11;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Effects applied %d, framerate %d", buf, 0x28u);
      }
    }
    result = *(_QWORD *)(v3 + 32);
    if (*(_DWORD *)(result + 260) != v11)
    {
      v10 = (void *)objc_msgSend((id)result, "captureServer");
      return objc_msgSend(v10, "setCaptureFrameRate:", v11);
    }
  }
  return result;
}

- (void)encodeProcessedPixelBuffer:(__CVBuffer *)a3 time:(id *)a4 imageData:(id)a5 processTime:(id)a6
{
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  int64_t var0;
  NSObject *captureSessionQueue;
  _QWORD block[8];
  __int128 v17;
  int64_t var3;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    v13 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        var0 = a4->var0;
        *(_DWORD *)buf = 136315906;
        v20 = v11;
        v21 = 2080;
        v22 = "-[VCAVFoundationCapture encodeProcessedPixelBuffer:time:imageData:processTime:]";
        v23 = 1024;
        v24 = 920;
        v25 = 2048;
        v26 = var0;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Send processed video frame to encoder %lld", buf, 0x26u);
        if (!a3)
          goto LABEL_9;
        goto LABEL_8;
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      -[VCAVFoundationCapture encodeProcessedPixelBuffer:time:imageData:processTime:].cold.1();
      if (!a3)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  if (a3)
LABEL_8:
    CFRetain(a3);
LABEL_9:
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__VCAVFoundationCapture_encodeProcessedPixelBuffer_time_imageData_processTime___block_invoke;
  block[3] = &unk_1E9E56208;
  block[4] = self;
  block[5] = a6;
  v17 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  block[6] = a5;
  block[7] = a3;
  dispatch_async(captureSessionQueue, block);
}

void __79__VCAVFoundationCapture_encodeProcessedPixelBuffer_time_imageData_processTime___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  __CVBuffer *v3;
  opaqueCMSampleBuffer *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  __int128 *v9;
  uint64_t v10;
  OpaqueVTPixelTransferSession *v11;
  __CVPixelBufferPool *v12;
  const void *v13;
  __int128 v14;
  uint64_t v15;
  CMSampleBufferRef v16[2];

  v16[1] = *(CMSampleBufferRef *)MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[340])
    objc_msgSend(v2, "updateRenderProcessFrameRate:", *(_QWORD *)(a1 + 40));
  v3 = *(__CVBuffer **)(a1 + 56);
  v14 = *(_OWORD *)(a1 + 64);
  v15 = *(_QWORD *)(a1 + 80);
  v4 = createSampleBufferWithPixelBuffer(v3, &v14);
  v16[0] = v4;
  v5 = objc_msgSend(*(id *)(a1 + 32), "isFrontCamera");
  if (*(_QWORD *)(a1 + 48))
  {
    *(_QWORD *)&v14 = 0;
    v6 = (void *)MEMORY[0x1E0CB3710];
    if (VCAVFoundationGetARImageData_onceToken != -1)
      dispatch_once(&VCAVFoundationGetARImageData_onceToken, &__block_literal_global_4);
    v7 = (void *)objc_msgSend(v6, "unarchivedObjectOfClass:fromData:error:", VCAVFoundationGetARImageData_cls, *(_QWORD *)(a1 + 48), &v14);
    v8 = objc_msgSend(v7, "cameraPosition", (_QWORD)v14) != 1;
  }
  else
  {
    v8 = v5;
  }
  v9 = (__int128 *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v10 + 448))
  {
    v11 = *(OpaqueVTPixelTransferSession **)(v10 + 472);
    v12 = *(__CVPixelBufferPool **)(v10 + 480);
    v14 = *v9;
    v15 = *(_QWORD *)(a1 + 80);
    _VCAVFoundationCapture_ConvertPixelFormat(v11, v12, v16, (uint64_t)&v14);
    v10 = *(_QWORD *)(a1 + 32);
    v4 = v16[0];
  }
  v14 = *v9;
  v15 = *(_QWORD *)(a1 + 80);
  _VCAVFoundationCapture_PushFrameToCaptureServer((_DWORD *)v10, v4, &v14, v8 ^ 1, v8);
  FigSampleBufferRelease();
  v13 = *(const void **)(a1 + 56);
  if (v13)
    CFRelease(v13);
}

- (void)updateRenderProcessFrameRate:(id)a3
{
  uint64_t v5;
  float v6;
  float v7;
  float v8;
  float v9;
  AVCaptureDevice *v10;
  float Seconds;
  double v12;
  double v13;
  float v14;
  uint64_t v15;
  double v16;
  float v17;
  CMTime v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "floatValue");
    v5 = -[NSMutableArray count](self->_renderFrameTimes, "count");
    if (v5 == +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", CFSTR("effectsProcessWindow"), 60))
    {
      objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_renderFrameTimes, "objectAtIndexedSubscript:", 0), "floatValue");
      self->_processTimeSum = self->_processTimeSum - v6;
      -[NSMutableArray removeObjectAtIndex:](self->_renderFrameTimes, "removeObjectAtIndex:", 0);
    }
    -[NSMutableArray addObject:](self->_renderFrameTimes, "addObject:", a3);
    objc_msgSend(a3, "floatValue");
    v8 = v7 + self->_processTimeSum;
    self->_processTimeSum = v8;
    v9 = v8 / (float)(unint64_t)-[NSMutableArray count](self->_renderFrameTimes, "count");
    v10 = -[AVCaptureDeviceInput device](self->_videoDeviceInput, "device");
    if (v10)
      -[AVCaptureDevice activeVideoMaxFrameDuration](v10, "activeVideoMaxFrameDuration");
    else
      memset(&v19, 0, sizeof(v19));
    Seconds = CMTimeGetSeconds(&v19);
    v12 = Seconds;
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", CFSTR("effectsProcessBoundPercentage"), 0.1);
    v14 = v12 - v12 * v13;
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", CFSTR("effectsProcessBoundPercentage"), 0.1);
    v17 = v12 + v12 * v16;
    if (v9 < v14 || v9 > v17)
    {
      LODWORD(v15) = vcvtms_s32_f32(1.0 / v9);
      -[VCAVFoundationCapture setFrameRateInternal:forceSourceFrameRateDidChange:](self, "setFrameRateInternal:forceSourceFrameRateDidChange:", v15, 0);
    }
  }
}

void __79__VCAVFoundationCapture_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "processMetadataObjects:", *(_QWORD *)(a1 + 40));

}

uint64_t __76__VCAVFoundationCapture_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke(uint64_t a1)
{
  _VCAVFoundationCapture_ProcessSampleBufferWithCaptureOutput(*(CVImageBufferRef *)(a1 + 32), *(opaqueCMSampleBuffer **)(a1 + 48), *(void **)(a1 + 40));
  return FigSampleBufferRelease();
}

- (void)dataOutputSynchronizer:(id)a3 didOutputSynchronizedDataCollection:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  opaqueCMSampleBuffer *v14;
  uint64_t v15;
  NSObject *v16;

  v7 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", self->_videoCaptureOutput);
  v8 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", self->_metadataOutput);
  if (self->_depthDataOutput)
    v9 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:");
  else
    v9 = 0;
  v10 = (void *)objc_msgSend((id)objc_msgSend(a3, "dataOutputs"), "firstObject");
  v11 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "connectionWithMediaType:", *MEMORY[0x1E0C8A808]), "inputPorts"), "firstObject");
  v12 = objc_msgSend((id)objc_msgSend(v11, "input"), "device");
  if (v7)
  {
    v13 = (void *)v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (opaqueCMSampleBuffer *)objc_msgSend(v7, "sampleBuffer");
      if (objc_msgSend(v7, "sampleBufferWasDropped"))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v15 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAVFoundationCapture dataOutputSynchronizer:didOutputSynchronizedDataCollection:].cold.1(v15, v7, v16);
        }
      }
      else
      {
        objc_msgSend(v11, "clock");
        _VCAVFoundationCapture_ProcessSampleBuffer((CVImageBufferRef)self, v14, v9, v8, v13);
      }
    }
  }
}

- (int)startCaptureWithWidth:(int)a3 height:(int)a4 frameRate:(int)a5
{
  uint64_t v9;
  NSObject *v10;
  NSObject *captureSessionQueue;
  int v12;
  _QWORD v14[6];
  int v15;
  int v16;
  int v17;
  _BYTE buf[24];
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAVFoundationCapture startCaptureWithWidth:height:frameRate:]";
      *(_WORD *)&buf[22] = 1024;
      v19 = 1392;
      v20 = 1024;
      v21 = a3;
      v22 = 1024;
      v23 = a4;
      v24 = 1024;
      v25 = a5;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d width=%d, height=%d, frameRate=%d", buf, 0x2Eu);
    }
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  captureSessionQueue = self->_captureSessionQueue;
  v19 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__VCAVFoundationCapture_startCaptureWithWidth_height_frameRate___block_invoke;
  v14[3] = &unk_1E9E535E0;
  v15 = a3;
  v16 = a4;
  v14[4] = self;
  v14[5] = buf;
  v17 = a5;
  dispatch_sync(captureSessionQueue, v14);
  v12 = *(_DWORD *)(*(_QWORD *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v12;
}

void __64__VCAVFoundationCapture_startCaptureWithWidth_height_frameRate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  double *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "captureServer");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "captureServer"), "centerStageEnabledDidChange:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 228));
  objc_msgSend(*(id *)(a1 + 32), "captureServer");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "captureServer"), "portraitBlurEnabledDidChange:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 240));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 338)
    && *(double *)(v2 + 304) == (double)*(int *)(a1 + 48)
    && *(double *)(v2 + 312) == (double)*(int *)(a1 + 52))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315650;
        v13 = v3;
        v14 = 2080;
        v15 = "-[VCAVFoundationCapture startCaptureWithWidth:height:frameRate:]_block_invoke";
        v16 = 1024;
        v17 = 1407;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Capture is already running with the same camera format", (uint8_t *)&v12, 0x1Cu);
      }
    }
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = -2146893775;
LABEL_22:
    *(_DWORD *)(v5 + 24) = v6;
    return;
  }
  if (!*(_BYTE *)(v2 + 337))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __64__VCAVFoundationCapture_startCaptureWithWidth_height_frameRate___block_invoke_cold_1();
    }
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = -2146893820;
    goto LABEL_22;
  }
  v7 = (double *)(v2 + 304);
  v8 = *(_DWORD *)(a1 + 52);
  *v7 = (double)*(int *)(a1 + 48);
  v7[1] = (double)v8;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "setVideoDeviceToWidth:height:frameRate:");
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 338) = 1;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 338);
      v12 = 136315906;
      v13 = v9;
      v14 = 2080;
      v15 = "-[VCAVFoundationCapture startCaptureWithWidth:height:frameRate:]_block_invoke";
      v16 = 1024;
      v17 = 1429;
      v18 = 1024;
      v19 = v11;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _isCapturing = %d", (uint8_t *)&v12, 0x22u);
    }
  }
}

- (int64_t)captureTierForEncodingSize:(CGSize)a3
{
  double height;
  double width;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  int v15;
  int64_t v17;
  int ErrorLogLevelForModule;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int64_t v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  height = a3.height;
  width = a3.width;
  v6 = 0;
  v36 = *MEMORY[0x1E0C80C00];
  v7 = -1;
  v8 = -1;
  v9 = a3.width / a3.height;
  while (1)
  {
    +[VideoUtil sizeForVideoResolution:](VideoUtil, "sizeForVideoResolution:", v6);
    v11 = v10;
    v13 = v12;
    v14 = (int)v10;
    v15 = (int)v12;
    if (!-[VCAVFoundationCapture cameraSupportsNoQueueFormatWidth:height:](self, "cameraSupportsNoQueueFormatWidth:height:", (int)v10, (int)v12))
    {
      v17 = v8;
      goto LABEL_15;
    }
    if (width == (double)v14 && height == (double)v15)
      goto LABEL_23;
    v17 = v6;
    if (vabdd_f64(v11 / v13, v9) < 0.05)
      break;
LABEL_15:
    ++v6;
    v8 = v17;
    if (v6 == 28)
      goto LABEL_24;
  }
  if (v11 <= width || v13 <= height)
  {
    v17 = v8;
    v7 = v6;
    goto LABEL_15;
  }
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (ErrorLogLevelForModule >= 8)
  {
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    v22 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 136316418;
        v25 = v20;
        v26 = 2080;
        v27 = "-[VCAVFoundationCapture captureTierForEncodingSize:]";
        v28 = 1024;
        v29 = 1452;
        v30 = 2048;
        v31 = v6;
        v32 = 2048;
        v33 = v11;
        v34 = 2048;
        v35 = v13;
        _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d resolution i = %ld, found optimal capture tier. width=%f, height=%f", (uint8_t *)&v24, 0x3Au);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v24 = 136316418;
      v25 = v20;
      v26 = 2080;
      v27 = "-[VCAVFoundationCapture captureTierForEncodingSize:]";
      v28 = 1024;
      v29 = 1452;
      v30 = 2048;
      v31 = v6;
      v32 = 2048;
      v33 = v11;
      v34 = 2048;
      v35 = v13;
      _os_log_debug_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEBUG, " [%s] %s:%d resolution i = %ld, found optimal capture tier. width=%f, height=%f", (uint8_t *)&v24, 0x3Au);
    }
  }
LABEL_23:
  v17 = v8;
  v7 = v6;
LABEL_24:
  if (v7 == -1)
    return v17;
  else
    return v7;
}

- (int)stop:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 isPreviewing;
  _BOOL4 isCapturing;
  NSObject *captureSessionQueue;
  _QWORD v11[5];
  BOOL v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      isPreviewing = self->_isPreviewing;
      isCapturing = self->_isCapturing;
      *(_DWORD *)buf = 136316418;
      v14 = v5;
      v15 = 2080;
      v16 = "-[VCAVFoundationCapture stop:]";
      v17 = 1024;
      v18 = 1463;
      v19 = 1024;
      v20 = v3;
      v21 = 1024;
      v22 = isPreviewing;
      v23 = 1024;
      v24 = isCapturing;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d shouldStopPreview=%d _isPreviewing=%d _isCapturing=%d", buf, 0x2Eu);
    }
  }
  captureSessionQueue = self->_captureSessionQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __30__VCAVFoundationCapture_stop___block_invoke;
  v11[3] = &unk_1E9E521E8;
  v11[4] = self;
  v12 = v3;
  dispatch_sync(captureSessionQueue, v11);
  return 0;
}

void __30__VCAVFoundationCapture_stop___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 338) || *(_BYTE *)(v2 + 337))
  {
    *(_BYTE *)(v2 + 338) = 0;
    if (*(_BYTE *)(a1 + 40))
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 337) = 0;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "stopRunning");
      *(double *)(*(_QWORD *)(a1 + 32) + 296) = micro()
                                                - *(double *)(*(_QWORD *)(a1 + 32) + 288)
                                                + *(double *)(*(_QWORD *)(a1 + 32) + 296);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v3 = VRTraceErrorLogLevelToCSTR();
        v4 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v10 = 136315650;
          v11 = v3;
          v12 = 2080;
          v13 = "-[VCAVFoundationCapture stop:]_block_invoke";
          v14 = 1024;
          v15 = 1475;
          _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _captureSession stopRunning", (uint8_t *)&v10, 0x1Cu);
        }
      }
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "captureServer"), "handleCaptureEvent:", CFSTR("avCaptureCameraDidStop"));
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(unsigned __int8 *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(unsigned __int8 *)(v8 + 337);
      LODWORD(v8) = *(unsigned __int8 *)(v8 + 338);
      v10 = 136316418;
      v11 = v5;
      v12 = 2080;
      v13 = "-[VCAVFoundationCapture stop:]_block_invoke";
      v14 = 1024;
      v15 = 1467;
      v16 = 1024;
      v17 = v7;
      v18 = 1024;
      v19 = v9;
      v20 = 1024;
      v21 = v8;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d preview already stopped! shouldStopPreview=%d _isPreviewing=%d _isCapturing=%d", (uint8_t *)&v10, 0x2Eu);
    }
  }
}

- (int)invalidate
{
  NSObject *captureSessionQueue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  captureSessionQueue = self->_captureSessionQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__VCAVFoundationCapture_invalidate__block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = self;
  dispatch_sync(captureSessionQueue, v4);
  return 0;
}

uint64_t __35__VCAVFoundationCapture_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUpCaptureDevicePropertyObserver:", 0);
}

- (int)setWidth:(int)a3 height:(int)a4 frameRate:(int)a5
{
  NSObject *captureSessionQueue;
  int v6;
  _QWORD block[6];
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  captureSessionQueue = self->_captureSessionQueue;
  v15 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VCAVFoundationCapture_setWidth_height_frameRate___block_invoke;
  block[3] = &unk_1E9E535E0;
  v9 = a3;
  v10 = a4;
  block[4] = self;
  block[5] = &v12;
  v11 = a5;
  dispatch_sync(captureSessionQueue, block);
  v6 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v6;
}

void __51__VCAVFoundationCapture_setWidth_height_frameRate___block_invoke(uint64_t a1)
{
  double *v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (double *)(*(_QWORD *)(a1 + 32) + 304);
  v3 = *(_DWORD *)(a1 + 52);
  *v2 = (double)*(int *)(a1 + 48);
  v2[1] = (double)v3;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "setVideoDeviceToWidth:height:frameRate:");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_DWORD *)(a1 + 48);
      v7 = *(_DWORD *)(a1 + 52);
      v8 = *(_DWORD *)(a1 + 56);
      v9 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v10 = 136316674;
      v11 = v4;
      v12 = 2080;
      v13 = "-[VCAVFoundationCapture setWidth:height:frameRate:]_block_invoke";
      v14 = 1024;
      v15 = 1496;
      v16 = 1024;
      v17 = v6;
      v18 = 1024;
      v19 = v7;
      v20 = 1024;
      v21 = v8;
      v22 = 1024;
      v23 = v9;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %dx%d/%d, error=%d", (uint8_t *)&v10, 0x34u);
    }
  }
}

- (int)copyColorInfo:(const __CFDictionary *)a3
{
  NSObject *captureSessionQueue;
  int v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__VCAVFoundationCapture_copyColorInfo___block_invoke;
  v6[3] = &unk_1E9E52378;
  v6[5] = &v7;
  v6[6] = a3;
  v6[4] = self;
  dispatch_sync(captureSessionQueue, v6);
  v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __39__VCAVFoundationCapture_copyColorInfo___block_invoke(uint64_t a1)
{
  __CFDictionary *Mutable;
  CFDictionaryRef Extensions;
  const void *v4;
  const void *v5;
  const void *v6;

  if (*(_QWORD *)(a1 + 48))
  {
    Mutable = CFDictionaryCreateMutable(0, 3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    Extensions = CMFormatDescriptionGetExtensions((CMFormatDescriptionRef)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32)+ 144), "device"), "activeFormat"), "formatDescription"));
    v4 = (const void *)-[__CFDictionary objectForKeyedSubscript:](Extensions, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8D68]);
    v5 = (const void *)-[__CFDictionary objectForKeyedSubscript:](Extensions, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8E98]);
    v6 = (const void *)-[__CFDictionary objectForKeyedSubscript:](Extensions, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8EE8]);
    if (v4)
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CECF48], v4);
    if (v5)
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CED238], v5);
    if (v6)
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CED290], v6);
    **(_QWORD **)(a1 + 48) = Mutable;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -2146893823;
  }
}

- (BOOL)isPreviewRunning
{
  NSObject *captureSessionQueue;
  char v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__VCAVFoundationCapture_isPreviewRunning__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(captureSessionQueue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __41__VCAVFoundationCapture_isPreviewRunning__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 337);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v5 = 136315906;
      v6 = v2;
      v7 = 2080;
      v8 = "-[VCAVFoundationCapture isPreviewRunning]_block_invoke";
      v9 = 1024;
      v10 = 1534;
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d isPreviewRunning=%d", (uint8_t *)&v5, 0x22u);
    }
  }
}

- (int)getFrameRate
{
  NSObject *captureSessionQueue;
  int v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__VCAVFoundationCapture_getFrameRate__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(captureSessionQueue, block);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__VCAVFoundationCapture_getFrameRate__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 260);
  return result;
}

- (BOOL)isInternalCamera
{
  AVCaptureDevice *captureDevice;
  uint64_t v3;

  captureDevice = self->_captureDevice;
  if (!captureDevice)
    return 1;
  v3 = -[AVCaptureDevice deviceType](captureDevice, "deviceType");
  return v3 != *MEMORY[0x1E0C89FA8];
}

- (BOOL)isCurrentCaptureDeviceAppleProduct
{
  return -[NSString containsString:](-[AVCaptureDevice manufacturer](self->_captureDevice, "manufacturer"), "containsString:", CFSTR("Apple Inc."));
}

- (BOOL)supportsPortraitResolution
{
  return self->_supportPortraitResolution;
}

- (int)configureCaptureWithToken:(_VCVideoSourceToken)a3
{
  NSObject *captureSessionQueue;
  int v4;
  _QWORD v6[6];
  $948446A44E2BC96870B572155DF52E0B var0;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__VCAVFoundationCapture_configureCaptureWithToken___block_invoke;
  v6[3] = &unk_1E9E54D70;
  v6[4] = self;
  v6[5] = &v8;
  var0 = a3.var0.var0;
  dispatch_sync(captureSessionQueue, v6);
  v4 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __51__VCAVFoundationCapture_configureCaptureWithToken___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  _BYTE *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "beginConfiguration");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "setCamera:width:height:frameRate:", *(unsigned int *)(a1 + 48), (int)*(double *)(*(_QWORD *)(a1 + 32)+ 304), (int)*(double *)(*(_QWORD *)(a1 + 32)+ 312), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 268));
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_DWORD *)(a1 + 48);
      v5 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(v5 + 304);
      v6 = *(_QWORD *)(v5 + 312);
      v8 = *(_DWORD *)(v5 + 268);
      v9 = *(unsigned __int8 *)(v5 + 337);
      v10 = *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v13 = 136317186;
      v14 = v2;
      v15 = 2080;
      v16 = "-[VCAVFoundationCapture configureCaptureWithToken:]_block_invoke";
      v17 = 1024;
      v18 = 1736;
      v19 = 1024;
      v20 = v4;
      v21 = 2048;
      v22 = v7;
      v23 = 2048;
      v24 = v6;
      v25 = 1024;
      v26 = v8;
      v27 = 1024;
      v28 = v9;
      v29 = 2048;
      v30 = v10;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoSourceToken=0x%x(%4.0fx%4.0f/%d), isPreviewing=%d, error=0x%lx", (uint8_t *)&v13, 0x4Cu);
    }
  }
  v11 = *(_BYTE **)(a1 + 32);
  if (v11[337])
  {
    objc_msgSend(v11, "unlockAVCaptureDeviceInputForConfiguration");
    v11 = *(_BYTE **)(a1 + 32);
  }
  objc_msgSend(v11, "applyVideoRetainedBufferCountHint");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "commitConfiguration");
}

- (void)initializeViewpointCorrection
{
  _BOOL4 v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  VCVideoCaptureServer *v13;
  unsigned int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  self->_isViewpointSupported = 0;
  v3 = +[VCHardwareSettings isViewPointCorrectionSupported](VCHardwareSettings, "isViewPointCorrectionSupported");
  v4 = _os_feature_enabled_impl();
  self->_isViewpointSupported = v3 & v4;
  v5 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-viewpoint-correction-enabled"));
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "BOOLValue") & 1) == 0)
    self->_isViewpointSupported = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136316418;
      v15 = v7;
      v16 = 2080;
      v17 = "-[VCAVFoundationCapture initializeViewpointCorrection]";
      v18 = 1024;
      v19 = 1761;
      v20 = 1024;
      v21 = v3;
      v22 = 1024;
      v23 = v4;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d hardwareSupport=%d, featureFlag=%d, storeBagValue=%@", (uint8_t *)&v14, 0x32u);
    }
  }
  if (VCDefaults_GetBoolValueForKey(CFSTR("VPCForceEnable"), 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136315650;
        v15 = v9;
        v16 = 2080;
        v17 = "-[VCAVFoundationCapture initializeViewpointCorrection]";
        v18 = 1024;
        v19 = 1764;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Defaults overwrite support Viewpoint Correction to 1", (uint8_t *)&v14, 0x1Cu);
      }
    }
    self->_isViewpointSupported = 1;
  }
  else if (!self->_isViewpointSupported)
  {
    goto LABEL_17;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315650;
      v15 = v11;
      v16 = 2080;
      v17 = "-[VCAVFoundationCapture initializeViewpointCorrection]";
      v18 = 1024;
      v19 = 1769;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Viewpoint Correction is supported", (uint8_t *)&v14, 0x1Cu);
    }
  }
  self->_viewpointCorrection = (VCViewpointCorrection *)objc_opt_new();
  -[VCAVFoundationCapture setViewPointCorrectionEnabled:](self, "setViewPointCorrectionEnabled:", VCDefaults_GetEyeContactEnabledBoolValue(1));
LABEL_17:
  -[VCVideoCapture captureServer](self, "captureServer");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = -256;
    LOBYTE(v15) = -1;
    -[VCAVFoundationCapture dispatchedCurrentVideoFeatureStatus:](self, "dispatchedCurrentVideoFeatureStatus:", &v14);
    v13 = -[VCVideoCapture captureServer](self, "captureServer");
    -[VCVideoCaptureServer captureSourceVideoFeatureStatusDidChange:](v13, "captureSourceVideoFeatureStatusDidChange:", v14 | ((unint64_t)v15 << 32));
  }
}

- (void)setViewPointCorrectionEnabled:(BOOL)a3
{
  NSObject *captureSessionQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (self->_isViewpointSupported)
  {
    captureSessionQueue = self->_captureSessionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__VCAVFoundationCapture_setViewPointCorrectionEnabled___block_invoke;
    block[3] = &unk_1E9E521E8;
    block[4] = self;
    v5 = a3;
    dispatch_async(captureSessionQueue, block);
  }
}

void __55__VCAVFoundationCapture_setViewPointCorrectionEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  int ErrorLogLevelForModule;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  int v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 225);
  v3 = *(unsigned __int8 *)(a1 + 40);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v2 == v3)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(unsigned __int8 *)(a1 + 40);
        v13 = 136315906;
        v14 = v5;
        v15 = 2080;
        v16 = "-[VCAVFoundationCapture setViewPointCorrectionEnabled:]_block_invoke";
        v17 = 1024;
        v18 = 1795;
        v19 = 1024;
        v20 = v7;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d already in enabled=%d", (uint8_t *)&v13, 0x22u);
      }
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 225);
        v11 = *(unsigned __int8 *)(a1 + 40);
        v13 = 136316162;
        v14 = v8;
        v15 = 2080;
        v16 = "-[VCAVFoundationCapture setViewPointCorrectionEnabled:]_block_invoke";
        v17 = 1024;
        v18 = 1797;
        v19 = 1024;
        v20 = v10;
        v21 = 1024;
        v22 = v11;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %d->%d", (uint8_t *)&v13, 0x28u);
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "beginConfiguration");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 225) = *(_BYTE *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "resetDepthDataOutput");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "commitConfiguration");
    objc_msgSend(*(id *)(a1 + 32), "captureServer");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = -256;
      LOBYTE(v14) = -1;
      objc_msgSend(*(id *)(a1 + 32), "dispatchedCurrentVideoFeatureStatus:", &v13);
      v12 = (void *)objc_msgSend(*(id *)(a1 + 32), "captureServer");
      objc_msgSend(v12, "captureSourceVideoFeatureStatusDidChange:", v13 | ((unint64_t)v14 << 32));
    }
  }
}

- (void)getReportingStats:(__CFDictionary *)a3
{
  int VPCProcessedFrameCount;
  float v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  int VPCModifiedFrameCount;
  uint64_t v11;
  double v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3 && self->_isCapturing)
  {
    VPCProcessedFrameCount = self->_VPCProcessedFrameCount;
    if (VPCProcessedFrameCount)
      v6 = (float)(self->_viewpointProcessTime / (float)VPCProcessedFrameCount) * 1000.0;
    else
      v6 = 0.0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = self->_VPCProcessedFrameCount;
        VPCModifiedFrameCount = self->_VPCModifiedFrameCount;
        v13 = 136316418;
        v14 = v7;
        v15 = 2080;
        v16 = "-[VCAVFoundationCapture getReportingStats:]";
        v17 = 1024;
        v18 = 1824;
        v19 = 1024;
        v20 = v9;
        v21 = 1024;
        v22 = VPCModifiedFrameCount;
        v23 = 2048;
        v24 = v6;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Viewpoint Health - processed frames:%d (modified=%u), average process time ms: %4.3f", (uint8_t *)&v13, 0x32u);
      }
    }
    v11 = -[VCAVFoundationCapture isFrontCamera](self, "isFrontCamera") ^ 1;
    CFDictionaryAddValue(a3, CFSTR("VPCFRAMECOUNT"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_VPCProcessedFrameCount));
    CFDictionaryAddValue(a3, CFSTR("VPCMODIFYCOUNT"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_VPCModifiedFrameCount));
    *(float *)&v12 = v6;
    CFDictionaryAddValue(a3, CFSTR("VPCPROCESSTIME"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12));
    CFDictionaryAddValue(a3, CFSTR("CAMRESW"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_activeWidth));
    CFDictionaryAddValue(a3, CFSTR("CAMRESH"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_activeHeight));
    CFDictionaryAddValue(a3, CFSTR("CAMPOSCUR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11));
    -[VCAVFoundationCapture collectCaptureFrameRateStats:](self, "collectCaptureFrameRateStats:", a3);
    CFDictionaryAddValue(a3, CFSTR("CAMSLA"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVCaptureDevice isStudioLightActive](self->_captureDevice, "isStudioLightActive")));
    -[VCAVFoundationCapture resetViewPointLogging](self, "resetViewPointLogging");
  }
}

- (void)applyBlockToAllAvailableCaptureFormats:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  AVCaptureDevice *captureDevice;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v4 = objc_msgSend(&unk_1E9EFA1A8, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(&unk_1E9EFA1A8);
        v8 = (void *)objc_msgSend(MEMORY[0x1E0C8B0A0], "deviceWithUniqueID:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v9 = (void *)objc_msgSend(v8, "formats");
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v28;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v28 != v12)
                objc_enumerationMutation(v9);
              (*((void (**)(id, _QWORD))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j));
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
          }
          while (v11);
        }
      }
      v5 = objc_msgSend(&unk_1E9EFA1A8, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
    }
    while (v5);
  }
  captureDevice = self->_captureDevice;
  if (captureDevice)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = -[AVCaptureDevice formats](captureDevice, "formats");
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (k = 0; k != v17; ++k)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          (*((void (**)(id, _QWORD))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * k));
        }
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
      }
      while (v17);
    }
  }
}

- (BOOL)isCenterStageSupported
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__VCAVFoundationCapture_isCenterStageSupported__block_invoke;
  v4[3] = &unk_1E9E56230;
  v4[4] = &v5;
  -[VCAVFoundationCapture applyBlockToAllAvailableCaptureFormats:](self, "applyBlockToAllAvailableCaptureFormats:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __47__VCAVFoundationCapture_isCenterStageSupported__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCenterStageSupported");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

- (BOOL)isPortraitModeSupported
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__VCAVFoundationCapture_isPortraitModeSupported__block_invoke;
  v4[3] = &unk_1E9E56230;
  v4[4] = &v5;
  -[VCAVFoundationCapture applyBlockToAllAvailableCaptureFormats:](self, "applyBlockToAllAvailableCaptureFormats:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __48__VCAVFoundationCapture_isPortraitModeSupported__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isPortraitEffectSupported");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

- (BOOL)isStudioLightSupported
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__VCAVFoundationCapture_isStudioLightSupported__block_invoke;
  v4[3] = &unk_1E9E56230;
  v4[4] = &v5;
  -[VCAVFoundationCapture applyBlockToAllAvailableCaptureFormats:](self, "applyBlockToAllAvailableCaptureFormats:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __47__VCAVFoundationCapture_isStudioLightSupported__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isStudioLightSupported");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

- (BOOL)isReactionSupported
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__VCAVFoundationCapture_isReactionSupported__block_invoke;
  v4[3] = &unk_1E9E56230;
  v4[4] = &v5;
  -[VCAVFoundationCapture applyBlockToAllAvailableCaptureFormats:](self, "applyBlockToAllAvailableCaptureFormats:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __44__VCAVFoundationCapture_isReactionSupported__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "reactionEffectsSupported");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

- (void)reportStatus:(__CFDictionary *)a3 forKey:(__CFString *)a4 supported:(BOOL)a5 enabled:(BOOL)a6
{
  uint64_t v8;

  v8 = -[VCAVFoundationCapture featureStatusForFeatureSupported:enabled:](self, "featureStatusForFeatureSupported:enabled:", a5, a6);
  CFDictionaryAddValue(a3, a4, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", v8));
}

- (char)featureStatusForFeatureSupported:(BOOL)a3 enabled:(BOOL)a4
{
  if (a3)
    return a4;
  else
    return -1;
}

- (void)retrieveInitialReportingStats:(__CFDictionary *)a3
{
  char viewPointCorrectionEnabled;
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;

  if (a3)
  {
    if (self->_isViewpointSupported)
      viewPointCorrectionEnabled = self->_viewPointCorrectionEnabled;
    else
      viewPointCorrectionEnabled = -1;
    CFDictionaryAddValue(a3, CFSTR("VideoEyeContact"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", viewPointCorrectionEnabled));
    v6 = -[VCAVFoundationCapture isPortraitModeSupported](self, "isPortraitModeSupported");
    -[VCAVFoundationCapture reportStatus:forKey:supported:enabled:](self, "reportStatus:forKey:supported:enabled:", a3, CFSTR("PMFENB"), v6, objc_msgSend(MEMORY[0x1E0C8B0A0], "isPortraitEffectEnabled"));
    v7 = -[VCAVFoundationCapture isStudioLightSupported](self, "isStudioLightSupported");
    -[VCAVFoundationCapture reportStatus:forKey:supported:enabled:](self, "reportStatus:forKey:supported:enabled:", a3, CFSTR("SLFENB"), v7, objc_msgSend(MEMORY[0x1E0C8B0A0], "isStudioLightEnabled"));
    v8 = -[VCAVFoundationCapture isCenterStageSupported](self, "isCenterStageSupported");
    -[VCAVFoundationCapture reportStatus:forKey:supported:enabled:](self, "reportStatus:forKey:supported:enabled:", a3, CFSTR("CSFENB"), v8, objc_msgSend(MEMORY[0x1E0C8B0A0], "isCenterStageEnabled"));
    v9 = -[VCAVFoundationCapture isReactionSupported](self, "isReactionSupported");
    -[VCAVFoundationCapture reportStatus:forKey:supported:enabled:](self, "reportStatus:forKey:supported:enabled:", a3, CFSTR("REFENB"), v9, objc_msgSend(MEMORY[0x1E0C8B0A0], "reactionEffectsEnabled"));
  }
}

- (void)dispatchedCurrentVideoFeatureStatus:(tagVCVideoCaptureFeatureStatus *)a3
{
  char viewPointCorrectionEnabled;
  AVCaptureDevice *captureDevice;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315650;
    v27 = v16;
    v28 = 2080;
    v29 = "-[VCAVFoundationCapture dispatchedCurrentVideoFeatureStatus:]";
    v30 = 1024;
    v31 = 1917;
    v18 = " [%s] %s:%d Feature status cannot be NULL";
LABEL_23:
    _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0x1Cu);
    return;
  }
  if (self->_isViewpointSupported)
    viewPointCorrectionEnabled = self->_viewPointCorrectionEnabled;
  else
    viewPointCorrectionEnabled = -1;
  a3->var0 = viewPointCorrectionEnabled;
  captureDevice = self->_captureDevice;
  if (!captureDevice)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return;
    v19 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315650;
    v27 = v19;
    v28 = 2080;
    v29 = "-[VCAVFoundationCapture dispatchedCurrentVideoFeatureStatus:]";
    v30 = 1024;
    v31 = 1922;
    v18 = " [%s] %s:%d Cannot get current video feature status without captureDevice";
    goto LABEL_23;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = -[AVCaptureDevice formats](captureDevice, "formats");
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v6);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v9 |= objc_msgSend(v15, "isCenterStageSupported");
        v10 |= objc_msgSend(v15, "isPortraitEffectSupported");
        v11 |= objc_msgSend(v15, "reactionEffectsSupported");
        v12 |= objc_msgSend(v15, "isStudioLightSupported");
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
    }
    while (v8);
  }
  else
  {
    LOBYTE(v9) = 0;
    LOBYTE(v10) = 0;
    LOBYTE(v11) = 0;
    LOBYTE(v12) = 0;
  }
  a3->var1 = -[VCAVFoundationCapture featureStatusForFeatureSupported:enabled:](self, "featureStatusForFeatureSupported:enabled:", v9 & 1, objc_msgSend(MEMORY[0x1E0C8B0A0], "isCenterStageEnabled"));
  a3->var2 = -[VCAVFoundationCapture featureStatusForFeatureSupported:enabled:](self, "featureStatusForFeatureSupported:enabled:", v10 & 1, objc_msgSend(MEMORY[0x1E0C8B0A0], "isPortraitEffectEnabled"));
  a3->var4 = -[VCAVFoundationCapture featureStatusForFeatureSupported:enabled:](self, "featureStatusForFeatureSupported:enabled:", v11 & 1, objc_msgSend(MEMORY[0x1E0C8B0A0], "reactionEffectsEnabled"));
  a3->var3 = -[VCAVFoundationCapture featureStatusForFeatureSupported:enabled:](self, "featureStatusForFeatureSupported:enabled:", v12 & 1, objc_msgSend(MEMORY[0x1E0C8B0A0], "isStudioLightEnabled"));
}

- (tagVCVideoCaptureFeatureStatus)currentVideoFeatureStatus
{
  NSObject *captureSessionQueue;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  const char *v10;
  int v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2810000000;
  v10 = "";
  v11 = -256;
  v12 = -1;
  captureSessionQueue = self->_captureSessionQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__VCAVFoundationCapture_currentVideoFeatureStatus__block_invoke;
  v6[3] = &unk_1E9E522B0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(captureSessionQueue, v6);
  v3 = *((unsigned __int8 *)v8 + 36);
  v4 = *((unsigned int *)v8 + 8);
  _Block_object_dispose(&v7, 8);
  return (tagVCVideoCaptureFeatureStatus)(v4 | (v3 << 32));
}

uint64_t __50__VCAVFoundationCapture_currentVideoFeatureStatus__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedCurrentVideoFeatureStatus:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
}

- (void)collectCaptureFrameRateStats:(__CFDictionary *)a3
{
  NSObject *captureSessionQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__VCAVFoundationCapture_collectCaptureFrameRateStats___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(captureSessionQueue, block);
}

void __54__VCAVFoundationCapture_collectCaptureFrameRateStats___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 338) || *(_BYTE *)(v2 + 337))
  {
    v3 = micro();
    *(double *)(*(_QWORD *)(a1 + 32) + 296) = v3
                                              - *(double *)(*(_QWORD *)(a1 + 32) + 288)
                                              + *(double *)(*(_QWORD *)(a1 + 32) + 296);
    *(double *)(*(_QWORD *)(a1 + 32) + 288) = v3;
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(double *)(v2 + 296) >= 2.0)
  {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 40), CFSTR("CAMFC"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v2 + 280)));
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 40), CFSTR("CAMDUR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 296)));
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 280) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296) = 0;
  }
}

- (BOOL)cameraSupportsFormatWidth:(int)a3 height:(int)a4
{
  NSObject *captureSessionQueue;
  char v5;
  _QWORD v7[6];
  int v8;
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  captureSessionQueue = self->_captureSessionQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__VCAVFoundationCapture_cameraSupportsFormatWidth_height___block_invoke;
  v7[3] = &unk_1E9E52378;
  v7[4] = self;
  v7[5] = &v10;
  v8 = a3;
  v9 = a4;
  dispatch_sync(captureSessionQueue, v7);
  v5 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __58__VCAVFoundationCapture_cameraSupportsFormatWidth_height___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "cameraFormatForWidth:height:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (BOOL)cameraSupportsNoQueueFormatWidth:(int)a3 height:(int)a4
{
  return -[VCAVFoundationCapture cameraFormatForWidth:height:](self, "cameraFormatForWidth:height:", *(_QWORD *)&a3, *(_QWORD *)&a4) != 0;
}

- (BOOL)cameraContainsCaptureFormatWithWidth:(int)a3 height:(int)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CMVideoDimensions Dimensions;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = -[VCAVFoundationCapture getCaptureFormatList](self, "getCaptureFormatList");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1)+ 8 * v10), "formatDescription"));
        if (Dimensions.width == a3 && Dimensions.height == a4)
        {
          LOBYTE(v7) = 1;
          return v7;
        }
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      v8 = v7;
      if (v7)
        continue;
      break;
    }
  }
  return v7;
}

- (void)setCameraZoomFactor:(double)a3 withRate:(double)a4
{
  AVCaptureDeviceInput **p_videoDeviceInput;
  double v8;
  double v9;
  double v10;
  AVCaptureDevice *v11;
  double v12;

  if (-[VCAVFoundationCapture isBackCamera](self, "isBackCamera"))
  {
    p_videoDeviceInput = &self->_videoDeviceInput;
    if (-[AVCaptureDevice lockForConfiguration:](-[AVCaptureDeviceInput device](*p_videoDeviceInput, "device"), "lockForConfiguration:", 0))
    {
      -[AVCaptureDeviceFormat videoMaxZoomFactor](-[AVCaptureDevice activeFormat](-[AVCaptureDeviceInput device](*p_videoDeviceInput, "device"), "activeFormat"), "videoMaxZoomFactor");
      v9 = 1.0;
      if (a3 >= 1.0)
        v9 = a3;
      if (v8 >= v9)
        v10 = v9;
      else
        v10 = v8;
      v11 = -[AVCaptureDeviceInput device](*p_videoDeviceInput, "device");
      *(float *)&v12 = a4;
      -[AVCaptureDevice rampToVideoZoomFactor:withRate:](v11, "rampToVideoZoomFactor:withRate:", v10, v12);
      -[AVCaptureDevice unlockForConfiguration](-[AVCaptureDeviceInput device](*p_videoDeviceInput, "device"), "unlockForConfiguration");
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAVFoundationCapture setCameraZoomFactor:withRate:].cold.1();
    }
  }
}

- (BOOL)shouldAdjustCaptureWithOrientation:(int)a3
{
  _BOOL4 v3;
  CGSize *p_requestSize;
  double width;
  double height;
  id v8;
  id v9;
  float v10;
  unint64_t v11;
  float v12;
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int lastClientRequestedFrameRate;
  CGFloat v17;
  double v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  double v22;
  CGFloat v23;
  uint64_t v24;
  NSObject *v25;
  int v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  int v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if ((a3 & 0xFFFFFFFE) == 2)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    p_requestSize = &self->_requestSize;
    width = self->_requestSize.width;
    height = self->_requestSize.height;
    if (width <= height)
    {
      v3 = 0;
    }
    else
    {
      v8 = -[VCAVFoundationCapture cameraFormatForWidth:height:frameRate:](self, "cameraFormatForWidth:height:frameRate:", (int)height, (int)width, self->_lastClientRequestedFrameRate);
      v9 = -[VCAVFoundationCapture cameraFormatForWidth:height:frameRate:](self, "cameraFormatForWidth:height:frameRate:", (int)p_requestSize->width, (int)p_requestSize->height, self->_lastClientRequestedFrameRate);
      v10 = p_requestSize->height / p_requestSize->width;
      v11 = _VCAVFoundationCapture_effectiveResolution(v8, v10);
      v12 = p_requestSize->width / p_requestSize->height;
      v13 = _VCAVFoundationCapture_effectiveResolution(v9, v12);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          lastClientRequestedFrameRate = self->_lastClientRequestedFrameRate;
          v18 = p_requestSize->width;
          v17 = p_requestSize->height;
          v27 = 136317186;
          v28 = v14;
          v29 = 2080;
          v30 = "-[VCAVFoundationCapture shouldAdjustCaptureWithOrientation:]";
          v31 = 1024;
          v32 = 2100;
          v33 = 2080;
          v34 = "Portrait";
          v35 = 2048;
          v36 = v11;
          v37 = 2048;
          v38 = v17;
          v39 = 2048;
          v40 = v18;
          v41 = 1024;
          v42 = lastClientRequestedFrameRate;
          v43 = 2112;
          v44 = v8;
          _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %-10s, resolution=%12llu, %4.0fx%4.0f@%d from %@", (uint8_t *)&v27, 0x54u);
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v21 = self->_lastClientRequestedFrameRate;
          v22 = p_requestSize->width;
          v23 = p_requestSize->height;
          v27 = 136317186;
          v28 = v19;
          v29 = 2080;
          v30 = "-[VCAVFoundationCapture shouldAdjustCaptureWithOrientation:]";
          v31 = 1024;
          v32 = 2101;
          v33 = 2080;
          v34 = "Landscape";
          v35 = 2048;
          v36 = v13;
          v37 = 2048;
          v38 = v22;
          v39 = 2048;
          v40 = v23;
          v41 = 1024;
          v42 = v21;
          v43 = 2112;
          v44 = v9;
          _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %-10s, resolution=%12llu, %4.0fx%4.0f@%d from %@", (uint8_t *)&v27, 0x54u);
        }
      }
      v3 = v11 == v13;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v27 = 136315906;
        v28 = v24;
        v29 = 2080;
        v30 = "-[VCAVFoundationCapture shouldAdjustCaptureWithOrientation:]";
        v31 = 1024;
        v32 = 2104;
        v33 = 1024;
        LODWORD(v34) = v3;
        _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d better capture in portrait fashion = %d", (uint8_t *)&v27, 0x22u);
      }
    }
  }
  return v3;
}

- (void)updateCenterStageEnabled:(BOOL)a3 requestCaptureChange:(BOOL)a4
{
  NSObject *captureSessionQueue;
  _QWORD block[5];
  BOOL v6;
  BOOL v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  captureSessionQueue = self->_captureSessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__VCAVFoundationCapture_updateCenterStageEnabled_requestCaptureChange___block_invoke;
  block[3] = &unk_1E9E52A50;
  block[4] = self;
  v6 = a3;
  v7 = a4;
  dispatch_async(captureSessionQueue, block);
}

void __71__VCAVFoundationCapture_updateCenterStageEnabled_requestCaptureChange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  int v14;
  unsigned int *v15;
  uint64_t v16;
  unsigned int *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  _WORD v33[9];

  *(_QWORD *)&v33[5] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 144) || !*(_BYTE *)(v1 + 238))
    return;
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 228) == v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(unsigned __int8 *)(a1 + 40);
        v26 = 136315906;
        if (v6)
          v7 = "enabled";
        else
          v7 = "disabled";
        v27 = v4;
        v28 = 2080;
        v29 = "-[VCAVFoundationCapture updateCenterStageEnabled:requestCaptureChange:]_block_invoke";
        v30 = 1024;
        v31 = 2129;
        v32 = 2080;
        *(_QWORD *)v33 = v7;
        v8 = " [%s] %s:%d already %s.";
        v9 = v5;
        v10 = 38;
        goto LABEL_30;
      }
    }
    return;
  }
  *(_BYTE *)(v1 + 228) = v3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(unsigned __int8 *)(a1 + 40);
      v14 = *(unsigned __int8 *)(a1 + 41);
      v26 = 136316162;
      v27 = v11;
      v28 = 2080;
      v29 = "-[VCAVFoundationCapture updateCenterStageEnabled:requestCaptureChange:]_block_invoke";
      v30 = 1024;
      v31 = 2134;
      v32 = 1024;
      *(_DWORD *)v33 = v13;
      v33[2] = 1024;
      *(_DWORD *)&v33[3] = v14;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d enabled=%d, requestCaptureChange=%d", (uint8_t *)&v26, 0x28u);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "captureServer");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "captureServer"), "centerStageEnabledDidChange:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "beginConfiguration");
  if (objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "device"), "lockForConfiguration:", 0))
  {
    if (*(_BYTE *)(a1 + 41))
    {
      objc_msgSend(MEMORY[0x1E0C8B0A0], "setCenterStageControlMode:", 2);
      objc_msgSend(MEMORY[0x1E0C8B0A0], "setCenterStageEnabled:", *(unsigned __int8 *)(a1 + 40));
    }
    v15 = *(unsigned int **)(a1 + 32);
    v16 = v15[67];
    if (*(_BYTE *)(a1 + 40))
    {
      if ((int)v16 < 31)
      {
LABEL_26:
        objc_msgSend(*(id *)(a1 + 32), "updateCenterStageRegionOfInterestWithLock:", 0);
        objc_msgSend(*(id *)(a1 + 32), "configureMetadataTypesForOutput:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200));
        objc_msgSend(*(id *)(a1 + 32), "resetDepthDataOutput");
        objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "device"), "unlockForConfiguration");
        goto LABEL_27;
      }
      v17 = *(unsigned int **)(a1 + 32);
      v18 = 30;
    }
    else
    {
      v18 = objc_msgSend(*(id *)(a1 + 32), "getMaxAllowedFrameRate:", v16);
      v17 = v15;
    }
    objc_msgSend(v17, "setFrameRateInternal:forceSourceFrameRateDidChange:", v18, 0);
    goto LABEL_26;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
      v26 = 136315906;
      v27 = v19;
      v28 = 2080;
      v29 = "-[VCAVFoundationCapture updateCenterStageEnabled:requestCaptureChange:]_block_invoke";
      v30 = 1024;
      v31 = 2160;
      v32 = 2112;
      *(_QWORD *)v33 = v21;
      _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to retain lock for video device input: %@", (uint8_t *)&v26, 0x26u);
    }
  }
LABEL_27:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "commitConfiguration");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(MEMORY[0x1E0C8B0A0], "isCenterStageEnabled");
      v25 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "device"), "isCenterStageActive");
      v26 = 136316162;
      v27 = v22;
      v28 = 2080;
      v29 = "-[VCAVFoundationCapture updateCenterStageEnabled:requestCaptureChange:]_block_invoke";
      v30 = 1024;
      v31 = 2163;
      v32 = 1024;
      *(_DWORD *)v33 = v24;
      v33[2] = 1024;
      *(_DWORD *)&v33[3] = v25;
      v8 = " [%s] %s:%d Device enabled = %d, active = %d";
      v9 = v23;
      v10 = 40;
LABEL_30:
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v26, v10);
    }
  }
}

- (BOOL)setCaptureDeviceMinFrameRateIfNeeded:(int)a3
{
  int deviceMinFrameRate;
  int32_t v6;
  BOOL v7;
  AVCaptureDevice *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v13;
  NSObject *v14;
  int v15;
  AVCaptureDeviceFormat *v16;
  CMTime v17[2];
  CMTime time1;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  AVCaptureDeviceFormat *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  deviceMinFrameRate = self->_deviceMinFrameRate;
  if (!deviceMinFrameRate)
    return 0;
  if (deviceMinFrameRate >= a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      v7 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return v7;
      v11 = self->_deviceMinFrameRate;
      LODWORD(time1.value) = 136316162;
      *(CMTimeValue *)((char *)&time1.value + 4) = v9;
      LOWORD(time1.flags) = 2080;
      *(_QWORD *)((char *)&time1.flags + 2) = "-[VCAVFoundationCapture setCaptureDeviceMinFrameRateIfNeeded:]";
      HIWORD(time1.epoch) = 1024;
      v19 = 2174;
      v20 = 1024;
      v21 = v11;
      v22 = 1024;
      LODWORD(v23) = a3;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _deviceMinFrameRate=%d is not smaller than targetFrameRate=%d. NO change to captureDeviceFrameRate", (uint8_t *)&time1, 0x28u);
    }
    return 0;
  }
  memset(&v17[1], 170, sizeof(CMTime));
  -[VCAVFoundationCapture frameDurationForVideoDeviceFormat:frameRate:](self, "frameDurationForVideoDeviceFormat:frameRate:", -[AVCaptureDevice activeFormat](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "activeFormat"), self->_deviceMinFrameRate);
  time1 = v17[1];
  v17[0] = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  v6 = CMTimeCompare(&time1, v17);
  v7 = v6 != 0;
  if (v6)
  {
    v8 = -[AVCaptureDeviceInput device](self->_videoDeviceInput, "device");
    time1 = v17[1];
    -[AVCaptureDevice setActiveVideoMaxFrameDuration:](v8, "setActiveVideoMaxFrameDuration:", &time1);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v15 = self->_deviceMinFrameRate;
      v16 = -[AVCaptureDevice activeFormat](-[AVCaptureDeviceInput device](self->_videoDeviceInput, "device"), "activeFormat");
      LODWORD(time1.value) = 136316162;
      *(CMTimeValue *)((char *)&time1.value + 4) = v13;
      LOWORD(time1.flags) = 2080;
      *(_QWORD *)((char *)&time1.flags + 2) = "-[VCAVFoundationCapture setCaptureDeviceMinFrameRateIfNeeded:]";
      HIWORD(time1.epoch) = 1024;
      v19 = 2179;
      v20 = 1024;
      v21 = v15;
      v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Can not find frameDuration for framerate=%d, activeFormat=%@!", (uint8_t *)&time1, 0x2Cu);
    }
  }
  return v7;
}

- (double)setUpVideoZoomFactor
{
  NSString *v3;
  NSString *v4;
  double v5;
  float v6;

  v3 = -[AVCaptureDevice deviceType](self->_captureDevice, "deviceType");
  if (v3 == (NSString *)*MEMORY[0x1E0C89F88]
    || (v4 = -[AVCaptureDevice deviceType](self->_captureDevice, "deviceType"),
        v5 = 1.0,
        v4 == (NSString *)*MEMORY[0x1E0C89F60]))
  {
    objc_msgSend(-[NSArray firstObject](-[AVCaptureDevice virtualDeviceSwitchOverVideoZoomFactors](self->_captureDevice, "virtualDeviceSwitchOverVideoZoomFactors"), "firstObject"), "floatValue");
    v5 = v6;
  }
  -[VCAVFoundationCapture setCameraZoomFactor:](self, "setCameraZoomFactor:", v5);
  return v5;
}

+ (BOOL)deviceInputSupportsCenterStage:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_msgSend((id)objc_msgSend(a3, "device"), "formats");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "isCenterStageSupported") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          return v4;
        }
        ++v7;
      }
      while (v5 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
      v5 = v4;
      if (v4)
        continue;
      break;
    }
  }
  return v4;
}

+ (BOOL)captureDeviceformatSupportsVideoEffects:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "isPortraitEffectSupported");
  else
    return 0;
}

+ (BOOL)deviceInputSupportsVideoEffects:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_msgSend((id)objc_msgSend(a3, "device"), "formats");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (+[VCAVFoundationCapture captureDeviceformatSupportsVideoEffects:](VCAVFoundationCapture, "captureDeviceformatSupportsVideoEffects:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7)))
        {
          LOBYTE(v4) = 1;
          return v4;
        }
        ++v7;
      }
      while (v5 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
      v5 = v4;
      if (v4)
        continue;
      break;
    }
  }
  return v4;
}

- (id)cameraFormatForWidth:(int)a3 height:(int)a4
{
  return -[VCAVFoundationCapture cameraFormatForWidth:height:frameRate:](self, "cameraFormatForWidth:height:frameRate:", *(_QWORD *)&a3, *(_QWORD *)&a4, 0);
}

- (BOOL)isFormatMaxFrameRateSupported:(id)a3 frameRate:(int)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t i;
  void *v11;
  double v12;
  double v14;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (void *)objc_msgSend(a3, "videoSupportedFrameRateRanges");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "maxFrameRate");
        if (v12 > 60.0 || a4 == 0)
        {
          v9 &= v12 <= 60.0;
        }
        else
        {
          objc_msgSend(v11, "maxFrameRate");
          if (v14 < (double)a4)
            v9 = 0;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 1;
  }
  return v9 & 1;
}

- (void)prepareSynchronizedOutputs:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_outputSynchronizerOutputs)
    self->_outputSynchronizerOutputs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((-[NSMutableArray containsObject:](self->_outputSynchronizerOutputs, "containsObject:", v9) & 1) == 0)
          -[NSMutableArray addObject:](self->_outputSynchronizerOutputs, "addObject:", v9);
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
}

- (AVCaptureDepthDataOutput)depthDataOutput
{
  return self->_depthDataOutput;
}

- (BOOL)faceMeshTrackingEnabled
{
  return self->_faceMeshTrackingEnabled;
}

- (BOOL)effectsApplied
{
  return self->_effectsApplied;
}

- (void)initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:cinematicFramingEnabled:videoOrientation:capturePixelFormat:.cold.1()
{
  __int16 v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];
  int v4;
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9();
  v4 = 358;
  v5 = v0;
  v6 = "VCAVFCaptureNumberPropertyAllocator";
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v1, v2, " [%s] %s:%d Failed to allocate %s", v3);
  OUTLINED_FUNCTION_3();
}

- (void)shouldResizeWithCaptureSize:requestSize:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Allocating VCResizeImageBuffer failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateCenterStageRegionOfInterestWithLock:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retain lock for capture device=%@.");
  OUTLINED_FUNCTION_3();
}

- (void)encodeProcessedPixelBuffer:time:imageData:processTime:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[24];
  int v3;
  __int16 v4;
  uint64_t v5;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  v3 = 920;
  v4 = 2048;
  v5 = v0;
  _os_log_debug_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Send processed video frame to encoder %lld", v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)dataOutputSynchronizer:(NSObject *)a3 didOutputSynchronizedDataCollection:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  __int16 v4;
  int v5;
  uint8_t v6[14];
  const char *v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "droppedReason");
  OUTLINED_FUNCTION_12_0();
  v7 = "-[VCAVFoundationCapture dataOutputSynchronizer:didOutputSynchronizedDataCollection:]";
  OUTLINED_FUNCTION_4();
  v8 = 1319;
  v9 = v4;
  v10 = v5;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Sample buffer was dropped. AVCaptureOutputDataDroppedReason: %d", v6, 0x22u);
  OUTLINED_FUNCTION_3_0();
}

- (void)captureSessionNotification:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d captureServer is nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __52__VCAVFoundationCapture_captureSessionNotification___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d session run time error %@");
  OUTLINED_FUNCTION_3();
}

void __64__VCAVFoundationCapture_startCaptureWithWidth_height_frameRate___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Capture called before Preview, failing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setFrameRateInternal:forceSourceFrameRateDidChange:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCAVFoundationCapture setFrameRateInternal:forceSourceFrameRateDidChange:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid frame rate %d", v2, *(const char **)v3, (unint64_t)"-[VCAVFoundationCapture setFrameRateInternal:forceSourceFrameRateDidChange:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setFrameRateInternal:forceSourceFrameRateDidChange:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to lock device %@");
  OUTLINED_FUNCTION_3();
}

- (void)setCameraZoomFactor:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retain lock for video device input: %@");
  OUTLINED_FUNCTION_3();
}

- (void)setCameraZoomFactor:withRate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retain lock for video device input: %@");
  OUTLINED_FUNCTION_3();
}

- (void)setCamera:width:height:frameRate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Camera not found for UID=%@");
  OUTLINED_FUNCTION_3();
}

- (void)setCamera:width:height:frameRate:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCAVFoundationCapture setCamera:width:height:frameRate:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d setVideoDeviceToSelectedDevice failed, result=0x%x", v2, *(const char **)v3, (unint64_t)"-[VCAVFoundationCapture setCamera:width:height:frameRate:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setVideoDeviceToSelectedDevice:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d initWithDevice() failed, error=%@");
  OUTLINED_FUNCTION_3();
}

- (void)setVideoDeviceToWidth:height:frameRate:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d failed locking for configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
