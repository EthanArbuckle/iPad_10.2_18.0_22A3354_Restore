@implementation JFXAnimojiPlaybackDelegate

- (JFXAnimojiPlaybackDelegate)initWithPlayableElement:(id)a3 sharedMediaDataReaderManager:(id)a4
{
  id v7;
  id v8;
  JFXAnimojiPlaybackDelegate *v9;
  JFXAnimojiPlaybackDelegate *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)JFXAnimojiPlaybackDelegate;
  v9 = -[JFXAnimojiPlaybackDelegate init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_playableElement, a3);
    objc_storeStrong((id *)&v10->_sharedMediaDataReaderManager, a4);
    -[JFXAnimojiPlaybackDelegate JFX_initPlaybackLoadingProperies](v10, "JFX_initPlaybackLoadingProperies");
    -[JFXAnimojiPlaybackDelegate JFX_initAnimojiRenderingProperies](v10, "JFX_initAnimojiRenderingProperies");
    -[JFXAnimojiPlaybackDelegate JFX_initMediaDataReaderProperties](v10, "JFX_initMediaDataReaderProperties");
    -[JFXAnimojiPlaybackDelegate JFX_initAnimojiImageBufferCachingProperties](v10, "JFX_initAnimojiImageBufferCachingProperties");
  }

  return v10;
}

- (void)setIsScrubbing:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;

  v3 = a3;
  JFXLog_DebugAnimojiPlayback();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[JFXAnimojiPlaybackDelegate setIsScrubbing:].cold.1(self, v3, v5);

  self->_isScrubbing = v3;
  -[JFXAnimojiPlaybackDelegate JFX_setMediaDataReaderScrubbingMode:](self, "JFX_setMediaDataReaderScrubbingMode:", v3);
}

- (void)loadWithUserContext:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  NSObject *v15;
  id v16;
  _QWORD block[5];
  id v18;
  BOOL v19;

  v4 = a3;
  JFXLog_DebugAnimojiPlayback();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[JFXAnimojiPlaybackDelegate loadWithUserContext:].cold.1(self);

  v6 = v4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("JFXAnimojiRendererMetadata_Effect"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[JFXAnimojiPlaybackDelegate playableElement](self, "playableElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "originalAnimojiDataRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[JFXAnimojiPlaybackDelegate playableElement](self, "playableElement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "originalAnimojiVersionNumber");

    if (objc_msgSend(v11, "isEqualToData:", v8))
      v14 = v13 == AVTAvatarKitVersionNumber();
    else
      v14 = 0;

  }
  else
  {
    v14 = 0;
  }
  -[JFXAnimojiPlaybackDelegate animojiRenderQueue](self, "animojiRenderQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__JFXAnimojiPlaybackDelegate_loadWithUserContext___block_invoke;
  block[3] = &unk_24EE5AC78;
  block[4] = self;
  v18 = v7;
  v19 = v14;
  v16 = v7;
  dispatch_async(v15, block);

  -[JFXAnimojiPlaybackDelegate JFX_loadResourcesForPlayback](self, "JFX_loadResourcesForPlayback");
}

uint64_t __50__JFXAnimojiPlaybackDelegate_loadWithUserContext___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAnimojiEffect:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setUseAnimojiBlendShapes:", *(unsigned __int8 *)(a1 + 48));
}

- (void)unloadWithUserContext:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  JFXLog_DebugAnimojiPlayback();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[JFXAnimojiPlaybackDelegate unloadWithUserContext:].cold.1(self);

  -[JFXAnimojiPlaybackDelegate JFX_requestUnloadResourcesForPlayback](self, "JFX_requestUnloadResourcesForPlayback");
}

- (id)preprocessWithInputs:(id)a3 time:(id *)a4 userContext:(id)a5 compositeContext:(id)a6
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  JFXAnimojiPlaybackPreprocessedData *v24;
  JFXAnimojiPlaybackPreprocessedData *v25;
  Float64 Seconds;
  CMTimeFlags v28;
  void *v29;
  void *v30;
  Float64 v31;
  void *v32;
  void *v33;
  CMTimeValue v34;
  uint64_t v35;
  CMTimeRange v36;
  CMTime duration;
  CMTime start;
  CMTime v39;
  CMTimeRange v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  JFXLog_DebugAnimojiPlayback();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_OWORD *)&v40.start.value = *(_OWORD *)&a4->var0;
    v40.start.epoch = a4->var3;
    Seconds = CMTimeGetSeconds(&v40.start);
    v28 = -[JFXAnimojiPlaybackDelegate isScrubbing](self, "isScrubbing");
    -[JFXAnimojiPlaybackDelegate playableElement](self, "playableElement");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "uuid");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v40.start.value) = 134218754;
    *(Float64 *)((char *)&v40.start.value + 4) = Seconds;
    LOWORD(v40.start.flags) = 1024;
    *(CMTimeFlags *)((char *)&v40.start.flags + 2) = v28;
    WORD1(v40.start.epoch) = 2112;
    *(CMTimeEpoch *)((char *)&v40.start.epoch + 4) = (CMTimeEpoch)v30;
    WORD2(v40.duration.value) = 2048;
    *(CMTimeValue *)((char *)&v40.duration.value + 6) = (CMTimeValue)v8;
    _os_log_debug_impl(&dword_2269A9000, v9, OS_LOG_TYPE_DEBUG, "preprocessWithInputs called for at time %f scrubMode %{BOOL}d for clip %@ userContext %p", (uint8_t *)&v40, 0x26u);

  }
  memset(&v39, 0, sizeof(v39));
  *(_OWORD *)&v40.start.value = *(_OWORD *)&a4->var0;
  v40.start.epoch = a4->var3;
  -[JFXAnimojiPlaybackDelegate jfx_mediaTimeFromPlaybackTime:](self, "jfx_mediaTimeFromPlaybackTime:", &v40);
  v10 = v8;
  memset(&v40, 0, 24);
  -[JFXAnimojiPlaybackDelegate JFX_cachedAnimojiImageForMediaTime:forAnimojiRenderingAttributes:](self, "JFX_cachedAnimojiImageForMediaTime:forAnimojiRenderingAttributes:", &v40, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    JFXLog_DebugAnimojiPlayback();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_OWORD *)&v40.start.value = *(_OWORD *)&a4->var0;
      v40.start.epoch = a4->var3;
      v31 = CMTimeGetSeconds(&v40.start);
      -[JFXAnimojiPlaybackDelegate playableElement](self, "playableElement");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "uuid");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v40.start = v39;
      *(double *)&v34 = CMTimeGetSeconds(&v40.start);
      LODWORD(v40.start.value) = 134218498;
      *(Float64 *)((char *)&v40.start.value + 4) = v31;
      LOWORD(v40.start.flags) = 2112;
      *(_QWORD *)((char *)&v40.start.flags + 2) = v33;
      HIWORD(v40.start.epoch) = 2048;
      v40.duration.value = v34;
      _os_log_debug_impl(&dword_2269A9000, v14, OS_LOG_TYPE_DEBUG, "reading ARData for animoji at time %f for clip %@ using media time %f", (uint8_t *)&v40, 0x20u);

    }
    v40.start = v39;
    -[JFXAnimojiPlaybackDelegate JFX_arMetadataReaderItemForMediaTime:](self, "JFX_arMetadataReaderItemForMediaTime:", &v40);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      objc_msgSend(v16, "arFrame");
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)v18;
        v20 = objc_msgSend(v17, "hasTrackedFace");

        if ((v20 & 1) != 0)
        {
          v40.start = v39;
          -[JFXAnimojiPlaybackDelegate JFX_avDepthDataFromDepthDataForMediaTime:](self, "JFX_avDepthDataFromDepthDataForMediaTime:", &v40);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "arFrame");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "animojiPhysicsBlendShapes");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = [JFXAnimojiPlaybackPreprocessedData alloc];
          objc_msgSend(v15, "timeRange");
          *(_OWORD *)&v40.start.value = *(_OWORD *)&a4->var0;
          v40.start.epoch = a4->var3;
          v13 = -[JFXAnimojiPlaybackPreprocessedData initForRenderTime:usingDataFromMediaTimeRange:arFrame:avDepthData:animojiBlendShapes:](v24, "initForRenderTime:usingDataFromMediaTimeRange:arFrame:avDepthData:animojiBlendShapes:", &v40, &v35, v22, v21, v23);

LABEL_14:
          goto LABEL_15;
        }
      }
      objc_msgSend(v15, "timeRange");
    }
    else
    {
      memset(&v40, 0, sizeof(v40));
      memset(&v36, 0, 24);
      CMTimeMake(&v36.start, 1, +[JFXMediaSettings frameRate](JFXMediaSettings, "frameRate"));
      start = v39;
      duration = v36.start;
      CMTimeRangeMake(&v40, &start, &duration);
    }
    v25 = [JFXAnimojiPlaybackPreprocessedData alloc];
    start = (CMTime)*a4;
    v36 = v40;
    v13 = -[JFXAnimojiPlaybackPreprocessedData initForRenderTime:usingDataFromMediaTimeRange:arFrame:avDepthData:animojiBlendShapes:](v25, "initForRenderTime:usingDataFromMediaTimeRange:arFrame:avDepthData:animojiBlendShapes:", &start, &v36, 0, 0, 0);
    goto LABEL_14;
  }
  v13 = v11;
LABEL_15:

  return v13;
}

- (id)renderWithInputs:(id)a3 time:(id *)a4 userContext:(id)a5 compositeContext:(id)a6
{
  id v9;
  id v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  JFXCachedAnimojiImage *v37;
  NSObject *v38;
  JFXCachedAnimojiImage *v39;
  NSObject *v40;
  Float64 v41;
  Float64 v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  int v47;
  dispatch_time_t v48;
  NSObject *v49;
  JFXCachedAnimojiImage *v50;
  Float64 Seconds;
  Float64 v53;
  void *v54;
  void *v55;
  Float64 v56;
  Float64 v57;
  void *v58;
  void *v59;
  Float64 v60;
  void *v61;
  void *v62;
  id v63;
  JFXCachedAnimojiImage *v64;
  void *v65;
  _QWORD block[5];
  id v67;
  id v68;
  _OWORD v69[3];
  _OWORD v70[5];
  CMTime time;
  Float64 v72;
  __int16 v73;
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  memset((char *)&v70[3] + 8, 0, 24);
  time = *(CMTime *)a4;
  v10 = a6;
  -[JFXAnimojiPlaybackDelegate jfx_mediaTimeFromPlaybackTime:](self, "jfx_mediaTimeFromPlaybackTime:", &time);
  objc_msgSend(v10, "preprocessData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v10, "preprocessData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((isKindOfClass & 1) != 0)
  {
    JFXLog_DebugAnimojiPlayback();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      time = (CMTime)*a4;
      Seconds = CMTimeGetSeconds(&time);
      time = *(CMTime *)((char *)&v70[3] + 8);
      v53 = CMTimeGetSeconds(&time);
      -[JFXAnimojiPlaybackDelegate playableElement](self, "playableElement");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "uuid");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.value) = 134218754;
      *(Float64 *)((char *)&time.value + 4) = Seconds;
      LOWORD(time.flags) = 2112;
      *(_QWORD *)((char *)&time.flags + 2) = v13;
      HIWORD(time.epoch) = 2048;
      v72 = v53;
      v73 = 2112;
      v74 = v55;
      _os_log_debug_impl(&dword_2269A9000, v14, OS_LOG_TYPE_DEBUG, "renderWithInputs called at time %f found cached animojiImage %@ for media time %f on clip %@", (uint8_t *)&time, 0x2Au);

    }
    objc_msgSend(v13, "animojiImageBuffer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = v9;
    objc_msgSend(v13, "arFrame");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v63 = v9;
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("JFXAnimojiRendererMetadata_Effect"));
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("JFXAnimojiRendererMetadata_UIInterfaceOrientation"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "integerValue");

      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("JFXAnimojiRendererMetadata_AVCaptureVideoOrientation"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "integerValue");

      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("JFXAnimojiRendererMetadata_RenderSize"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "CGSizeValue");
      v25 = v24;
      v27 = v26;

      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("JFXAnimojiRendererMetadata_BackgroundColor"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("JFXAnimojiRendererMetadata_AVCaptureVideoOrientation"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v64 = (JFXCachedAnimojiImage *)v18;
      if (!v28)
      {
        JFXLog_DebugAnimojiPlayback();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          -[JFXAnimojiPlaybackDelegate renderWithInputs:time:userContext:compositeContext:].cold.2(v29);

        v22 = 4;
      }
      objc_msgSend(v13, "arFrame");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "valueForKey:", CFSTR("worldAlignment"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "integerValue");

      if (v32 != 2)
      {
        JFXLog_DebugAnimojiPlayback();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          -[JFXAnimojiPlaybackDelegate renderWithInputs:time:userContext:compositeContext:].cold.1();

      }
      objc_msgSend(v13, "animojiBlendShapes");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arFrame");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "avDepthData");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      time = (CMTime)*a4;
      -[JFXAnimojiPlaybackDelegate JFX_renderAnimojiEffect:forTime:withARFrame:depthData:inputBufferSize:captureOrientation:interfaceOrientation:preRecordedBlendShapes:backgroundColor:](self, "JFX_renderAnimojiEffect:forTime:withARFrame:depthData:inputBufferSize:captureOrientation:interfaceOrientation:preRecordedBlendShapes:backgroundColor:", v64, &time, v35, v36, v22, v20, v25, v27, v34, v65);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v37 = [JFXCachedAnimojiImage alloc];
        if (v13)
          objc_msgSend(v13, "mediaTimeRangeForData");
        else
          memset(v69, 0, sizeof(v69));
        v40 = -[JFXCachedAnimojiImage initWithMediaTimeRange:animojiRenderingAttributes:animojiImageBuffer:](v37, "initWithMediaTimeRange:animojiRenderingAttributes:animojiImageBuffer:", v69, v16, v15);
        JFXLog_DebugAnimojiPlayback();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          time = (CMTime)*a4;
          v56 = CMTimeGetSeconds(&time);
          time = *(CMTime *)((char *)&v70[3] + 8);
          v57 = CMTimeGetSeconds(&time);
          -[JFXAnimojiPlaybackDelegate playableElement](self, "playableElement");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "uuid");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(time.value) = 134218754;
          *(Float64 *)((char *)&time.value + 4) = v56;
          LOWORD(time.flags) = 2048;
          *(Float64 *)((char *)&time.flags + 2) = v57;
          HIWORD(time.epoch) = 2112;
          v72 = *(double *)&v59;
          v73 = 2048;
          v74 = v16;
          _os_log_debug_impl(&dword_2269A9000, v45, OS_LOG_TYPE_DEBUG, "renderWithInputs called at time %f rendered animoji at media time %f for clip %@ userContext %p", (uint8_t *)&time, 0x2Au);

        }
        -[JFXAnimojiPlaybackDelegate JFX_cacheAnimojiImage:](self, "JFX_cacheAnimojiImage:", v40);
        -[JFXAnimojiPlaybackDelegate playableElement](self, "playableElement");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "isStill");

        if (v47)
        {
          objc_initWeak((id *)&time, self);
          v48 = dispatch_time(0, 100000000);
          dispatch_get_global_queue(17, 0);
          v49 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __81__JFXAnimojiPlaybackDelegate_renderWithInputs_time_userContext_compositeContext___block_invoke;
          block[3] = &unk_24EE5ACA0;
          objc_copyWeak(&v68, (id *)&time);
          block[4] = self;
          v67 = v16;
          dispatch_after(v48, v49, block);

          objc_destroyWeak(&v68);
          objc_destroyWeak((id *)&time);
        }
      }
      else
      {
        JFXLog_DebugAnimojiPlayback();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          time = (CMTime)*a4;
          v41 = CMTimeGetSeconds(&time);
          time = *(CMTime *)((char *)&v70[3] + 8);
          v42 = CMTimeGetSeconds(&time);
          -[JFXAnimojiPlaybackDelegate playableElement](self, "playableElement");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "uuid");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(time.value) = 134218754;
          *(Float64 *)((char *)&time.value + 4) = v41;
          LOWORD(time.flags) = 2048;
          *(Float64 *)((char *)&time.flags + 2) = v42;
          HIWORD(time.epoch) = 2112;
          v72 = *(double *)&v44;
          v73 = 2048;
          v74 = v16;
          _os_log_debug_impl(&dword_2269A9000, v40, OS_LOG_TYPE_DEBUG, "renderWithInputs called at time %f rendering failed for animoji at media time %f for clip %@ userContext %p", (uint8_t *)&time, 0x2Au);

        }
      }
      v50 = v64;

      v9 = v63;
    }
    else
    {
      JFXLog_DebugAnimojiPlayback();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        time = *(CMTime *)((char *)&v70[3] + 8);
        v60 = CMTimeGetSeconds(&time);
        -[JFXAnimojiPlaybackDelegate playableElement](self, "playableElement");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "uuid");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(time.value) = 134218242;
        *(Float64 *)((char *)&time.value + 4) = v60;
        LOWORD(time.flags) = 2112;
        *(_QWORD *)((char *)&time.flags + 2) = v62;
        _os_log_debug_impl(&dword_2269A9000, v38, OS_LOG_TYPE_DEBUG, "did not render animoji at media time %f for clip %@ because ARData with face is not available", (uint8_t *)&time, 0x16u);

      }
      v39 = [JFXCachedAnimojiImage alloc];
      if (v13)
        objc_msgSend(v13, "mediaTimeRangeForData");
      else
        memset(v70, 0, 48);
      v50 = -[JFXCachedAnimojiImage initWithMediaTimeRange:animojiRenderingAttributes:animojiImageBuffer:](v39, "initWithMediaTimeRange:animojiRenderingAttributes:animojiImageBuffer:", v70, v16, 0);
      -[JFXAnimojiPlaybackDelegate JFX_cacheAnimojiImage:](self, "JFX_cacheAnimojiImage:", v50);
      v15 = 0;
    }

  }
  return v15;
}

void __81__JFXAnimojiPlaybackDelegate_renderWithInputs_time_userContext_compositeContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    JFXLog_DebugAnimojiPlayback();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __81__JFXAnimojiPlaybackDelegate_renderWithInputs_time_userContext_compositeContext___block_invoke_cold_1(a1);

    objc_msgSend(*(id *)(a1 + 32), "JFX_unloadMediaDataReaders");
    objc_msgSend(*(id *)(a1 + 32), "JFX_unloadAnimojiRenderer");
  }

}

- (void)JFX_initPlaybackLoadingProperies
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *delayedUnloadPlaybackQueue;
  id v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.%@.delayedUnloadPlaybackQueue"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_retainAutorelease(v6);
  v7 = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v9, "UTF8String"), 0);
  delayedUnloadPlaybackQueue = self->_delayedUnloadPlaybackQueue;
  self->_delayedUnloadPlaybackQueue = v7;

}

- (void)JFX_loadResourcesForPlayback
{
  NSObject *v3;
  _QWORD block[5];

  -[JFXAnimojiPlaybackDelegate delayedUnloadPlaybackQueue](self, "delayedUnloadPlaybackQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__JFXAnimojiPlaybackDelegate_JFX_loadResourcesForPlayback__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_sync(v3, block);

  -[JFXAnimojiPlaybackDelegate JFX_loadMediaDataReaders](self, "JFX_loadMediaDataReaders");
  -[JFXAnimojiPlaybackDelegate JFX_loadAnimojiRenderer](self, "JFX_loadAnimojiRenderer");
}

void __58__JFXAnimojiPlaybackDelegate_JFX_loadResourcesForPlayback__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  NSObject *v3;

  v1 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "delayedUnloadPlaybackResourcesBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*v1, "setDelayedUnloadPlaybackResourcesBlock:", 0);
    JFXLog_DebugAnimojiPlayback();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __58__JFXAnimojiPlaybackDelegate_JFX_loadResourcesForPlayback__block_invoke_cold_1(v1);

    dispatch_block_cancel(v2);
  }

}

- (void)JFX_requestUnloadResourcesForPlayback
{
  void *v3;
  int v4;
  uint64_t v5;
  dispatch_block_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[5];
  id v12;
  id location;

  if (-[JFXAnimojiPlaybackDelegate isScrubbing](self, "isScrubbing")
    || (-[JFXAnimojiPlaybackDelegate playableElement](self, "playableElement"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isStill"),
        v3,
        v4))
  {
    objc_initWeak(&location, self);
    v5 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__JFXAnimojiPlaybackDelegate_JFX_requestUnloadResourcesForPlayback__block_invoke;
    block[3] = &unk_24EE59890;
    objc_copyWeak(&v12, &location);
    block[4] = self;
    v6 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
    -[JFXAnimojiPlaybackDelegate delayedUnloadPlaybackQueue](self, "delayedUnloadPlaybackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __67__JFXAnimojiPlaybackDelegate_JFX_requestUnloadResourcesForPlayback__block_invoke_61;
    v9[3] = &unk_24EE580A0;
    v9[4] = self;
    v10 = v6;
    v8 = v6;
    dispatch_sync(v7, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    -[JFXAnimojiPlaybackDelegate JFX_unloadResourcesForPlayback](self, "JFX_unloadResourcesForPlayback");
  }
}

void __67__JFXAnimojiPlaybackDelegate_JFX_requestUnloadResourcesForPlayback__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "delayedUnloadPlaybackQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__JFXAnimojiPlaybackDelegate_JFX_requestUnloadResourcesForPlayback__block_invoke_2;
    block[3] = &unk_24EE57B60;
    block[4] = WeakRetained;
    dispatch_sync(v3, block);

    JFXLog_DebugAnimojiPlayback();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __67__JFXAnimojiPlaybackDelegate_JFX_requestUnloadResourcesForPlayback__block_invoke_cold_1(WeakRetained);

    objc_msgSend(WeakRetained, "JFX_unloadResourcesForPlayback");
  }

}

uint64_t __67__JFXAnimojiPlaybackDelegate_JFX_requestUnloadResourcesForPlayback__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDelayedUnloadPlaybackResourcesBlock:", 0);
}

void __67__JFXAnimojiPlaybackDelegate_JFX_requestUnloadResourcesForPlayback__block_invoke_61(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  void *v6;
  NSObject *queue;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "delayedUnloadPlaybackResourcesBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    JFXLog_DebugAnimojiPlayback();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __67__JFXAnimojiPlaybackDelegate_JFX_requestUnloadResourcesForPlayback__block_invoke_61_cold_1(v2);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setDelayedUnloadPlaybackResourcesBlock:", *(_QWORD *)(a1 + 40));
    v5 = dispatch_time(0, 1000000000);
    dispatch_get_global_queue(21, 0);
    queue = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "delayedUnloadPlaybackResourcesBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_after(v5, queue, v6);

  }
}

- (void)JFX_unloadResourcesForPlayback
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "playableElement");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v3, v4, "unloaded resources for animoji playback for clip %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_2();
}

- (void)JFX_initAnimojiRenderingProperies
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *animojiRenderQueue;
  id v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.%@.renderQueue"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_retainAutorelease(v6);
  v7 = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v9, "UTF8String"), 0);
  animojiRenderQueue = self->_animojiRenderQueue;
  self->_animojiRenderQueue = v7;

}

- (void)JFX_loadAnimojiRenderer
{
  NSObject *v3;
  _QWORD block[5];

  -[JFXAnimojiPlaybackDelegate animojiRenderQueue](self, "animojiRenderQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__JFXAnimojiPlaybackDelegate_JFX_loadAnimojiRenderer__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(v3, block);

}

id __53__JFXAnimojiPlaybackDelegate_JFX_loadAnimojiRenderer__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "animojiRenderer");
}

- (JFXAnimojiEffectRenderer)animojiRenderer
{
  NSObject *v3;
  JFXAnimojiEffectRenderer *animojiRenderer;
  JFXAnimojiEffectRenderer *v5;
  JFXAnimojiEffectRenderer *v6;

  -[JFXAnimojiPlaybackDelegate animojiRenderQueue](self, "animojiRenderQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  animojiRenderer = self->_animojiRenderer;
  if (!animojiRenderer)
  {
    v5 = (JFXAnimojiEffectRenderer *)objc_opt_new();
    v6 = self->_animojiRenderer;
    self->_animojiRenderer = v5;

    animojiRenderer = self->_animojiRenderer;
  }
  return animojiRenderer;
}

- (void)setAnimojiRenderer:(id)a3
{
  JFXAnimojiEffectRenderer *v4;
  NSObject *v5;
  JFXAnimojiEffectRenderer *animojiRenderer;

  v4 = (JFXAnimojiEffectRenderer *)a3;
  -[JFXAnimojiPlaybackDelegate animojiRenderQueue](self, "animojiRenderQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  animojiRenderer = self->_animojiRenderer;
  self->_animojiRenderer = v4;

}

- (void)JFX_unloadAnimojiRenderer
{
  NSObject *v3;
  _QWORD block[5];

  -[JFXAnimojiPlaybackDelegate animojiRenderQueue](self, "animojiRenderQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__JFXAnimojiPlaybackDelegate_JFX_unloadAnimojiRenderer__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __55__JFXAnimojiPlaybackDelegate_JFX_unloadAnimojiRenderer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAnimojiRenderer:", 0);
}

- (id)JFX_renderAnimojiEffect:(id)a3 forTime:(id *)a4 withARFrame:(id)a5 depthData:(id)a6 inputBufferSize:(CGSize)a7 captureOrientation:(int64_t)a8 interfaceOrientation:(int64_t)a9 preRecordedBlendShapes:(id)a10 backgroundColor:(id)a11
{
  CGFloat height;
  CGFloat width;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD block[4];
  id v33;
  JFXAnimojiPlaybackDelegate *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t *v39;
  CGFloat v40;
  CGFloat v41;
  int64_t v42;
  int64_t v43;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  height = a7.height;
  width = a7.width;
  v18 = a3;
  v19 = a5;
  v20 = a6;
  v21 = a10;
  v22 = a11;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__19;
  v49 = __Block_byref_object_dispose__19;
  v50 = 0;
  -[JFXAnimojiPlaybackDelegate animojiRenderQueue](self, "animojiRenderQueue");
  v23 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __179__JFXAnimojiPlaybackDelegate_JFX_renderAnimojiEffect_forTime_withARFrame_depthData_inputBufferSize_captureOrientation_interfaceOrientation_preRecordedBlendShapes_backgroundColor___block_invoke;
  block[3] = &unk_24EE5ACC8;
  v44 = *a4;
  v33 = v18;
  v34 = self;
  v35 = v19;
  v36 = v20;
  v40 = width;
  v41 = height;
  v42 = a8;
  v43 = a9;
  v37 = v21;
  v38 = v22;
  v39 = &v45;
  v24 = v22;
  v25 = v21;
  v26 = v20;
  v27 = v19;
  v28 = v18;
  dispatch_sync(v23, block);

  v29 = (id)v46[5];
  _Block_object_dispose(&v45, 8);

  return v29;
}

void __179__JFXAnimojiPlaybackDelegate_JFX_renderAnimojiEffect_forTime_withARFrame_depthData_inputBufferSize_captureOrientation_interfaceOrientation_preRecordedBlendShapes_backgroundColor___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __CVBuffer *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  JFXLog_DebugAnimojiPlayback();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __179__JFXAnimojiPlaybackDelegate_JFX_renderAnimojiEffect_forTime_withARFrame_depthData_inputBufferSize_captureOrientation_interfaceOrientation_preRecordedBlendShapes_backgroundColor___block_invoke_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 40), "animojiRenderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setupInputBufferPoolForSize:", *(double *)(a1 + 88), *(double *)(a1 + 96));
  objc_msgSend(v3, "setAsynchronouslyLoadNewPuppets:", 0);
  objc_msgSend(v3, "setAllowAntialiasing:", 1);
  objc_msgSend(*(id *)(a1 + 40), "animojiEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    v12 = objc_msgSend(*(id *)(a1 + 40), "useAnimojiBlendShapes");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 104);
    v11 = *(_QWORD *)(a1 + 112);
    if (v12)
      v6 = *(_QWORD *)(a1 + 64);
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 104);
    v11 = *(_QWORD *)(a1 + 112);
  }
  v13 = objc_msgSend(v3, "newPixelBufferRenderedFromARFrame:withEffect:depthData:captureOrientation:interfaceOrientation:preRecordedBlendShapes:backgroundColor:", v8, v7, v9, v10, v11, v6, *(_QWORD *)(a1 + 72));
  if (v13)
  {
    v14 = (__CVBuffer *)v13;
    objc_msgSend(MEMORY[0x24BE79030], "imageWithCVPixelBuffer:", v13);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    CVPixelBufferRelease(v14);
  }

}

- (void)JFX_initAnimojiImageBufferCachingProperties
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const char *v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *cachedAnimojiImageQueue;
  id v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.%@.cachedAnimojiRenderedImageQueue"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_retainAutorelease(v6);
  v7 = (const char *)objc_msgSend(v10, "UTF8String");
  v8 = (OS_dispatch_queue *)dispatch_queue_create(v7, MEMORY[0x24BDAC9C0]);
  cachedAnimojiImageQueue = self->_cachedAnimojiImageQueue;
  self->_cachedAnimojiImageQueue = v8;

}

- (id)JFX_cachedAnimojiImageForMediaTime:(id *)a3 forAnimojiRenderingAttributes:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__19;
  v19 = __Block_byref_object_dispose__19;
  v20 = 0;
  -[JFXAnimojiPlaybackDelegate cachedAnimojiImageQueue](self, "cachedAnimojiImageQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __95__JFXAnimojiPlaybackDelegate_JFX_cachedAnimojiImageForMediaTime_forAnimojiRenderingAttributes___block_invoke;
  v11[3] = &unk_24EE5ACF0;
  v14 = *a3;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v8 = v6;
  dispatch_sync(v7, v11);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __95__JFXAnimojiPlaybackDelegate_JFX_cachedAnimojiImageForMediaTime_forAnimojiRenderingAttributes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CMTime v11;
  CMTimeRange range;

  objc_msgSend(*(id *)(a1 + 32), "cachedAnimojiImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "mediaTimeRange");
  else
    memset(&range, 0, sizeof(range));
  v11 = *(CMTime *)(a1 + 56);
  v4 = CMTimeRangeContainsTime(&range, &v11);

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedAnimojiImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animojiRenderAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToDictionary:", *(_QWORD *)(a1 + 40));

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "cachedAnimojiImage");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
  }
}

- (void)JFX_cacheAnimojiImage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[JFXAnimojiPlaybackDelegate cachedAnimojiImageQueue](self, "cachedAnimojiImageQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__JFXAnimojiPlaybackDelegate_JFX_cacheAnimojiImage___block_invoke;
  block[3] = &unk_24EE57AA8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

}

uint64_t __52__JFXAnimojiPlaybackDelegate_JFX_cacheAnimojiImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCachedAnimojiImage:", *(_QWORD *)(a1 + 40));
}

- (void)JFX_clearCachedAnimojiImages
{
  NSObject *v3;
  _QWORD block[5];

  -[JFXAnimojiPlaybackDelegate cachedAnimojiImageQueue](self, "cachedAnimojiImageQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__JFXAnimojiPlaybackDelegate_JFX_clearCachedAnimojiImages__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_barrier_sync(v3, block);

}

uint64_t __58__JFXAnimojiPlaybackDelegate_JFX_clearCachedAnimojiImages__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCachedAnimojiImage:", 0);
}

- (void)JFX_initMediaDataReaderProperties
{
  int32_t v3;
  void *v4;
  void *v5;
  int v6;
  $C2F727EE4C0F338CF71FC260D22EDBFE *p_playbackElementPlaybackMediaRange;
  __int128 v8;
  void *v9;
  void *v10;
  __int128 v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  OS_dispatch_queue *v17;
  OS_dispatch_queue *mediaDataReaderUpdateQueue;
  CMTime v19;
  CMTime v20;
  CMTime start;
  CMTime duration;
  CMTimeRange v23;

  self->_isScrubbing = 1;
  v3 = +[JFXMediaSettings timeScale](JFXMediaSettings, "timeScale");
  -[JFXAnimojiPlaybackDelegate playableElement](self, "playableElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeFromFrameTime(objc_msgSend(v4, "presentationTime"), v3, &v23.start);
  self->_playbackElementPlaybackPresentationOffset = ($95D729B680665BEAEFA1D6FCA8238556)v23.start;

  -[JFXAnimojiPlaybackDelegate playableElement](self, "playableElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isStill");

  p_playbackElementPlaybackMediaRange = &self->_playbackElementPlaybackMediaRange;
  if (v6)
  {
    CMTimeMake(&duration, 1, +[JFXMediaSettings frameRate](JFXMediaSettings, "frameRate"));
    start = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
    CMTimeRangeMake(&v23, &start, &duration);
    v8 = *(_OWORD *)&v23.start.epoch;
    *(_OWORD *)&p_playbackElementPlaybackMediaRange->start.value = *(_OWORD *)&v23.start.value;
    *(_OWORD *)&self->_playbackElementPlaybackMediaRange.start.epoch = v8;
    *(_OWORD *)&self->_playbackElementPlaybackMediaRange.duration.timescale = *(_OWORD *)&v23.duration.timescale;
  }
  else
  {
    -[JFXAnimojiPlaybackDelegate playableElement](self, "playableElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeFromFrameTime(objc_msgSend(v9, "mediaStartOffset"), v3, &v20);
    -[JFXAnimojiPlaybackDelegate playableElement](self, "playableElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeFromFrameTime(objc_msgSend(v10, "duration"), v3, &v19);
    CMTimeRangeMake(&v23, &v20, &v19);
    v11 = *(_OWORD *)&v23.start.epoch;
    *(_OWORD *)&p_playbackElementPlaybackMediaRange->start.value = *(_OWORD *)&v23.start.value;
    *(_OWORD *)&self->_playbackElementPlaybackMediaRange.start.epoch = v11;
    *(_OWORD *)&self->_playbackElementPlaybackMediaRange.duration.timescale = *(_OWORD *)&v23.duration.timescale;

  }
  v12 = (void *)MEMORY[0x24BDD17C8];
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.%@.mediaDataReaderQueue"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_retainAutorelease(v15);
  v17 = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v16, "UTF8String"), 0);
  mediaDataReaderUpdateQueue = self->_mediaDataReaderUpdateQueue;
  self->_mediaDataReaderUpdateQueue = v17;

}

- (void)JFX_loadMediaDataReaders
{
  NSObject *v3;
  _QWORD block[5];

  -[JFXAnimojiPlaybackDelegate mediaDataReaderUpdateQueue](self, "mediaDataReaderUpdateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__JFXAnimojiPlaybackDelegate_JFX_loadMediaDataReaders__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(v3, block);

}

id __54__JFXAnimojiPlaybackDelegate_JFX_loadMediaDataReaders__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "arMetadataReader");
  return (id)objc_msgSend(*(id *)(a1 + 32), "depthReader");
}

- (JFXDepthDataMediaReader)depthReader
{
  NSObject *v3;
  JFXDepthDataMediaReader *depthReader;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BYTE v13[48];

  -[JFXAnimojiPlaybackDelegate mediaDataReaderUpdateQueue](self, "mediaDataReaderUpdateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  depthReader = self->_depthReader;
  if (!depthReader)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    -[JFXAnimojiPlaybackDelegate playableElement](self, "playableElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("animojiPlaybackDepthReader"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[JFXMediaDataReaderFactory sharedInstance](JFXMediaDataReaderFactory, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAnimojiPlaybackDelegate playableElement](self, "playableElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createDepthDataReaderWithCreationAttributesProvider:name:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "setIsScrubbing:", -[JFXAnimojiPlaybackDelegate isScrubbing](self, "isScrubbing"));
      -[JFXAnimojiPlaybackDelegate playbackElementPlaybackMediaRange](self, "playbackElementPlaybackMediaRange");
      objc_msgSend(v11, "beginReadingAtTimeRange:", v13);
      objc_storeStrong((id *)&self->_depthReader, v11);
    }

    depthReader = self->_depthReader;
  }
  return depthReader;
}

- (void)setDepthReader:(id)a3
{
  NSObject *v4;
  JFXDepthDataMediaReader *depthReader;

  -[JFXAnimojiPlaybackDelegate mediaDataReaderUpdateQueue](self, "mediaDataReaderUpdateQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  depthReader = self->_depthReader;
  self->_depthReader = 0;

}

- (JFXARMetadataMediaReader)arMetadataReader
{
  NSObject *v3;
  JFXARMetadataMediaReader *arMetadataReader;
  void *v5;
  void *v6;
  uint64_t v8;

  -[JFXAnimojiPlaybackDelegate mediaDataReaderUpdateQueue](self, "mediaDataReaderUpdateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  arMetadataReader = self->_arMetadataReader;
  if (!arMetadataReader)
  {
    -[JFXAnimojiPlaybackDelegate sharedMediaDataReaderManager](self, "sharedMediaDataReaderManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sharedARMetadataReader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "setIsScrubbing:", -[JFXAnimojiPlaybackDelegate isScrubbing](self, "isScrubbing"));
      -[JFXAnimojiPlaybackDelegate playbackElementPlaybackMediaRange](self, "playbackElementPlaybackMediaRange");
      objc_msgSend(v6, "beginReadingAtTimeRange:", &v8);
      objc_storeStrong((id *)&self->_arMetadataReader, v6);
    }

    arMetadataReader = self->_arMetadataReader;
  }
  return arMetadataReader;
}

- (void)setArMetadataReader:(id)a3
{
  NSObject *v4;
  JFXARMetadataMediaReader *arMetadataReader;

  -[JFXAnimojiPlaybackDelegate mediaDataReaderUpdateQueue](self, "mediaDataReaderUpdateQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  arMetadataReader = self->_arMetadataReader;
  self->_arMetadataReader = 0;

}

- (id)JFX_arMetadataReaderItemForMediaTime:(id *)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[6];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__19;
  v14 = __Block_byref_object_dispose__19;
  v15 = 0;
  -[JFXAnimojiPlaybackDelegate mediaDataReaderUpdateQueue](self, "mediaDataReaderUpdateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__JFXAnimojiPlaybackDelegate_JFX_arMetadataReaderItemForMediaTime___block_invoke;
  block[3] = &unk_24EE57C70;
  block[4] = self;
  block[5] = &v10;
  v9 = *a3;
  dispatch_sync(v5, block);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __67__JFXAnimojiPlaybackDelegate_JFX_arMetadataReaderItemForMediaTime___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "arMetadataReader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v2, "arMetadataItemForTime:", &v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)JFX_avDepthDataFromDepthDataForMediaTime:(id *)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[6];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__19;
  v14 = __Block_byref_object_dispose__19;
  v15 = 0;
  -[JFXAnimojiPlaybackDelegate mediaDataReaderUpdateQueue](self, "mediaDataReaderUpdateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__JFXAnimojiPlaybackDelegate_JFX_avDepthDataFromDepthDataForMediaTime___block_invoke;
  block[3] = &unk_24EE57F48;
  v9 = *a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(v5, block);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __71__JFXAnimojiPlaybackDelegate_JFX_avDepthDataFromDepthDataForMediaTime___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "depthReader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v2, "depthDataForTime:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "avDepthData");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)JFX_setMediaDataReaderScrubbingMode:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[JFXAnimojiPlaybackDelegate mediaDataReaderUpdateQueue](self, "mediaDataReaderUpdateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__JFXAnimojiPlaybackDelegate_JFX_setMediaDataReaderScrubbingMode___block_invoke;
  v6[3] = &unk_24EE57C98;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __66__JFXAnimojiPlaybackDelegate_JFX_setMediaDataReaderScrubbingMode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "arMetadataReader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsScrubbing:", v2);

  v4 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "depthReader");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsScrubbing:", v4);

}

- (void)JFX_unloadMediaDataReaders
{
  NSObject *v3;
  _QWORD block[5];

  -[JFXAnimojiPlaybackDelegate mediaDataReaderUpdateQueue](self, "mediaDataReaderUpdateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__JFXAnimojiPlaybackDelegate_JFX_unloadMediaDataReaders__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __56__JFXAnimojiPlaybackDelegate_JFX_unloadMediaDataReaders__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setArMetadataReader:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setDepthReader:", 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)jfx_mediaTimeFromPlaybackTime:(SEL)a3
{
  void *v7;
  int v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  uint64_t v10;
  CMTime v11;
  CMTime v12;
  CMTime lhs;
  CMTime rhs;
  CMTime v15;

  -[JFXAnimojiPlaybackDelegate playableElement](self, "playableElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isStill");

  if (v8)
  {
    v10 = MEMORY[0x24BDC0D88];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x24BDC0D88];
    retstr->var3 = *(_QWORD *)(v10 + 16);
  }
  else
  {
    memset(&v15, 0, sizeof(v15));
    -[JFXAnimojiPlaybackDelegate playbackElementPlaybackPresentationOffset](self, "playbackElementPlaybackPresentationOffset");
    lhs = (CMTime)*a4;
    CMTimeSubtract(&v15, &lhs, &rhs);
    -[JFXAnimojiPlaybackDelegate playbackElementPlaybackMediaRange](self, "playbackElementPlaybackMediaRange");
    v12 = v11;
    lhs = v15;
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeAdd((CMTime *)retstr, &lhs, &v12);
  }
  return result;
}

- (BOOL)isScrubbing
{
  return self->_isScrubbing;
}

- (OS_dispatch_queue)mediaDataReaderUpdateQueue
{
  return self->_mediaDataReaderUpdateQueue;
}

- (JFXSharedMediaDataReaderManager)sharedMediaDataReaderManager
{
  return self->_sharedMediaDataReaderManager;
}

- (void)setSharedMediaDataReaderManager:(id)a3
{
  objc_storeStrong((id *)&self->_sharedMediaDataReaderManager, a3);
}

- (OS_dispatch_queue)animojiRenderQueue
{
  return self->_animojiRenderQueue;
}

- (JFXAnimojiEffect)animojiEffect
{
  return self->_animojiEffect;
}

- (void)setAnimojiEffect:(id)a3
{
  objc_storeStrong((id *)&self->_animojiEffect, a3);
}

- (BOOL)useAnimojiBlendShapes
{
  return self->_useAnimojiBlendShapes;
}

- (void)setUseAnimojiBlendShapes:(BOOL)a3
{
  self->_useAnimojiBlendShapes = a3;
}

- (JFXPlayableElement)playableElement
{
  return self->_playableElement;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackElementPlaybackPresentationOffset
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 112);
  return self;
}

- ($70930193D4F448A53BB9343C0237EB5F)playbackElementPlaybackMediaRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var1.var0;
  return self;
}

- (OS_dispatch_queue)delayedUnloadPlaybackQueue
{
  return self->_delayedUnloadPlaybackQueue;
}

- (id)delayedUnloadPlaybackResourcesBlock
{
  return self->_delayedUnloadPlaybackResourcesBlock;
}

- (void)setDelayedUnloadPlaybackResourcesBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (OS_dispatch_queue)cachedAnimojiImageQueue
{
  return self->_cachedAnimojiImageQueue;
}

- (JFXCachedAnimojiImage)cachedAnimojiImage
{
  return self->_cachedAnimojiImage;
}

- (void)setCachedAnimojiImage:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAnimojiImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAnimojiImage, 0);
  objc_storeStrong((id *)&self->_cachedAnimojiImageQueue, 0);
  objc_storeStrong(&self->_delayedUnloadPlaybackResourcesBlock, 0);
  objc_storeStrong((id *)&self->_delayedUnloadPlaybackQueue, 0);
  objc_storeStrong((id *)&self->_playableElement, 0);
  objc_storeStrong((id *)&self->_animojiEffect, 0);
  objc_storeStrong((id *)&self->_animojiRenderQueue, 0);
  objc_storeStrong((id *)&self->_sharedMediaDataReaderManager, 0);
  objc_storeStrong((id *)&self->_mediaDataReaderUpdateQueue, 0);
  objc_storeStrong((id *)&self->_arMetadataReader, 0);
  objc_storeStrong((id *)&self->_depthReader, 0);
  objc_storeStrong((id *)&self->_animojiRenderer, 0);
}

- (void)setIsScrubbing:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  int v6;
  uint8_t v7[12];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "playableElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v8 = 1024;
  v9 = v6;
  _os_log_debug_impl(&dword_2269A9000, a3, OS_LOG_TYPE_DEBUG, "clip %@ scrubMode set to %{BOOL}d", v7, 0x12u);

  OUTLINED_FUNCTION_1_2();
}

- (void)loadWithUserContext:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "playableElement");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_4(&dword_2269A9000, v3, v4, "loadWithUserContext called on clip %@ userContext %p", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_2();
}

- (void)unloadWithUserContext:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "playableElement");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_4(&dword_2269A9000, v3, v4, "unloadWithUserContext called on clip %@ userContext %p", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_2();
}

- (void)renderWithInputs:time:userContext:compositeContext:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
}

- (void)renderWithInputs:(os_log_t)log time:userContext:compositeContext:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2269A9000, log, OS_LOG_TYPE_DEBUG, "missing JFXAnimojiRendererMetadata_AVCaptureVideoOrientation metadata", v1, 2u);
}

void __81__JFXAnimojiPlaybackDelegate_renderWithInputs_time_userContext_compositeContext___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*(id *)(a1 + 32), "playableElement");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_4(&dword_2269A9000, v3, v4, "unload rendering resources for clip %@ userContext %p because they are longer neeed for still", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_2();
}

void __58__JFXAnimojiPlaybackDelegate_JFX_loadResourcesForPlayback__block_invoke_cold_1(id *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*a1, "playableElement");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v3, v4, "cancel delayed unload for clip %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_2();
}

void __67__JFXAnimojiPlaybackDelegate_JFX_requestUnloadResourcesForPlayback__block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "playableElement");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v3, v4, "performing delayed unloading of resources for animoji playback for clip %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_2();
}

void __67__JFXAnimojiPlaybackDelegate_JFX_requestUnloadResourcesForPlayback__block_invoke_61_cold_1(id *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*a1, "playableElement");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v3, v4, "ignored delayed unload request for clip because already pending  %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_2();
}

void __179__JFXAnimojiPlaybackDelegate_JFX_renderAnimojiEffect_forTime_withARFrame_depthData_inputBufferSize_captureOrientation_interfaceOrientation_preRecordedBlendShapes_backgroundColor___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  CMTimeValue v4;
  Float64 Seconds;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  CMTime v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  v10 = *(CMTime *)(a1 + 120);
  Seconds = CMTimeGetSeconds(&v10);
  objc_msgSend(*(id *)(a1 + 40), "playableElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  LODWORD(v10.value) = 138413314;
  *(CMTimeValue *)((char *)&v10.value + 4) = v4;
  LOWORD(v10.flags) = 2048;
  *(Float64 *)((char *)&v10.flags + 2) = Seconds;
  HIWORD(v10.epoch) = 2112;
  v11 = v7;
  v12 = 2112;
  v13 = v8;
  v14 = 2112;
  v15 = v9;
  _os_log_debug_impl(&dword_2269A9000, a2, OS_LOG_TYPE_DEBUG, "rendering animoji %@ for time %f for clip %@ with ARFrame %@ and avDepthData %@", (uint8_t *)&v10, 0x34u);

}

@end
