@implementation JFXARMetadataMediaReader

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_4);
}

void __38__JFXARMetadataMediaReader_initialize__block_invoke()
{
  objc_class *v0;
  uint64_t v1;
  void *v2;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)s_JFXARMetadataClassName;
  s_JFXARMetadataClassName = v1;

}

- (JFXARMetadataMediaReader)initWithMetadataReader:(id)a3
{
  id v5;
  JFXARMetadataMediaReader *v6;
  JFXARMetadataMediaReader *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *synchronizationQueue;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)JFXARMetadataMediaReader;
  v6 = -[JFXARMetadataMediaReader init](&v18, sel_init);
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

  }
  return v7;
}

- (id)arMetadataItemForTime:(id *)a3
{
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  Float64 Seconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  id v12;
  uint8_t v14[8];
  _QWORD block[6];
  __int128 v16;
  int64_t var3;
  CMTime time;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  JFXMediaDataReaderIntervalSignpostCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[JFXARMetadataMediaReader signPostID](self, "signPostID");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      time = (CMTime)*a3;
      Seconds = CMTimeGetSeconds(&time);
      LODWORD(time.value) = 138412546;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)self;
      LOWORD(time.flags) = 2048;
      *(Float64 *)((char *)&time.flags + 2) = Seconds;
      _os_signpost_emit_with_name_impl(&dword_2269A9000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "arMetadataItemForTime", "%@ time %f", (uint8_t *)&time, 0x16u);
    }
  }

  time.value = 0;
  *(_QWORD *)&time.timescale = &time;
  time.epoch = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  v21 = 0;
  -[JFXARMetadataMediaReader synchronizationQueue](self, "synchronizationQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__JFXARMetadataMediaReader_arMetadataItemForTime___block_invoke;
  block[3] = &unk_24EE57F48;
  v16 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  block[4] = self;
  block[5] = &time;
  dispatch_sync(v9, block);

  JFXMediaDataReaderIntervalSignpostCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = -[JFXARMetadataMediaReader signPostID](self, "signPostID");
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_2269A9000, v10, OS_SIGNPOST_INTERVAL_END, v11, "arMetadataItemForTime", (const char *)&unk_226AC25B2, v14, 2u);
  }

  v12 = *(id *)(*(_QWORD *)&time.timescale + 40);
  _Block_object_dispose(&time, 8);

  return v12;
}

void __50__JFXARMetadataMediaReader_arMetadataItemForTime___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _OWORD *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  os_signpost_id_t v10;
  CMTimeValue v11;
  Float64 v12;
  Float64 v13;
  Float64 v14;
  NSObject *v15;
  uint64_t v16;
  os_signpost_id_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  os_signpost_id_t v24;
  CMTimeValue v25;
  Float64 v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  os_signpost_id_t v30;
  JFXARMetadataMediaReaderItem *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  CMTimeValue v35;
  Float64 Seconds;
  Float64 v37;
  Float64 v38;
  _BYTE v39[48];
  CMTimeRange v40;
  CMTime v41;
  CMTime v42;
  CMTime v43;
  CMTimeRange v44;
  CMTime v45;
  CMTime v46;
  CMTime v47;
  CMTimeRange range;
  CMTime time;
  Float64 v50;
  __int16 v51;
  Float64 v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "cachedARMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "timeRange"), time = *(CMTime *)(a1 + 48), CMTimeRangeContainsTime(&range, &time)))
  {
    v4 = (_OWORD *)(a1 + 48);
    JFXLog_DebugMediaDataReader();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

    if (v6)
    {
      JFXLog_DebugMediaDataReader();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v35 = *(_QWORD *)(a1 + 32);
        *(_OWORD *)&time.value = *v4;
        time.epoch = *(_QWORD *)(a1 + 64);
        Seconds = CMTimeGetSeconds(&time);
        objc_msgSend(v3, "timeRange");
        v47 = v46;
        v37 = CMTimeGetSeconds(&v47);
        objc_msgSend(v3, "timeRange");
        CMTimeRangeGetEnd(&v45, &v44);
        v38 = CMTimeGetSeconds(&v45);
        LODWORD(time.value) = 138413058;
        *(CMTimeValue *)((char *)&time.value + 4) = v35;
        LOWORD(time.flags) = 2048;
        *(Float64 *)((char *)&time.flags + 2) = Seconds;
        HIWORD(time.epoch) = 2048;
        v50 = v37;
        v51 = 2048;
        v52 = v38;
        _os_log_debug_impl(&dword_2269A9000, v7, OS_LOG_TYPE_DEBUG, "%@ cached data found for time %f in cached sample at timerange %f-%f", (uint8_t *)&time, 0x2Au);
      }

    }
    JFXMediaDataReaderEventSignpostPointCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 32), "signPostID");
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_OWORD *)&time.value = *v4;
        time.epoch = *(_QWORD *)(a1 + 64);
        v12 = CMTimeGetSeconds(&time);
        objc_msgSend(v3, "timeRange");
        v43 = v42;
        v13 = CMTimeGetSeconds(&v43);
        objc_msgSend(v3, "timeRange");
        CMTimeRangeGetEnd(&v41, &v40);
        v14 = CMTimeGetSeconds(&v41);
        LODWORD(time.value) = 138413058;
        *(CMTimeValue *)((char *)&time.value + 4) = v11;
        LOWORD(time.flags) = 2048;
        *(Float64 *)((char *)&time.flags + 2) = v12;
        HIWORD(time.epoch) = 2048;
        v50 = v13;
        v51 = 2048;
        v52 = v14;
        _os_signpost_emit_with_name_impl(&dword_2269A9000, v8, OS_SIGNPOST_EVENT, v10, "arMetadataFoundInCache", "%@ found for time %f in cached sample at timerange %f-%f", (uint8_t *)&time, 0x2Au);
      }
    }

    JFXMediaDataReaderIntervalSignpostCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(*(id *)(a1 + 32), "signPostID");
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v17 = v16;
      if (os_signpost_enabled(v15))
      {
        LOWORD(time.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_2269A9000, v15, OS_SIGNPOST_INTERVAL_END, v17, "arMetadataItemForTime", (const char *)&unk_226AC25B2, (uint8_t *)&time, 2u);
      }
    }

    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v19 = v3;
    v20 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v19;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "reader");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    time = *(CMTime *)(a1 + 48);
    objc_msgSend(v21, "metadataForTime:", &time);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      JFXMediaDataReaderIntervalSignpostCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(*(id *)(a1 + 32), "signPostID");
      if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v24 = v23;
        if (os_signpost_enabled(v22))
        {
          v25 = *(_QWORD *)(a1 + 32);
          time = *(CMTime *)(a1 + 48);
          v26 = CMTimeGetSeconds(&time);
          LODWORD(time.value) = 138412546;
          *(CMTimeValue *)((char *)&time.value + 4) = v25;
          LOWORD(time.flags) = 2048;
          *(Float64 *)((char *)&time.flags + 2) = v26;
          _os_signpost_emit_with_name_impl(&dword_2269A9000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v24, "decodingARMetadata", "%@ for time %f", (uint8_t *)&time, 0x16u);
        }
      }

      objc_msgSend(*(id *)(a1 + 32), "JFX_ARMetadataFromMetadataReaderItem:", v20);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      JFXMediaDataReaderIntervalSignpostCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(*(id *)(a1 + 32), "signPostID");
      if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v30 = v29;
        if (os_signpost_enabled(v28))
        {
          LOWORD(time.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_2269A9000, v28, OS_SIGNPOST_INTERVAL_END, v30, "decodingARMetadata", (const char *)&unk_226AC25B2, (uint8_t *)&time, 2u);
        }
      }

      if (v27)
      {
        v31 = [JFXARMetadataMediaReaderItem alloc];
        objc_msgSend(v20, "timeRange");
        v32 = -[JFXARMetadataMediaReaderItem initWithARMetadata:timeRange:](v31, "initWithARMetadata:timeRange:", v27, v39);
        v33 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v34 = *(void **)(v33 + 40);
        *(_QWORD *)(v33 + 40) = v32;

        objc_msgSend(*(id *)(a1 + 32), "setCachedARMetadata:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      }

    }
  }

}

- (id)JFX_ARMetadataFromMetadataReaderItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasSuffix:", s_JFXARMetadataClassName);

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD1620];
    v8 = objc_opt_class();
    objc_msgSend(v4, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v7, "unarchivedObjectOfClass:fromData:error:", v8, v9, &v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;

    if (!v10 || v11)
      -[JFXARMetadataMediaReader setLastDecodeError:](self, "setLastDecodeError:", v11);

  }
  else
  {
    v10 = 0;
  }

  return v10;
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
  -[JFXARMetadataMediaReader synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__JFXARMetadataMediaReader_readableTimeRange__block_invoke;
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

__n128 __45__JFXARMetadataMediaReader_readableTimeRange__block_invoke(uint64_t a1)
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
  JFXARMetadataMediaReader *v2;
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
  -[JFXARMetadataMediaReader synchronizationQueue](self, "synchronizationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__JFXARMetadataMediaReader_isScrubbing__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __39__JFXARMetadataMediaReader_isScrubbing__block_invoke(uint64_t a1)
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

  -[JFXARMetadataMediaReader synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__JFXARMetadataMediaReader_setIsScrubbing___block_invoke;
  v6[3] = &unk_24EE57C98;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __43__JFXARMetadataMediaReader_setIsScrubbing___block_invoke(uint64_t a1)
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
  -[JFXARMetadataMediaReader synchronizationQueue](self, "synchronizationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__JFXARMetadataMediaReader_status__block_invoke;
  v6[3] = &unk_24EE57A80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __34__JFXARMetadataMediaReader_status__block_invoke(uint64_t a1)
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
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  -[JFXARMetadataMediaReader synchronizationQueue](self, "synchronizationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __33__JFXARMetadataMediaReader_error__block_invoke;
  v6[3] = &unk_24EE57A80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSError *)v4;
}

void __33__JFXARMetadataMediaReader_error__block_invoke(uint64_t a1)
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
  -[JFXARMetadataMediaReader synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__JFXARMetadataMediaReader_beginReadingAtTimeRange___block_invoke;
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

void __52__JFXARMetadataMediaReader_beginReadingAtTimeRange___block_invoke(uint64_t a1)
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
  JFXARMetadataMediaReader *v2;
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
  -[JFXARMetadataMediaReader synchronizationQueue](self, "synchronizationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__JFXARMetadataMediaReader_beginReading__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __40__JFXARMetadataMediaReader_beginReading__block_invoke(uint64_t a1)
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

  -[JFXARMetadataMediaReader reader](self, "reader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)signPostID
{
  void *v2;
  unint64_t v3;

  -[JFXARMetadataMediaReader reader](self, "reader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "signPostID");

  return v3;
}

- (id)metadataForTime:(id *)a3
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
  v13 = __Block_byref_object_copy__2;
  v14 = __Block_byref_object_dispose__2;
  v15 = 0;
  -[JFXARMetadataMediaReader synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__JFXARMetadataMediaReader_metadataForTime___block_invoke;
  block[3] = &unk_24EE57C70;
  block[4] = self;
  block[5] = &v10;
  v9 = *a3;
  dispatch_sync(v5, block);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __44__JFXARMetadataMediaReader_metadataForTime___block_invoke(uint64_t a1)
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
  objc_msgSend(v2, "metadataForTime:", &v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (JFXMediaMetadataReader)reader
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

- (JFXARMetadataMediaReaderItem)cachedARMetadata
{
  return self->_cachedARMetadata;
}

- (void)setCachedARMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_cachedARMetadata, a3);
}

- (OS_dispatch_queue)synchronizationQueue
{
  return self->_synchronizationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronizationQueue, 0);
  objc_storeStrong((id *)&self->_cachedARMetadata, 0);
  objc_storeStrong((id *)&self->_lastDecodeError, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
