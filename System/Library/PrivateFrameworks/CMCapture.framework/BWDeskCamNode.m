@implementation BWDeskCamNode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWDeskCamNode)initWithOutputDimensions:(id)a3 cameraInfoByPortType:(id)a4 horizontalSensorBinningFactor:(int)a5 verticalSensorBinningFactor:(int)a6 stillImageCaptureEnabled:(BOOL)a7 objectMetadataIdentifiers:(id)a8 maxLossyCompressionLevel:(int)a9 portType:(id)a10 overheadCameraMode:(int)a11 captureDevice:(id)a12
{
  _BOOL4 v13;
  BWDeskCamNode *v18;
  uint64_t v19;
  BWNodeInput *v20;
  BWVideoFormatRequirements *v21;
  BWNodeOutput *v22;
  BWVideoFormatRequirements *v23;
  BWNodeInput *v24;
  BWVideoFormatRequirements *v25;
  BWNodeOutput *v26;
  BWVideoFormatRequirements *v27;
  BWNodeInput *v28;
  BWNodeOutput *v29;
  id v30;
  objc_super v32;

  v13 = a7;
  v32.receiver = self;
  v32.super_class = (Class)BWDeskCamNode;
  v18 = -[BWNode init](&v32, sel_init);
  v19 = (uint64_t)v18;
  if (v18)
  {
    v18->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
    v18->_cameraInfoByPortType = (NSDictionary *)a4;
    *(_QWORD *)(v19 + 264) = objc_alloc_init(BWDeviceOrientationMonitor);
    *(_DWORD *)(v19 + 152) = 0;
    if ((a5 - 3) >= 0xFFFFFFFE && (*(_DWORD *)(v19 + 156) = a5, (a6 - 3) >= 0xFFFFFFFE))
    {
      *(_DWORD *)(v19 + 160) = a6;
      *(_DWORD *)(v19 + 296) = a9;
      v20 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v19, 0);
      v21 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v21, "setSupportedPixelFormats:", FigCapturePixelFormatsByAddingCompressedVariants(&unk_1E4A007E8, *(_DWORD *)(v19 + 296)));
      -[BWNodeInput setFormatRequirements:](v20, "setFormatRequirements:", v21);
      -[BWNodeInput setPassthroughMode:](v20, "setPassthroughMode:", 0);
      objc_msgSend((id)v19, "addInput:", v20);
      *(_QWORD *)(v19 + 96) = v20;

      v22 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v19);
      v23 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v23, "setSupportedPixelFormats:", -[BWDeskCamNode _supportedOutputPixelFormats](v19));
      -[BWNodeOutput setFormatRequirements:](v22, "setFormatRequirements:", v23);
      -[BWNodeOutput setPassthroughMode:](v22, "setPassthroughMode:", 0);
      -[BWNodeOutputMediaConfiguration setOwningNodeRetainedBufferCount:](-[BWNodeOutput primaryMediaConfiguration](v22, "primaryMediaConfiguration"), "setOwningNodeRetainedBufferCount:", 2);
      *(_QWORD *)(v19 + 104) = v22;
      objc_msgSend((id)v19, "addOutput:", v22);

      *(_BYTE *)(v19 + 284) = v13;
      if (v13)
      {
        v24 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v19, 1);
        v25 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v25, "setSupportedPixelFormats:", FigCapturePixelFormatsByAddingCompressedVariants(&unk_1E4A007E8, *(_DWORD *)(v19 + 296)));
        -[BWNodeInput setFormatRequirements:](v24, "setFormatRequirements:", v25);
        -[BWNodeInput setPassthroughMode:](v24, "setPassthroughMode:", 0);
        *(_QWORD *)(v19 + 112) = v24;
        objc_msgSend((id)v19, "addInput:", v24);

        v26 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v19);
        v27 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v27, "setSupportedPixelFormats:", -[BWDeskCamNode _supportedOutputPixelFormats](v19));
        -[BWNodeOutput setFormatRequirements:](v26, "setFormatRequirements:", v27);
        -[BWNodeOutput setPassthroughMode:](v26, "setPassthroughMode:", 0);
        -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](-[BWNodeOutput primaryMediaConfiguration](v26, "primaryMediaConfiguration"), "setProvidesPixelBufferPool:", 1);
        *(_QWORD *)(v19 + 120) = v26;
        objc_msgSend((id)v19, "addOutput:", v26);

        *(_OWORD *)(v19 + 184) = 0u;
        *(_OWORD *)(v19 + 200) = 0u;
        *(_OWORD *)(v19 + 216) = 0u;
        *(_OWORD *)(v19 + 232) = 0u;
        *(_DWORD *)(v19 + 248) = 0;
      }
      if (a8)
      {
        v28 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1835365473, v19, 2);
        *(_QWORD *)(v19 + 128) = v28;
        objc_msgSend((id)v19, "addInput:", v28);

        v29 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1836016234, v19);
        -[BWNodeOutput setFormat:](v29, "setFormat:", +[BWMetadataObjectFormat formatWithMetadataIdentifiers:](BWMetadataObjectFormat, "formatWithMetadataIdentifiers:", a8));
        *(_QWORD *)(v19 + 136) = v29;
        objc_msgSend((id)v19, "addOutput:", v29);

      }
      *(_DWORD *)(v19 + 280) = 5;
      *(_QWORD *)(v19 + 304) = objc_msgSend(a10, "copy");
      *(_DWORD *)(v19 + 312) = a11;
      v30 = a12;
      *(_QWORD *)(v19 + 320) = v30;
      objc_msgSend(v30, "setOverheadCameraModeChangeDelegate:", v19);
      -[BWDeskCamNode _updateOutputRequirements](v19);
      *(_WORD *)(v19 + 328) = 6;
      *(_WORD *)(v19 + 330) = 0;
    }
    else
    {
      return 0;
    }
  }
  return (BWDeskCamNode *)v19;
}

- (void)_supportedOutputPixelFormats
{
  void *v2;
  int v3;
  char IsFullRange;
  _QWORD v6[4];
  char v7;

  if (!a1)
    return 0;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", FigCapturePixelFormatsByAddingCompressedVariants(&unk_1E4A007E8, *(_DWORD *)(a1 + 296)));
  v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "videoFormat"), "pixelFormat");
  if (v3)
  {
    IsFullRange = FigCapturePixelFormatIsFullRange(v3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__BWDeskCamNode__supportedOutputPixelFormats__block_invoke;
    v6[3] = &__block_descriptor_33_e35_B24__0__NSNumber_8__NSDictionary_16l;
    v7 = IsFullRange;
    objc_msgSend(v2, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v6));
  }
  return v2;
}

- (uint64_t)_updateOutputRequirements
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 96), "videoFormat"), "colorSpaceProperties");
    if ((_DWORD)v2)
    {
      v7[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v2);
      v3 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    }
    else
    {
      v3 = 0;
    }
    objc_msgSend((id)objc_msgSend(*(id *)(v1 + 112), "videoFormat"), "colorSpaceProperties");
    v4 = -[BWDeskCamNode _supportedOutputPixelFormats](v1);
    v5 = (void *)objc_msgSend(*(id *)(v1 + 104), "formatRequirements");
    objc_msgSend(v5, "setWidth:", *(int *)(v1 + 176));
    objc_msgSend(v5, "setHeight:", *(int *)(v1 + 180));
    objc_msgSend(v5, "setSupportedColorSpaceProperties:", v3);
    objc_msgSend(v5, "setSupportedPixelFormats:", v4);
    v6 = (void *)objc_msgSend(*(id *)(v1 + 120), "formatRequirements");
    objc_msgSend(v6, "setWidth:", *(int *)(v1 + 176));
    objc_msgSend(v6, "setHeight:", *(int *)(v1 + 180));
    objc_msgSend(v6, "setSupportedColorSpaceProperties:", v3);
    return objc_msgSend(v6, "setSupportedPixelFormats:", v4);
  }
  return result;
}

- (void)dealloc
{
  OpaqueVTPixelTransferSession *stillImagePixelTransferSession;
  opaqueCMFormatDescription *outputFormatDescription;
  uint64_t v5;
  char v6;
  char v7;
  __CVBuffer *pixelBuffer;
  objc_super v9;

  stillImagePixelTransferSession = self->_stillImagePixelTransferSession;
  if (stillImagePixelTransferSession)
    CFRelease(stillImagePixelTransferSession);
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);
  if (self->_stillImageCaptureEnabled)
  {
    v5 = 0;
    v6 = 1;
    do
    {
      v7 = v6;
      pixelBuffer = self->_stillCaptureQueue[v5].pixelBuffer;
      if (pixelBuffer)
        CFRelease(pixelBuffer);
      v6 = 0;
      v5 = 1;
    }
    while ((v7 & 1) != 0);
  }

  v9.receiver = self;
  v9.super_class = (Class)BWDeskCamNode;
  -[BWNode dealloc](&v9, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("DeskCam");
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWDeskCamNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v3, sel_prepareForCurrentConfigurationToBecomeLive);
  -[BWDeskCamNode _initDeskCamSession]((uint64_t)self);
  -[BWDeviceOrientationMonitor start](self->_deviceOrientationMonitor, "start");
  if (self->_stillImageCaptureEnabled)
    VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &self->_stillImagePixelTransferSession);
}

- (uint64_t)_initDeskCamSession
{
  uint64_t v1;
  void *v2;

  if (result)
  {
    v1 = result;

    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10638]), "initWithOutputDimensions:portType:deviceModelName:", *(_QWORD *)(v1 + 176), *(_QWORD *)(v1 + 304), FigCaptureGetModelSpecificName());
    *(_QWORD *)(v1 + 256) = v2;
    return objc_msgSend(v2, "setOutputType:", *(unsigned int *)(v1 + 312));
  }
  return result;
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  int *v5;

  if (self->_videoCaptureInput == a5)
  {
    v5 = &OBJC_IVAR___BWDeskCamNode__videoCaptureOutput;
LABEL_8:
    objc_msgSend(*(id *)((char *)&self->super.super.isa + *v5), "makeConfiguredFormatLive", a3, a4);
    return;
  }
  if (self->_stillImageInput == a5)
  {
    v5 = &OBJC_IVAR___BWDeskCamNode__stillImageOutput;
    goto LABEL_8;
  }
  if (self->_detectionMetadataInput == a5)
  {
    v5 = &OBJC_IVAR___BWDeskCamNode__detectionMetadataOutput;
    goto LABEL_8;
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  uint64_t v4;

  if (self->_videoCaptureInput == a3)
  {
    -[BWDeviceOrientationMonitor stop](self->_deviceOrientationMonitor, "stop");
    -[BWNodeOutput markEndOfLiveOutput](self->_videoCaptureOutput, "markEndOfLiveOutput");

    self->_deskCamSession = 0;
  }
  else
  {
    if (self->_stillImageInput == a3)
    {
      v4 = 120;
      goto LABEL_8;
    }
    if (self->_detectionMetadataInput == a3)
    {
      v4 = 136;
LABEL_8:
      objc_msgSend(*(id *)((char *)&self->super.super.isa + v4), "markEndOfLiveOutput");
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  os_unfair_lock_s *v10;
  int *v11;
  void *v12;
  const __CFDictionary *v13;
  const __CFDictionary *Value;
  __CVBuffer *v15;
  CFTypeRef v16;
  void *v17;
  const __CFDictionary *v18;
  const __CFDictionary *v19;
  uint64_t v20;
  __CVBuffer *v21;
  size_t Width;
  size_t Height;
  int CopyWithNewPixelBuffer;
  void *v25;
  int v26;
  int v27;
  id v28;
  id v29;
  float v30;
  int MotionDataFromISP;
  float32x2_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  double v37;
  __CVBuffer *ImageBuffer;
  CFTypeRef v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  __CVBuffer *v43;
  os_unfair_lock_s *lock;
  void *v45;
  CMTime v46;
  float32x2_t v47;
  uint64_t v48;
  CMTime v49;
  CFTypeRef cf;
  float64x2_t v51;
  CMTimeEpoch epoch;
  uint64_t v53;

  v4 = (os_unfair_lock_s *)MEMORY[0x1E0C80A78](self, a2, a3, a4);
  v6 = v5;
  v8 = v7;
  v9 = (uint64_t)v4;
  v53 = *MEMORY[0x1E0C80C00];
  v10 = v4 + 38;
  os_unfair_lock_lock(v4 + 38);
  cf = 0;
  if (*(_QWORD *)(v9 + 112) == v6)
  {
    v11 = &OBJC_IVAR___BWDeskCamNode__stillImageOutput;
  }
  else if (*(_QWORD *)(v9 + 128) == v6)
  {
    v11 = &OBJC_IVAR___BWDeskCamNode__detectionMetadataOutput;
  }
  else
  {
    v11 = &OBJC_IVAR___BWDeskCamNode__videoCaptureOutput;
  }
  v12 = *(void **)(v9 + *v11);
  v13 = (const __CFDictionary *)CMGetAttachment(v8, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  Value = (const __CFDictionary *)CFDictionaryGetValue(v13, (const void *)*MEMORY[0x1E0D05D00]);
  memset(&v49, 0, sizeof(v49));
  CMTimeMakeFromDictionary(&v49, Value);
  if (*(_QWORD *)(v9 + 96) != v6)
  {
    if (*(_QWORD *)(v9 + 112) == v6)
    {
      v51 = *(float64x2_t *)&v49.value;
      epoch = v49.epoch;
      v15 = (__CVBuffer *)-[BWDeskCamNode _createMatchingPixelBufferFromSavedVideoBuffersWithTargetPts:](v9, (__CVBuffer **)&v51);
      if (!v15)
      {
        FigDebugAssert3();
        os_unfair_lock_unlock(v10);
        CopyWithNewPixelBuffer = -12783;
        goto LABEL_38;
      }
    }
    else
    {
      v15 = 0;
    }
LABEL_31:
    if (*(_QWORD *)(v9 + 128) == v6)
    {
      CopyWithNewPixelBuffer = 0;
      v39 = v8;
    }
    else
    {
      CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)v8, v15, (CFTypeRef *)(v9 + 144), (CMSampleBufferRef *)&cf);
      if (!cf)
        goto LABEL_36;
      ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v8);
      CVBufferPropagateAttachments(ImageBuffer, v15);
      -[BWDeskCamNode _updateTransportLayerAttachmentsForOutputSampleBuffer:](v9, cf);
      v39 = cf;
    }
    objc_msgSend(v12, "emitSampleBuffer:", v39);
LABEL_36:
    os_unfair_lock_unlock(v10);
    if (!v15)
      goto LABEL_38;
    goto LABEL_37;
  }
  v16 = CMGetAttachment(v8, CFSTR("OriginalCameraIntrinsicMatrix"), 0);
  if (v16
    && (v17 = (void *)v16,
        (v18 = (const __CFDictionary *)CMGetAttachment(v8, CFSTR("OriginalCameraIntrinsicMatrixReferenceDimensions"), 0)) != 0))
  {
    v19 = v18;
    v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v9, "output"), "primaryMediaProperties"), "livePixelBufferPool"), "newPixelBuffer");
    if (v20)
    {
      v15 = (__CVBuffer *)v20;
      lock = v10;
      v45 = v12;
      v21 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v8);
      Width = CVPixelBufferGetWidth(v21);
      v43 = v21;
      Height = CVPixelBufferGetHeight(v21);
      if (objc_msgSend((id)-[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D06C40]), "intValue") >= *(_DWORD *)(v9 + 280))v42 = -[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D069A0]);
      else
        v42 = 0;
      v25 = *(void **)(v9 + 168);
      v26 = *(_DWORD *)(v9 + 156);
      v27 = *(_DWORD *)(v9 + 160);
      v51 = *(float64x2_t *)&v49.value;
      epoch = v49.epoch;
      v28 = (id)FigCaptureCreateCalibrationDataDictionaryFromSampleBufferMetadataIncludeMaxRadius(v13, (__int128 *)&v51, v25, v26, v27, v17, v19, 0, 0, 1, 1);
      if (v28)
      {
        v29 = v28;
        v30 = (float)Width / (float)Height;
        if ((objc_msgSend((id)-[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D06B78]), "unsignedIntValue") & 1) != 0)
        {
          v41 = 2143289344;
          v12 = v45;
        }
        else
        {
          bzero(&v51, 0x14A0uLL);
          v47 = 0;
          v48 = 0;
          MotionDataFromISP = FigMotionGetMotionDataFromISP(v13, &v51, 0, 110, (int *)&v48 + 1, &v47, 0, 0, 0);
          v32 = (float32x2_t)2143289344;
          if (MotionDataFromISP)
          {
            v12 = v45;
          }
          else
          {
            v12 = v45;
            if (SHIDWORD(v48) >= 1)
              v32 = v47;
          }
          v41 = (uint64_t)v32;
        }
        v33 = FigCaptureSensorIDFromSampleBufferMetadata(v13, *(void **)(v9 + 168));
        v34 = objc_alloc(MEMORY[0x1E0D10640]);
        v35 = objc_msgSend(*(id *)(v9 + 264), "mostRecentPortraitLandscapeOrientation");
        v51 = *(float64x2_t *)&v49.value;
        epoch = v49.epoch;
        v36 = (void *)objc_msgSend(v34, "initWithDetectedObjectsInfo:cameraCalibrationData:cameraOrientation:timestamp:aspectRatio:sensorID:gravity:", v42, v29, v35, &v51, v33, COERCE_DOUBLE(__PAIR64__(HIDWORD(v49.value), LODWORD(v30))), *(double *)&v41);
        CopyWithNewPixelBuffer = objc_msgSend(*(id *)(v9 + 256), "processPixelBuffer:withMetadata:outputPixelBuffer:", v43, v36, v15);
        if (objc_msgSend((id)objc_msgSend(*(id *)(v9 + 320), "captureStream"), "hasFocus"))
        {
          ++*(_WORD *)(v9 + 330);
          objc_msgSend(*(id *)(v9 + 256), "focusPoint");
          if (-[BWDeskCamNode _updateFocusIfNeededWithFocusPoint:](v9, v37))
            *(_WORD *)(v9 + 330) = 0;
        }

        if (!CopyWithNewPixelBuffer)
        {
          v10 = lock;
          if (*(_BYTE *)(v9 + 284))
          {
            v51 = *(float64x2_t *)&v49.value;
            epoch = v49.epoch;
            -[BWDeskCamNode _savePixelBufferForStillImageCaptureRequests:withPts:](v9, v15, (__int128 *)&v51);
          }
          goto LABEL_31;
        }
        FigDebugAssert3();
      }
      else
      {
        FigDebugAssert3();
        CopyWithNewPixelBuffer = -12784;
        v12 = v45;
      }
      os_unfair_lock_unlock(lock);
LABEL_37:
      CFRelease(v15);
      goto LABEL_38;
    }
    CopyWithNewPixelBuffer = -12786;
  }
  else
  {
    FigDebugAssert3();
    CopyWithNewPixelBuffer = 0;
  }
  os_unfair_lock_unlock(v10);
LABEL_38:
  if (cf)
    CFRelease(cf);
  if (CopyWithNewPixelBuffer)
  {
    CMSampleBufferGetPresentationTimeStamp(&v46, (CMSampleBufferRef)v8);
    v40 = +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494F158, &v46);
    objc_msgSend(v12, "emitDroppedSample:", v40);

  }
}

- (uint64_t)_updateFocusIfNeededWithFocusPoint:(uint64_t)result
{
  uint64_t v2;

  if (result)
  {
    v2 = result;
    result = objc_msgSend((id)objc_msgSend(*(id *)(result + 320), "captureStream"), "hasFocus");
    if ((_DWORD)result)
    {
      if (*(unsigned __int16 *)(v2 + 330) == *(unsigned __int16 *)(v2 + 328))
      {
        if (*(float *)&a2 != -1.0 || *((float *)&a2 + 1) != -1.0)
          objc_msgSend(*(id *)(v2 + 320), "setContinuousAutoFocusRect:isFocusRectInOverscanSpace:", 0, *(float *)&a2, *((float *)&a2 + 1), 0.0, 0.0);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (void)_savePixelBufferForStillImageCaptureRequests:(__int128 *)a3 withPts:
{
  const void *v6;
  uint64_t v7;
  int v8;
  int v9;
  __int128 v10;
  uint64_t v11;

  if (a1)
  {
    v6 = *(const void **)(a1 + 184 + 32 * *(unsigned int *)(a1 + 248));
    if (v6)
      CFRelease(v6);
    v10 = *a3;
    v11 = *((_QWORD *)a3 + 2);
    if (cf)
      CFRetain(cf);
    v7 = a1 + 184 + 32 * *(unsigned int *)(a1 + 248);
    *(_QWORD *)v7 = cf;
    *(_OWORD *)(v7 + 8) = v10;
    *(_QWORD *)(v7 + 24) = v11;
    v8 = *(_DWORD *)(a1 + 248);
    if (v8 == 1)
      v9 = 0;
    else
      v9 = v8 + 1;
    *(_DWORD *)(a1 + 248) = v9;
  }
}

- (void)_createMatchingPixelBufferFromSavedVideoBuffersWithTargetPts:(uint64_t)a1
{
  uint64_t v3;
  __CVBuffer *v4;
  __CVBuffer *v5;
  unint64_t v6;
  char v7;
  char v8;
  __CVBuffer **v9;
  __CVBuffer *v10;
  __CVBuffer *v11;
  uint64_t v12;

  if (a1)
  {
    v3 = 0;
    v4 = 0;
    v5 = *a2;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    v7 = 1;
    while (1)
    {
      v8 = v7;
      v9 = (__CVBuffer **)(a1 + 184 + 32 * v3);
      v11 = *v9;
      v10 = v9[1];
      v12 = v5 - v10;
      if (v5 == v10)
        break;
      v7 = 0;
      if (v12 < 0)
        v12 = -v12;
      if (v6 > v12)
        v4 = v11;
      if (v6 >= v12)
        v6 = v12;
      v3 = 1;
      if ((v8 & 1) == 0)
      {
        if (!v4)
          return 0;
        return -[BWDeskCamNode _newStillImageOutputPixelBufferFromVideoPixelBuffer:](a1, v4);
      }
    }
    v4 = v11;
    if (v11)
      return -[BWDeskCamNode _newStillImageOutputPixelBufferFromVideoPixelBuffer:](a1, v4);
  }
  return 0;
}

- (uint64_t)_updateTransportLayerAttachmentsForOutputSampleBuffer:(uint64_t)result
{
  uint64_t v3;
  const __CFString *v4;
  void *v5;
  __n128 v6;
  __n128 v7;
  __n128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (result)
  {
    v3 = result;
    v4 = (const __CFString *)*MEMORY[0x1E0D05DD8];
    v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05DD8], 0);
    if (!v5)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      CMSetAttachment(target, v4, v5, 1u);
    }
    objc_msgSend(*(id *)(v3 + 256), "transformMatrix");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", BWRowMajorArrayFrom3x3Matrix(v6, v7, v8), *MEMORY[0x1E0D08280]);
    v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(v3 + 256), "transformIsValid"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D08278]);
    v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(v3 + 256), "isFrontFacingCamera"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D08268]);
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(v3 + 256), "exifOrientation"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CBCFF0]);
    v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(v3 + 256), "outputType"));
    return objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D08270]);
  }
  return result;
}

- (void)_newStillImageOutputPixelBufferFromVideoPixelBuffer:(uint64_t)a1
{
  void *v3;

  if (!a1)
    return 0;
  v3 = 0;
  if (a2)
  {
    if (*(_QWORD *)(a1 + 288))
    {
      v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 120), "primaryMediaProperties"), "livePixelBufferPool"), "newPixelBuffer");
      if (v3)
      {
        if (VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(a1 + 288), a2, (CVPixelBufferRef)v3))
        {
          CFRelease(v3);
          return 0;
        }
      }
    }
  }
  return v3;
}

BOOL __45__BWDeskCamNode__supportedOutputPixelFormats__block_invoke(uint64_t a1, void *a2)
{
  return *(unsigned __int8 *)(a1 + 32) == FigCapturePixelFormatIsFullRange(objc_msgSend(a2, "intValue"));
}

- (void)didChangeOverheadCameraMode:(int)a3
{
  if (self->_overheadCameraMode != a3)
  {
    self->_overheadCameraMode = a3;
    -[DeskCamSession setOutputType:](self->_deskCamSession, "setOutputType:");
  }
}

- (BWNodeInput)videoCaptureInput
{
  return self->_videoCaptureInput;
}

- (BWNodeOutput)videoCaptureOutput
{
  return self->_videoCaptureOutput;
}

- (BWNodeInput)stillImageInput
{
  return self->_stillImageInput;
}

- (BWNodeOutput)stillImageOutput
{
  return self->_stillImageOutput;
}

- (BWNodeInput)detectionMetadataInput
{
  return self->_detectionMetadataInput;
}

- (BWNodeOutput)detectionMetadataOutput
{
  return self->_detectionMetadataOutput;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

@end
