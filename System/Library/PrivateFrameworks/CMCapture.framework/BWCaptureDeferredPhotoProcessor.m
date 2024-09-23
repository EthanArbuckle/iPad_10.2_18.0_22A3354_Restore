@implementation BWCaptureDeferredPhotoProcessor

- (BWCaptureDeferredPhotoProcessor)initWithFigCaptureDeferredPhotoProcessor:(OpaqueFigCaptureDeferredPhotoProcessor *)a3
{
  BWCaptureDeferredPhotoProcessor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWCaptureDeferredPhotoProcessor;
  v4 = -[BWCaptureDeferredPhotoProcessor init](&v6, sel_init);
  if (v4)
    v4->_weakDeferredPhotoProcessorReference = (FigWeakReference *)+[FigWeakReference weakReferenceToObject:](FigWeakReference, "weakReferenceToObject:", a3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWCaptureDeferredPhotoProcessor;
  -[BWCaptureDeferredPhotoProcessor dealloc](&v3, sel_dealloc);
}

- (void)request:(id)a3 failedWithError:(int)a4
{
  uint64_t v4;
  id v6;
  _BYTE *DerivedStorage;
  _BYTE *v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  _DWORD *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[7];
  os_log_type_t type;
  int v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD v20[31];

  v4 = *(_QWORD *)&a4;
  v20[28] = *MEMORY[0x1E0C80C00];
  v6 = -[FigWeakReference referencedObject](self->_weakDeferredPhotoProcessorReference, "referencedObject");
  DerivedStorage = (_BYTE *)CMBaseObjectGetDerivedStorage();
  if (DerivedStorage)
  {
    v8 = DerivedStorage;
    if (*DerivedStorage)
    {
      if (dword_1ECFE9390)
      {
        v17 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v10 = objc_msgSend((id)objc_msgSend(a3, "container", v13, v14), "abortingProcessingDueToError:", v4);
      v11 = (_DWORD *)MEMORY[0x1E0CA1FC0];
      if (*MEMORY[0x1E0CA1FC0] == 1)
        v10 = kdebug_trace();
      v12 = (void *)MEMORY[0x1A858DD40](v10);
      if (!objc_msgSend(a3, "parent"))
      {
        v19[0] = CFSTR("CaptureRequestIdentifier");
        v20[0] = objc_msgSend(a3, "captureRequestIdentifier");
        v19[1] = CFSTR("PhotoIdentifiers");
        v18 = objc_msgSend(a3, "photoIdentifier");
        v20[1] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
        v19[2] = CFSTR("ErrorStatus");
        v20[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
        captureDeferredPhotoProcessor_sendXPCNotificationWithPayload((uint64_t)v6, (uint64_t)CFSTR("DidFinishProcessingPhotoProxy"), (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3));
      }
      if (!v8[57])
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __59__BWCaptureDeferredPhotoProcessor_request_failedWithError___block_invoke;
        v15[3] = &unk_1E4920768;
        v15[4] = a3;
        v15[5] = v8;
        v15[6] = v6;
        captureDeferredPhotoProcessor_performBlockOnWorkerQueueAsync(v6, (uint64_t)v15);
      }
      objc_autoreleasePoolPop(v12);
      if (*v11 == 1)
        kdebug_trace();
    }
  }
}

void __59__BWCaptureDeferredPhotoProcessor_request_failedWithError___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48))
    captureDeferredPhotoProcessor_cleanupForCurrentProcessingRequest(*(const void **)(a1 + 48));
}

- (void)job:(id)a3 failedWithError:(int)a4
{
  -[BWCaptureDeferredPhotoProcessor request:failedWithError:](self, "request:failedWithError:", objc_msgSend(a3, "processorRequest"), *(_QWORD *)&a4);
}

- (void)job:(id)a3 completedWithSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  opaqueCMSampleBuffer *v4;
  id v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v8;
  _BYTE *DerivedStorage;
  _DWORD *v10;
  void *v11;
  id v12;
  const __CFAllocator *v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  const void *StillImageMetadataInSettingsForSampleBuffer;
  void *IrisAssetIdentifierForSettingsAndSampleBuffer;
  uint64_t v24;
  uint64_t v25;
  opaqueCMSampleBuffer *v26;
  int v27;
  __CFDictionary *v28;
  CFTypeRef v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CFTypeRef v33;
  unsigned int v34;
  CFTypeRef v35;
  void *v36;
  CFTypeRef v37;
  CFTypeRef v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __IOSurface *v51;
  __IOSurface *v52;
  CFTypeRef v53;
  const __CFDictionary *v54;
  const void *v55;
  int v56;
  char v57[8];
  uint64_t v58;
  const void *v59;
  unsigned int v60;
  BWCaptureDeferredPhotoProcessor *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v66;
  _QWORD v68[5];
  CMTime v69;
  os_log_type_t type;
  int v71;
  CMTime v72;
  uint64_t v73;

  v4 = a4;
  v5 = a3;
  v73 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9390)
  {
    v71 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v4 = a4;
  }
  v8 = -[FigWeakReference referencedObject](self->_weakDeferredPhotoProcessorReference, "referencedObject", *(_QWORD *)v57, v58);
  DerivedStorage = (_BYTE *)CMBaseObjectGetDerivedStorage();
  if (DerivedStorage && *DerivedStorage)
  {
    v10 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    if (*MEMORY[0x1E0CA1FC0] == 1)
      DerivedStorage = (_BYTE *)kdebug_trace();
    v11 = (void *)MEMORY[0x1A858DD40](DerivedStorage);
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (objc_msgSend((id)objc_msgSend(v5, "processorRequest"), "parent"))
    {

LABEL_44:
      objc_autoreleasePoolPop(v11);
      if (*v10 == 1)
        kdebug_trace();
      return;
    }
    v61 = self;
    v66 = v12;
    v64 = v11;
    memset(&v69, 0, sizeof(v69));
    CMSampleBufferGetPresentationTimeStamp(&v69, v4);
    v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v72 = v69;
    v14 = CMTimeCopyAsDictionary(&v72, v13);
    if (v14)
    {
      v15 = v14;
      v63 = (uint64_t)v8;
      v62 = (void *)CMGetAttachment(v4, CFSTR("PhotoManifest"), 0);
      v16 = (void *)objc_msgSend(v62, "descriptorForSampleBuffer:", v4);
      v17 = FigCaptureMetadataUtilitiesShouldIncludeDiagnosticMetadata() != 0;
      v18 = (void *)CMGetAttachment(v4, CFSTR("StillImageSettings"), 0);
      v19 = objc_msgSend(v18, "outputOrientation");
      v20 = objc_msgSend(v18, "outputMirroring");
      v21 = objc_msgSend(v18, "flashMode");
      StillImageMetadataInSettingsForSampleBuffer = (const void *)FigCaptureMetadataUtilitiesGetStillImageMetadataInSettingsForSampleBuffer(v18, v4);
      IrisAssetIdentifierForSettingsAndSampleBuffer = (void *)FigCaptureMetadataUtilitiesGetIrisAssetIdentifierForSettingsAndSampleBuffer(v18, v4);
      v24 = objc_msgSend(v18, "imageGroupIdentifier");
      v25 = objc_msgSend(v16, "time");
      v59 = (const void *)v24;
      v26 = a4;
      v27 = v21;
      v5 = a3;
      v28 = objc_autorelease(FigCaptureMetadataUtilitiesCreateMetadataAttachments(a4, v19, v20, 1, 1, v27, v17, 1, 0, 1, 0, 0, 0, 0, StillImageMetadataInSettingsForSampleBuffer, IrisAssetIdentifierForSettingsAndSampleBuffer, v59, 0,
                v25,
                0));
      objc_msgSend(v66, "setObject:forKeyedSubscript:", v15, CFSTR("PresentationTimestamp"));
      objc_msgSend(v66, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a3, "processorRequest"), "captureRequestIdentifier"), CFSTR("CaptureRequestIdentifier"));
      objc_msgSend(v66, "setObject:forKeyedSubscript:", objc_msgSend(v16, "photoIdentifier"), CFSTR("PhotoIdentifier"));
      if ((objc_msgSend(v16, "processingFlags") & 0x10000) == 0)
      {
        v29 = CMGetAttachment(a4, CFSTR("EncodedImageSurface"), 0);
        v30 = objc_msgSend((id)CMGetAttachment(a4, CFSTR("EncodedImageSurfaceSize"), 0), "unsignedLongValue");
        v31 = objc_msgSend((id)CMGetAttachment(a4, CFSTR("EncodedImageCodecType"), 0), "intValue");
        v32 = objc_msgSend((id)CMGetAttachment(a4, CFSTR("EncodedImageFileType"), 0), "intValue");
LABEL_13:
        v46 = 4294950471;
        if (v29 && v30 && (_DWORD)v31 && (_DWORD)v32 && v28)
        {
          objc_msgSend(v66, "setObject:forKeyedSubscript:", v29, CFSTR("Surface"));
          objc_msgSend(v66, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v30), CFSTR("SurfaceSize"));
          objc_msgSend(v66, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v31), CFSTR("PhotoCodec"));
          objc_msgSend(v66, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v32), CFSTR("PhotoFileType"));
          objc_msgSend(v66, "setObject:forKeyedSubscript:", v28, CFSTR("Metadata"));
          if (objc_msgSend(v18, "depthDataDeliveryEnabled")
            && (objc_msgSend(v18, "embedsDepthDataInImage") & 1) == 0)
          {
            fcdpp_copyAttachedMediaSurfaceDataFromSampleBufferIntoNotificationPayload(v26, (uint64_t)CFSTR("Depth"), (const __CFString *)*MEMORY[0x1E0D086F0], 0, v66, (uint64_t)CFSTR("DepthDataSurface"), (uint64_t)CFSTR("DepthMetadata"));
          }
          if (objc_msgSend(v18, "portraitEffectsMatteDeliveryEnabled")
            && (objc_msgSend(v18, "embedsPortraitEffectsMatteInImage") & 1) == 0)
          {
            fcdpp_copyAttachedMediaSurfaceDataFromSampleBufferIntoNotificationPayload(v26, 0x1E495AF38, (const __CFString *)*MEMORY[0x1E0D08730], 1, v66, (uint64_t)CFSTR("PortraitEffectsMatteSurface"), (uint64_t)CFSTR("PortraitEffectsMatteMetadata"));
          }
          v11 = v64;
          if ((objc_msgSend(v18, "embedsSemanticSegmentationMattesInImage") & 1) == 0)
          {
            v47 = (void *)objc_msgSend(v18, "enabledSemanticSegmentationMatteURNs");
            if (objc_msgSend(v47, "containsObject:", *MEMORY[0x1E0D09288]))
              fcdpp_copyAttachedMediaSurfaceDataFromSampleBufferIntoNotificationPayload(v26, (uint64_t)CFSTR("PersonSemanticsHair"), (const __CFString *)*MEMORY[0x1E0D08738], 1, v66, (uint64_t)CFSTR("HairSegmentationMatteSurface"), (uint64_t)CFSTR("HairSegmentationMatteMetadata"));
            v48 = (void *)objc_msgSend(v18, "enabledSemanticSegmentationMatteURNs");
            if (objc_msgSend(v48, "containsObject:", *MEMORY[0x1E0D09290]))
              fcdpp_copyAttachedMediaSurfaceDataFromSampleBufferIntoNotificationPayload(v26, (uint64_t)CFSTR("PersonSemanticsSkin"), (const __CFString *)*MEMORY[0x1E0D08738], 1, v66, (uint64_t)CFSTR("SkinSegmentationMatteSurface"), (uint64_t)CFSTR("SkinSegmentationMatteMetadata"));
            v49 = (void *)objc_msgSend(v18, "enabledSemanticSegmentationMatteURNs");
            if (objc_msgSend(v49, "containsObject:", *MEMORY[0x1E0D092A0]))
              fcdpp_copyAttachedMediaSurfaceDataFromSampleBufferIntoNotificationPayload(v26, (uint64_t)CFSTR("PersonSemanticsTeeth"), (const __CFString *)*MEMORY[0x1E0D08738], 1, v66, (uint64_t)CFSTR("TeethSegmentationMatteSurface"), (uint64_t)CFSTR("TeethSegmentationMatteMetadata"));
            v50 = (void *)objc_msgSend(v18, "enabledSemanticSegmentationMatteURNs");
            if (objc_msgSend(v50, "containsObject:", *MEMORY[0x1E0D09280]))
              fcdpp_copyAttachedMediaSurfaceDataFromSampleBufferIntoNotificationPayload(v26, (uint64_t)CFSTR("PersonSemanticsGlasses"), (const __CFString *)*MEMORY[0x1E0D08738], 1, v66, (uint64_t)CFSTR("GlassesSegmentationMatteSurface"), (uint64_t)CFSTR("GlassesSegmentationMatteMetadata"));
          }
          if (objc_msgSend(v18, "previewEnabled"))
          {
            v51 = (__IOSurface *)CMGetAttachment(v26, CFSTR("PreviewSurface"), 0);
            if (!v51)
            {
              FigDebugAssert3();
              v55 = (const void *)v63;
LABEL_41:

              v10 = (_DWORD *)MEMORY[0x1E0CA1FC0];
              if (v62)
              {
                v56 = objc_msgSend(v5, "numberOfPhotosDelivered");
                if (objc_msgSend((id)objc_msgSend(v62, "photoDescriptors"), "count") == v56)
                {
                  v68[0] = MEMORY[0x1E0C809B0];
                  v68[1] = 3221225472;
                  v68[2] = __65__BWCaptureDeferredPhotoProcessor_job_completedWithSampleBuffer___block_invoke;
                  v68[3] = &__block_descriptor_40_e5_v8__0l;
                  v68[4] = v55;
                  captureDeferredPhotoProcessor_performBlockOnWorkerQueueAsync(v55, (uint64_t)v68);
                }
              }
              goto LABEL_44;
            }
            v52 = v51;
            objc_msgSend(v66, "setObject:forKeyedSubscript:", v51, CFSTR("PreviewSurface"));
            objc_msgSend(v66, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", IOSurfaceGetAllocSize(v52)), CFSTR("PreviewSurfaceSize"));
          }
          if (objc_msgSend(v18, "cameraCalibrationDataDeliveryEnabled"))
          {
            if (!objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("DepthMetadata")))
            {
              v53 = CMGetAttachment(v26, CFSTR("CameraCalibrationDataMetadata"), 0);
              if (v53)
                objc_msgSend(v66, "setObject:forKeyedSubscript:", v53, CFSTR("DepthMetadata"));
            }
          }
          objc_msgSend(v66, "setObject:forKeyedSubscript:", 0, CFSTR("ThumbnailSurface"));
          v54 = (const __CFDictionary *)objc_msgSend(v66, "copy");
          v55 = (const void *)v63;
          captureDeferredPhotoProcessor_sendXPCNotificationWithPayload(v63, (uint64_t)CFSTR("DidFinishProcessingPhotoProxy"), v54);

          goto LABEL_41;
        }
        goto LABEL_48;
      }
      v33 = CMGetAttachment(a4, CFSTR("RawImageSurface"), 0);
      v30 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a4, CFSTR("RawImageAssetSizes"), 0), "objectForKeyedSubscript:", 0x1E495AC98), "unsignedLongValue");
      v34 = objc_msgSend(v18, "rawOutputFormat");
      v32 = objc_msgSend((id)CMGetAttachment(a4, CFSTR("RawImageFileType"), 0), "intValue");
      v35 = CMGetAttachment(a4, CFSTR("RawDNGDictionary"), 0);
      if (v35)
      {
        v36 = (void *)v35;
        v60 = v34;
        v37 = v33;
        v38 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
        v39 = objc_msgSend((id)CMGetAttachment(a4, CFSTR("RawImageContainsDepthData"), 0), "BOOLValue");
        v40 = objc_msgSend((id)CMGetAttachment(a4, CFSTR("RawImageContainsSemanticSegmentationMattes"), 0), "BOOLValue");
        v41 = objc_msgSend(v18, "rawOutputFileCodec");
        v42 = (void *)v38;
        v29 = v37;
        v31 = v60;
        v43 = objc_msgSend(v42, "objectForKeyedSubscript:", *MEMORY[0x1E0D06948]);
        v44 = v40;
        v26 = a4;
        v45 = v41;
        v5 = a3;
        v28 = BWCreateRawMetadataFromMetadata(v28, v36, 0x10000u, v43, v39, v44, v45);
        goto LABEL_13;
      }
    }
    v46 = 4294954516;
LABEL_48:

    -[BWCaptureDeferredPhotoProcessor job:failedWithError:](v61, "job:failedWithError:", v5, v46);
    v10 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    v11 = v64;
    goto LABEL_44;
  }
}

void __65__BWCaptureDeferredPhotoProcessor_job_completedWithSampleBuffer___block_invoke(uint64_t a1)
{
  captureDeferredPhotoProcessor_cleanupForCurrentProcessingRequest(*(const void **)(a1 + 32));
}

- (void)_prepareToTerminateImmediatelyDueToError:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *DerivedStorage;
  _BYTE *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x1E0C80C00];
  -[FigWeakReference referencedObject](self->_weakDeferredPhotoProcessorReference, "referencedObject");
  DerivedStorage = (_BYTE *)CMBaseObjectGetDerivedStorage();
  if (DerivedStorage)
  {
    v7 = DerivedStorage;
    if (*DerivedStorage)
    {
      if (!_FigIsCurrentDispatchQueue())
      {
        v15 = v3;
        LODWORD(v14) = 0;
        FigDebugAssert3();
      }
      v8 = *((_QWORD *)v7 + 6);
      if (v8)
      {
        -[BWCaptureDeferredPhotoProcessor request:failedWithError:](self, "request:failedWithError:", v8, v4);
        *((_QWORD *)v7 + 6) = 0;
      }
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v9 = (void *)*((_QWORD *)v7 + 5);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16, v14, v15);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v9);
            -[BWCaptureDeferredPhotoProcessor request:failedWithError:](self, "request:failedWithError:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), v4);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v11);
      }
      objc_msgSend(*((id *)v7 + 5), "removeAllObjects");
    }
  }
}

@end
