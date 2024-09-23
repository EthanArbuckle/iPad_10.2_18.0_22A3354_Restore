@implementation JFXDepthDataMediaReader

- (JFXDepthDataMediaReader)initWithVideoTrackReader:(id)a3
{
  id v5;
  JFXDepthDataMediaReader *v6;
  JFXDepthDataMediaReader *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *synchronizationQueue;
  uint64_t v17;
  JFXDepthDecompressor *depthDecompressor;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)JFXDepthDataMediaReader;
  v6 = -[JFXDepthDataMediaReader init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_reader, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UNSPECIFIED, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("com.apple.%@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_retainAutorelease(v13);
    v15 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), v9);
    synchronizationQueue = v7->_synchronizationQueue;
    v7->_synchronizationQueue = (OS_dispatch_queue *)v15;

    v17 = objc_opt_new();
    depthDecompressor = v7->_depthDecompressor;
    v7->_depthDecompressor = (JFXDepthDecompressor *)v17;

  }
  return v7;
}

- (id)depthDataForTime:(id *)a3
{
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  Float64 Seconds;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  os_signpost_id_t v12;
  Float64 v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  JFXMediaDataReaderIntervalSignpostCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[JFXDepthDataMediaReader signPostID](self, "signPostID");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      v15 = *a3;
      Seconds = CMTimeGetSeconds((CMTime *)&v15);
      LODWORD(v15.var0) = 138412546;
      *(int64_t *)((char *)&v15.var0 + 4) = (int64_t)self;
      LOWORD(v15.var2) = 2048;
      *(Float64 *)((char *)&v15.var2 + 2) = Seconds;
      _os_signpost_emit_with_name_impl(&dword_2269A9000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "depthDataForTime", "%@ time %f", (uint8_t *)&v15, 0x16u);
    }
  }

  v15 = *a3;
  -[JFXDepthDataMediaReader JFX_readDepthDataForTime:](self, "JFX_readDepthDataForTime:", &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[JFXDepthDataMediaReader setCachedDepthData:](self, "setCachedDepthData:", v9);
  JFXMediaDataReaderIntervalSignpostCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = -[JFXDepthDataMediaReader signPostID](self, "signPostID");
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v11;
    if (os_signpost_enabled(v10))
    {
      v15 = *a3;
      v13 = CMTimeGetSeconds((CMTime *)&v15);
      LODWORD(v15.var0) = 134217984;
      *(Float64 *)((char *)&v15.var0 + 4) = v13;
      _os_signpost_emit_with_name_impl(&dword_2269A9000, v10, OS_SIGNPOST_INTERVAL_END, v12, "depthDataForTime", "time %f", (uint8_t *)&v15, 0xCu);
    }
  }

  return v9;
}

- (id)JFX_cachedDepthDataForTime:(id *)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  os_signpost_id_t v12;
  Float64 v13;
  Float64 v14;
  Float64 v15;
  id v16;
  Float64 Seconds;
  Float64 v19;
  Float64 v20;
  CMTimeRange v21;
  CMTime v22;
  CMTime v23;
  CMTime v24;
  CMTimeRange v25;
  CMTime v26;
  CMTime v27;
  CMTime v28;
  CMTimeRange range;
  CMTime time;
  Float64 v31;
  __int16 v32;
  Float64 v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[JFXDepthDataMediaReader cachedDepthData](self, "cachedDepthData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "timeRange"), time = (CMTime)*a3, CMTimeRangeContainsTime(&range, &time)))
  {
    JFXLog_DebugMediaDataReader();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

    if (v8)
    {
      JFXLog_DebugMediaDataReader();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        time = (CMTime)*a3;
        Seconds = CMTimeGetSeconds(&time);
        objc_msgSend(v6, "timeRange");
        v28 = v27;
        v19 = CMTimeGetSeconds(&v28);
        objc_msgSend(v6, "timeRange");
        CMTimeRangeGetEnd(&v26, &v25);
        v20 = CMTimeGetSeconds(&v26);
        LODWORD(time.value) = 138413058;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)self;
        LOWORD(time.flags) = 2048;
        *(Float64 *)((char *)&time.flags + 2) = Seconds;
        HIWORD(time.epoch) = 2048;
        v31 = v19;
        v32 = 2048;
        v33 = v20;
        _os_log_debug_impl(&dword_2269A9000, v9, OS_LOG_TYPE_DEBUG, "%@ cached data found for time %f in cached sample at timerange %f-%f", (uint8_t *)&time, 0x2Au);
      }

    }
    JFXMediaDataReaderEventSignpostPointCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[JFXDepthDataMediaReader signPostID](self, "signPostID");
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      if (os_signpost_enabled(v10))
      {
        time = (CMTime)*a3;
        v13 = CMTimeGetSeconds(&time);
        objc_msgSend(v6, "timeRange");
        v24 = v23;
        v14 = CMTimeGetSeconds(&v24);
        objc_msgSend(v6, "timeRange");
        CMTimeRangeGetEnd(&v22, &v21);
        v15 = CMTimeGetSeconds(&v22);
        LODWORD(time.value) = 138413058;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)self;
        LOWORD(time.flags) = 2048;
        *(Float64 *)((char *)&time.flags + 2) = v13;
        HIWORD(time.epoch) = 2048;
        v31 = v14;
        v32 = 2048;
        v33 = v15;
        _os_signpost_emit_with_name_impl(&dword_2269A9000, v10, OS_SIGNPOST_EVENT, v12, "depthDataFoundInCache", "%@ found for time %f in cached sample at timerange %f-%f", (uint8_t *)&time, 0x2Au);
      }
    }

    v16 = v6;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)JFX_readDepthDataForTime:(id *)a3
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
  v13 = __Block_byref_object_copy__10;
  v14 = __Block_byref_object_dispose__10;
  v15 = 0;
  -[JFXDepthDataMediaReader synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__JFXDepthDataMediaReader_JFX_readDepthDataForTime___block_invoke;
  block[3] = &unk_24EE57C70;
  block[4] = self;
  block[5] = &v10;
  v9 = *a3;
  dispatch_sync(v5, block);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __52__JFXDepthDataMediaReader_JFX_readDepthDataForTime___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  CMTime *v6;
  void *v7;
  void *v8;
  const void *v9;
  NSObject *v10;
  JFXMediaReaderDepthData *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CMTimeValue v15;
  Float64 v16;
  const char *v17;
  CMTimeValue v18;
  Float64 Seconds;
  uint64_t v20;
  CMTime time;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  time = *(CMTime *)(a1 + 48);
  objc_msgSend(v2, "JFX_cachedDepthDataForTime:", &time);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v6 = (CMTime *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "reader");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    time = *(CMTime *)(a1 + 48);
    objc_msgSend(v7, "videoSampleForTime:", &time);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (const void *)objc_msgSend(v8, "sampleBufferRef");
      if (CMGetAttachment(v9, (CFStringRef)*MEMORY[0x24BDC0CF0], 0) != (CFTypeRef)*MEMORY[0x24BDBD270])
      {
        objc_msgSend(*(id *)(a1 + 32), "JFX_decompressAVDepthDataFromVideoTrackReaderSample:", v8);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = [JFXMediaReaderDepthData alloc];
          objc_msgSend(v8, "timeRange");
          v12 = -[JFXMediaReaderDepthData initWithAVDepthData:timeRange:](v11, "initWithAVDepthData:timeRange:", v10, &v20);
          v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v14 = *(void **)(v13 + 40);
          *(_QWORD *)(v13 + 40) = v12;

        }
        goto LABEL_9;
      }
      JFXLog_DebugMediaDataReader();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
LABEL_9:

        return;
      }
      v18 = *(_QWORD *)(a1 + 32);
      time = *v6;
      Seconds = CMTimeGetSeconds(&time);
      LODWORD(time.value) = 138412546;
      *(CMTimeValue *)((char *)&time.value + 4) = v18;
      LOWORD(time.flags) = 2048;
      *(Float64 *)((char *)&time.flags + 2) = Seconds;
      v17 = "%@ empty frame found at time %f";
    }
    else
    {
      JFXLog_DebugMediaDataReader();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        goto LABEL_9;
      v15 = *(_QWORD *)(a1 + 32);
      time = *v6;
      v16 = CMTimeGetSeconds(&time);
      LODWORD(time.value) = 138412546;
      *(CMTimeValue *)((char *)&time.value + 4) = v15;
      LOWORD(time.flags) = 2048;
      *(Float64 *)((char *)&time.flags + 2) = v16;
      v17 = "%@ could not read video sample at time %f";
    }
    _os_log_debug_impl(&dword_2269A9000, v10, OS_LOG_TYPE_DEBUG, v17, (uint8_t *)&time, 0x16u);
    goto LABEL_9;
  }
}

- (id)JFX_decompressAVDepthDataFromVideoTrackReaderSample:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  unint64_t v7;
  os_signpost_id_t v8;
  Float64 Seconds;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  _BOOL4 v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSObject *v22;
  unint64_t v23;
  os_signpost_id_t v24;
  _BYTE v26[5];
  _BYTE v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CMTime v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CMTime time;
  int buf;
  JFXDepthDataMediaReader *v38;
  __int16 v39;
  Float64 v40;
  __int16 v41;
  double v42;
  __int16 v43;
  _BYTE *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[JFXDepthDataMediaReader synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  JFXMediaDataReaderIntervalSignpostCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = -[JFXDepthDataMediaReader signPostID](self, "signPostID");
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v6))
    {
      if (v4)
      {
        objc_msgSend(v4, "timeRange");
      }
      else
      {
        v34 = 0u;
        v35 = 0u;
        v33 = 0u;
      }
      *(_OWORD *)&time.value = v33;
      time.epoch = v34;
      Seconds = CMTimeGetSeconds(&time);
      buf = 138412546;
      v38 = self;
      v39 = 2048;
      v40 = Seconds;
      _os_signpost_emit_with_name_impl(&dword_2269A9000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "decompressAVDepthData", "%@ time %f", (uint8_t *)&buf, 0x16u);
    }
  }

  -[JFXDepthDataMediaReader depthDecompressor](self, "depthDecompressor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v10, "decompressAVDepthData:error:", objc_msgSend(v4, "sampleBufferRef"), &v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = COERCE_DOUBLE(v32);

  if (v4)
  {
    objc_msgSend(v4, "timeRange");
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v28 = 0u;
  }
  *(_OWORD *)&v31.value = v28;
  v31.epoch = v29;
  v13 = CMTimeGetSeconds(&v31);
  -[JFXDepthDataMediaReader depthDecompressor](self, "depthDecompressor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "depthCodecType");

  if (!v15)
  {
    JFXLog_mediaDataReader();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[JFXDepthDataMediaReader JFX_decompressAVDepthDataFromVideoTrackReaderSample:].cold.1((uint64_t)self, v16, v13);

  }
  JFXLog_DebugMediaDataReader();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (v11 && v12 == 0.0)
  {
    if (v18)
    {
      v27[0] = HIBYTE(v15);
      v27[1] = BYTE2(v15);
      v27[2] = BYTE1(v15);
      v27[3] = v15;
      v27[4] = 0;
      buf = 138412802;
      v38 = self;
      v39 = 2048;
      v40 = v13;
      v41 = 2080;
      v42 = COERCE_DOUBLE(v27);
      v19 = "%@ depth data decompression succeeded for time %f, type detected %s";
      v20 = v17;
      v21 = 32;
LABEL_24:
      _os_log_debug_impl(&dword_2269A9000, v20, OS_LOG_TYPE_DEBUG, v19, (uint8_t *)&buf, v21);
    }
  }
  else if (v18)
  {
    v26[0] = HIBYTE(v15);
    v26[1] = BYTE2(v15);
    v26[2] = BYTE1(v15);
    v26[3] = v15;
    v26[4] = 0;
    buf = 138413058;
    v38 = self;
    v39 = 2112;
    v40 = v12;
    v41 = 2048;
    v42 = v13;
    v43 = 2080;
    v44 = v26;
    v19 = "%@ depth data decompression failed with error %@ for time %f, type detected %s";
    v20 = v17;
    v21 = 42;
    goto LABEL_24;
  }

  JFXMediaDataReaderIntervalSignpostCategory();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = -[JFXDepthDataMediaReader signPostID](self, "signPostID");
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v24 = v23;
    if (os_signpost_enabled(v22))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_2269A9000, v22, OS_SIGNPOST_INTERVAL_END, v24, "decompressAVDepthData", (const char *)&unk_226AC25B2, (uint8_t *)&buf, 2u);
    }
  }

  return v11;
}

- ($70930193D4F448A53BB9343C0237EB5F)readableTimeRange
{
  NSObject *v5;
  uint64_t *v6;
  __int128 v7;
  $70930193D4F448A53BB9343C0237EB5F *result;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v10 = 0;
  v11 = &v10;
  v12 = 0x5010000000;
  v13 = &unk_226ACDFC7;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[JFXDepthDataMediaReader synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__JFXDepthDataMediaReader_readableTimeRange__block_invoke;
  v9[3] = &unk_24EE57A80;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v5, v9);

  v6 = v11;
  v7 = *((_OWORD *)v11 + 3);
  *(_OWORD *)&retstr->var0.var0 = *((_OWORD *)v11 + 2);
  *(_OWORD *)&retstr->var0.var3 = v7;
  *(_OWORD *)&retstr->var1.var1 = *((_OWORD *)v6 + 4);
  _Block_object_dispose(&v10, 8);
  return result;
}

__n128 __44__JFXDepthDataMediaReader_readableTimeRange__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _OWORD *v4;
  __n128 result;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  objc_msgSend(*(id *)(a1 + 32), "reader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "readableTimeRange");
  }
  else
  {
    v7 = 0u;
    v8 = 0u;
    v6 = 0u;
  }
  v4 = *(_OWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v4[2] = v6;
  v4[3] = v7;
  v4[4] = v8;

  return result;
}

- (BOOL)isScrubbing
{
  JFXDepthDataMediaReader *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[JFXDepthDataMediaReader synchronizationQueue](self, "synchronizationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__JFXDepthDataMediaReader_isScrubbing__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __38__JFXDepthDataMediaReader_isScrubbing__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "reader");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isScrubbing");

}

- (void)setIsScrubbing:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[JFXDepthDataMediaReader synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__JFXDepthDataMediaReader_setIsScrubbing___block_invoke;
  v6[3] = &unk_24EE57C98;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __42__JFXDepthDataMediaReader_setIsScrubbing___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "reader");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsScrubbing:", v1);

}

- (int64_t)status
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 2;
  -[JFXDepthDataMediaReader synchronizationQueue](self, "synchronizationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __33__JFXDepthDataMediaReader_status__block_invoke;
  v6[3] = &unk_24EE57A80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __33__JFXDepthDataMediaReader_status__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "reader");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "status");

}

- (NSError)error
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__10;
  v11 = __Block_byref_object_dispose__10;
  v12 = 0;
  -[JFXDepthDataMediaReader synchronizationQueue](self, "synchronizationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__JFXDepthDataMediaReader_error__block_invoke;
  v6[3] = &unk_24EE57A80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSError *)v4;
}

void __32__JFXDepthDataMediaReader_error__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "reader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "lastDecodeError");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (BOOL)beginReadingAtTimeRange:(id *)a3
{
  NSObject *v5;
  __int128 v6;
  _QWORD v8[6];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[JFXDepthDataMediaReader synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__JFXDepthDataMediaReader_beginReadingAtTimeRange___block_invoke;
  v8[3] = &unk_24EE57F70;
  v8[4] = self;
  v8[5] = &v12;
  v6 = *(_OWORD *)&a3->var0.var3;
  v9 = *(_OWORD *)&a3->var0.var0;
  v10 = v6;
  v11 = *(_OWORD *)&a3->var1.var1;
  dispatch_sync(v5, v8);

  LOBYTE(a3) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)a3;
}

void __51__JFXDepthDataMediaReader_beginReadingAtTimeRange___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v4[3];

  objc_msgSend(*(id *)(a1 + 32), "reader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(a1 + 64);
  v4[0] = *(_OWORD *)(a1 + 48);
  v4[1] = v3;
  v4[2] = *(_OWORD *)(a1 + 80);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "beginReadingAtTimeRange:", v4);

}

- (BOOL)beginReading
{
  JFXDepthDataMediaReader *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[JFXDepthDataMediaReader synchronizationQueue](self, "synchronizationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__JFXDepthDataMediaReader_beginReading__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __39__JFXDepthDataMediaReader_beginReading__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "reader");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "beginReading");

}

- (NSString)name
{
  void *v2;
  void *v3;

  -[JFXDepthDataMediaReader reader](self, "reader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)signPostID
{
  void *v2;
  unint64_t v3;

  -[JFXDepthDataMediaReader reader](self, "reader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "signPostID");

  return v3;
}

- (id)videoSampleForTime:(id *)a3
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
  v13 = __Block_byref_object_copy__10;
  v14 = __Block_byref_object_dispose__10;
  v15 = 0;
  -[JFXDepthDataMediaReader synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__JFXDepthDataMediaReader_videoSampleForTime___block_invoke;
  block[3] = &unk_24EE57C70;
  block[4] = self;
  block[5] = &v10;
  v9 = *a3;
  dispatch_sync(v5, block);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __46__JFXDepthDataMediaReader_videoSampleForTime___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "reader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v2, "videoSampleForTime:", &v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (JFXMediaVideoTrackReader)reader
{
  return self->_reader;
}

- (NSError)lastDecodeError
{
  return self->_lastDecodeError;
}

- (void)setLastDecodeError:(id)a3
{
  objc_storeStrong((id *)&self->_lastDecodeError, a3);
}

- (JFXMediaReaderDepthData)cachedDepthData
{
  return self->_cachedDepthData;
}

- (void)setCachedDepthData:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDepthData, a3);
}

- (OS_dispatch_queue)synchronizationQueue
{
  return self->_synchronizationQueue;
}

- (JFXDepthDecompressor)depthDecompressor
{
  return self->_depthDecompressor;
}

- (void)setDepthDecompressor:(id)a3
{
  objc_storeStrong((id *)&self->_depthDecompressor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthDecompressor, 0);
  objc_storeStrong((id *)&self->_synchronizationQueue, 0);
  objc_storeStrong((id *)&self->_cachedDepthData, 0);
  objc_storeStrong((id *)&self->_lastDecodeError, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)JFX_decompressAVDepthDataFromVideoTrackReaderSample:(double)a3 .cold.1(uint64_t a1, NSObject *a2, double a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2048;
  v6 = a3;
  _os_log_error_impl(&dword_2269A9000, a2, OS_LOG_TYPE_ERROR, "%@ found data with invalid depth data at time %f", (uint8_t *)&v3, 0x16u);
}

@end
