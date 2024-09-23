@implementation BWFigCaptureSession

- (void)previewStitcher:(id)a3 overCaptureStatusDidChange:(int)a4
{
  uint64_t v4;
  BWFigCaptureSession *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v4 = *(_QWORD *)&a4;
  v5 = self;
  v7[2] = *MEMORY[0x1E0C80C00];
  if (self)
    self = (BWFigCaptureSession *)self->_pipelines;
  v6[0] = CFSTR("SectionID");
  v7[0] = objc_msgSend((id)objc_msgSend((id)-[BWFigCaptureSession previewSinkPipelines](self, "previewSinkPipelines", a3), "firstObject"), "sinkID");
  v6[1] = CFSTR("Status");
  v7[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  captureSession_postNotificationWithPayload(v5->_captureSession, CFSTR("OverCaptureStatusDidChange"), (const void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2));
}

- (void)imageQueueSinkNodeDidDisplayFirstFrame:(id)a3 atHostTime:(int64_t)a4
{
  OpaqueFigCaptureSession *captureSession;
  uint64_t DerivedStorage;
  FigCaptureSessionPipelines *pipelines;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const void *v16;
  const void *v17;
  _QWORD v18[7];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  captureSession = self->_captureSession;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if ((objc_msgSend(*(id *)(DerivedStorage + 56), "isEqualToString:", 0x1E493D4D8) & 1) != 0
    || objc_msgSend(*(id *)(DerivedStorage + 56), "isEqualToString:", 0x1E493D5F8))
  {
    pipelines = self->_pipelines;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = -[FigCaptureSessionPipelines previewSinkPipelines](pipelines, "previewSinkPipelines");
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((id)objc_msgSend(v15, "imageQueueSinkNode") == a3)
          {
            v16 = (const void *)-[FigCaptureCameraSourcePipeline captureSource]((uint64_t)-[FigCaptureSessionPipelines cameraSourcePipelineWithSourceID:](pipelines, "cameraSourcePipelineWithSourceID:", objc_msgSend(v15, "sourceID")));
            if (v16)
            {
              v17 = v16;
              CFRetain(v16);
              v18[0] = MEMORY[0x1E0C809B0];
              v18[1] = 3221225472;
              v18[2] = __73__BWFigCaptureSession_imageQueueSinkNodeDidDisplayFirstFrame_atHostTime___block_invoke;
              v18[3] = &__block_descriptor_56_e8_v12__0B8l;
              v18[4] = DerivedStorage;
              v18[5] = v17;
              v18[6] = a4;
              captureSession_dispatchGraphCalloutToWorkerQueueAfter(captureSession, (uint64_t)v18, 0.0);
            }
            return;
          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v12)
          continue;
        break;
      }
    }
  }
}

- (void)graphDidPrepareNodes:(id)a3
{
  BWFigCaptureSession *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *OwnerOfUpstreamPoolFeedingInput;
  uint64_t v12;
  FigCaptureSessionPipelines *pipelines;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  uint64_t v21;
  FigCaptureSessionPipelines *v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[6];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[6];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[6];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v3 = self;
  v50 = *MEMORY[0x1E0C80C00];
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  if (self)
    self = (BWFigCaptureSession *)self->_pipelines;
  v4 = (void *)-[BWFigCaptureSession videoDataSinkPipelines](self, "videoDataSinkPipelines", a3);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v44 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        OwnerOfUpstreamPoolFeedingInput = cs_findOwnerOfUpstreamPoolFeedingInput((void *)objc_msgSend((id)objc_msgSend(v10, "sinkNode"), "input"));
        v12 = objc_msgSend(v10, "sinkNode");
        v42[0] = v6;
        v42[1] = 3221225472;
        v42[2] = __44__BWFigCaptureSession_graphDidPrepareNodes___block_invoke;
        v42[3] = &unk_1E491E748;
        v42[4] = v12;
        v42[5] = OwnerOfUpstreamPoolFeedingInput;
        objc_msgSend(OwnerOfUpstreamPoolFeedingInput, "addPoolPreallocationCompletionHandler:", v42);
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v7);
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  if (v3)
    pipelines = v3->_pipelines;
  else
    pipelines = 0;
  v14 = -[FigCaptureSessionPipelines previewSinkPipelines](pipelines, "previewSinkPipelines");
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v39 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(v19, "prepareForRenderingWithPreparedPixelBufferPool");
        v20 = cs_findOwnerOfUpstreamPoolFeedingInput((void *)objc_msgSend((id)objc_msgSend(v19, "imageQueueSinkNode"), "input"));
        v21 = objc_msgSend(v19, "imageQueueSinkNode");
        v37[0] = v6;
        v37[1] = 3221225472;
        v37[2] = __44__BWFigCaptureSession_graphDidPrepareNodes___block_invoke_2;
        v37[3] = &unk_1E491E748;
        v37[4] = v21;
        v37[5] = v20;
        objc_msgSend(v20, "addPoolPreallocationCompletionHandler:", v37);
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    }
    while (v16);
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  if (v3)
    v22 = v3->_pipelines;
  else
    v22 = 0;
  v23 = -[FigCaptureSessionPipelines videoThumbnailSinkPipelines](v22, "videoThumbnailSinkPipelines");
  v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v34 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k);
        v29 = (void *)objc_msgSend((id)-[FigCaptureVideoThumbnailSinkPipeline imageQueueSinkNode](v28), "input");
        v30 = cs_findOwnerOfUpstreamPoolFeedingInput(v29);
        v31 = -[FigCaptureVideoThumbnailSinkPipeline imageQueueSinkNode](v28);
        v32[0] = v6;
        v32[1] = 3221225472;
        v32[2] = __44__BWFigCaptureSession_graphDidPrepareNodes___block_invoke_3;
        v32[3] = &unk_1E491E748;
        v32[4] = v31;
        v32[5] = v30;
        objc_msgSend(v30, "addPoolPreallocationCompletionHandler:", v32);
      }
      v25 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
    }
    while (v25);
  }
}

- (void)node:(id)a3 format:(id)a4 didBecomeLiveForOutput:(id)a5
{
  uint64_t DerivedStorage;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSString *v17;
  uint64_t v18;
  const void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = -[FigCaptureSessionPipelines cameraSourcePipelines](self->_pipelines, "cameraSourcePipelines", 0);
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v14);
      if ((id)-[FigCaptureCameraSourcePipeline sourceFormatReferenceOutput]((uint64_t)v15) == a5)
        break;
      if (v12 == ++v14)
      {
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v12)
          goto LABEL_3;
        goto LABEL_14;
      }
    }
    v16 = objc_msgSend(v15, "sourceID");
    v17 = (NSString *)v16;
    if (a4)
    {
      v18 = objc_msgSend((id)-[FigCaptureCameraSourcePipeline captureSourceVideoFormat]((uint64_t)v15), "formatDescription");
      if (v17)
        goto LABEL_19;
    }
    else
    {
      v18 = 0;
      if (v16)
        goto LABEL_19;
    }
  }
LABEL_14:
  if ((id)-[FigCaptureMicSourcePipeline sourceNode]((uint64_t)-[FigCaptureSessionPipelines micSourcePipeline](self->_pipelines, "micSourcePipeline")) == a3)
  {
    v17 = -[FigCaptureSourcePipeline sourceID](-[FigCaptureSessionPipelines micSourcePipeline](self->_pipelines, "micSourcePipeline"), "sourceID");
    v18 = objc_msgSend(a4, "formatDescription");
    if (a4)
    {
      if (!*(_BYTE *)(DerivedStorage + 273))
        *(_BYTE *)(DerivedStorage + 273) = objc_msgSend((id)-[FigCaptureMicSourcePipeline sourceNode]((uint64_t)-[FigCaptureSessionPipelines micSourcePipeline](self->_pipelines, "micSourcePipeline")), "didBeginInterruption");
    }
    if (v17)
    {
LABEL_19:
      v19 = (const void *)cs_notificationPayloadForSectionFormatChanged((uint64_t)v17, v18);
      captureSession_postNotificationWithPayload(self->_captureSession, CFSTR("SourceFormatDidChange"), v19);
    }
  }
}

- (void)graphDidResolveRetainedBufferCounts:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
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
  if (self)
    self = (BWFigCaptureSession *)self->_pipelines;
  v3 = (void *)-[BWFigCaptureSession movieFileSinkPipelines](self, "movieFileSinkPipelines", a3, (_QWORD)v8);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[FigCaptureMovieFileSinkPipeline setUpBackPressureForResolvedRetainedBufferCounts](*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

void __73__BWFigCaptureSession_imageQueueSinkNodeDidDisplayFirstFrame_atHostTime___block_invoke(_QWORD *a1, int a2)
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  int v16;
  int v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  __int128 v23;
  NSObject *v24;
  char *v25;
  const char *v26;
  NSObject *v27;
  const char *v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  int v32;
  BWAggdDataReporter *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const void *v37;
  int v38;
  int v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  char *v45;
  __int16 v46;
  _BYTE v47[10];
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  char __str[64];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 320));
  v4 = *(id *)(a1[4] + 416);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 320));
  v5 = v4;
  os_unfair_lock_lock(&sFigCaptureSessionCameraAppStartupTelemetry);
  if (a2)
  {
    if (*(_DWORD *)(a1[4] + 368) != 2)
      captureSession_abandonCameraAppSessionStartupTelemetry();
    goto LABEL_39;
  }
  v6 = dword_1ECFE9D84;
  if (!dword_1ECFE9D84)
    goto LABEL_39;
  v7 = cs_captureSourceDeviceType(a1[5]);
  v8 = cs_captureSourceCameraPosition(a1[5]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v9 = (void *)objc_msgSend(v4, "sourceConfigurations");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  v39 = v6;
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v41 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (objc_msgSend(v14, "sourceType") == 1)
        {
          v15 = v7;
          v16 = v8;
          v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "requiredFormat"), "AVCaptureSessionPresets"), "containsObject:", CFSTR("AVCaptureSessionPresetPhoto"));
          goto LABEL_15;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
      if (v11)
        continue;
      break;
    }
  }
  v15 = v7;
  v16 = v8;
  v17 = 0;
LABEL_15:
  v18 = byte_1ECFE9D88 == 0;
  if (a1[6] <= qword_1ECFE9DA8)
    v19 = qword_1ECFE9DA8;
  else
    v19 = a1[6];
  v38 = FigHostTimeToNanoseconds();
  v20 = (((int)FigHostTimeToNanoseconds() / 1000 + 999) / 1000);
  v21 = v16;
  snprintf(__str, 0x40uLL, "%x,%x,%x,%x", v15, v16, v17, v18);
  if (v39 == 2)
  {
    v22 = v17;
    if (*MEMORY[0x1E0CA1FC0])
    {
      v23 = xmmword_1ECFE9D90;
      v24 = fig_log_handle();
      if (os_signpost_enabled(v24))
      {
        v25 = (char *)(v19 - v23 + *((_QWORD *)&v23 + 1));
        if (qword_1ECFE9DC0)
          v26 = (const char *)objc_msgSend((id)qword_1ECFE9DC0, "UTF8String");
        else
          v26 = "Unspecified";
        *(_DWORD *)buf = 134219010;
        v45 = v25;
        v46 = 2082;
        *(_QWORD *)v47 = __str;
        *(_WORD *)&v47[8] = 2082;
        v48 = v26;
        v49 = 1026;
        v50 = v20;
        v51 = 1026;
        v52 = qword_1ECFE9DC8;
        v28 = "CameraAppLaunchWithOrigin";
        v29 = " enableTelemetry=YES %{signpost.description:end_time}llu S1=%{public,signpost.telemetry:string1}s S2=%{pub"
              "lic,signpost.telemetry:string2}s N1=%{public,signpost.telemetry:number1}d N2=%{public,signpost.telemetry:number2}d";
        v30 = v24;
        v31 = 44;
        goto LABEL_29;
      }
    }
  }
  else
  {
    v22 = v17;
    if (v39 == 1)
    {
      if (*MEMORY[0x1E0CA1FC0])
      {
        v27 = fig_log_handle();
        if (os_signpost_enabled(v27))
        {
          *(_DWORD *)buf = 136446722;
          v45 = __str;
          v46 = 1026;
          *(_DWORD *)v47 = v20;
          *(_WORD *)&v47[4] = 1026;
          *(_DWORD *)&v47[6] = qword_1ECFE9DC8;
          v28 = "CameraLaunchWithoutPrewarm";
          v29 = " enableTelemetry=YES S1=%{public,signpost.telemetry:string1}s N1=%{public,signpost.telemetry:number1}d N"
                "2=%{public,signpost.telemetry:number2}d";
          v30 = v27;
          v31 = 24;
LABEL_29:
          _os_signpost_emit_with_name_impl(&dword_1A2C80000, v30, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v28, v29, buf, v31);
        }
      }
    }
  }
  if (v21 == 1)
    v32 = v22;
  else
    v32 = 0;
  if (v32 == 1)
  {
    v33 = +[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance");
    if (v39 == 2)
    {
      -[BWAggdDataReporter reportCameraLaunchWithPrewarm:reason:](v33, "reportCameraLaunchWithPrewarm:reason:", ((v38 / 1000 + 999) / 1000), qword_1ECFE9DC0);
      v34 = qword_1ECFE9DC0;
      v35 = 1;
      v36 = ((v38 / 1000 + 999) / 1000);
    }
    else
    {
      -[BWAggdDataReporter reportCameraLaunchWithoutPrewarm:](v33, "reportCameraLaunchWithoutPrewarm:", v20);
      v35 = 0;
      v34 = 0;
      v36 = v20;
    }
    cs_reportCameraAppLaunchCoreAnalyticsData(v35, v34, v36);
  }
  os_unfair_lock_assert_owner(&sFigCaptureSessionCameraAppStartupTelemetry);
  dword_1ECFE9D84 = 0;
  byte_1ECFE9D88 = 0;
  xmmword_1ECFE9D90 = 0u;
  *(_OWORD *)&qword_1ECFE9DA0 = 0u;
  xmmword_1ECFE9DB0 = 0u;
  qword_1ECFE9DC8 = 0;
  *(uint64_t *)((char *)&qword_1ECFE9DC8 + 5) = 0;

  qword_1ECFE9DC0 = 0;
LABEL_39:
  os_unfair_lock_unlock(&sFigCaptureSessionCameraAppStartupTelemetry);
  v37 = (const void *)a1[5];
  if (v37)
    CFRelease(v37);
}

void __93__BWFigCaptureSession_imageQueueSinkNode_didAttemptToEnqueuePreviewSampleBuffer_withSuccess___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, _QWORD);

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 176));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 184))
  {
    v3 = *(_QWORD *)(v2 + 192);
    v5 = *(void (**)(uint64_t, uint64_t, _QWORD))(v2 + 184);
    if (*(_BYTE *)(v2 + 200))
    {
      v4 = 0;
    }
    else
    {
      v4 = 1;
      *(_BYTE *)(v2 + 200) = 1;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 176));
    v5(v3, v4, *(_QWORD *)(a1 + 40));
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 176));
  }
}

- (void)imageQueueSinkNode:(id)a3 didAttemptToEnqueuePreviewSampleBuffer:(opaqueCMSampleBuffer *)a4 withSuccess:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t DerivedStorage;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[6];

  v5 = a5;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v10 = -[FigCaptureSessionPipelines previewSinkPipelineWithSinkID:](self->_pipelines, "previewSinkPipelineWithSinkID:", objc_msgSend(a3, "sinkID"));
  if (v10)
  {
    v11 = v10;
    os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 320));
    if (objc_msgSend(*(id *)(DerivedStorage + 432), "containsObject:", v11)
      && (captureSession_setPreviewRunning(self->_captureSession, 1, v11),
          objc_msgSend(*(id *)(DerivedStorage + 432), "removeObject:", v11),
          !objc_msgSend(*(id *)(DerivedStorage + 432), "count")))
    {

      *(_QWORD *)(DerivedStorage + 432) = 0;
      *(_BYTE *)(DerivedStorage + 496) = 1;
      os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 320));
      captureSession_makeCommittedConfigurationLive(self->_captureSession);
      if (!v5)
        return;
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 320));
      if (!v5)
        return;
    }
    v12 = *(NSObject **)(DerivedStorage + 208);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __93__BWFigCaptureSession_imageQueueSinkNode_didAttemptToEnqueuePreviewSampleBuffer_withSuccess___block_invoke;
    v13[3] = &__block_descriptor_48_e5_v8__0l;
    v13[4] = DerivedStorage;
    v13[5] = a4;
    dispatch_sync(v12, v13);
  }
}

- (void)imageQueueSinkNodeDidDisplayFirstFrame:(id)a3
{
  _BYTE *v4;

  v4 = (_BYTE *)(CMBaseObjectGetDerivedStorage() + 497);
  captureSession_updateDeferredGraphSetupStartCondition(self->_captureSession, v4, 1);
}

- (void)stagingNode:(id)a3 readyToReceiveRequestsWithEarliestAllowedStillImageCaptureHostPTS:(id *)a4
{
  BWFigCaptureSession *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  int64_t v11;
  char v12;
  __int128 v13;
  int64_t var3;

  v5 = self;
  if (self)
  {
    v6 = -[FigCaptureSessionPipelines movieFileSinkPipelineWithIrisStagingNode:](self->_pipelines, "movieFileSinkPipelineWithIrisStagingNode:", a3);
    v5 = (BWFigCaptureSession *)v5->_pipelines;
  }
  else
  {
    v6 = (id)objc_msgSend(0, "movieFileSinkPipelineWithIrisStagingNode:", a3);
  }
  v7 = objc_msgSend((id)-[BWFigCaptureSession stillImageSinkPipelineSessionStorageWithSinkID:](v5, "stillImageSinkPipelineSessionStorageWithSinkID:", objc_msgSend(v6, "sinkID")), "cameraSourcePipeline");
  v13 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  objc_msgSend((id)-[FigCaptureCameraSourcePipeline captureDevice](v7), "setZeroShutterLagEarliestAllowedPTS:", &v13);
  v8 = objc_msgSend((id)-[FigCaptureCameraSourcePipeline captureDevice](v7), "previewTimeMachineProcessor");
  if (v8)
  {
    v9 = (void *)v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "earliestAllowedPTS");
      if ((v12 & 1) != 0)
      {
        v10 = *(_OWORD *)&a4->var0;
        v11 = a4->var3;
        objc_msgSend(v9, "setEarliestAllowedPTS:", &v10);
      }
    }
  }
}

- (void)layoutMonitor:(id)a3 didUpdateLayout:(id)a4
{
  uint64_t v7;

  CMBaseObjectGetDerivedStorage();
  if (objc_msgSend(a3, "displayType"))
  {
    if (objc_msgSend(a3, "displayType") == 2)
      -[BWFigCaptureSession _continuityDisplay:didUpdateLayout:]((uint64_t)self, a3);
  }
  else
  {
    -[BWFigCaptureSession _mainDisplay:didUpdateLayout:]((uint64_t)self, v7, a4);
  }
}

- (void)remoteQueueSinkNode:(id)a3 queueBecameReady:(remoteQueueSenderOpaque *)a4
{
  uint64_t DerivedStorage;
  uint64_t v8;
  uint64_t v9;
  CFTypeRef cf;
  xpc_object_t xdict;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  xdict = 0;
  v8 = objc_msgSend(a3, "sinkID");
  if (!v8)
    goto LABEL_8;
  v9 = v8;
  if (FigRemoteQueueSenderCreateXPCObject((uint64_t)a4, &xdict))
    goto LABEL_8;
  if (!*(_BYTE *)(DerivedStorage + 168))
  {
    cf = 0;
    if (!FigRemoteQueueReceiverCreateFromXPCObject(*MEMORY[0x1E0C9AE00], xdict, (uint64_t *)&cf))
    {
      captureSession_postSinkRemoteQueueUpdatedNotification(self->_captureSession, v9, (uint64_t)cf);
      CFRelease(cf);
      goto LABEL_7;
    }
LABEL_8:
    FigDebugAssert3();
    goto LABEL_7;
  }
  captureSession_postSinkRemoteQueueUpdatedNotification(self->_captureSession, v9, (uint64_t)xdict);
LABEL_7:
  FigXPCRelease();
}

- (void)videoPIPOverlayNode:(id)a3 overlayRectDidChange:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  BWFigCaptureSession *v8;
  void *v9;
  CFDictionaryRef DictionaryRepresentation;
  _QWORD v11[2];
  _QWORD v12[3];
  CGRect v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = self;
  v12[2] = *MEMORY[0x1E0C80C00];
  if (self)
    self = (BWFigCaptureSession *)self->_pipelines;
  v9 = (void *)objc_msgSend((id)-[BWFigCaptureSession previewSinkPipelines](self, "previewSinkPipelines", a3), "firstObject");
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v13);
  v11[0] = CFSTR("SectionID");
  v11[1] = CFSTR("ZoomPIPOverlayRect");
  v12[0] = objc_msgSend(v9, "sinkID");
  v12[1] = DictionaryRepresentation;
  captureSession_postNotificationWithPayload(v8->_captureSession, CFSTR("ZoomPIPOverlayRectDidChange"), (const void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2));

}

- (void)graph:(id)a3 didFinishStartingWithError:(int)a4
{
  uint64_t v4;
  uint64_t DerivedStorage;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v8;
  _BYTE *v9;
  int v10;

  v4 = *(_QWORD *)&a4;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (dword_1ECFE9590)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((_DWORD)v4)
  {
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if ((_DWORD)v4 == -12689 || (_DWORD)v4 == -12785)
    {
      v9 = (_BYTE *)(DerivedStorage + 340);
      v10 = 1;
    }
    else
    {
      v10 = 0;
      v9 = (_BYTE *)(DerivedStorage + 332);
    }
    captureSession_updateSessionStateWithNewInputCondition((uint64_t)self->_captureSession, v9, v10, v4, 0);
  }
}

uint64_t __44__BWFigCaptureSession_graphDidPrepareNodes___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerSurfacesFromSourcePool:", objc_msgSend(*(id *)(a1 + 40), "preparedPixelBufferPool"));
}

- (_QWORD)initWithFigCaptureSession:(_QWORD *)result
{
  objc_super v3;

  if (result)
  {
    if (a2)
    {
      v3.receiver = result;
      v3.super_class = (Class)BWFigCaptureSession;
      result = objc_msgSendSuper2(&v3, sel_init);
      if (result)
        result[1] = a2;
    }
    else
    {

      return 0;
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWFigCaptureSession;
  -[BWFigCaptureSession dealloc](&v3, sel_dealloc);
}

- (void)postNotification:(id)a3 notificationPayload:(id)a4
{
  captureSession_postNotificationWithPayload(self->_captureSession, a3, a4);
}

- (void)fileCoordinator:(id)a3 sentMarkerBufferForFileWriterAction:(id)a4 withPTS:(id *)a5 settingsID:(int64_t)a6 errorCode:(int)a7
{
  BWFigCaptureSession *v8;
  OpaqueFigCaptureSession *captureSession;
  _QWORD v10[7];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  v8 = self;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__23;
  v17 = __Block_byref_object_dispose__23;
  if (self)
    self = (BWFigCaptureSession *)self->_pipelines;
  v18 = 0;
  v18 = -[BWFigCaptureSession movieFileSinkPipelineWithFileCoordinatorNode:](self, "movieFileSinkPipelineWithFileCoordinatorNode:", a3, a4, a5, a6, *(_QWORD *)&a7);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3052000000;
  v11[3] = __Block_byref_object_copy__23;
  v11[4] = __Block_byref_object_dispose__23;
  v12 = 0;
  v12 = -[FigCaptureMovieFileSinkPipeline irisStagingNode](v14[5]);
  if ((objc_msgSend(a4, "isEqualToString:", 0x1E495A098) & 1) != 0
    || (objc_msgSend(a4, "isEqualToString:", 0x1E495A118) & 1) != 0
    || objc_msgSend(a4, "isEqualToString:", 0x1E495A0F8))
  {
    captureSession = v8->_captureSession;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __104__BWFigCaptureSession_fileCoordinator_sentMarkerBufferForFileWriterAction_withPTS_settingsID_errorCode___block_invoke;
    v10[3] = &unk_1E4922C40;
    v10[4] = v8;
    v10[5] = v11;
    v10[6] = &v13;
    captureSession_dispatchGraphCalloutToWorkerQueueAfter(captureSession, (uint64_t)v10, 0.0);
  }
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);
}

unint64_t __104__BWFigCaptureSession_fileCoordinator_sentMarkerBufferForFileWriterAction_withPTS_settingsID_errorCode___block_invoke(unint64_t result, char a2)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  if ((a2 & 1) == 0)
  {
    v2 = (_QWORD *)result;
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40);
    if (v3)
      objc_msgSend(v3, "closeValve");
    v4 = *(_QWORD *)(v2[4] + 8);
    v5 = -[FigCaptureMovieFileSinkPipeline videoSourceID](*(_QWORD *)(*(_QWORD *)(v2[6] + 8) + 40));
    result = captureSession_setRestoreForcedOffOverCaptureActiveSlaveStreamEnabled(v4, v5, 1);
    if (*(_QWORD *)(*(_QWORD *)(v2[5] + 8) + 40))
      return captureSession_servicePendingIrisRecordings(*(const void **)(v2[4] + 8), *(void **)(*(_QWORD *)(v2[6] + 8) + 40), 1);
  }
  return result;
}

- (void)fileCoordinator:(id)a3 stoppedBeforeStartedRecordingForSettings:(id)a4 pendingIrisMovieInfos:(id)a5 errorCode:(int)a6
{
  uint64_t v6;
  BWFigCaptureSession *v9;
  OpaqueFigCaptureSession *captureSession;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v6 = *(_QWORD *)&a6;
  v9 = self;
  v28 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__23;
  v25 = __Block_byref_object_dispose__23;
  if (self)
    self = (BWFigCaptureSession *)self->_pipelines;
  v26 = 0;
  v26 = -[BWFigCaptureSession movieFileSinkPipelineWithFileCoordinatorNode:](self, "movieFileSinkPipelineWithFileCoordinatorNode:", a3);
  captureSession = v9->_captureSession;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __112__BWFigCaptureSession_fileCoordinator_stoppedBeforeStartedRecordingForSettings_pendingIrisMovieInfos_errorCode___block_invoke;
  v20[3] = &unk_1E4922C68;
  v20[4] = &v21;
  captureSession_dispatchGraphCalloutToWorkerQueueAfter(captureSession, (uint64_t)v20, 0.0);
  if (a4)
  {
    cs_resetImageControlModeAndStreamSelection(v22[5], 0);
    v11 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(objc_msgSend((id)v22[5], "sinkID"), objc_msgSend(a4, "settingsID"), v6);
    captureSession_postNotificationWithPayload(v9->_captureSession, CFSTR("DidStopRecording"), v11);
  }
  else if (a5)
  {
    mach_absolute_time();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v12 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(a5);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v15, "enqueuedHostTime");
          objc_msgSend(v15, "setProcessingTimeInMilliseconds:", (double)FigHostTimeToNanoseconds() / 1000000.0);
          captureSession_postNotificationsForIrisRequestCompletedWithError(v9->_captureSession, objc_msgSend((id)v22[5], "sinkID"), v15, v6);
        }
        v12 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
      }
      while (v12);
    }
  }
  _Block_object_dispose(&v21, 8);
}

uint64_t __112__BWFigCaptureSession_fileCoordinator_stoppedBeforeStartedRecordingForSettings_pendingIrisMovieInfos_errorCode___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40), "setRecording:", 0);
  return result;
}

- (void)fileWriter:(id)a3 startedRecordingForSettings:(id)a4 writerPipelineIndex:(unint64_t)a5
{
  void *v8;
  __CFString **v9;
  FigCaptureSessionPipelines *pipelines;
  void *v11;
  void *v12;
  void *v13;
  float v14;

  v8 = (void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(objc_msgSend(a3, "sinkID"), objc_msgSend(a4, "settingsID"), 0);
  objc_opt_class();
  v9 = kFigCaptureSessionFileSinkNotification_DidStartRecording;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self)
      pipelines = self->_pipelines;
    else
      pipelines = 0;
    v11 = (void *)-[FigCaptureMovieFileSinkPipeline captureDevice]((uint64_t)-[FigCaptureSessionPipelines movieFileSinkPipelineWithFileSinkNode:](pipelines, "movieFileSinkPipelineWithFileSinkNode:", a3));
    v12 = (void *)objc_msgSend(a4, "videoSettings");
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v8);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AVVideoWidthKey")), CFSTR("MovieWidth"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AVVideoHeightKey")), CFSTR("MovieHeight"));
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "torchLevel");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(v13, "numberWithInt:", v14 != 0.0), CFSTR("TorchEnabled"));
    if (objc_msgSend(a4, "isIrisRecording"))
      v9 = kFigCaptureSessionIrisStillImageSinkNotification_DidStartRecordingIrisMovie;
  }
  captureSession_postNotificationWithPayload(self->_captureSession, *v9, v8);
}

- (void)fileWriter:(id)a3 writerPipelineIndex:(unint64_t)a4 stoppedRecordingSampleDataForSettingsID:(int64_t)a5
{
  uint64_t DerivedStorage;
  id v10;
  unint64_t v11;
  os_unfair_lock_s *v12;
  char v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  OpaqueFigCaptureSession *captureSession;
  _QWORD v19[7];

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v10 = -[FigCaptureSessionPipelines movieFileSinkPipelineWithFileSinkNode:](self->_pipelines, "movieFileSinkPipelineWithFileSinkNode:", a3);
  if (v10)
  {
    v11 = (unint64_t)v10;
    v12 = (os_unfair_lock_s *)(DerivedStorage + 320);
    os_unfair_lock_lock(v12);
    -[FigCaptureMovieFileSinkPipeline setRecording:forTailPipelineIndex:](v11, 0, a4);
    v13 = -[FigCaptureMovieFileSinkPipeline atLeastOneTailIsRecording](v11);
    os_unfair_lock_unlock(v12);
    if ((v13 & 1) == 0)
    {
      v14 = -[FigCaptureSessionPipelines audioFileSinkPipelineWithFileSinkNode:](self->_pipelines, "audioFileSinkPipelineWithFileSinkNode:", a3);
      v15 = -[FigCaptureMovieFileSinkPipeline fileCoordinatorNode](v11);
      if (!v15)
        v15 = -[FigCaptureAudioFileSinkPipeline fileCoordinatorNode]((uint64_t)v14);
      v16 = +[FigWeakReference weakReferenceToObject:](FigWeakReference, "weakReferenceToObject:", v15);
      v17 = +[FigWeakReference weakReferenceToObject:](FigWeakReference, "weakReferenceToObject:", v11);
      captureSession = self->_captureSession;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __94__BWFigCaptureSession_fileWriter_writerPipelineIndex_stoppedRecordingSampleDataForSettingsID___block_invoke;
      v19[3] = &unk_1E4922C90;
      v19[4] = v16;
      v19[5] = v17;
      v19[6] = a5;
      captureSession_dispatchGraphCalloutToWorkerQueueAfter(captureSession, (uint64_t)v19, 0.0);
    }
  }
}

uint64_t __94__BWFigCaptureSession_fileWriter_writerPipelineIndex_stoppedRecordingSampleDataForSettingsID___block_invoke(uint64_t result, char a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  if ((a2 & 1) == 0)
  {
    v2 = result;
    v3 = (void *)objc_msgSend(*(id *)(result + 32), "referencedObject");
    v4 = (void *)objc_msgSend(*(id *)(v2 + 40), "referencedObject");
    objc_msgSend(v3, "recordingTerminated:", *(_QWORD *)(v2 + 48));
    return objc_msgSend(v4, "setRecording:", 0);
  }
  return result;
}

- (void)fileWriter:(id)a3 writerPipelineIndex:(unint64_t)a4 stoppedRecordingForSettings:(id)a5 withError:(int)a6 thumbnailSurface:(__IOSurface *)a7 irisMovieInfo:(id)a8 debugMetadataSidecarFileURL:(id)a9 recordingSucceeded:(BOOL)a10
{
  uint64_t v11;
  uint64_t DerivedStorage;
  id v16;
  char v17;
  int v18;
  int v19;
  void *v20;
  int v21;
  const __CFAllocator *v22;
  CFDictionaryRef v23;
  CFDictionaryRef v24;
  void *v25;
  void *v26;
  char v27;
  const __CFAllocator *v28;
  CFDictionaryRef v29;
  __CFString **v30;
  const __CFString *v31;
  uint64_t v34;
  CMTime v35;
  CMTime v36;
  CMTime v37;
  CMTime v38;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  _QWORD v42[2];
  _QWORD v43[4];

  v11 = *(_QWORD *)&a6;
  v43[2] = *MEMORY[0x1E0C80C00];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v16 = -[FigCaptureSessionPipelines movieFileSinkPipelineWithFileSinkNode:](self->_pipelines, "movieFileSinkPipelineWithFileSinkNode:", a3);
  v34 = objc_msgSend(a9, "path");
  os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 320));
  if ((_DWORD)v11 == -16414)
  {
    if (*(_BYTE *)(DerivedStorage + 332))
      v11 = 4294950882;
    else
      v11 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 320));
  if (v16)
  {
    v17 = objc_msgSend(a5, "isIrisRecording");
    v18 = objc_msgSend(a5, "isIrisMovieRecording");
    if ((v17 & 1) != 0)
    {
      v19 = 1;
    }
    else
    {
      cs_resetImageControlModeAndStreamSelection((uint64_t)v16, 0);
      if (objc_msgSend(v16, "recordedWhileMultitasking"))
      {
        objc_msgSend(v16, "setRecordedWhileMultitasking:", 0);
        captureSession_showRecordingVideoWhileMultitaskingDialogIfNecessary();
      }
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
    v18 = 0;
  }
  v20 = (void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(objc_msgSend(a3, "sinkID"), objc_msgSend(a5, "settingsID"), v11);
  if (v19)
  {
    if (!a8)
      return;
    v21 = objc_msgSend(a8, "spatialOverCaptureExpected");
    if (a4)
    {
      if (!v21)
        return;
    }
    v20 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v20);
    objc_msgSend(a8, "movieTrimEndTime");
    objc_msgSend(a8, "movieTrimStartTime");
    CMTimeSubtract(&time, &lhs, &rhs);
    v22 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v23 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", CFAutorelease(v23), CFSTR("MovieDuration"));
    if (objc_msgSend((id)objc_msgSend(a8, "outputMovieURL"), "isEqual:", objc_msgSend(a8, "spatialOverCaptureOutputMovieURL")))objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IsSpatialOverCaptureMovie"));
    memset(&v38, 0, sizeof(v38));
    objc_msgSend(a8, "stillImageCaptureTime");
    objc_msgSend(a8, "movieTrimStartTime");
    CMTimeSubtract(&v38, &v37, &v36);
    v35 = v38;
    v24 = CMTimeCopyAsDictionary(&v35, v22);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", CFAutorelease(v24), CFSTR("StillImageDisplayTime"));
    if (objc_msgSend((id)objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline movieFileSinkNodes]((uint64_t)v16), "objectAtIndexedSubscript:", 0), "irisSampleReferenceMoviesEnabled"))
    {
      objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a8, "isFinalReferenceMovie")), CFSTR("IsFinalReferenceMovie"));
      if (objc_msgSend(a8, "masterMovieURL"))
        objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a8, "masterMovieURL"), "path"), CFSTR("MasterMoviePath"));
    }
    objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a8, "isOriginalPhotoRecording")), CFSTR("IsOriginalPhotoMovie"));
    if (objc_msgSend((id)objc_msgSend(a8, "settings"), "metadataIdentifiersEnabled")
      && objc_msgSend(a8, "isVitalityScoreValid"))
    {
      v42[0] = *MEMORY[0x1E0CC5C30];
      v25 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(a8, "vitalityScore");
      v43[0] = objc_msgSend(v25, "numberWithFloat:");
      v42[1] = *MEMORY[0x1E0CC5C38];
      v43[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a8, "vitalityScoringVersion"));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2), CFSTR("MetadataIdentifiers"));
    }
  }
  if (a7 || v34 || (_DWORD)v11)
  {
    v26 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v20);
    v20 = v26;
    if (a7)
    {
      objc_msgSend(v26, "setObject:forKeyedSubscript:", a7, CFSTR("PreviewSurface"));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", IOSurfaceGetAllocSize(a7)), CFSTR("PreviewSurfaceSize"));
    }
    if (v34)
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v34, CFSTR("DebugMetadataSidecarFilePath"));
    if ((_DWORD)v11)
      objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a10), CFSTR("RecordingSucceeded"));
    if (a4 == 1)
      v27 = v19;
    else
      v27 = 1;
    if ((v27 & 1) == 0)
      objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IsSpatialOverCaptureMovie"));
    if (v16)
    {
      memset(&v38, 0, sizeof(v38));
      if (a3)
        objc_msgSend(a3, "lastFileDuration");
      v28 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v35 = v38;
      v29 = CMTimeCopyAsDictionary(&v35, v28);
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v29, CFSTR("MovieDuration"));
      if (v29)
        CFRelease(v29);
    }
  }
  if (v19)
  {
    v30 = kFigCaptureSessionIrisStillImageSinkNotification_DidFinishRecordingMomentCaptureMovie;
    if (!v18)
      v30 = kFigCaptureSessionIrisStillImageSinkNotification_DidFinishRecordingIrisMovie;
    v31 = *v30;
    cs_reportLivePhotoMovieCoreAnalyticsData((uint64_t)self->_captureSession, a8, v11, a10);
  }
  else
  {
    v31 = CFSTR("DidStopRecording");
  }
  captureSession_postNotificationWithPayload(self->_captureSession, v31, v20);
}

- (void)fileWriter:(id)a3 pausedRecordingForSettingsID:(unint64_t)a4
{
  const void *v5;

  v5 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(objc_msgSend(a3, "sinkID"), a4, 0);
  captureSession_postNotificationWithPayload(self->_captureSession, CFSTR("DidPauseRecording"), v5);
}

- (void)fileWriter:(id)a3 resumedRecordingForSettingsID:(unint64_t)a4
{
  const void *v5;

  v5 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(objc_msgSend(a3, "sinkID"), a4, 0);
  captureSession_postNotificationWithPayload(self->_captureSession, CFSTR("DidResumeRecording"), v5);
}

- (void)fileWriter:(id)a3 frameDroppedForSettingsID:(unint64_t)a4 withError:(int)a5
{
  const void *v6;

  v6 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(objc_msgSend(a3, "sinkID"), a4, *(uint64_t *)&a5);
  captureSession_postNotificationWithPayload(self->_captureSession, CFSTR("DidDropFrameWhileRecording"), v6);
}

- (void)stillImageCoordinator:(id)a3 willBeginCaptureBeforeResolvingSettingsForID:(int64_t)a4
{
  BWFigCaptureSession *v4;
  const void *v5;

  v4 = self;
  if (self)
    self = (BWFigCaptureSession *)self->_pipelines;
  v5 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(objc_msgSend((id)objc_msgSend((id)-[BWFigCaptureSession stillImageSinkPipelineSessionStorageWithStillImageCoordinator:](self, "stillImageSinkPipelineSessionStorageWithStillImageCoordinator:", a3), "stillImageSinkPipeline"), "sinkID"), a4, 0);
  captureSession_postNotificationWithPayload(v4->_captureSession, CFSTR("IrisWillBeginCaptureBeforeResolvingSettings"), v5);
}

- (void)stillImageCoordinator:(id)a3 willBeginCaptureForSettings:(id)a4
{
  BWFigCaptureSession *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  FigCaptureSessionPipelines *pipelines;
  void *v10;
  void *v11;
  int v12;
  unint64_t v13;
  _BOOL4 v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  float v29;
  float v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  uint64_t v35;
  float v36;
  float v37;
  float v38;
  float v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  float v54;
  unsigned int v55;
  float v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  void *v61;
  int v62;
  char v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int64_t v69;
  float v70;
  void *v71;
  char v72;
  int64_t v73;
  double v74;
  const __CFString *v75;
  const __CFString *v76;
  const __CFString *v77;
  const __CFString *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  __int128 v84;
  Float64 v85;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  CMTimeValue v88;
  uint64_t v89;
  CMTimeEpoch v90;
  BWFigCaptureSession *v91;
  void *v92;
  float v93;
  unint64_t v94;
  CMTimeEpoch v95;
  double v96;
  double v97;
  unint64_t v98;
  double v99;
  float v100;
  double v101;
  BOOL v102;
  double v103;
  const __CFAllocator *v104;
  CFDictionaryRef v105;
  CFDictionaryRef v106;
  BWFigCaptureSession *v107;
  uint64_t v108;
  _BOOL4 v109;
  int v110;
  int v111;
  uint64_t v112;
  CMTimeEpoch v113;
  int v114;
  CMTimeValue v115;
  int v116;
  CMTimeEpoch v117;
  unint64_t v118;
  CMTimeFlags v119;
  int v120;
  uint64_t v121;
  void *v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  CMTime v131;
  CMTime start;
  CMTime duration;
  CMTimeRange v134;
  CMTime rhs;
  CMTime lhs;
  CMTimeValue value;
  CMTimeScale timescale;
  _BYTE v139[128];
  _BYTE v140[128];
  uint64_t v141;

  v5 = self;
  v141 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (BWFigCaptureSession *)self->_pipelines;
  v6 = (void *)-[BWFigCaptureSession stillImageSinkPipelineSessionStorageWithStillImageCoordinator:](self, "stillImageSinkPipelineSessionStorageWithStillImageCoordinator:", a3);
  v7 = (void *)objc_msgSend(v6, "stillImageSinkPipeline");
  v8 = objc_msgSend(v6, "cameraSourcePipeline");
  if (v5)
    pipelines = v5->_pipelines;
  else
    pipelines = 0;
  cs_setSceneClassifierSuspended(pipelines, v6, 1);
  v10 = (void *)objc_msgSend(a4, "requestedSettings");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(objc_msgSend(v7, "sinkID"), objc_msgSend(v10, "settingsID"), 0));
    v12 = objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureType");
    v13 = objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureFlags");
    v14 = 0;
    if ((v13 & 0x10000) != 0)
      v14 = objc_msgSend(v10, "outputFormat") != 0;
    v107 = v5;
    v116 = objc_msgSend((id)objc_msgSend(a4, "processingSettings"), "processIntelligentDistortionCorrection");
    if (v12 == 12 || v12 == 10)
    {
      v108 = (v13 >> 20) & 1;
      v109 = (int)objc_msgSend(v10, "qualityPrioritization") > 1;
    }
    else
    {
      LODWORD(v108) = v12 == 3;
      v109 = (v12 & 0xFFFFFFFE) == 4;
    }
    v114 = objc_msgSend(v10, "squareCropEnabled");
    v111 = objc_msgSend(v10, "movieMode");
    v110 = objc_msgSend(v10, "rawOutputFormat");
    v15 = objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "deliverDeferredPhotoProxyImage");
    v16 = (void *)MEMORY[0x1E0CB37E8];
    if (v15)
      v17 = objc_msgSend(v10, "deferredPhotoFinalWidth");
    else
      v17 = objc_msgSend(v10, "outputWidth");
    objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(v16, "numberWithUnsignedInt:", v17), CFSTR("StillWidth"));
    v18 = (void *)MEMORY[0x1E0CB37E8];
    v120 = v15;
    v118 = v13;
    v112 = v8;
    v19 = v12;
    if (v15)
      v20 = objc_msgSend(v10, "deferredPhotoFinalHeight");
    else
      v20 = objc_msgSend(v10, "outputHeight");
    v122 = v11;
    objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(v18, "numberWithUnsignedInt:", v20), CFSTR("StillHeight"));
    v21 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "processingSettings"), "photoManifest"), "photoDescriptors");
    v22 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
    v127 = 0u;
    v128 = 0u;
    v129 = 0u;
    v130 = 0u;
    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v127, v140, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v128;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v128 != v25)
            objc_enumerationMutation(v21);
          objc_msgSend(v22, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((_QWORD *)&v127 + 1) + 8 * i), "processingFlags")));
        }
        v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v127, v140, 16);
      }
      while (v24);
    }
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, CFSTR("PhotoManifest"));
    if (v110)
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "outputWidth")), CFSTR("RawStillWidth"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "outputHeight")), CFSTR("RawStillHeight"));
    }
    if (objc_msgSend(v10, "previewEnabled"))
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "previewWidth")), CFSTR("PreviewWidth"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "previewHeight")), CFSTR("PreviewHeight"));
    }
    if (objc_msgSend(v10, "thumbnailEnabled"))
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "thumbnailWidth")), CFSTR("ThumbnailWidth"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "thumbnailHeight")), CFSTR("ThumbnailHeight"));
    }
    if (objc_msgSend(v10, "rawThumbnailEnabled"))
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "rawThumbnailWidth")), CFSTR("RawThumbnailWidth"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "rawThumbnailHeight")), CFSTR("RawThumbnailHeight"));
    }
    if (v111)
    {
      v27 = (void *)objc_msgSend((id)objc_msgSend(v10, "movieRecordingSettings"), "videoSettings");
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("AVVideoWidthKey")), CFSTR("IrisMovieWidth"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("AVVideoHeightKey")), CFSTR("IrisMovieHeight"));
    }
    if (objc_msgSend(v10, "portraitEffectsMatteDeliveryEnabled"))
    {
      v28 = -[FigCaptureCameraSourcePipeline captureSource](v112);
      objc_msgSend(cs_captureSourceGetAttribute(v28, (uint64_t)CFSTR("PortraitEffectsMatteMainImageDownscalingFactor")), "floatValue");
      v30 = v29;
      v31 = (void *)MEMORY[0x1E0CB37E8];
      *(float *)&v32 = (float)objc_msgSend(v10, "outputWidth") / v29;
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(v31, "numberWithFloat:", v32), CFSTR("PortraitEffectsMatteWidth"));
      v33 = (void *)MEMORY[0x1E0CB37E8];
      *(float *)&v34 = (float)objc_msgSend(v10, "outputHeight") / v30;
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(v33, "numberWithFloat:", v34), CFSTR("PortraitEffectsMatteHeight"));
    }
    if (objc_msgSend((id)objc_msgSend(v10, "enabledSemanticSegmentationMatteURNs"), "count"))
    {
      v35 = -[FigCaptureCameraSourcePipeline captureSource](v112);
      objc_msgSend(cs_captureSourceGetAttribute(v35, (uint64_t)CFSTR("PortraitEffectsMatteMainImageDownscalingFactor")), "floatValue");
      if (v36 == 0.0)
      {
        v38 = 0.0;
        v39 = 0.0;
      }
      else
      {
        v37 = v36;
        v38 = (float)objc_msgSend(v10, "outputWidth") / v36;
        v39 = (float)objc_msgSend(v10, "outputHeight") / v37;
      }
      v40 = (void *)objc_msgSend(v10, "enabledSemanticSegmentationMatteURNs");
      if (objc_msgSend(v40, "containsObject:", *MEMORY[0x1E0D09288]))
      {
        *(float *)&v41 = v38;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v41), CFSTR("HairSegmentationMatteWidth"));
        *(float *)&v42 = v39;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v42), CFSTR("HairSegmentationMatteHeight"));
      }
      v43 = (void *)objc_msgSend(v10, "enabledSemanticSegmentationMatteURNs");
      if (objc_msgSend(v43, "containsObject:", *MEMORY[0x1E0D09290]))
      {
        *(float *)&v44 = v38;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44), CFSTR("SkinSegmentationMatteWidth"));
        *(float *)&v45 = v39;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v45), CFSTR("SkinSegmentationMatteHeight"));
      }
      v46 = (void *)objc_msgSend(v10, "enabledSemanticSegmentationMatteURNs");
      if (objc_msgSend(v46, "containsObject:", *MEMORY[0x1E0D092A0]))
      {
        *(float *)&v47 = v38;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v47), CFSTR("TeethSegmentationMatteWidth"));
        *(float *)&v48 = v39;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v48), CFSTR("TeethSegmentationMatteHeight"));
      }
      v49 = (void *)objc_msgSend(v10, "enabledSemanticSegmentationMatteURNs");
      if (objc_msgSend(v49, "containsObject:", *MEMORY[0x1E0D09280]))
      {
        *(float *)&v50 = v38;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v50), CFSTR("GlassesSegmentationMatteWidth"));
        *(float *)&v51 = v39;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v51), CFSTR("GlassesSegmentationMatteHeight"));
      }
    }
    if (v19 == 2)
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("FlashActive"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14), CFSTR("RedEyeReductionEnabled"));
    }
    if ((_DWORD)v108)
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HDRActive"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "deliverOriginalImage")), CFSTR("OriginalPhotoDeliveryEnabled"));
    }
    if (v109)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("SISActive"));
    if ((v118 & 0x400) != 0)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("BravoImageFusionActive"));
    if (v114)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("SquareCropEnabled"));
    if (v116)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IDCEnabled"));
    if ((v118 & 0x4000000000) != 0)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("StereoPhotoEnabled"));
    if (v19 == 11)
    {
      v52 = (void *)objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "masterPortType");
      if ((objc_msgSend(v52, "isEqualToString:", *MEMORY[0x1E0D05A38]) & 1) != 0
        || objc_msgSend(v52, "isEqualToString:", *MEMORY[0x1E0D05A50]))
      {
        v53 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureStreamSettingsForPortType:", v52), "adaptiveBracketingParameters");
        objc_msgSend(v53, "previewSNR");
        v55 = v54 < 0.0;
        if (objc_msgSend(v10, "digitalFlashMode") == 2)
        {
          if (objc_msgSend(v53, "stationary"))
          {
            objc_msgSend(v53, "previewSNR");
            if (v56 < -12.0)
              v55 |= 2u;
          }
        }
        if (((unint64_t)objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureFlags") >> 34) & 2 | v55)
          objc_msgSend(v122, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("DigitalFlashUserInterfaceHints"));
        objc_msgSend(v122, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "frameStatisticsByPortType"), "objectForKeyedSubscript:", v52), "displayStrobeRGBEstimate"), CFSTR("DigitalFlashUserInterfaceRGBEstimate"));
      }
    }
    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    v57 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v123, v139, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v124;
      while (2)
      {
        for (j = 0; j != v58; ++j)
        {
          if (*(_QWORD *)v124 != v59)
            objc_enumerationMutation(v21);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * j), "processingFlags") & 8) != 0)
          {
            objc_msgSend(v122, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ProcessedFiltersEnabled"));
            goto LABEL_83;
          }
        }
        v58 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v123, v139, 16);
        if (v58)
          continue;
        break;
      }
    }
LABEL_83:
    if (v120)
    {
      objc_msgSend(v122, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "deferredPhotoProxyWidth")), CFSTR("DeferredPhotoProxyWidth"));
      objc_msgSend(v122, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "deferredPhotoProxyHeight")), CFSTR("DeferredPhotoProxyHeight"));
    }
    v61 = (void *)objc_msgSend(a4, "captureSettings");
    objc_msgSend((id)objc_msgSend(a4, "processingSettings"), "photoManifest");
    value = *MEMORY[0x1E0CA2E40];
    v119 = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 12);
    timescale = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 8);
    v115 = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 24);
    v117 = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 16);
    v121 = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 32);
    v113 = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 40);
    v62 = objc_msgSend(v61, "captureType");
    v63 = objc_msgSend(v61, "sceneFlags");
    v64 = objc_msgSend(v61, "captureFlags");
    v65 = (void *)objc_msgSend((id)objc_msgSend(+[FigCaptureSourceBackings sharedCaptureSourceBackings](FigCaptureSourceBackings, "sharedCaptureSourceBackings"), "commonSettings"), "photoProcessingTimeRangesInMS");
    v66 = (void *)objc_msgSend(v61, "masterPortType");
    v67 = (void *)objc_msgSend(v61, "captureStreamSettingsForPortType:", v66);
    v68 = (void *)objc_msgSend((id)objc_msgSend(v61, "frameStatisticsByPortType"), "objectForKeyedSubscript:", v66);
    if (v65)
    {
      v69 = 0;
      v70 = 0.5;
      v71 = v68;
      v72 = v63;
      v73 = 0;
      switch(v62)
      {
        case 1:
          if ((objc_msgSend(v61, "captureFlags") & 0x80) == 0)
            goto LABEL_98;
          v78 = CFSTR("WYSIWYG-LearnedNR");
          if (!objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("WYSIWYG-LearnedNR")))
            goto LABEL_98;
          goto LABEL_99;
        case 2:
          v69 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("Flash")), "objectForKeyedSubscript:", CFSTR("Min")), "integerValue");
          v73 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("Flash")), "objectForKeyedSubscript:", CFSTR("Max")), "integerValue");
          v70 = 0.1;
          goto LABEL_120;
        case 3:
          v75 = CFSTR("HDR");
          goto LABEL_119;
        case 4:
        case 5:
          objc_msgSend(v68, "integrationTime");
          if (v74 <= 0.0588235294 || (objc_msgSend(v66, "isEqualToString:", *MEMORY[0x1E0D05A30]) & 1) != 0)
            v75 = CFSTR("Dim-SIS");
          else
            v75 = CFSTR("Dark-SIS");
          goto LABEL_119;
        case 6:
        case 8:
LABEL_98:
          v78 = CFSTR("WYSIWYG");
LABEL_99:
          v79 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v65, "objectForKeyedSubscript:", v78), "objectForKeyedSubscript:", CFSTR("Min")), "integerValue");
          v80 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v65, "objectForKeyedSubscript:", v78), "objectForKeyedSubscript:", CFSTR("Max")), "integerValue");
          if (v62 == 6)
            v69 = v79 + 250;
          else
            v69 = v79;
          if (v62 == 6)
            v73 = v80 + 250;
          else
            v73 = v80;
          goto LABEL_105;
        case 7:
          if (objc_msgSend(v10, "bracketType") == 1)
          {
            *(_OWORD *)&v134.start.value = *MEMORY[0x1E0CA2E68];
            v134.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
            if (objc_msgSend(v10, "bracketImageCount"))
            {
              v81 = 0;
              v82 = 0;
              do
              {
                v83 = objc_msgSend(v10, "exposureDurations");
                lhs = v134.start;
                v84 = *(_OWORD *)(v83 + v81);
                rhs.epoch = *(_QWORD *)(v83 + v81 + 16);
                *(_OWORD *)&rhs.value = v84;
                CMTimeAdd(&v134.start, &lhs, &rhs);
                ++v82;
                v81 += 24;
              }
              while (v82 < objc_msgSend(v10, "bracketImageCount"));
            }
            lhs = v134.start;
            v69 = (uint64_t)(CMTimeGetSeconds(&lhs) * 1000.0);
            v73 = (uint64_t)((double)v69 * 1.1);
LABEL_105:
            v70 = 0.25;
          }
          else
          {
            v70 = 0.25;
            if (objc_msgSend(v10, "bracketType") == 2)
            {
              objc_msgSend(v71, "integrationTime");
              v97 = v96;
              if (objc_msgSend(v10, "bracketImageCount"))
              {
                v98 = 0;
                v73 = 0;
                v99 = 1.79769313e308;
                do
                {
                  v100 = *(float *)(objc_msgSend(v10, "exposureTargetBiases") + 4 * v98);
                  v101 = v100;
                  v102 = v100 < 0.0;
                  if (v100 <= 0.0)
                  {
                    v103 = 1.0;
                    if (v102)
                      v103 = fabs(1.0 / (v101 + v101));
                  }
                  else
                  {
                    v103 = v101 + v101;
                  }
                  v73 = (uint64_t)((double)v73 + v97 * v103 * 1000.0);
                  if (v103 < v99)
                    v99 = v103;
                  ++v98;
                }
                while (v98 < objc_msgSend(v10, "bracketImageCount"));
              }
              else
              {
                v73 = 0;
                v99 = 1.79769313e308;
              }
              v69 = (uint64_t)(v97 * v99 * 1000.0 * (double)objc_msgSend(v10, "bracketImageCount"));
            }
            else
            {
              v69 = 0;
              v73 = 0;
            }
          }
LABEL_120:
          if (objc_msgSend((id)objc_msgSend(v10, "bravoConstituentImageDeliveryDeviceTypes"), "count"))
          {
            v93 = 1.0;
            flags = v119;
            v88 = v115;
            epoch = v117;
            v90 = v113;
            if ((unint64_t)objc_msgSend((id)objc_msgSend(v10, "bravoConstituentImageDeliveryDeviceTypes"), "count") >= 2)
            {
              v94 = 1;
              do
              {
                v93 = v70 + v93;
                ++v94;
              }
              while (v94 < objc_msgSend((id)objc_msgSend(v10, "bravoConstituentImageDeliveryDeviceTypes"), "count"));
            }
            v73 = (uint64_t)(float)(v93 * (float)v73);
            v91 = v107;
            v92 = v122;
          }
          else
          {
            v91 = v107;
            v92 = v122;
            flags = v119;
            v88 = v115;
            epoch = v117;
            v90 = v113;
          }
          v89 = v121;
          if (v69 >= 1)
          {
            memset(&lhs, 0, sizeof(lhs));
            CMTimeMake(&lhs, v69, 1000);
            memset(&rhs, 0, sizeof(rhs));
            CMTimeMake(&rhs, v73, 1000);
            v134.start = rhs;
            start = lhs;
            CMTimeSubtract(&duration, &v134.start, &start);
            start = lhs;
            CMTimeRangeMake(&v134, &start, &duration);
            value = v134.start.value;
            flags = v134.start.flags;
            timescale = v134.start.timescale;
            epoch = v134.start.epoch;
            v88 = v134.duration.value;
            v89 = *(_QWORD *)&v134.duration.timescale;
            v90 = v134.duration.epoch;
          }
          if ((flags & 1) != 0)
            goto LABEL_129;
          goto LABEL_155;
        case 9:
          goto LABEL_120;
        case 10:
        case 12:
          if (v62 == 10)
            v76 = CFSTR("UB-");
          else
            v76 = CFSTR("DeepFusion-");
          if ((v64 & 0x100000) != 0)
          {
            if ((v72 & 8) != 0)
              v77 = CFSTR("LowLightHDR");
            else
              v77 = CFSTR("HDR");
          }
          else if ((v72 & 8) != 0)
          {
            v77 = CFSTR("LowLightHDR");
            if ((objc_msgSend(v66, "isEqualToString:", *MEMORY[0x1E0D05A30]) & 1) == 0
              && !objc_msgSend(v66, "isEqualToString:", *MEMORY[0x1E0D05A28]))
            {
              v77 = CFSTR("LowLight");
            }
          }
          else
          {
            v77 = CFSTR("WYSIWYG");
          }
          v75 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v76, v77);
LABEL_119:
          v69 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v65, "objectForKeyedSubscript:", v75), "objectForKeyedSubscript:", CFSTR("Min")), "integerValue");
          v73 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v65, "objectForKeyedSubscript:", v75), "objectForKeyedSubscript:", CFSTR("Max")), "integerValue");
          goto LABEL_120;
        case 11:
          objc_msgSend((id)objc_msgSend(v67, "adaptiveBracketingParameters"), "totalIntegrationTime");
          CMTimeMakeWithSeconds(&lhs, v85, 1000000000);
          CMTimeMakeWithSeconds(&rhs, 0.0, 1000000000);
          CMTimeRangeMake(&v134, &lhs, &rhs);
          value = v134.start.value;
          flags = v134.start.flags;
          timescale = v134.start.timescale;
          epoch = v134.start.epoch;
          v88 = v134.duration.value;
          v89 = *(_QWORD *)&v134.duration.timescale;
          v90 = v134.duration.epoch;
          v91 = v107;
          v92 = v122;
          if ((v134.start.flags & 1) == 0)
            goto LABEL_155;
          goto LABEL_129;
        default:
          v73 = 0;
          goto LABEL_120;
      }
    }
    v91 = v107;
    v92 = v122;
    flags = v119;
    v88 = v115;
    epoch = v117;
    v89 = v121;
    v90 = v113;
    if ((v119 & 1) != 0)
    {
LABEL_129:
      if ((v89 & 0x100000000) != 0 && !v90 && (v88 & 0x8000000000000000) == 0)
      {
        v95 = 0;
LABEL_156:
        v104 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v134.start.value = value;
        v134.start.timescale = timescale;
        v134.start.flags = flags;
        v134.start.epoch = epoch;
        v134.duration.value = v88;
        *(_QWORD *)&v134.duration.timescale = v89;
        v134.duration.epoch = v95;
        v105 = CMTimeRangeCopyAsDictionary(&v134, v104);
        if (v105)
        {
          v106 = v105;
          objc_msgSend(v92, "setObject:forKeyedSubscript:", v105, CFSTR("PhotoProcessingTimeRange"));
          CFRelease(v106);
        }
        captureSession_postNotificationWithPayload(v91->_captureSession, CFSTR("IrisWillBeginCapture"), v92);
        return;
      }
    }
LABEL_155:
    CMTimeMakeWithSeconds(&start, 0.1, 1000000000);
    CMTimeMakeWithSeconds(&v131, 1.5, 1000000000);
    CMTimeRangeMake(&v134, &start, &v131);
    value = v134.start.value;
    flags = v134.start.flags;
    timescale = v134.start.timescale;
    epoch = v134.start.epoch;
    v88 = v134.duration.value;
    v89 = *(_QWORD *)&v134.duration.timescale;
    v95 = v134.duration.epoch;
    goto LABEL_156;
  }
}

- (void)stillImageCoordinator:(id)a3 willCapturePhotoForSettings:(id)a4 error:(int)a5
{
  uint64_t v5;
  BWFigCaptureSession *v7;
  void *v8;
  unsigned __int8 isKindOfClass;
  BOOL v10;
  void *v11;
  const __CFString *v12;

  v5 = *(_QWORD *)&a5;
  v7 = self;
  if (self)
    self = (BWFigCaptureSession *)self->_pipelines;
  v8 = (void *)-[BWFigCaptureSession stillImageSinkPipelineSessionStorageWithStillImageCoordinator:](self, "stillImageSinkPipelineSessionStorageWithStillImageCoordinator:", a3);
  objc_msgSend(a4, "requestedSettings");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureType") != 4
     && objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureType") != 5;
  v11 = (void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(objc_msgSend((id)objc_msgSend(v8, "stillImageSinkPipeline"), "sinkID"), objc_msgSend((id)objc_msgSend(a4, "requestedSettings"), "settingsID"), v5);
  if ((isKindOfClass & 1) != 0)
    v12 = CFSTR("IrisWillCaptureStillImage");
  else
    v12 = CFSTR("WillCaptureStillImage");
  if (((isKindOfClass | v10) & 1) == 0)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v11);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("StillImageStabilizationActive"));
    v12 = CFSTR("WillCaptureStillImage");
  }
  captureSession_postNotificationWithPayload(v7->_captureSession, v12, v11);
}

- (void)stillImageCoordinator:(id)a3 didResolveStillImagePTS:(id *)a4 forSettings:(id)a5 isPreBracketedEV0:(BOOL)a6
{
  unsigned int v6;
  BWFigCaptureSession *v9;
  void *v10;
  FigCaptureSessionPipelines *pipelines;
  OpaqueFigCaptureSession *captureSession;
  void *v13;
  void *v14;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15;

  v6 = a6;
  v9 = self;
  if (self)
    self = (BWFigCaptureSession *)self->_pipelines;
  v10 = (void *)-[BWFigCaptureSession stillImageSinkPipelineSessionStorageWithStillImageCoordinator:](self, "stillImageSinkPipelineSessionStorageWithStillImageCoordinator:", a3);
  objc_msgSend(a5, "requestedSettings");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (!v6 || objc_msgSend((id)objc_msgSend(a5, "captureSettings"), "deliverOriginalImage")))
  {
    captureSession = v9->_captureSession;
    pipelines = v9->_pipelines;
    v13 = (void *)objc_msgSend(a5, "requestedSettings");
    v14 = (void *)objc_msgSend(a5, "captureSettings");
    v15 = *a4;
    captureSession_didCaptureIrisStill(captureSession, pipelines, v10, v13, v14, (CMTime *)&v15, v6, 0);
  }
}

- (void)stillImageCoordinator:(id)a3 didSelectNewReferenceFrameWithPTS:(id *)a4 transform:(id)a5 forSettings:(id)a6
{
  id v10;
  uint64_t v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  CMBaseObjectGetDerivedStorage();
  v10 = -[FigCaptureSessionPipelines movieFileSinkPipelineWithSinkID:](self->_pipelines, "movieFileSinkPipelineWithSinkID:", objc_msgSend((id)objc_msgSend(-[FigCaptureSessionPipelines stillImageSinkPipelineSessionStorageWithStillImageCoordinator:](self->_pipelines, "stillImageSinkPipelineSessionStorageWithStillImageCoordinator:", a3), "stillImageSinkPipeline"), "sinkID"));
  if (a5)
  {
    v11 = (uint64_t)v10;
    if (dword_1ECFE9590)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v13 = (void *)objc_msgSend((id)objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline movieFileSinkNodes](v11), "firstObject"), "irisStillImageMovieMetadataCache");
    if (v13)
      objc_msgSend(v13, "cacheStillImageVideoToPhotoTransform:forSettingsID:", a5, +[BWIrisMovieInfo livePhotoMetadataStillImageKeyFrameSettingsIDForSettingsID:isOriginalPhotoRecording:](BWIrisMovieInfo, "livePhotoMetadataStillImageKeyFrameSettingsIDForSettingsID:isOriginalPhotoRecording:", objc_msgSend((id)objc_msgSend(a6, "requestedSettings"), "settingsID"), 0));
  }
}

- (void)stillImageCoordinator:(id)a3 didCapturePhotoForSettings:(id)a4
{
  uint64_t DerivedStorage;
  id v8;
  char isKindOfClass;
  __CFString **v10;
  __CFString *v11;
  const void *v12;
  void *v13;
  OpaqueFigCaptureSession *captureSession;
  _QWORD v15[8];

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v8 = -[FigCaptureSessionPipelines stillImageSinkPipelineSessionStorageWithStillImageCoordinator:](self->_pipelines, "stillImageSinkPipelineSessionStorageWithStillImageCoordinator:", a3);
  if (objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureType") == 2
    && BWCaptureDevicePositionFromPortType((void *)objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "masterPortType")) == 1&& (objc_msgSend(*(id *)(DerivedStorage + 56), "isEqualToString:", 0x1E493D4D8) & 1) == 0&& (objc_msgSend(*(id *)(DerivedStorage + 56), "isEqualToString:", 0x1E493D4F8) & 1) == 0&& (objc_msgSend(*(id *)(DerivedStorage + 56), "isEqualToString:", 0x1E493D5F8) & 1) == 0&& objc_msgSend((id)objc_msgSend(+[FigCaptureSourceBackings sharedCaptureSourceBackings](FigCaptureSourceBackings, "sharedCaptureSourceBackings"), "commonSettings"), "flashMitigationRequired"))
  {
    -[BWFigCaptureSession _doFlashMitigation]((uint64_t)self);
  }
  cs_setSceneClassifierSuspended(self->_pipelines, v8, 0);
  objc_msgSend(a4, "requestedSettings");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = kFigCaptureSessionIrisStillImageSinkNotification_DidCaptureStillImage;
  if ((isKindOfClass & 1) == 0)
    v10 = kFigCaptureSessionStillImageSinkNotification_DidCaptureStillImage;
  v11 = *v10;
  v12 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(objc_msgSend((id)objc_msgSend(v8, "stillImageSinkPipeline"), "sinkID"), objc_msgSend((id)objc_msgSend(a4, "requestedSettings"), "settingsID"), 0);
  captureSession_postNotificationWithPayload(self->_captureSession, v11, v12);
  v13 = (void *)objc_msgSend(a4, "requestedSettings");
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "stillImageSinkPipeline"), "stillImageCoordinatorNode"), "responsiveShutterEnabled"))objc_msgSend(v13, "resolutionFlavor");
  if ((isKindOfClass & 1) != 0)
  {
    if (objc_msgSend((id)objc_msgSend(a4, "requestedSettings"), "movieMode"))
    {
      captureSession = self->_captureSession;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __72__BWFigCaptureSession_stillImageCoordinator_didCapturePhotoForSettings___block_invoke;
      v15[3] = &unk_1E4922AA0;
      v15[4] = self;
      v15[5] = v8;
      v15[6] = a4;
      v15[7] = DerivedStorage;
      captureSession_performBlockOnWorkerQueue(captureSession, (uint64_t)v15);
    }
  }
}

- (uint64_t)_doFlashMitigation
{
  uint64_t v1;
  int v2;
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  int v16;
  int v17;
  const __CFString *v18;
  void *v19;

  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(+[BWFigCaptureAttachedAccessoriesMonitor sharedAttachedAccessoriesMonitor](BWFigCaptureAttachedAccessoriesMonitor, "sharedAttachedAccessoriesMonitor"), "batteryPackAccessoryConnected");
    v3 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v4 = (const __CFString *)*MEMORY[0x1E0C9B230];
    v5 = (id)CFPreferencesCopyValue(CFSTR("FlashMitigationInfo"), CFSTR("com.apple.cameracapture.volatile"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NumPostedNotifications")), "intValue");
    v7 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LastNotificationTime")), "intValue");
    v8 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FlashCaptureCountWhileBatteryAccessoryAttached")), "intValue");
    result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSince1970");
    v10 = v9;
    if (v2)
    {
      v11 = (v8 + 1);
      v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v5);
      if (v6)
        v13 = 10;
      else
        v13 = 1;
      if ((int)v11 < v13 || v10 - (double)v7 <= (float)(powf(5.0, (float)(v6 - 1)) * 1209600.0))
      {
        v14 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
      }
      else
      {
        -[BWFigCaptureSession _postFlashMitigationUserNotification](v1);
        objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v6 + 1)), CFSTR("NumPostedNotifications"));
        objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10), CFSTR("LastNotificationTime"));
        v14 = &unk_1E49F9F30;
      }
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("FlashCaptureCountWhileBatteryAccessoryAttached"));
      v18 = CFSTR("FlashCaptureCountWhileBatteryAccessoryDetached");
      v19 = v12;
      goto LABEL_20;
    }
    if (v6 > 0 || v8 >= 1)
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v5);
      v16 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FlashCaptureCountWhileBatteryAccessoryDetached")), "intValue");
      if (!v16)
        objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10), CFSTR("FirstFlashCaptureTimeWhileBatteryAccessoryDetached"));
      v17 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FirstFlashCaptureTimeWhileBatteryAccessoryDetached")), "intValue");
      result = objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v16 + 1)), CFSTR("FlashCaptureCountWhileBatteryAccessoryDetached"));
      if (v16 < 9 || v10 - (double)v17 <= 86400.0)
        goto LABEL_21;
      objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E49F9F30, CFSTR("FlashCaptureCountWhileBatteryAccessoryDetached"));
      objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E49F9F30, CFSTR("FlashCaptureCountWhileBatteryAccessoryAttached"));
      objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E49F9F30, CFSTR("NumPostedNotifications"));
      v18 = CFSTR("LastNotificationTime");
      v19 = v12;
LABEL_20:
      result = objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1E49F9F30, v18);
LABEL_21:
      if (v12)
      {
        CFPreferencesSetValue(CFSTR("FlashMitigationInfo"), v12, CFSTR("com.apple.cameracapture.volatile"), v3, v4);
        return CFPreferencesSynchronize(CFSTR("com.apple.cameracapture.volatile"), v3, v4);
      }
    }
  }
  return result;
}

unint64_t __72__BWFigCaptureSession_stillImageCoordinator_didCapturePhotoForSettings___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v18;
  uint64_t v19;
  id obj;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 16);
  else
    v3 = 0;
  v4 = (void *)objc_msgSend(v3, "movieFileSinkPipelineWithSinkID:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "stillImageSinkPipeline"), "sinkID"));
  obj = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v22 = v4;
  v5 = (void *)objc_msgSend(v4, "pendingIrisRecordings");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v11 = objc_msgSend((id)objc_msgSend(v10, "settings"), "settingsID");
        if (v11 == objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "requestedSettings"), "settingsID")
          && objc_msgSend(v10, "isEmpty"))
        {
          objc_msgSend(obj, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v12)
  {
    v13 = v12;
    v21 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(obj);
        v15 = +[BWIrisMovieInfo emptyIrisMovieInfoWithFigCaptureMovieFileRecordingSettings:](BWIrisMovieInfo, "emptyIrisMovieInfoWithFigCaptureMovieFileRecordingSettings:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "settings"));
        if (dword_1ECFE9590)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        captureSession_postNotificationsForIrisRequestCompletedWithError(*(const void **)(*(_QWORD *)(a1 + 32) + 8), objc_msgSend(v22, "sinkID", v18, v19), v15, 4294951756);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v13);
  }
  return cs_removeEmptyPendingIrisRecording(*(const void **)(*(_QWORD *)(a1 + 32) + 8), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "stillImageSinkPipeline"), "sinkID"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "requestedSettings"), "settingsID"));
}

- (void)stillImageCoordinator:(id)a3 readyToRespondToRequestAfterRequestWithSettings:(id)a4
{
  BWFigCaptureSession *v5;
  void *v6;
  void *v7;
  const void *v8;

  v5 = self;
  if (self)
    self = (BWFigCaptureSession *)self->_pipelines;
  v6 = (void *)-[BWFigCaptureSession stillImageSinkPipelineSessionStorageWithStillImageCoordinator:](self, "stillImageSinkPipelineSessionStorageWithStillImageCoordinator:", a3);
  v7 = (void *)objc_msgSend(a4, "requestedSettings");
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "stillImageSinkPipeline"), "stillImageCoordinatorNode"), "responsiveShutterEnabled"))
  {
    if (objc_msgSend(v7, "resolutionFlavor") != 2)
    {
      v8 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(objc_msgSend((id)objc_msgSend(v6, "stillImageSinkPipeline"), "sinkID"), objc_msgSend(a4, "settingsID"), 0);
      captureSession_postNotificationWithPayload(v5->_captureSession, CFSTR("ReadyForResponsiveRequest"), v8);
    }
  }
}

- (void)_postFlashMitigationUserNotification
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const __CFDictionary *v5;
  CFUserNotificationRef v6;
  CFUserNotificationRef v7;
  NSObject *global_queue;
  _QWORD v9[5];
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AVFCapture"));
    v2 = objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E4928818, CFSTR("FlashMitigationNotification-A149"));
    v3 = objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Alert Message"), &stru_1E4928818, CFSTR("FlashMitigationNotification-A149"));
    v4 = *MEMORY[0x1E0C9B810];
    v10[0] = *MEMORY[0x1E0C9B838];
    v10[1] = v4;
    v11[0] = v2;
    v11[1] = v3;
    v5 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v6 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0, 0, v5);
    if (v6)
    {
      v7 = v6;
      global_queue = dispatch_get_global_queue(0, 0);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __59__BWFigCaptureSession__postFlashMitigationUserNotification__block_invoke;
      v9[3] = &__block_descriptor_40_e5_v8__0l;
      v9[4] = v7;
      dispatch_async(global_queue, v9);
    }
  }
}

void __59__BWFigCaptureSession__postFlashMitigationUserNotification__block_invoke(uint64_t a1)
{
  CFOptionFlags responseFlags;

  responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 32), 0.0, &responseFlags);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (void)stillImageCoordinator:(id)a3 didCancelMomentCaptureForSettingsID:(int64_t)a4 streamingDisruptionEndPTS:(id *)a5
{
  uint64_t DerivedStorage;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int value;
  unsigned int v17;
  uint64_t v18;
  const void *v19;
  OpaqueFigCaptureSession *v20;
  float v21;
  double v22;
  NSObject *v23;
  OpaqueFigCaptureSession *captureSession;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[7];
  _QWORD v28[10];
  __int128 v29;
  int64_t var3;
  os_log_type_t v31[16];
  os_log_type_t v32;
  os_log_type_t type[4];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  CMTime time;
  _BYTE v41[24];
  __int128 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v34 = 0;
  v35 = &v34;
  v36 = 0x3052000000;
  v37 = __Block_byref_object_copy__23;
  v38 = __Block_byref_object_dispose__23;
  v39 = 0;
  v39 = -[FigCaptureSessionPipelines stillImageSinkPipelineSessionStorageWithStillImageCoordinator:](self->_pipelines, "stillImageSinkPipelineSessionStorageWithStillImageCoordinator:", a3);
  if (dword_1ECFE9590)
  {
    *(_DWORD *)v31 = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 320));
  if (objc_msgSend(*(id *)(DerivedStorage + 576), "settingsID") == a4
    && objc_msgSend(*(id *)(DerivedStorage + 576), "movieMode") == 2)
  {
    v11 = *(id *)(DerivedStorage + 576);
    os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 320));
    if (v11)
    {
      v12 = objc_msgSend((id)v35[5], "cameraSourcePipeline");
      *(_QWORD *)v41 = 0;
      *(_QWORD *)&v41[8] = v41;
      *(_QWORD *)&v41[16] = 0x3052000000;
      *(_QWORD *)&v42 = __Block_byref_object_copy__23;
      *((_QWORD *)&v42 + 1) = __Block_byref_object_dispose__23;
      v43 = 0;
      v43 = -[FigCaptureCameraSourcePipeline captureDevice](v12);
      v13 = objc_msgSend(v11, "flashMode");
      if (v13)
      {
        if (v13 != 1)
        {
          if (v13 == 2)
            objc_msgSend(*(id *)(*(_QWORD *)&v41[8] + 40), "setAutomaticallyAdjustsTorch:", 1);
          goto LABEL_23;
        }
        v21 = 1.0;
        objc_msgSend(*(id *)(*(_QWORD *)&v41[8] + 40), "setAutomaticallyAdjustsTorch:", 0);
      }
      else
      {
        v21 = 0.0;
        objc_msgSend(*(id *)(*(_QWORD *)&v41[8] + 40), "setAutomaticallyAdjustsTorch:", 0);
      }
      *(float *)&v22 = v21;
      objc_msgSend(*(id *)(*(_QWORD *)&v41[8] + 40), "setTorchLevel:", v22, v25, v26);
LABEL_23:
      if (dword_1ECFE9590)
      {
        *(_DWORD *)type = 0;
        v32 = OS_LOG_TYPE_DEFAULT;
        v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      captureSession = self->_captureSession;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __107__BWFigCaptureSession_stillImageCoordinator_didCancelMomentCaptureForSettingsID_streamingDisruptionEndPTS___block_invoke;
      v28[3] = &unk_1E4922D08;
      v28[4] = self;
      v28[5] = v11;
      v29 = *(_OWORD *)&a5->var0;
      var3 = a5->var3;
      v28[6] = &v34;
      v28[7] = v41;
      v28[8] = DerivedStorage;
      v28[9] = a4;
      captureSession_dispatchGraphCalloutToWorkerQueueAfter(captureSession, (uint64_t)v28, 0.0);

      _Block_object_dispose(v41, 8);
      goto LABEL_19;
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 320));
  }
  v14 = objc_msgSend((id)objc_msgSend((id)v35[5], "stillImageSinkPipeline", v25, v26), "sinkID");
  if (dword_1ECFE9590)
  {
    LODWORD(time.value) = 0;
    v31[0] = OS_LOG_TYPE_DEFAULT;
    v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    value = time.value;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      v17 = value;
    else
      v17 = value & 0xFFFFFFFE;
    if (v17)
    {
      v18 = *(_QWORD *)(DerivedStorage + 72);
      *(_DWORD *)v41 = 136315906;
      *(_QWORD *)&v41[4] = "-[BWFigCaptureSession stillImageCoordinator:didCancelMomentCaptureForSettingsID:streamingDisruptionEndPTS:]";
      *(_WORD *)&v41[12] = 2114;
      *(_QWORD *)&v41[14] = v18;
      *(_WORD *)&v41[22] = 1024;
      LODWORD(v42) = -16418;
      WORD2(v42) = 2048;
      *(_QWORD *)((char *)&v42 + 6) = a4;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v19 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(v14, a4, 4294950878);
  captureSession_postNotificationWithPayload(self->_captureSession, CFSTR("DidBeginRecordingMomentCaptureMovie"), v19);
  v20 = self->_captureSession;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __107__BWFigCaptureSession_stillImageCoordinator_didCancelMomentCaptureForSettingsID_streamingDisruptionEndPTS___block_invoke_77;
  v27[3] = &unk_1E491EC68;
  v27[4] = self;
  v27[5] = v14;
  v27[6] = a4;
  captureSession_performBlockOnWorkerQueue(v20, (uint64_t)v27);
LABEL_19:
  _Block_object_dispose(&v34, 8);
}

void __107__BWFigCaptureSession_stillImageCoordinator_didCancelMomentCaptureForSettingsID_streamingDisruptionEndPTS___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v14[4];
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;

  if ((a2 & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      v4 = *(void **)(v3 + 16);
    else
      v4 = 0;
    v5 = objc_msgSend(v4, "movieFileSinkPipelineWithSinkID:", objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "stillImageSinkPipeline"), "sinkID"));
    v6 = (void *)v5;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3052000000;
    v26 = __Block_byref_object_copy__23;
    v27 = __Block_byref_object_dispose__23;
    v28 = 0;
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      v8 = *(void **)(v7 + 16);
    else
      v8 = 0;
    v9 = -[FigCaptureMovieFileSinkPipeline videoSourceID](v5);
    v28 = objc_msgSend(v8, "previewSinkPipelineWithSourceID:sourceDeviceType:", v9, -[FigCaptureMovieFileSinkPipeline videoSourceDeviceType]((uint64_t)v6));
    objc_msgSend((id)v24[5], "setVideoStabilizationOverscanCropEnabled:momentMovieRecordingEnabled:", 1, 1);
    objc_msgSend((id)v24[5], "setSemanticStyleRenderingSuspended:animated:", 1, 1);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setVideoStabilizationOverscanCropEnabled:", 1);
    v10 = objc_msgSend(v6, "sinkID");
    v11 = (void *)-[FigCaptureMovieFileSinkPipeline captureDevice]((uint64_t)v6);
    v14[1] = 3221225472;
    v12 = *(_OWORD *)(a1 + 48);
    v15 = *(_OWORD *)(a1 + 32);
    v21 = *(_OWORD *)(a1 + 80);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[2] = __107__BWFigCaptureSession_stillImageCoordinator_didCancelMomentCaptureForSettingsID_streamingDisruptionEndPTS___block_invoke_2;
    v14[3] = &unk_1E4922CE0;
    v22 = *(_QWORD *)(a1 + 96);
    v16 = v10;
    v17 = &v23;
    v18 = v12;
    v13 = *(_QWORD *)(a1 + 72);
    v19 = *(_QWORD *)(a1 + 64);
    v20 = v13;
    objc_msgSend(v11, "setAutoImageControlMode:completionHandler:", 2, v14);
    _Block_object_dispose(&v23, 8);
  }
}

void __107__BWFigCaptureSession_stillImageCoordinator_didCancelMomentCaptureForSettingsID_streamingDisruptionEndPTS___block_invoke_2(uint64_t a1, char a2, __int128 *a3)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v7;
  int8x16_t v8;
  const void *v9;
  uint64_t v10;
  _QWORD v11[4];
  int8x16_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  char v21;
  os_log_type_t type;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9590)
  {
    v23 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v21 = a2;
  v7 = *(_OWORD *)(a1 + 48);
  v8 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  v9 = *(const void **)(*(_QWORD *)(a1 + 32) + 8);
  v11[1] = 3221225472;
  v17 = *(_OWORD *)(a1 + 96);
  v19 = *a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[2] = __107__BWFigCaptureSession_stillImageCoordinator_didCancelMomentCaptureForSettingsID_streamingDisruptionEndPTS___block_invoke_73;
  v11[3] = &unk_1E4922CB8;
  v18 = *(_QWORD *)(a1 + 112);
  v20 = *((_QWORD *)a3 + 2);
  v12 = v8;
  v13 = v7;
  v14 = *(_OWORD *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 88);
  v15 = *(_QWORD *)(a1 + 80);
  v16 = v10;
  captureSession_dispatchGraphCalloutToWorkerQueueAfter(v9, (uint64_t)v11, 0.0);
}

void __107__BWFigCaptureSession_stillImageCoordinator_didCancelMomentCaptureForSettingsID_streamingDisruptionEndPTS___block_invoke_73(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  double v9;
  NSObject *v10;
  _OWORD *v11;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  NSObject *v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  Float64 Seconds;
  Float64 v20;
  Float64 v21;
  const void *v22;
  uint64_t v23;
  void *v24;
  const void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  int64_t v30;
  NSObject *v31;
  CMTime *p_time1;
  uint64_t v33;
  CMTime time2;
  CMTime time1;
  int v36;
  __int16 v37;
  Float64 v38;
  __int16 v39;
  Float64 v40;
  __int16 v41;
  Float64 v42;
  CMTime time;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 80) + 320));
  v4 = objc_msgSend(*(id *)(a1 + 32), "settingsID");
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 80) + 576), "settingsID");
  v6 = *(_QWORD *)(a1 + 80);
  if (v4 == v5)
  {

    v6 = *(_QWORD *)(a1 + 80);
    *(_QWORD *)(v6 + 576) = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 320));
  if ((a2 & 1) != 0)
  {
    if (dword_1ECFE9590)
    {
      LODWORD(time2.value) = 0;
      LOBYTE(value) = 0;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else if (v4 != v5 || *(_BYTE *)(a1 + 144) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setVideoStabilizationOverscanCropEnabled:momentMovieRecordingEnabled:", 0, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setSemanticStyleRenderingSuspended:animated:", 0, 1);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setVideoStabilizationOverscanCropEnabled:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setAutomaticallyAdjustsTorch:", 0);
    LODWORD(v9) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setTorchLevel:", v9);
    if (dword_1ECFE9590)
    {
      LODWORD(time2.value) = 0;
      LOBYTE(value) = 0;
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v22 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "settingsID", p_time1, v33), 4294950878);
    captureSession_postNotificationWithPayload(*(const void **)(*(_QWORD *)(a1 + 40) + 8), CFSTR("DidBeginRecordingMomentCaptureMovie"), v22);
    cs_removeEmptyPendingIrisRecording(*(const void **)(*(_QWORD *)(a1 + 40) + 8), objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "stillImageSinkPipeline"), "sinkID"), *(_QWORD *)(a1 + 88));
  }
  else
  {
    value = *MEMORY[0x1E0CA2E18];
    timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
    v11 = (_OWORD *)(a1 + 96);
    flags = *(_DWORD *)(a1 + 108);
    if ((flags & 1) != 0)
    {
      if ((*(_BYTE *)(a1 + 132) & 1) != 0)
      {
        *(_OWORD *)&time1.value = *v11;
        time1.epoch = *(_QWORD *)(a1 + 112);
        time2 = *(CMTime *)(a1 + 120);
        CMTimeMaximum(&time, &time1, &time2);
        value = time.value;
        flags = time.flags;
        timescale = time.timescale;
        epoch = time.epoch;
      }
      else
      {
        value = *(_QWORD *)v11;
        timescale = *(_DWORD *)(a1 + 104);
        epoch = *(_QWORD *)(a1 + 112);
      }
    }
    else
    {
      flags = *(_DWORD *)(a1 + 132);
      if ((flags & 1) != 0)
      {
        value = *(_QWORD *)(a1 + 120);
        timescale = *(_DWORD *)(a1 + 128);
        epoch = *(_QWORD *)(a1 + 136);
      }
      else
      {
        epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
        flags = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
      }
    }
    if (dword_1ECFE9590)
    {
      LODWORD(time2.value) = 0;
      HIBYTE(v33) = 0;
      v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v15 = time2.value;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        v16 = v15;
      else
        v16 = v15 & 0xFFFFFFFE;
      if (v16)
      {
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 72);
        v18 = *(unsigned __int8 *)(a1 + 144);
        *(_OWORD *)&time.value = *v11;
        time.epoch = *(_QWORD *)(a1 + 112);
        Seconds = CMTimeGetSeconds(&time);
        time = *(CMTime *)(a1 + 120);
        v20 = CMTimeGetSeconds(&time);
        time.value = value;
        time.timescale = timescale;
        time.flags = flags;
        time.epoch = epoch;
        v21 = CMTimeGetSeconds(&time);
        LODWORD(time1.value) = 136316418;
        *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)"-[BWFigCaptureSession stillImageCoordinator:didCancelM"
                                                                  "omentCaptureForSettingsID:streamingDisruptionEndPTS:]_block_invoke";
        LOWORD(time1.flags) = 2114;
        *(_QWORD *)((char *)&time1.flags + 2) = v17;
        HIWORD(time1.epoch) = 1024;
        v36 = v18;
        v37 = 2048;
        v38 = Seconds;
        v39 = 2048;
        v40 = v20;
        v41 = 2048;
        v42 = v21;
        LODWORD(v33) = 58;
        p_time1 = &time1;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v24 = *(void **)(a1 + 32);
    v23 = *(_QWORD *)(a1 + 40);
    v25 = *(const void **)(v23 + 8);
    v26 = *(void **)(v23 + 16);
    v27 = (void *)objc_msgSend(v26, "stillImageSinkPipelineSessionStorageWithSinkID:", *(_QWORD *)(a1 + 48), p_time1, v33);
    v28 = (void *)objc_msgSend(v27, "previewSinkNode");
    v29 = objc_msgSend(v24, "stillImageUserInitiatedRequestTime");
    if (objc_msgSend((id)objc_msgSend(v24, "movieRecordingSettings"), "movieStartTimeOverride") > v29)
      v29 = objc_msgSend((id)objc_msgSend(v24, "movieRecordingSettings"), "movieStartTimeOverride");
    memset(&time, 0, sizeof(time));
    if (!v28
      || (objc_msgSend(v28, "previewPTSDisplayedAtHostTime:allowingExtrapolation:", v29, 1), (time.flags & 1) == 0))
    {
      v30 = FigHostTimeToNanoseconds();
      CMTimeMake(&time1, v30, 1000000000);
      time = time1;
    }
    if ((flags & 0x1D) == 1)
    {
      time1.value = value;
      time1.timescale = timescale;
      time1.flags = flags;
      time1.epoch = epoch;
      time2 = time;
      if (CMTimeCompare(&time1, &time2) >= 1)
      {
        time.value = value;
        time.timescale = timescale;
        time.flags = flags;
        time.epoch = epoch;
      }
    }
    LOBYTE(time2.value) = 0;
    if (*MEMORY[0x1E0CA1FC0])
    {
      v31 = fig_log_handle();
      if (os_signpost_enabled(v31))
      {
        LOWORD(time1.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A2C80000, v31, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CameraCaptureFirstQuickTakeVideoFrame", (const char *)&unk_1A332D80B, (uint8_t *)&time1, 2u);
      }
    }
    time1 = time;
    captureSession_didCaptureIrisStill(v25, v26, v27, v24, 0, &time1, 0, &time2);
  }
}

unint64_t __107__BWFigCaptureSession_stillImageCoordinator_didCancelMomentCaptureForSettingsID_streamingDisruptionEndPTS___block_invoke_77(_QWORD *a1)
{
  return cs_removeEmptyPendingIrisRecording(*(const void **)(a1[4] + 8), a1[5], a1[6]);
}

- (void)stillImageCoordinator:(id)a3 willPrepareStillImageCaptureWithSettings:(id)a4 clientInitiated:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t DerivedStorage;
  id v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  char v29;
  void *v30;
  uint64_t IsBayerRaw;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const void *v39;
  int v40;
  __CFString **v41;
  uint64_t v42;
  unsigned int v43;
  uint64_t v44;
  BWFigCaptureSession *v45;
  id v46;
  _BOOL4 v47;

  v5 = a5;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v10 = -[FigCaptureSessionPipelines stillImageSinkPipelineSessionStorageWithStillImageCoordinator:](self->_pipelines, "stillImageSinkPipelineSessionStorageWithStillImageCoordinator:", a3);
  v11 = objc_msgSend(v10, "cameraSourcePipeline");
  v46 = a4;
  v12 = (void *)objc_msgSend(a4, "requestedSettings");
  v13 = objc_msgSend(v12, "outputWidth");
  v14 = objc_msgSend(v12, "outputHeight");
  v15 = objc_msgSend((id)objc_msgSend(v10, "stillImageSinkPipeline"), "sinkID");
  v44 = v15;
  v45 = self;
  v47 = v5;
  v43 = v13;
  v42 = v14;
  if (objc_msgSend(v12, "settingsProvider"))
  {
    if (v5)
    {
      v16 = v15;
      v17 = (void *)objc_msgSend(v12, "figCaptureIrisPreparedSettingsRepresentation");
      os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 320));
      v18 = (id)objc_msgSend(*(id *)(DerivedStorage + 448), "objectForKeyedSubscript:", v15);
      objc_msgSend(*(id *)(DerivedStorage + 448), "setObject:forKeyedSubscript:", v17, v16);
      os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 320));

      v19 = v11;
      v20 = v46;
      if (!v17)
        goto LABEL_22;
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 320));
      v21 = (void *)objc_msgSend(*(id *)(DerivedStorage + 448), "objectForKeyedSubscript:", v15);
      objc_msgSend(v21, "setSettingsID:", objc_msgSend(v12, "settingsID"));
      v22 = objc_msgSend(v12, "bracketImageCount");
      v19 = v11;
      if (v22 > objc_msgSend(v21, "bracketedImageCount"))
        objc_msgSend(v21, "setBracketedImageCount:", objc_msgSend(v12, "bracketImageCount"));
      v20 = v46;
      if (objc_msgSend(v12, "rawOutputFormat"))
        objc_msgSend(v21, "setRawOutputFormat:", objc_msgSend(v12, "rawOutputFormat"));
      if (objc_msgSend(v12, "outputFormat"))
        objc_msgSend(v21, "setProcessedOutputFormat:", objc_msgSend(v12, "outputFormat"));
      v23 = objc_msgSend(v12, "HDRMode");
      if (v23 > (int)objc_msgSend(v21, "HDRMode"))
        objc_msgSend(v21, "setHDRMode:", objc_msgSend(v12, "HDRMode"));
      v24 = objc_msgSend(v12, "qualityPrioritization");
      if (v24 > (int)objc_msgSend(v21, "qualityPrioritization"))
        objc_msgSend(v21, "setQualityPrioritization:", objc_msgSend(v12, "qualityPrioritization"));
      v25 = objc_msgSend(v12, "digitalFlashMode");
      if (v25 > (int)objc_msgSend(v21, "digitalFlashMode"))
        objc_msgSend(v21, "setDigitalFlashMode:", objc_msgSend(v12, "digitalFlashMode"));
      v26 = objc_msgSend((id)objc_msgSend(v12, "bravoConstituentImageDeliveryDeviceTypes"), "count");
      if (v26 > objc_msgSend((id)objc_msgSend(v21, "bravoConstituentImageDeliveryDeviceTypes"), "count"))
        objc_msgSend(v21, "setBravoConstituentImageDeliveryDeviceTypes:", objc_msgSend(v12, "bravoConstituentImageDeliveryDeviceTypes"));
      objc_msgSend(v21, "setOutputWidth:", objc_msgSend(v12, "outputWidth"));
      objc_msgSend(v21, "setOutputHeight:", objc_msgSend(v12, "outputHeight"));
      v17 = (void *)objc_msgSend(v21, "copy");
      os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 320));
      v27 = v17;
      if (!v17)
        goto LABEL_22;
    }
    v28 = objc_msgSend(v17, "bracketedImageCount");
    v29 = 0;
    goto LABEL_23;
  }
  objc_msgSend((id)objc_msgSend(v10, "preparedBracket"), "setOutputFormat:", objc_msgSend(v12, "outputFormat"));
  objc_msgSend((id)objc_msgSend(v10, "preparedBracket"), "setOutputDimensions:", v13 | (unint64_t)(v14 << 32));
  objc_msgSend((id)objc_msgSend(v10, "preparedBracket"), "setImageCount:", objc_msgSend(v12, "bracketImageCount"));
  v19 = v11;
  v20 = v46;
LABEL_22:
  v28 = objc_msgSend(v12, "bracketImageCount");
  v17 = 0;
  v29 = 1;
LABEL_23:
  v30 = (void *)-[FigCaptureCameraSourcePipeline captureDevice](v19);
  IsBayerRaw = FigCapturePixelFormatIsBayerRaw(objc_msgSend(v17, "rawOutputFormat"));
  +[BWStillImageCoordinatorNode worstCaseMaxBracketedCaptureBufferCountForPreparedSettings:stillImageCaptureSettings:captureDevice:](BWStillImageCoordinatorNode, "worstCaseMaxBracketedCaptureBufferCountForPreparedSettings:stillImageCaptureSettings:captureDevice:", v17, objc_msgSend(v20, "captureSettings"), v30);
  v32 = -[FigCaptureCameraSourcePipeline prepareForStillImageCaptureWithStillImageOutputRetainedBufferCountOverride:infraRedStillImageOutputRetainedBufferCountOverride:clientBracketCount:enableSushiRawAttachmentOption:](v19, 0, 0, v28, IsBayerRaw);
  if ((_DWORD)v32)
  {
    v33 = v32;
    FigDebugAssert3();
  }
  else
  {
    v33 = objc_msgSend(v30, "updateStillImageSensorRawBufferPoolsWithRetainedBufferCount:zoomBasedRetainedBufferCount:ultraHighResolutionRetainedBufferCount:", 0, 0, 0);
    if (objc_msgSend(v10, "pixelConverter")
      && objc_msgSend(v12, "outputFormat")
      && objc_msgSend(v12, "outputFormat") != 1785750887
      && objc_msgSend(v12, "outputFormat") != 1752589105
      && objc_msgSend(v12, "outputFormat") != 1635148593)
    {
      v34 = cs_figCaptureColorSpaceFromSourcePipeline(v19);
      v35 = (void *)-[FigCaptureCameraSourcePipeline captureSourceVideoFormat](v19);
      v36 = +[BWVideoFormat colorSpacePropertiesForSourceThatSupportsWideColor:sourceColorSpace:sourcePixelFormat:sourceDimensions:requestedPixelFormat:](BWVideoFormat, "colorSpacePropertiesForSourceThatSupportsWideColor:sourceColorSpace:sourcePixelFormat:sourceDimensions:requestedPixelFormat:", objc_msgSend(v30, "supportsWideColor"), v34, objc_msgSend(v35, "format"), objc_msgSend(v35, "dimensions"), objc_msgSend(v12, "outputFormat"));
      if (!objc_msgSend(v12, "settingsProvider"))
        objc_msgSend((id)objc_msgSend(v10, "preparedBracket"), "setColorSpaceProperties:", v36);
      if ((v29 & 1) != 0)
        v37 = v12;
      else
        v37 = v17;
      v38 = (void *)objc_msgSend(v37, "bravoConstituentImageDeliveryDeviceTypes");
      if (objc_msgSend(v38, "count"))
        v28 = v28 * objc_msgSend(v38, "count");
      v33 = objc_msgSend((id)objc_msgSend(v10, "pixelConverter"), "updateOutputPixelFormat:dimensions:poolCapacity:colorSpaceProperties:alwaysUseHardwareForConversion:", objc_msgSend(v12, "outputFormat"), v43 | (unint64_t)(v42 << 32), v28, v36, (_DWORD)v36 != 0);
    }
  }
  if (v47)
  {
    v39 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(v44, objc_msgSend(v12, "settingsID"), v33);
    v40 = objc_msgSend(v12, "settingsProvider");
    v41 = kFigCaptureSessionIrisStillImageSinkNotification_PreparationComplete;
    if (v40 != 1)
      v41 = kFigCaptureSessionStillImageSinkNotification_BracketPreparationComplete;
    captureSession_postNotificationWithPayload(v45->_captureSession, *v41, v39);
  }
}

- (void)stagingNode:(id)a3 willEmitIrisRequest:(id)a4
{
  BWFigCaptureSession *v5;
  const void *v6;
  int v7;

  v5 = self;
  if (self)
    self = (BWFigCaptureSession *)self->_pipelines;
  v6 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(objc_msgSend((id)-[BWFigCaptureSession movieFileSinkPipelineWithIrisStagingNode:](self, "movieFileSinkPipelineWithIrisStagingNode:", a3), "sinkID"), objc_msgSend((id)objc_msgSend(a4, "settings"), "settingsID"), 0);
  if ((int)objc_msgSend(a4, "numberOfRequestedVariants") >= 1)
  {
    v7 = 0;
    do
    {
      captureSession_postNotificationWithPayload(v5->_captureSession, CFSTR("IrisDidRecordIrisMovie"), v6);
      ++v7;
    }
    while (v7 < (int)objc_msgSend(a4, "numberOfRequestedVariants"));
  }
}

- (void)stagingNode:(id)a3 waitingToEmitFrameWithPTS:(id *)a4
{
  if (self)
    self = (BWFigCaptureSession *)self->_pipelines;
  objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline fileCoordinatorNode](-[BWFigCaptureSession movieFileSinkPipelineWithIrisStagingNode:](self, "movieFileSinkPipelineWithIrisStagingNode:", a3, a4)), "tryToEmitFramesWaitingForMotion");
}

- (void)stagingNode:(id)a3 valveClosedWithPendingIrisRequests:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v13;
  uint64_t v14;
  id v15;
  BWFigCaptureSession *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  CMBaseObjectGetDerivedStorage();
  v16 = self;
  v15 = -[FigCaptureSessionPipelines movieFileSinkPipelineWithIrisStagingNode:](self->_pipelines, "movieFileSinkPipelineWithIrisStagingNode:", a3);
  mach_absolute_time();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(a4);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "enqueuedHostTime", v13, v14);
        objc_msgSend(v11, "setProcessingTimeInMilliseconds:", (double)FigHostTimeToNanoseconds() / 1000000.0);
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        captureSession_postNotificationsForIrisRequestCompletedWithError(v16->_captureSession, objc_msgSend(v15, "sinkID"), v11, 4294951754);
      }
      v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
}

- (void)remoteQueueSinkNode:(id)a3 localQueueBecameReady:(localQueueOpaque *)a4
{
  uint64_t v6;
  const void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a3, "sinkID");
  if (a4 && v6)
  {
    v8[0] = CFSTR("SectionID");
    v8[1] = CFSTR("LocalQueue");
    v9[0] = v6;
    v9[1] = a4;
    v7 = (const void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    if (v7)
      captureSession_postNotificationWithPayload(self->_captureSession, CFSTR("LocalQueueUpdated"), v7);
  }
}

uint64_t __44__BWFigCaptureSession_graphDidPrepareNodes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerSurfacesFromSourcePool:", objc_msgSend(*(id *)(a1 + 40), "preparedPixelBufferPool"));
}

uint64_t __44__BWFigCaptureSession_graphDidPrepareNodes___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerSurfacesFromSourcePool:", objc_msgSend(*(id *)(a1 + 40), "preparedPixelBufferPool"));
}

- (void)previewStitcher:(id)a3 didApplyWiderShift:(CGPoint)a4 widerScaleFactor:(float)a5 forWiderPortType:(id)a6 narrowerShift:(CGPoint)a7 narrowerScaleFactor:(float)a8 forNarrowerPortType:(id)a9 inSuperWideMacroMode:(BOOL)a10 widerShiftAtBaseZoom:(CGPoint)a11
{
  double y;
  double x;
  _BOOL8 v13;
  double v16;
  double v17;
  double v20;
  double v21;
  FigCaptureCameraSourcePipeline *v23;
  FigCaptureSessionPipelines *pipelines;

  y = a11.y;
  x = a11.x;
  v13 = a10;
  v16 = a7.y;
  v17 = a7.x;
  v20 = a4.y;
  v21 = a4.x;
  if (!self)
  {
    pipelines = (FigCaptureSessionPipelines *)objc_msgSend(0, "firstColorCameraSourcePipeline", a3);
    v23 = (FigCaptureCameraSourcePipeline *)pipelines;
    if (pipelines)
      goto LABEL_5;
    goto LABEL_4;
  }
  v23 = -[FigCaptureSessionPipelines firstColorCameraSourcePipeline](self->_pipelines, "firstColorCameraSourcePipeline", a3);
  if (!v23)
  {
    pipelines = self->_pipelines;
LABEL_4:
    v23 = -[NSArray firstObject](-[FigCaptureSessionPipelines cameraSourcePipelines](pipelines, "cameraSourcePipelines"), "firstObject");
  }
LABEL_5:
  -[FigCaptureCameraSourcePipeline setPreviewShift:previewScaleFactor:forPortType:previewShiftAtBaseZoom:]((uint64_t)v23, (uint64_t)a6, v21, v20, a5, x, y);
  -[FigCaptureCameraSourcePipeline setPreviewShift:previewScaleFactor:forPortType:previewShiftAtBaseZoom:]((uint64_t)v23, (uint64_t)a9, v17, v16, a8, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  objc_msgSend((id)-[FigCaptureCameraSourcePipeline captureDevice]((uint64_t)v23), "setOverCaptureSuperWideMacroActive:", v13);
}

- (void)previewStitcherReadyForPrimaryCaptureRectUpdates:(id)a3
{
  uint64_t DerivedStorage;
  id v6;
  void *v7;
  id v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[6];
  os_log_type_t type;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v6 = -[NSArray firstObject](-[FigCaptureSessionPipelines previewSinkPipelines](self->_pipelines, "previewSinkPipelines"), "firstObject");
  os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 320));
  v7 = *(void **)(DerivedStorage + 480);
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    *(_QWORD *)(DerivedStorage + 480) = v7;
  }
  v8 = (id)objc_msgSend(v7, "objectForKeyedSubscript:", objc_msgSend(v6, "sinkID"));
  objc_msgSend(*(id *)(DerivedStorage + 480), "setObject:forKeyedSubscript:", v6, objc_msgSend(v6, "sinkID"));
  if (dword_1ECFE9590)
  {
    v21 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v8)
  {
    objc_msgSend((id)objc_msgSend(v8, "previewStitcherNode"), "primaryCameraAspectRatio");
    v11 = v10;
    objc_msgSend((id)objc_msgSend(v8, "previewStitcherNode"), "primaryCaptureRectCenterX");
    v13 = v12;
    objc_msgSend((id)objc_msgSend(v8, "previewStitcherNode"), "trueVideoTransitionPercentComplete");
    objc_msgSend((id)objc_msgSend(v6, "previewStitcherNode"), "setPrimaryCaptureRectAspectRatio:center:trueVideoTransitionPercentComplete:trueVideoTransitionReferenceSampleBuffer:fencePortSendRight:", objc_msgSend((id)objc_msgSend(v8, "previewStitcherNode"), "trueVideoTransitionReferenceSampleBuffer"), 0, v11, v13, 0.0, v14);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 320));
  if (objc_msgSend(a3, "waitsForFencedUpdateBeforeFirstEmit"))
    captureSession_makeCommittedConfigurationLive(self->_captureSession);
  if (v8)
  {
    objc_msgSend((id)objc_msgSend(v8, "previewStitcherNode"), "markDelayedEndOfData");
    if (dword_1ECFE9590)
    {
      v21 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v16 = (void *)objc_msgSend(v8, "imageQueueSinkNode", v17, v18);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __72__BWFigCaptureSession_previewStitcherReadyForPrimaryCaptureRectUpdates___block_invoke;
    v19[3] = &unk_1E491F158;
    v19[4] = v6;
    v19[5] = DerivedStorage;
    objc_msgSend(v16, "notifyWhenIdle:", v19);

  }
  else
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "imageQueueSinkNode"), "input"), "connection"), "attachNow");
  }
}

uint64_t __72__BWFigCaptureSession_previewStitcherReadyForPrimaryCaptureRectUpdates___block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9590)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "imageQueueSinkNode", v4, v5), "input"), "connection"), "attachNow");
}

- (void)_mainDisplay:(void *)a3 didUpdateLayout:
{
  uint64_t DerivedStorage;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  if (a1)
  {
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    if (!*(_BYTE *)DerivedStorage)
    {
      v6 = DerivedStorage;
      if (*(_BYTE *)(DerivedStorage + 80))
      {
        if (objc_msgSend((id)objc_msgSend(a3, "foregroundApps"), "containsObject:", *(_QWORD *)(DerivedStorage + 56)))v7 = objc_msgSend((id)objc_msgSend(a3, "transitioningApps"), "containsObject:", *(_QWORD *)(v6 + 56)) ^ 1;
        else
          v7 = 0;
        os_unfair_lock_lock((os_unfair_lock_t)(v6 + 320));
        v8 = *(_DWORD *)(v6 + 368);
        os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 320));
        if ((objc_msgSend(*(id *)(v6 + 56), "isEqualToString:", 0x1E493D4D8) & 1) != 0
          || objc_msgSend(*(id *)(v6 + 56), "isEqualToString:", 0x1E493D5F8))
        {
          os_unfair_lock_lock(&sLockScreenCameraLaunchTelemetry);
          v9 = byte_1EE6BF330;
          v10 = objc_msgSend((id)objc_msgSend(a3, "foregroundApps"), "containsObject:", *(_QWORD *)(v6 + 56));
          if (v9)
          {
            if (v10)
              v11 = objc_msgSend((id)objc_msgSend(a3, "transitioningApps"), "containsObject:", *(_QWORD *)(v6 + 56)) ^ 1;
            else
              v11 = 0;
            if ((objc_msgSend((id)objc_msgSend(a3, "foregroundApps"), "containsObject:", *(_QWORD *)(v6 + 56)) & 1) != 0)
              v12 = 0;
            else
              v12 = objc_msgSend((id)objc_msgSend(a3, "transitioningApps"), "containsObject:", *(_QWORD *)(v6 + 56)) ^ 1;
            if ((v11 | v12) == 1)
            {
              byte_1EE6BF330 = 0;
              if (v11)
                qword_1EE6BF338 = mach_absolute_time();
              if (v12 && byte_1EE6BF31C && dword_1EE6BF32C && !v8)
                captureSession_reportCancelledLockScreenCameraLaunch();
            }
          }
          else if (v10
                 && objc_msgSend((id)objc_msgSend(a3, "transitioningApps"), "containsObject:", *(_QWORD *)(v6 + 56)))
          {
            byte_1EE6BF330 = 1;
          }
          os_unfair_lock_unlock(&sLockScreenCameraLaunchTelemetry);
        }
        if (v7)
        {
          if (!v8)
          {
            v13 = (void *)MEMORY[0x1A858DD40]();
            v14 = *(void **)(v6 + 56);
            v15 = mach_absolute_time();
            v16 = mach_continuous_time();
            FigCaptureSessionPrewarm(v14, v15, v16, CFSTR("FBSDisplayLayoutMonitor"));
            objc_autoreleasePoolPop(v13);
          }
        }
        captureSession_updateDeferredGraphSetupStartCondition(*(const void **)(a1 + 8), (_BYTE *)(v6 + 498), v7);
      }
    }
  }
}

- (void)_continuityDisplay:(uint64_t)a1 didUpdateLayout:(void *)a2
{
  char v3;
  const void *v4;
  _QWORD v5[5];
  char v6;

  if (a1)
  {
    v3 = objc_msgSend(a2, "isDisplayConnected");
    v4 = *(const void **)(a1 + 8);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __58__BWFigCaptureSession__continuityDisplay_didUpdateLayout___block_invoke;
    v5[3] = &unk_1E4922D50;
    v5[4] = a1;
    v6 = v3;
    captureSession_dispatchGraphCalloutToWorkerQueueAfter(v4, (uint64_t)v5, 0.0);
  }
}

uint64_t __58__BWFigCaptureSession__continuityDisplay_didUpdateLayout___block_invoke(uint64_t result, char a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    v2 = result;
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = *(_QWORD *)(result + 32);
    v4 = v3 ? *(void **)(v3 + 16) : 0;
    v5 = (void *)objc_msgSend(v4, "cameraSourcePipelines", (_QWORD)v9);
    result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (result)
    {
      v6 = result;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v5);
          -[FigCaptureCameraSourcePipeline setBlackenFramesForContinuityDisplayConnected:](*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), *(unsigned __int8 *)(v2 + 40));
        }
        while (v6 != v8);
        result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        v6 = result;
      }
      while (result);
    }
  }
  return result;
}

@end
