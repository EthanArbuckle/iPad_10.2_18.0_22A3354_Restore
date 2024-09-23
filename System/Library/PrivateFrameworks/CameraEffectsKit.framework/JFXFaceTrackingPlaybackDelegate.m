@implementation JFXFaceTrackingPlaybackDelegate

- (JFXFaceTrackingPlaybackDelegate)initWithPlayableElement:(id)a3 sharedMediaDataReaderManager:(id)a4 outputSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  JFXFaceTrackingPlaybackDelegate *v12;
  JFXFaceTrackingPlaybackDelegate *v13;
  objc_super v15;

  height = a5.height;
  width = a5.width;
  v10 = a3;
  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)JFXFaceTrackingPlaybackDelegate;
  v12 = -[JFXFaceTrackingPlaybackDelegate init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_playableElement, a3);
    objc_storeStrong((id *)&v13->_sharedMediaDataReaderManager, a4);
    v13->_outputSize.width = width;
    v13->_outputSize.height = height;
    -[JFXFaceTrackingPlaybackDelegate JFX_initMetadataReadingProperties](v13, "JFX_initMetadataReadingProperties");
    -[JFXFaceTrackingPlaybackDelegate JFX_initFaceTrackingCachingProperties](v13, "JFX_initFaceTrackingCachingProperties");
  }

  return v13;
}

- (void)JFX_initFaceTrackingCachingProperties
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const char *v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *cachedFaceTrackingPropertiesQueue;
  id v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.%@.cachedFaceTrackingPropertiesQueue"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_retainAutorelease(v6);
  v7 = (const char *)objc_msgSend(v10, "UTF8String");
  v8 = (OS_dispatch_queue *)dispatch_queue_create(v7, MEMORY[0x24BDAC9C0]);
  cachedFaceTrackingPropertiesQueue = self->_cachedFaceTrackingPropertiesQueue;
  self->_cachedFaceTrackingPropertiesQueue = v8;

}

- (id)JFX_cachedFaceTrackingPropertiesForMediaTime:(id *)a3 forDisplayingMediaAtInterfaceOrientation:(int64_t)a4
{
  NSObject *v7;
  id v8;
  _QWORD v10[7];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  -[JFXFaceTrackingPlaybackDelegate cachedFaceTrackingPropertiesQueue](self, "cachedFaceTrackingPropertiesQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __121__JFXFaceTrackingPlaybackDelegate_JFX_cachedFaceTrackingPropertiesForMediaTime_forDisplayingMediaAtInterfaceOrientation___block_invoke;
  v10[3] = &unk_24EE57C48;
  v11 = *a3;
  v10[5] = &v12;
  v10[6] = a4;
  v10[4] = self;
  dispatch_sync(v7, v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __121__JFXFaceTrackingPlaybackDelegate_JFX_cachedFaceTrackingPropertiesForMediaTime_forDisplayingMediaAtInterfaceOrientation___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "cachedFaceTrackingProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  v8 = *(_OWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 72);
  v4 = objc_msgSend(v2, "containsMediaTime:forDisplayingMediaAtInterfaceOrientation:", &v8, v3);

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedFaceTrackingProperties");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (void)JFX_cacheFaceTrackingProperties:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[JFXFaceTrackingPlaybackDelegate cachedFaceTrackingPropertiesQueue](self, "cachedFaceTrackingPropertiesQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__JFXFaceTrackingPlaybackDelegate_JFX_cacheFaceTrackingProperties___block_invoke;
  block[3] = &unk_24EE57AA8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

}

uint64_t __67__JFXFaceTrackingPlaybackDelegate_JFX_cacheFaceTrackingProperties___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCachedFaceTrackingProperties:", *(_QWORD *)(a1 + 40));
}

- (void)JFX_initMetadataReadingProperties
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
  -[JFXFaceTrackingPlaybackDelegate playableElement](self, "playableElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeFromFrameTime(objc_msgSend(v4, "presentationTime"), v3, &v23.start);
  self->_playbackElementPlaybackPresentationOffset = ($95D729B680665BEAEFA1D6FCA8238556)v23.start;

  -[JFXFaceTrackingPlaybackDelegate playableElement](self, "playableElement");
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
    -[JFXFaceTrackingPlaybackDelegate playableElement](self, "playableElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeFromFrameTime(objc_msgSend(v9, "mediaStartOffset"), v3, &v20);
    -[JFXFaceTrackingPlaybackDelegate playableElement](self, "playableElement");
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

  -[JFXFaceTrackingPlaybackDelegate mediaDataReaderUpdateQueue](self, "mediaDataReaderUpdateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__JFXFaceTrackingPlaybackDelegate_JFX_loadMediaDataReaders__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(v3, block);

}

id __59__JFXFaceTrackingPlaybackDelegate_JFX_loadMediaDataReaders__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "arMetadataReader");
}

- (id)JFX_arMetadataForMediaTime:(id *)a3 foundTimeRange:(id *)a4
{
  NSObject *v7;
  void *v8;
  uint64_t *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD block[6];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v22 = 0;
  -[JFXFaceTrackingPlaybackDelegate mediaDataReaderUpdateQueue](self, "mediaDataReaderUpdateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__JFXFaceTrackingPlaybackDelegate_JFX_arMetadataForMediaTime_foundTimeRange___block_invoke;
  block[3] = &unk_24EE57C70;
  block[4] = self;
  block[5] = &v17;
  v16 = *a3;
  dispatch_sync(v7, block);

  v8 = (void *)v18[5];
  if (v8)
  {
    if (a4)
    {
      objc_msgSend(v8, "timeRange");
      v9 = v18;
      *(_OWORD *)&a4->var0.var0 = v12;
      *(_OWORD *)&a4->var0.var3 = v13;
      *(_OWORD *)&a4->var1.var1 = v14;
      v8 = (void *)v9[5];
    }
    objc_msgSend(v8, "arMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v17, 8);

  return v10;
}

void __77__JFXFaceTrackingPlaybackDelegate_JFX_arMetadataForMediaTime_foundTimeRange___block_invoke(uint64_t a1)
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

- (void)JFX_setMediaDataReaderScrubbingMode:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[JFXFaceTrackingPlaybackDelegate mediaDataReaderUpdateQueue](self, "mediaDataReaderUpdateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__JFXFaceTrackingPlaybackDelegate_JFX_setMediaDataReaderScrubbingMode___block_invoke;
  v6[3] = &unk_24EE57C98;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __71__JFXFaceTrackingPlaybackDelegate_JFX_setMediaDataReaderScrubbingMode___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "arMetadataReader");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsScrubbing:", v1);

}

- (JFXARMetadataMediaReader)arMetadataReader
{
  NSObject *v3;
  JFXARMetadataMediaReader *arMetadataReader;
  void *v5;
  void *v6;
  uint64_t v8;

  -[JFXFaceTrackingPlaybackDelegate mediaDataReaderUpdateQueue](self, "mediaDataReaderUpdateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  arMetadataReader = self->_arMetadataReader;
  if (!arMetadataReader)
  {
    -[JFXFaceTrackingPlaybackDelegate sharedMediaDataReaderManager](self, "sharedMediaDataReaderManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sharedARMetadataReader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "setIsScrubbing:", -[JFXFaceTrackingPlaybackDelegate isScrubbing](self, "isScrubbing"));
      -[JFXFaceTrackingPlaybackDelegate playbackElementPlaybackMediaRange](self, "playbackElementPlaybackMediaRange");
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

  -[JFXFaceTrackingPlaybackDelegate mediaDataReaderUpdateQueue](self, "mediaDataReaderUpdateQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  arMetadataReader = self->_arMetadataReader;
  self->_arMetadataReader = 0;

}

- (void)JFX_unloadMediaDataReaders
{
  NSObject *v3;
  _QWORD block[5];

  -[JFXFaceTrackingPlaybackDelegate mediaDataReaderUpdateQueue](self, "mediaDataReaderUpdateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__JFXFaceTrackingPlaybackDelegate_JFX_unloadMediaDataReaders__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __61__JFXFaceTrackingPlaybackDelegate_JFX_unloadMediaDataReaders__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setArMetadataReader:", 0);
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

  -[JFXFaceTrackingPlaybackDelegate playableElement](self, "playableElement");
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
    -[JFXFaceTrackingPlaybackDelegate playbackElementPlaybackPresentationOffset](self, "playbackElementPlaybackPresentationOffset");
    lhs = (CMTime)*a4;
    CMTimeSubtract(&v15, &lhs, &rhs);
    -[JFXFaceTrackingPlaybackDelegate playbackElementPlaybackMediaRange](self, "playbackElementPlaybackMediaRange");
    v12 = v11;
    lhs = v15;
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeAdd((CMTime *)retstr, &lhs, &v12);
  }
  return result;
}

- (void)effect:(id)a3 willStartRequestingTimedProperties:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  JFXLog_DebugFaceTrackingPlayback();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[JFXFaceTrackingPlaybackDelegate playableElement](self, "playableElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218498;
    v12 = v6;
    v13 = 2112;
    v14 = v10;
    v15 = 2048;
    v16 = v7;
    _os_log_debug_impl(&dword_2269A9000, v8, OS_LOG_TYPE_DEBUG, "willStartRequestingTimedProperties for PVEffect %p on clip %@ userContext %p", (uint8_t *)&v11, 0x20u);

  }
  -[JFXFaceTrackingPlaybackDelegate JFX_loadMediaDataReaders](self, "JFX_loadMediaDataReaders");

}

- (void)effect:(id)a3 didStopRequestingTimedProperties:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  JFXLog_DebugFaceTrackingPlayback();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[JFXFaceTrackingPlaybackDelegate playableElement](self, "playableElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218498;
    v12 = v6;
    v13 = 2112;
    v14 = v10;
    v15 = 2048;
    v16 = v7;
    _os_log_debug_impl(&dword_2269A9000, v8, OS_LOG_TYPE_DEBUG, "didStopRequestingTimedProperties called for PVEffect %p on clip %@ userContext %p", (uint8_t *)&v11, 0x20u);

  }
  -[JFXFaceTrackingPlaybackDelegate JFX_unloadMediaDataReaders](self, "JFX_unloadMediaDataReaders");

}

- (id)effect:(id)a3 timedPropertiesForGroup:(id)a4 time:(id *)a5 userContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  Float64 Seconds;
  _BOOL4 v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  CMTime time;
  _BOOL4 v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  JFXLog_DebugFaceTrackingPlayback();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    time = (CMTime)*a5;
    Seconds = CMTimeGetSeconds(&time);
    v27 = -[JFXFaceTrackingPlaybackDelegate isScrubbing](self, "isScrubbing");
    -[JFXFaceTrackingPlaybackDelegate playableElement](self, "playableElement");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "uuid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138413570;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v11;
    LOWORD(time.flags) = 2048;
    *(Float64 *)((char *)&time.flags + 2) = Seconds;
    HIWORD(time.epoch) = 1024;
    v33 = v27;
    v34 = 2048;
    v35 = v10;
    v36 = 2112;
    v37 = v29;
    v38 = 2048;
    v39 = v12;
    _os_log_debug_impl(&dword_2269A9000, v13, OS_LOG_TYPE_DEBUG, "timedPropertiesForGroup called for group %@ at time %f scrubMode %{BOOL}d on PVEffect %p on clip %@ userContext %p", (uint8_t *)&time, 0x3Au);

  }
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("faceTracking")) & 1) == 0)
  {
    JFXLog_DebugFaceTrackingPlayback();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[JFXFaceTrackingPlaybackDelegate effect:timedPropertiesForGroup:time:userContext:].cold.1((uint64_t)v11, v15);
    goto LABEL_10;
  }
  v14 = v12;
  v15 = v14;
  if (!v14)
  {
LABEL_10:
    v24 = 0;
    goto LABEL_15;
  }
  -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("JFXFaceTrackingKey_InterfaceOrientation"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "integerValue");

  -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("JFXFaceTrackingKey_TrackingType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "integerValue");
  if (v19)
  {
    v20 = v19;
    time = (CMTime)*a5;
    -[JFXFaceTrackingPlaybackDelegate faceTrackingTransformAtTime:forDisplayingMediaAtInterfaceOrientation:](self, "faceTrackingTransformAtTime:forDisplayingMediaAtInterfaceOrientation:", &time, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "effectParametersForTrackingType:", v20);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = *MEMORY[0x24BE795F0];
      v31 = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    v24 = (void *)v23;

  }
  else
  {
    v24 = 0;
  }

LABEL_15:
  return v24;
}

- (id)supportedTimedPropertyGroupsForEffect:(id)a3
{
  if (supportedTimedPropertyGroupsForEffect__onceToken != -1)
    dispatch_once(&supportedTimedPropertyGroupsForEffect__onceToken, &__block_literal_global_1);
  return (id)supportedTimedPropertyGroupsForEffect__s_timedProperties;
}

void __73__JFXFaceTrackingPlaybackDelegate_supportedTimedPropertyGroupsForEffect___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("faceTracking");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)supportedTimedPropertyGroupsForEffect__s_timedProperties;
  supportedTimedPropertyGroupsForEffect__s_timedProperties = v0;

}

- (void)setIsScrubbing:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;

  v3 = a3;
  JFXLog_DebugFaceTrackingPlayback();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[JFXFaceTrackingPlaybackDelegate setIsScrubbing:].cold.1(self, v3, v5);

  self->_isScrubbing = v3;
  -[JFXFaceTrackingPlaybackDelegate JFX_setMediaDataReaderScrubbingMode:](self, "JFX_setMediaDataReaderScrubbingMode:", v3);
}

- (id)faceTrackingTransformAtTime:(id *)a3 forDisplayingMediaAtInterfaceOrientation:(int64_t)a4
{
  void *v4;
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v7 = *a3;
  -[JFXFaceTrackingPlaybackDelegate JFX_faceTrackingPlaybackPropertiesAtTime:forDisplayingMediaAtInterfaceOrientation:](self, "JFX_faceTrackingPlaybackPropertiesAtTime:forDisplayingMediaAtInterfaceOrientation:", &v7, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "faceTrackingTransform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)arDataAtTime:(id *)a3 forDisplayingMediaAtInterfaceOrientation:(int64_t)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  Float64 Seconds;
  void *v12;
  void *v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  JFXLog_DebugFaceTrackingPlayback();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v14 = *a3;
    Seconds = CMTimeGetSeconds((CMTime *)&v14);
    -[JFXFaceTrackingPlaybackDelegate playableElement](self, "playableElement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14.var0) = 134218242;
    *(Float64 *)((char *)&v14.var0 + 4) = Seconds;
    LOWORD(v14.var2) = 2112;
    *(_QWORD *)((char *)&v14.var2 + 2) = v13;
    _os_log_debug_impl(&dword_2269A9000, v7, OS_LOG_TYPE_DEBUG, "arMetadata requested for time %f on clip %@", (uint8_t *)&v14, 0x16u);

  }
  v14 = *a3;
  -[JFXFaceTrackingPlaybackDelegate JFX_faceTrackingPlaybackPropertiesAtTime:forDisplayingMediaAtInterfaceOrientation:](self, "JFX_faceTrackingPlaybackPropertiesAtTime:forDisplayingMediaAtInterfaceOrientation:", &v14, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)JFX_faceTrackingPlaybackPropertiesAtTime:(id *)a3 forDisplayingMediaAtInterfaceOrientation:(int64_t)a4
{
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  JFXFaceTrackingPlaybackProperties *v11;
  void *v12;
  void *v13;
  JFXPlayableElement *playableElement;
  double v15;
  double v16;
  JFXFaceTrackingTransformCalculator *v17;
  void *v18;
  JFXFaceTrackingPlaybackProperties *v19;
  NSObject *v20;
  JFXFaceTrackingPlaybackProperties *v21;
  CMTimeRange *v22;
  JFXFaceTrackingPlaybackProperties *v23;
  NSObject *v24;
  Float64 v26;
  int v27;
  void *v28;
  void *v29;
  Float64 v30;
  void *v31;
  void *v32;
  Float64 Seconds;
  void *v34;
  void *v35;
  CMTime v36;
  CMTimeRange v37;
  __int128 v38;
  uint64_t v39;
  _BYTE start[32];
  __int128 v41;
  _BYTE time[32];
  __int128 v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v38 = 0uLL;
  v39 = 0;
  *($3CC8671D27C23BF42ADDB32F2B5E48AE *)time = *a3;
  -[JFXFaceTrackingPlaybackDelegate jfx_mediaTimeFromPlaybackTime:](self, "jfx_mediaTimeFromPlaybackTime:", time);
  memset(time, 0, 24);
  -[JFXFaceTrackingPlaybackDelegate JFX_cachedFaceTrackingPropertiesForMediaTime:forDisplayingMediaAtInterfaceOrientation:](self, "JFX_cachedFaceTrackingPropertiesForMediaTime:forDisplayingMediaAtInterfaceOrientation:", time, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v43 = 0u;
    memset(time, 0, sizeof(time));
    *(_OWORD *)start = v38;
    *(_QWORD *)&start[16] = v39;
    -[JFXFaceTrackingPlaybackDelegate JFX_arMetadataForMediaTime:foundTimeRange:](self, "JFX_arMetadataForMediaTime:foundTimeRange:", start, time);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if ((objc_msgSend(v12, "hasTrackedFace") & 1) != 0)
      {
        playableElement = self->_playableElement;
        -[JFXFaceTrackingPlaybackDelegate outputSize](self, "outputSize");
        -[JFXPlayableElement playableRectInOutputSize:](playableElement, "playableRectInOutputSize:");
        v17 = -[JFXFaceTrackingTransformCalculator initWithARMetaData:outputSize:playableInterfaceOrientation:]([JFXFaceTrackingTransformCalculator alloc], "initWithARMetaData:outputSize:playableInterfaceOrientation:", v13, a4, v15, v16);
        -[JFXFaceTrackingTransformCalculator calculateFaceTrackingTransform](v17, "calculateFaceTrackingTransform");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = [JFXFaceTrackingPlaybackProperties alloc];
        *(_OWORD *)start = *(_OWORD *)time;
        *(_OWORD *)&start[16] = *(_OWORD *)&time[16];
        v41 = v43;
        v11 = -[JFXFaceTrackingPlaybackProperties initWithFaceTrackableMediaTimeRange:forDisplayingMediaAtInterfaceOrientation:faceTrackingTransform:arMetadata:](v19, "initWithFaceTrackableMediaTimeRange:forDisplayingMediaAtInterfaceOrientation:faceTrackingTransform:arMetadata:", start, a4, v18, v13);

LABEL_17:
        -[JFXFaceTrackingPlaybackDelegate JFX_cacheFaceTrackingProperties:](self, "JFX_cacheFaceTrackingProperties:", v11);

        goto LABEL_18;
      }
      JFXLog_DebugFaceTrackingPlayback();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_OWORD *)start = *(_OWORD *)&a3->var0;
        *(_QWORD *)&start[16] = a3->var3;
        Seconds = CMTimeGetSeconds((CMTime *)start);
        -[JFXFaceTrackingPlaybackDelegate playableElement](self, "playableElement");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "uuid");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)start = 134218242;
        *(Float64 *)&start[4] = Seconds;
        *(_WORD *)&start[12] = 2112;
        *(_QWORD *)&start[14] = v35;
        _os_log_debug_impl(&dword_2269A9000, v24, OS_LOG_TYPE_DEBUG, "faceTrackingPropertiesForTime tracked face not found for time %f on clip %@", start, 0x16u);

      }
      v23 = [JFXFaceTrackingPlaybackProperties alloc];
      *(_OWORD *)start = *(_OWORD *)time;
      *(_OWORD *)&start[16] = *(_OWORD *)&time[16];
      v41 = v43;
      v22 = (CMTimeRange *)start;
    }
    else
    {
      JFXLog_DebugFaceTrackingPlayback();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_OWORD *)start = *(_OWORD *)&a3->var0;
        *(_QWORD *)&start[16] = a3->var3;
        v30 = CMTimeGetSeconds((CMTime *)start);
        -[JFXFaceTrackingPlaybackDelegate playableElement](self, "playableElement");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "uuid");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)start = 134218242;
        *(Float64 *)&start[4] = v30;
        *(_WORD *)&start[12] = 2112;
        *(_QWORD *)&start[14] = v32;
        _os_log_debug_impl(&dword_2269A9000, v20, OS_LOG_TYPE_DEBUG, "faceTrackingPropertiesForTime exited early at time %f because no arMetadata on clip %@", start, 0x16u);

      }
      v21 = [JFXFaceTrackingPlaybackProperties alloc];
      CMTimeMake(&v36, 1, a3->var1);
      *(_OWORD *)start = *(_OWORD *)&a3->var0;
      *(_QWORD *)&start[16] = a3->var3;
      CMTimeRangeMake(&v37, (CMTime *)start, &v36);
      v22 = &v37;
      v23 = v21;
    }
    v11 = -[JFXFaceTrackingPlaybackProperties initWithNonFaceTrackableMediaTimeRange:](v23, "initWithNonFaceTrackableMediaTimeRange:", v22);
    goto LABEL_17;
  }
  JFXLog_DebugFaceTrackingPlayback();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    JFXLog_DebugFaceTrackingPlayback();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_OWORD *)time = *(_OWORD *)&a3->var0;
      *(_QWORD *)&time[16] = a3->var3;
      v26 = CMTimeGetSeconds((CMTime *)time);
      v27 = objc_msgSend(v7, "canTrackFace");
      -[JFXFaceTrackingPlaybackDelegate playableElement](self, "playableElement");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "uuid");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)time = 134218498;
      *(Float64 *)&time[4] = v26;
      *(_WORD *)&time[12] = 1024;
      *(_DWORD *)&time[14] = v27;
      *(_WORD *)&time[18] = 2112;
      *(_QWORD *)&time[20] = v29;
      _os_log_debug_impl(&dword_2269A9000, v10, OS_LOG_TYPE_DEBUG, "timedPropertiesForGroup cached data found for time %f canTrackFace: %{BOOL}d on clip %@", time, 0x1Cu);

    }
  }
  v11 = v7;
LABEL_18:

  return v11;
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

- (JFXPlayableElement)playableElement
{
  return self->_playableElement;
}

- (CGSize)outputSize
{
  double width;
  double height;
  CGSize result;

  width = self->_outputSize.width;
  height = self->_outputSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (OS_dispatch_queue)cachedFaceTrackingPropertiesQueue
{
  return self->_cachedFaceTrackingPropertiesQueue;
}

- (JFXFaceTrackingPlaybackProperties)cachedFaceTrackingProperties
{
  return self->_cachedFaceTrackingProperties;
}

- (void)setCachedFaceTrackingProperties:(id)a3
{
  objc_storeStrong((id *)&self->_cachedFaceTrackingProperties, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackElementPlaybackPresentationOffset
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- ($70930193D4F448A53BB9343C0237EB5F)playbackElementPlaybackMediaRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var3;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFaceTrackingProperties, 0);
  objc_storeStrong((id *)&self->_cachedFaceTrackingPropertiesQueue, 0);
  objc_storeStrong((id *)&self->_playableElement, 0);
  objc_storeStrong((id *)&self->_sharedMediaDataReaderManager, 0);
  objc_storeStrong((id *)&self->_mediaDataReaderUpdateQueue, 0);
  objc_storeStrong((id *)&self->_arMetadataReader, 0);
}

- (void)effect:(uint64_t)a1 timedPropertiesForGroup:(NSObject *)a2 time:userContext:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_2269A9000, a2, OS_LOG_TYPE_DEBUG, "timedPropertiesForGroup called for group %@ that is not supported", (uint8_t *)&v2, 0xCu);
}

- (void)setIsScrubbing:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "playableElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 1024;
  v10 = a2 & 1;
  _os_log_debug_impl(&dword_2269A9000, a3, OS_LOG_TYPE_DEBUG, "clip %@ scrubMode set to %{BOOL}d", (uint8_t *)&v7, 0x12u);

}

@end
