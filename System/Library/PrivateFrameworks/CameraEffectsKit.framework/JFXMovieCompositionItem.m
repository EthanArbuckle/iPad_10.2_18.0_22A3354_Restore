@implementation JFXMovieCompositionItem

- (JFXMovieCompositionItem)initWithClip:(id)a3 timeScale:(int)a4
{
  uint64_t v4;
  id v6;
  JFXMovieCompositionItem *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)JFXMovieCompositionItem;
  v7 = -[JFXCompositionItem initWithClip:timeScale:](&v16, sel_initWithClip_timeScale_, v6, v4);
  if (v7 && objc_msgSend(v6, "mediaType") == 1)
  {
    objc_msgSend(v6, "mediaItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isAssetUnavailable"))
    {
      v9 = objc_alloc(MEMORY[0x24BDB26C8]);
      v10 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pathForResource:ofType:", CFSTR("blhack"), CFSTR("mov"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fileURLWithPath:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v9, "initWithURL:options:", v13, 0);
      -[JFXMovieCompositionItem setAsset:](v7, "setAsset:", v14);

    }
    else
    {
      objc_msgSend(v8, "avAsset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXMovieCompositionItem setAsset:](v7, "setAsset:", v11);
    }

  }
  return v7;
}

- (BOOL)hasVideoContent
{
  dispatch_semaphore_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v3 = dispatch_semaphore_create(0);
  -[JFXMovieCompositionItem asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDB1CE8];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__JFXMovieCompositionItem_hasVideoContent__block_invoke;
  v8[3] = &unk_24EE58C80;
  v10 = &v11;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v4, "loadTracksWithMediaCharacteristic:completionHandler:", v5, v8);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v4) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

intptr_t __42__JFXMovieCompositionItem_hasVideoContent__block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "count"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)needAudioLoop
{
  void *v2;
  BOOL v3;

  -[JFXMovieCompositionItem audioAssetOverwrite](self, "audioAssetOverwrite");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)segmentWithCharacteristic:(id)a3 sourceRange:(id *)a4 destinationRange:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  dispatch_semaphore_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  NSObject *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  NSObject *v23;
  uint64_t *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__26;
  v35 = __Block_byref_object_dispose__26;
  v36 = 0;
  -[JFXMovieCompositionItem asset](self, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXMovieCompositionItem audioAssetOverwrite](self, "audioAssetOverwrite");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v8 && v10)
  {
    v12 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDB1C90]);

    if (!v12)
      goto LABEL_6;
    -[JFXMovieCompositionItem audioAssetOverwrite](self, "audioAssetOverwrite");
    v11 = v9;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = dispatch_semaphore_create(0);
    v20[1] = 3221225472;
    v14 = *(_OWORD *)&a4->var0.var3;
    v25 = *(_OWORD *)&a4->var0.var0;
    v20[0] = MEMORY[0x24BDAC760];
    v20[2] = __82__JFXMovieCompositionItem_segmentWithCharacteristic_sourceRange_destinationRange___block_invoke;
    v20[3] = &unk_24EE5C308;
    v15 = *(_OWORD *)&a4->var1.var1;
    v26 = v14;
    v27 = v15;
    v20[4] = self;
    v24 = &v31;
    v21 = v9;
    v16 = *(_OWORD *)&a5->var0.var3;
    v28 = *(_OWORD *)&a5->var0.var0;
    v29 = v16;
    v30 = *(_OWORD *)&a5->var1.var1;
    v22 = v8;
    v17 = v13;
    v23 = v17;
    objc_msgSend(v21, "loadTracksWithMediaCharacteristic:completionHandler:", v22, v20);
    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    v18 = (id)v32[5];

  }
  else
  {
    JFXLog_playback();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[JFXMovieCompositionItem segmentWithCharacteristic:sourceRange:destinationRange:].cold.1((uint64_t)v9, v17);
    v18 = 0;
  }

  _Block_object_dispose(&v31, 8);
  return v18;
}

void __82__JFXMovieCompositionItem_segmentWithCharacteristic_sourceRange_destinationRange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  __int128 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _OWORD v13[3];
  _BYTE time1[32];
  __int128 v15;
  CMTime time2;
  _BYTE v17[32];
  __int128 v18;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_OWORD *)(a1 + 88);
    *(_OWORD *)v17 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)&v17[16] = v5;
    v18 = *(_OWORD *)(a1 + 104);
    CMTimeMake(&time2, 0, objc_msgSend(*(id *)(a1 + 32), "timeScale"));
    *(_OWORD *)time1 = *(_OWORD *)(a1 + 72);
    *(_QWORD *)&time1[16] = *(_QWORD *)(a1 + 88);
    CMTimeMaximum((CMTime *)v17, (CMTime *)time1, &time2);
    v6 = (void *)MEMORY[0x24BDB2528];
    objc_msgSend(*(id *)(a1 + 40), "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSObject trackID](v4, "trackID");
    *(_OWORD *)time1 = *(_OWORD *)v17;
    *(_OWORD *)&time1[16] = *(_OWORD *)&v17[16];
    v15 = v18;
    v9 = *(_OWORD *)(a1 + 136);
    v13[0] = *(_OWORD *)(a1 + 120);
    v13[1] = v9;
    v13[2] = *(_OWORD *)(a1 + 152);
    objc_msgSend(v6, "compositionTrackSegmentWithURL:trackID:sourceTimeRange:targetTimeRange:", v7, v8, time1, v13);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  else
  {
    JFXLog_DebugPlayback();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __82__JFXMovieCompositionItem_segmentWithCharacteristic_sourceRange_destinationRange___block_invoke_cold_1(a1, v4);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- ($70930193D4F448A53BB9343C0237EB5F)applySpeed:(SEL)a3
{
  __int128 v6;
  $70930193D4F448A53BB9343C0237EB5F *result;
  float v8;
  float v9;
  float v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var0;
  CMTime v12;

  v6 = *(_OWORD *)&a4->var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v6;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&a4->var1.var1;
  result = ($70930193D4F448A53BB9343C0237EB5F *)-[JFXCompositionItem speed](self, "speed");
  if (v8 != 1.0)
  {
    if (retstr->var0.var0)
    {
      -[JFXCompositionItem speed](self, "speed");
      var0 = retstr->var0;
      CMTimeMultiplyByFloat64(&v12, (CMTime *)&var0, v9 + 0.0001);
    }
    else
    {
      CMTimeMake(&v12, 1, 1000);
    }
    retstr->var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v12;
    -[JFXCompositionItem speed](self, "speed");
    var0 = retstr->var1;
    result = ($70930193D4F448A53BB9343C0237EB5F *)CMTimeMultiplyByFloat64(&v12, (CMTime *)&var0, v10 + 0.0001);
    retstr->var1 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v12;
  }
  return result;
}

- (id)speedRangesForSourceRange:(id *)a3 destinationRange:(id *)a4
{
  void *v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  void *v8;
  CMTimeRange v10;
  CMTimeRange source;
  CMTimeMapping v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD1968];
  v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&source.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&source.start.epoch = v5;
  *(_OWORD *)&source.duration.timescale = *(_OWORD *)&a3->var1.var1;
  v6 = *(_OWORD *)&a4->var0.var3;
  *(_OWORD *)&v10.start.value = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&v10.start.epoch = v6;
  *(_OWORD *)&v10.duration.timescale = *(_OWORD *)&a4->var1.var1;
  CMTimeMappingMake(&v12, &source, &v10);
  objc_msgSend(v4, "valueWithCMTimeMapping:", &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)videoTrackSegmentsWithDestinationRange:(id *)a3
{
  JFXMovieCompositionItem *v4;
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CMTimeScale *p_timescale;
  uint64_t v14;
  void *v15;
  CMTimeValue value;
  CMTimeValue v17;
  CMTimeValue v18;
  uint64_t v19;
  void *v20;
  CMTimeScale *v21;
  uint64_t v22;
  JFXMovieCompositionItem *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v28;
  id obj;
  id v30;
  uint64_t v31;
  uint8_t buf;
  _BYTE v33[15];
  CMTimeValue v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  CMTimeRange source;
  _OWORD v39[2];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CMTimeMapping v45;
  CMTimeRange v46;
  _BYTE v47[128];
  void *v48;
  CMTimeRange target;
  uint64_t v50;

  v4 = self;
  v50 = *MEMORY[0x24BDAC8D0];
  memset(&v46, 0, sizeof(v46));
  -[JFXCompositionItem sourceTimeRange](self, "sourceTimeRange");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (-[JFXCompositionItem isFreezeFrame](v4, "isFreezeFrame"))
  {
    v46.duration.timescale *= 1000;
    v5 = (void *)MEMORY[0x24BDD1968];
    source = v46;
    v6 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&target.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&target.start.epoch = v6;
    *(_OWORD *)&target.duration.timescale = *(_OWORD *)&a3->var1.var1;
    CMTimeMappingMake(&v45, &source, &target);
    objc_msgSend(v5, "valueWithCMTimeMapping:", &v45);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v48, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    source = v46;
    v9 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&target.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&target.start.epoch = v9;
    *(_OWORD *)&target.duration.timescale = *(_OWORD *)&a3->var1.var1;
    -[JFXMovieCompositionItem speedRangesForSourceRange:destinationRange:](v4, "speedRangesForSourceRange:destinationRange:", &source, &target);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v42;
    p_timescale = &source.start.timescale;
    v31 = *MEMORY[0x24BDB1CE8];
    do
    {
      v14 = 0;
      v28 = v11;
      do
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v14);
        v40 = 0u;
        memset(v39, 0, sizeof(v39));
        memset(&source, 0, sizeof(source));
        if (v15)
        {
          objc_msgSend(v15, "CMTimeMappingValue");
          value = source.start.value;
          v17 = source.duration.value;
          v18 = *(_QWORD *)&v39[0];
          v19 = *((_QWORD *)&v39[1] + 1);
        }
        else
        {
          v19 = 0;
          v18 = 0;
          v17 = 0;
          value = 0;
        }
        *(_OWORD *)&target.start.timescale = *(_OWORD *)p_timescale;
        *(_OWORD *)&target.duration.timescale = *(_OWORD *)&source.duration.timescale;
        v35 = *(_OWORD *)((char *)v39 + 8);
        v37 = v40;
        target.start.value = value;
        target.duration.value = v17;
        v34 = v18;
        v36 = v19;
        -[JFXMovieCompositionItem segmentWithCharacteristic:sourceRange:destinationRange:](v4, "segmentWithCharacteristic:sourceRange:destinationRange:", v31, &target, &v34);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_msgSend(v30, "addObject:", v20);
        }
        else
        {
          v21 = p_timescale;
          v22 = v12;
          v23 = v4;
          JFXLog_DebugComposition();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            -[JFXMovieCompositionItem videoTrackSegmentsWithDestinationRange:].cold.1(&buf, v33, v24);

          JFXLog_DebugComposition();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(target.start.value) = 134218240;
            *(CMTimeValue *)((char *)&target.start.value + 4) = value;
            LOWORD(target.start.flags) = 2048;
            *(_QWORD *)((char *)&target.start.flags + 2) = v17;
            _os_log_debug_impl(&dword_2269A9000, v25, OS_LOG_TYPE_DEBUG, "  sourceRange was (%lld, %lld)", (uint8_t *)&target, 0x16u);
          }

          JFXLog_DebugComposition();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(target.start.value) = 134218240;
            *(CMTimeValue *)((char *)&target.start.value + 4) = v18;
            LOWORD(target.start.flags) = 2048;
            *(_QWORD *)((char *)&target.start.flags + 2) = v19;
            _os_log_debug_impl(&dword_2269A9000, v26, OS_LOG_TYPE_DEBUG, "  destinationTime was (%lld, %lld)", (uint8_t *)&target, 0x16u);
          }

          v4 = v23;
          v12 = v22;
          p_timescale = v21;
          v11 = v28;
        }

        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v11);
  }

  return v30;
}

- (id)audioTrackSegmentsWithDestinationTime:(id *)a3
{
  __int128 v4;
  uint64_t v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  v6 = *a3;
  v4 = *MEMORY[0x24BDC0D40];
  v5 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
  -[JFXMovieCompositionItem audioTrackSegmentsWithDestinationTime:paddedFromTime:](self, "audioTrackSegmentsWithDestinationTime:paddedFromTime:", &v6, &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)audioTrackSegmentsWithDestinationTime:(id *)a3 paddedFromTime:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE time2[32];
  __int128 v26;
  _BYTE lhs[32];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE time1[32];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CMTime v38;
  CMTime v39;
  CMTime v40;
  CMTime v41;
  CMTime rhs;
  __int128 v43;
  _BYTE v44[32];
  __int128 v45;
  _OWORD v46[2];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  memset(v46, 0, sizeof(v46));
  v45 = 0u;
  -[JFXCompositionItem sourceTimeRange](self, "sourceTimeRange");
  if (-[JFXCompositionItem isFreezeFrame](self, "isFreezeFrame"))
  {
    -[JFXCompositionItem destinationDuration](self, "destinationDuration");
    *(_OWORD *)((char *)v46 + 8) = *(_OWORD *)lhs;
    *((_QWORD *)&v46[1] + 1) = *(_QWORD *)&lhs[16];
  }
  -[JFXCompositionItem audioStartOffset](self, "audioStartOffset");
  *(_OWORD *)lhs = *(_OWORD *)&a3->var0;
  *(_QWORD *)&lhs[16] = a3->var3;
  CMTimeAdd((CMTime *)&v43, (CMTime *)lhs, &rhs);
  memset(&v44[8], 0, 24);
  -[JFXCompositionItem destinationDuration](self, "destinationDuration");
  -[JFXCompositionItem audioStartOffset](self, "audioStartOffset");
  CMTimeSubtract(&v41, &v40, &v39);
  -[JFXCompositionItem audioEndOffset](self, "audioEndOffset");
  CMTimeAdd((CMTime *)lhs, &v41, &v38);
  *(_OWORD *)&v44[8] = *(_OWORD *)lhs;
  *(_QWORD *)&v44[24] = *(_QWORD *)&lhs[16];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDC0D88];
  if ((a4->var2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("enableGapSyncWorkaround"));

    if (v10)
    {
      memset(lhs, 0, 24);
      *(_OWORD *)time1 = v43;
      *(_QWORD *)&time1[16] = *(_QWORD *)v44;
      *(_OWORD *)time2 = *(_OWORD *)&a4->var0;
      *(_QWORD *)&time2[16] = a4->var3;
      CMTimeSubtract((CMTime *)lhs, (CMTime *)time1, (CMTime *)time2);
      *(_OWORD *)time1 = *(_OWORD *)lhs;
      *(_QWORD *)&time1[16] = *(_QWORD *)&lhs[16];
      *(_OWORD *)time2 = *(_OWORD *)v8;
      *(_QWORD *)&time2[16] = *(_QWORD *)(v8 + 16);
      if (CMTimeCompare((CMTime *)time1, (CMTime *)time2) >= 1)
      {
        *(_OWORD *)time1 = *(_OWORD *)lhs;
        *(_QWORD *)&time1[16] = *(_QWORD *)&lhs[16];
        *(_OWORD *)time2 = v45;
        *(_QWORD *)&time2[16] = *(_QWORD *)&v46[0];
        if (CMTimeCompare((CMTime *)time1, (CMTime *)time2) >= 1)
        {
          *(_OWORD *)lhs = v45;
          *(_QWORD *)&lhs[16] = *(_QWORD *)&v46[0];
        }
        *(_OWORD *)time2 = v43;
        *(_QWORD *)&time2[16] = *(_QWORD *)v44;
        v22 = *(_OWORD *)lhs;
        *(_QWORD *)&v23 = *(_QWORD *)&lhs[16];
        CMTimeSubtract((CMTime *)time1, (CMTime *)time2, (CMTime *)&v22);
        v43 = *(_OWORD *)time1;
        *(_QWORD *)v44 = *(_QWORD *)&time1[16];
        *(_OWORD *)time2 = *(_OWORD *)&v44[8];
        *(_QWORD *)&time2[16] = *(_QWORD *)&v44[24];
        v22 = *(_OWORD *)lhs;
        *(_QWORD *)&v23 = *(_QWORD *)&lhs[16];
        CMTimeAdd((CMTime *)time1, (CMTime *)time2, (CMTime *)&v22);
        *(_OWORD *)&v44[8] = *(_OWORD *)time1;
        *(_QWORD *)&v44[24] = *(_QWORD *)&time1[16];
        *(_OWORD *)time2 = v45;
        *(_QWORD *)&time2[16] = *(_QWORD *)&v46[0];
        v22 = *(_OWORD *)lhs;
        *(_QWORD *)&v23 = *(_QWORD *)&lhs[16];
        CMTimeSubtract((CMTime *)time1, (CMTime *)time2, (CMTime *)&v22);
        v45 = *(_OWORD *)time1;
        *(_QWORD *)&v46[0] = *(_QWORD *)&time1[16];
        *(_OWORD *)time2 = *(_OWORD *)((char *)v46 + 8);
        *(_QWORD *)&time2[16] = *((_QWORD *)&v46[1] + 1);
        v22 = *(_OWORD *)lhs;
        *(_QWORD *)&v23 = *(_QWORD *)&lhs[16];
        CMTimeAdd((CMTime *)time1, (CMTime *)time2, (CMTime *)&v22);
        *(_OWORD *)((char *)v46 + 8) = *(_OWORD *)time1;
        *((_QWORD *)&v46[1] + 1) = *(_QWORD *)&time1[16];
      }
    }
  }
  *(_OWORD *)lhs = v43;
  *(_QWORD *)&lhs[16] = *(_QWORD *)v44;
  *(_OWORD *)time1 = *(_OWORD *)v8;
  *(_QWORD *)&time1[16] = *(_QWORD *)(v8 + 16);
  if (!CMTimeCompare((CMTime *)lhs, (CMTime *)time1))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("enableStartupSyncWorkaround"));

    if (v12)
    {
      memset(lhs, 0, 24);
      CMTimeMake((CMTime *)lhs, -1, -[JFXCompositionItem timeScale](self, "timeScale"));
      *(_OWORD *)time2 = v43;
      *(_QWORD *)&time2[16] = *(_QWORD *)v44;
      v22 = *(_OWORD *)lhs;
      *(_QWORD *)&v23 = *(_QWORD *)&lhs[16];
      CMTimeSubtract((CMTime *)time1, (CMTime *)time2, (CMTime *)&v22);
      v43 = *(_OWORD *)time1;
      *(_QWORD *)v44 = *(_QWORD *)&time1[16];
      *(_OWORD *)time2 = *(_OWORD *)&v44[8];
      *(_QWORD *)&time2[16] = *(_QWORD *)&v44[24];
      v22 = *(_OWORD *)lhs;
      *(_QWORD *)&v23 = *(_QWORD *)&lhs[16];
      CMTimeAdd((CMTime *)time1, (CMTime *)time2, (CMTime *)&v22);
      *(_OWORD *)&v44[8] = *(_OWORD *)time1;
      *(_QWORD *)&v44[24] = *(_QWORD *)&time1[16];
      *(_OWORD *)time2 = v45;
      *(_QWORD *)&time2[16] = *(_QWORD *)&v46[0];
      v22 = *(_OWORD *)lhs;
      *(_QWORD *)&v23 = *(_QWORD *)&lhs[16];
      CMTimeSubtract((CMTime *)time1, (CMTime *)time2, (CMTime *)&v22);
      v45 = *(_OWORD *)time1;
      *(_QWORD *)&v46[0] = *(_QWORD *)&time1[16];
      *(_OWORD *)time2 = *(_OWORD *)((char *)v46 + 8);
      *(_QWORD *)&time2[16] = *((_QWORD *)&v46[1] + 1);
      v22 = *(_OWORD *)lhs;
      *(_QWORD *)&v23 = *(_QWORD *)&lhs[16];
      CMTimeAdd((CMTime *)time1, (CMTime *)time2, (CMTime *)&v22);
      *(_OWORD *)((char *)v46 + 8) = *(_OWORD *)time1;
      *((_QWORD *)&v46[1] + 1) = *(_QWORD *)&time1[16];
    }
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  *(_OWORD *)lhs = v45;
  *(_OWORD *)&lhs[16] = v46[0];
  v28 = v46[1];
  *(_OWORD *)time1 = v43;
  *(_OWORD *)&time1[16] = *(_OWORD *)v44;
  v33 = *(_OWORD *)&v44[16];
  -[JFXMovieCompositionItem speedRangesForSourceRange:destinationRange:](self, "speedRangesForSourceRange:destinationRange:", lhs, time1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
    v17 = *MEMORY[0x24BDB1C90];
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        memset(lhs, 0, sizeof(lhs));
        if (v19)
          objc_msgSend(v19, "CMTimeMappingValue");
        *(_OWORD *)time2 = *(_OWORD *)lhs;
        *(_OWORD *)&time2[16] = *(_OWORD *)&lhs[16];
        v26 = v28;
        *(_OWORD *)time1 = v29;
        *(_OWORD *)&time1[16] = v30;
        v33 = v31;
        v22 = v29;
        v23 = v30;
        v24 = v31;
        -[JFXMovieCompositionItem segmentWithCharacteristic:sourceRange:destinationRange:](self, "segmentWithCharacteristic:sourceRange:destinationRange:", v17, time2, &v22);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          *(_OWORD *)time2 = *(_OWORD *)time1;
          *(_OWORD *)&time2[16] = *(_OWORD *)&time1[16];
          v26 = v33;
          -[JFXCompositionItem emptyTrackSegmentWithDestinationRange:](self, "emptyTrackSegmentWithDestinationRange:", time2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v20)
            continue;
        }
        objc_msgSend(v7, "addObject:", v20);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
    }
    while (v15);
  }

  return v7;
}

- (id)audioTrackSegmentsLoopedWithDestinationTime:(id *)a3
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CMTime v9;
  CMTime v10;
  CMTime lhs;
  CMTime v12;
  CMTime rhs;
  __int128 v14;
  _BYTE v15[32];

  -[JFXCompositionItem audioStartOffset](self, "audioStartOffset");
  v6 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&v7 = a3->var3;
  CMTimeAdd((CMTime *)&v14, (CMTime *)&v6, &rhs);
  memset(&v15[8], 0, 24);
  -[JFXCompositionItem destinationDuration](self, "destinationDuration");
  -[JFXCompositionItem audioStartOffset](self, "audioStartOffset");
  CMTimeSubtract(&v12, &lhs, &v10);
  -[JFXCompositionItem audioEndOffset](self, "audioEndOffset");
  CMTimeAdd((CMTime *)&v6, &v12, &v9);
  *(_QWORD *)&v15[24] = v7;
  *(_OWORD *)&v15[8] = v6;
  v6 = v14;
  v7 = *(_OWORD *)v15;
  v8 = *(_OWORD *)&v15[16];
  -[JFXMovieCompositionItem audioTrackSegmentsLoopedForDestinationTimeRange:](self, "audioTrackSegmentsLoopedForDestinationTimeRange:", &v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)audioTrackSegmentsLoopedForDestinationTimeRange:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  CMTimeRange v19;
  _BYTE duration[32];
  __int128 v21;
  _BYTE time2[32];
  __int128 v23;
  CMTime v24;
  CMTime v25;
  CMTimeRange time1;
  CMTime v27;
  CMTime var0;
  CMTime v29;
  CMTime rhs;
  CMTime v31;
  CMTime lhs;
  CMTime v33[2];
  CMTime time;
  CMTime v35;
  CMTime v36;

  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXMovieCompositionItem audioAssetOverwrite](self, "audioAssetOverwrite");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[JFXMovieCompositionItem audioAssetOverwrite](self, "audioAssetOverwrite");
  else
    -[JFXMovieCompositionItem asset](self, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  memset(&v36, 0, sizeof(v36));
  if (v7)
    objc_msgSend(v7, "duration");
  else
    memset(&time, 0, sizeof(time));
  -[JFXCompositionItem speed](self, "speed");
  CMTimeMultiplyByFloat64(&v35, &time, 1.0 / v9);
  CMTimeConvertScale(&v36, &v35, -[JFXCompositionItem timeScale](self, "timeScale"), kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  memset(v33, 0, sizeof(v33));
  if (v6)
  {
    -[JFXCompositionItem sourceTimeRange](self, "sourceTimeRange");
    lhs = v31;
    CMTimeMake(&rhs, -[JFXMovieCompositionItem audioAssetOverwriteStartOffset](self, "audioAssetOverwriteStartOffset"), -[JFXCompositionItem timeScale](self, "timeScale"));
    CMTimeAdd(v33, &lhs, &rhs);
  }
  else
  {
    -[JFXCompositionItem sourceTimeRange](self, "sourceTimeRange");
    v33[0] = v29;
  }
  time1.start = v33[0];
  *(CMTime *)time2 = v36;
  if (CMTimeCompare(&time1.start, (CMTime *)time2) >= 1)
  {
    do
    {
      *(CMTime *)time2 = v33[0];
      *(CMTime *)duration = v36;
      CMTimeSubtract(&time1.start, (CMTime *)time2, (CMTime *)duration);
      v33[0] = time1.start;
      *(CMTime *)time2 = v36;
    }
    while (CMTimeCompare(&time1.start, (CMTime *)time2) > 0);
  }
  v10 = *(_OWORD *)&a3->var0.var3;
  var0 = (CMTime)a3->var0;
  memset(&v27, 0, sizeof(v27));
  v11 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&time1.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&time1.start.epoch = v10;
  *(_OWORD *)&time1.duration.timescale = v11;
  CMTimeRangeGetEnd(&v27, &time1);
  time1.start = var0;
  *(CMTime *)time2 = v27;
  if (CMTimeCompare(&time1.start, (CMTime *)time2) < 0)
  {
    v16 = *MEMORY[0x24BDB1C90];
    while (1)
    {
      time1.start = v36;
      *(CMTime *)time2 = v33[0];
      CMTimeSubtract(&v25, &time1.start, (CMTime *)time2);
      time1.start = v27;
      *(CMTime *)time2 = var0;
      CMTimeSubtract(&v24, &time1.start, (CMTime *)time2);
      CMTimeMinimum(&time1.start, &v25, &v24);
      v33[1] = time1.start;
      if (v36.value <= 0)
      {
        *(CMTime *)time2 = v27;
        *(CMTime *)duration = var0;
        CMTimeSubtract(&time1.start, (CMTime *)time2, (CMTime *)duration);
        v33[1] = time1.start;
        if (v36.value < 1)
          break;
      }
      memset(&time1, 0, sizeof(time1));
      *(CMTime *)time2 = var0;
      *(CMTime *)duration = v33[1];
      CMTimeRangeMake(&time1, (CMTime *)time2, (CMTime *)duration);
      v23 = 0u;
      *(_OWORD *)duration = *(_OWORD *)&v33[0].value;
      *(_OWORD *)&duration[16] = *(_OWORD *)&v33[0].epoch;
      v21 = *(_OWORD *)&v33[1].timescale;
      memset(time2, 0, sizeof(time2));
      -[JFXMovieCompositionItem applySpeed:](self, "applySpeed:", duration);
      *(_OWORD *)duration = *(_OWORD *)time2;
      *(_OWORD *)&duration[16] = *(_OWORD *)&time2[16];
      v21 = v23;
      v19 = time1;
      -[JFXMovieCompositionItem segmentWithCharacteristic:sourceRange:destinationRange:](self, "segmentWithCharacteristic:sourceRange:destinationRange:", v16, duration, &v19);
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
        break;
      v18 = (void *)v17;
      objc_msgSend(v5, "arrayByAddingObject:", v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      *(CMTime *)duration = var0;
      v19.start = v33[1];
      CMTimeAdd(&var0, (CMTime *)duration, &v19.start);
      CMTimeMake((CMTime *)duration, 0, -[JFXCompositionItem timeScale](self, "timeScale"));
      v33[0] = *(CMTime *)duration;

      time1.start = var0;
      *(CMTime *)time2 = v27;
      v5 = v12;
      if ((CMTimeCompare(&time1.start, (CMTime *)time2) & 0x80000000) == 0)
        goto LABEL_14;
    }
  }
  v12 = v5;
LABEL_14:
  if (!objc_msgSend(v12, "count"))
  {
    time1.start = v27;
    -[JFXCompositionItem emptyTrackSegmentWithDestinationTime:](self, "emptyTrackSegmentWithDestinationTime:", &time1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v12, "arrayByAddingObject:", v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v14;
    }

  }
  return v12;
}

- (AVAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (AVAsset)audioAssetOverwrite
{
  return self->_audioAssetOverwrite;
}

- (void)setAudioAssetOverwrite:(id)a3
{
  objc_storeStrong((id *)&self->_audioAssetOverwrite, a3);
}

- (int)audioAssetOverwriteStartOffset
{
  return self->_audioAssetOverwriteStartOffset;
}

- (void)setAudioAssetOverwriteStartOffset:(int)a3
{
  self->_audioAssetOverwriteStartOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAssetOverwrite, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)segmentWithCharacteristic:(uint64_t)a1 sourceRange:(NSObject *)a2 destinationRange:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_2269A9000, a2, OS_LOG_TYPE_DEBUG, "Can only create an AVCompositionTrackSegment from a AVURLAsset, not %@", (uint8_t *)&v2, 0xCu);
}

void __82__JFXMovieCompositionItem_segmentWithCharacteristic_sourceRange_destinationRange___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 138412546;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_2269A9000, a2, OS_LOG_TYPE_DEBUG, "Asset %@ appears to not have any tracks with characteristic %@", (uint8_t *)&v4, 0x16u);
}

- (void)videoTrackSegmentsWithDestinationRange:(os_log_t)log .cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_2269A9000, log, OS_LOG_TYPE_DEBUG, "segmentWithCharacteristic returned nil !", buf, 2u);
}

@end
