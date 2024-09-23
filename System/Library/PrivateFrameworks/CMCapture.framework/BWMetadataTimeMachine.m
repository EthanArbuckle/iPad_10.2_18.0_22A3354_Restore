@implementation BWMetadataTimeMachine

- (void)setEarliestAllowedPTS:(id *)a3
{
  NSObject *metadataHandlingQueue;
  _QWORD v4[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  if ((a3->var2 & 1) != 0)
  {
    metadataHandlingQueue = self->_metadataHandlingQueue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __47__BWMetadataTimeMachine_setEarliestAllowedPTS___block_invoke;
    v4[3] = &unk_1E491EED0;
    v4[4] = self;
    v5 = *a3;
    dispatch_sync(metadataHandlingQueue, v4);
  }
}

uint64_t __47__BWMetadataTimeMachine_setEarliestAllowedPTS___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  void *v4;
  _QWORD v6[4];
  CMTimeRange v7;
  CMTime duration;
  CMTime start;
  CMTimeRange v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 40);
  *(_QWORD *)(v2 + 72) = *(_QWORD *)(a1 + 56);
  *(_OWORD *)(v2 + 56) = v3;
  memset(&v10, 0, sizeof(v10));
  start = *(CMTime *)(a1 + 40);
  duration = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
  CMTimeRangeMake(&v10, &start, &duration);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__BWMetadataTimeMachine_setEarliestAllowedPTS___block_invoke_2;
  v6[3] = &__block_descriptor_80_e29_B32__0__NSDictionary_8Q16_B24l;
  v7 = v10;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectsAtIndexes:", objc_msgSend(v4, "indexesOfObjectsPassingTest:", v6));
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWMetadataTimeMachine)initWithName:(id)a3 capacity:(int)a4 metadataHandlingPriority:(unsigned int)a5 addHandler:(id)a6
{
  char *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BWMetadataTimeMachine;
  v9 = -[BWMetadataTimeMachine init](&v12, sel_init);
  if (v9)
  {
    *((_QWORD *)v9 + 1) = objc_msgSend(a3, "copy");
    *((_DWORD *)v9 + 4) = a4;
    *((_QWORD *)v9 + 3) = objc_msgSend(a6, "copy");
    *((_QWORD *)v9 + 4) = FigDispatchQueueCreateWithPriority();
    *((_QWORD *)v9 + 5) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
    *((_QWORD *)v9 + 6) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)(v9 + 56) = *MEMORY[0x1E0CA2E18];
    *((_QWORD *)v9 + 9) = *(_QWORD *)(v10 + 16);
  }
  return (BWMetadataTimeMachine *)v9;
}

- (void)dealloc
{
  objc_super v3;

  -[BWMetadataTimeMachine reset](self, "reset");

  v3.receiver = self;
  v3.super_class = (Class)BWMetadataTimeMachine;
  -[BWMetadataTimeMachine dealloc](&v3, sel_dealloc);
}

- (void)addMetadata:(id)a3
{
  uint64_t v4;
  NSObject *metadataHandlingQueue;
  _QWORD v6[6];

  if (a3)
  {
    v4 = objc_msgSend(a3, "copy");
    metadataHandlingQueue = self->_metadataHandlingQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37__BWMetadataTimeMachine_addMetadata___block_invoke;
    v6[3] = &unk_1E491E748;
    v6[4] = self;
    v6[5] = v4;
    dispatch_async(metadataHandlingQueue, v6);
  }
}

void __37__BWMetadataTimeMachine_addMetadata___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  _BOOL4 v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void **p_vtable;
  unint64_t v19;
  uint64_t v20;
  void **v21;
  uint64_t v22;
  _DWORD *v23;
  __int128 *v24;
  __int128 v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void **v29;
  void *v30;
  void **v31;
  unint64_t v32;
  int v33;
  BOOL v34;
  int v35;
  uint64_t v36;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  os_log_type_t type;
  int v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  CMTime v50;
  CMTime v51;
  CMTime time2;
  CMTime time1;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 24);
  if (v3)
    v4 = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(v2 + 40));
  else
    v4 = 0;
  memset(&v51, 0, sizeof(v51));
  v5 = *MEMORY[0x1E0D05D00];
  CMTimeMakeFromDictionary(&v51, (CFDictionaryRef)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00]));
  memset(&v50, 0, sizeof(v50));
  CMTimeMakeFromDictionary(&v50, (CFDictionaryRef)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "lastObject"), "objectForKeyedSubscript:", v5));
  if ((v50.flags & 1) != 0)
  {
    time1 = v51;
    time2 = v50;
    v6 = CMTimeCompare(&time1, &time2) > 0;
  }
  else
  {
    v6 = 1;
  }
  v7 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v7 + 68) & 1) != 0)
  {
    time1 = v51;
    time2 = *(CMTime *)(v7 + 56);
    v8 = CMTimeCompare(&time1, &time2) >= 0;
  }
  else
  {
    v8 = 1;
  }
  v9 = (v4 == 3 || !v4) && v6 && v8;
  v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
  v11 = *(_QWORD *)(a1 + 32);
  if ((v4 & 0xFFFFFFFE) == 2)
  {
    ++*(_DWORD *)(v11 + 80);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
    if (!v9)
    {
LABEL_45:
      if (v10 && dword_1EE6BE758)
      {
        v42 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      goto LABEL_48;
    }
  }
  else
  {
    *(_DWORD *)(v11 + 80) = 0;
    if (!v9)
      goto LABEL_45;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
  v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
  v13 = *(_QWORD *)(a1 + 32);
  if (v12 > *(int *)(v13 + 16))
    objc_msgSend(*(id *)(v13 + 40), "removeObjectAtIndex:", 0);
  if (v10)
  {
    v38 = v10;
    v40 = (void *)objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (!v15)
      goto LABEL_44;
    v16 = v15;
    v17 = 0;
    p_vtable = BWRedEyeReducerNode.vtable;
    v19 = 0x1EE6B0000uLL;
    v20 = *(_QWORD *)v47;
    v21 = BWRedEyeReducerNode.vtable;
    while (1)
    {
      v22 = 0;
      v39 = v16;
      do
      {
        if (*(_QWORD *)v47 != v20)
          objc_enumerationMutation(v14);
        v23 = *(_DWORD **)(*((_QWORD *)&v46 + 1) + 8 * v22);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v23)
          {
            v24 = (__int128 *)((char *)v23 + *(int *)(v19 + 4000));
            v25 = v24[1];
            v43 = *v24;
            v44 = v25;
            v45 = v24[2];
          }
          else
          {
            v44 = 0u;
            v45 = 0u;
            v43 = 0u;
          }
          v26 = -[BWMetadataTimeMachine _metadataForPTSRange:](*(_QWORD *)(a1 + 32), (uint64_t)&v43);
          if (v26)
          {
            -[BWMetadataTimeMachineMetadataRequest completeWithMetadata:](v23, v26);
LABEL_38:
            objc_msgSend(v40, "addIndex:", v17 + v22);
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v27 = v20;
            v28 = v17;
            v29 = p_vtable;
            v30 = v14;
            v31 = v21;
            v32 = v19;
            v33 = v23 ? v23[4] : 0;
            v34 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count") >= (unint64_t)v33;
            v19 = v32;
            v21 = v31;
            v14 = v30;
            p_vtable = v29;
            v17 = v28;
            v20 = v27;
            v16 = v39;
            if (v34)
            {
              v35 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
              if (v23)
              {
                v23[5] = v35;
                time1.value = (CMTimeValue)v23;
                *(_QWORD *)&time1.timescale = BWMetadataTimeMachineWaitRequest;
                -[CMTime complete]((objc_super *)&time1, sel_complete);
              }
              goto LABEL_38;
            }
          }
        }
        ++v22;
      }
      while (v16 != v22);
      v36 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      v16 = v36;
      v17 += v22;
      if (!v36)
      {
LABEL_44:
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectsAtIndexes:", v40);
        v10 = v38;
        goto LABEL_45;
      }
    }
  }
LABEL_48:

}

- (void)_metadataForPTSRange:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  CMTimeValue v10;
  uint64_t v11;
  CMTimeEpoch v12;
  void *v13;
  CMTimeFlags v15;
  CMTimeEpoch v16;
  CMTimeValue v17;
  CMTimeEpoch v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CMTimeRange start;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CMTime v37;
  CMTime v38;
  CMTime v39;
  CMTime rhs;
  CMTime end;
  CMTimeRange time1;
  CMTime time2;
  CMTime duration;
  CMTime v45;
  _BYTE v46[128];
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!_FigIsCurrentDispatchQueue())
  {
    v30 = v2;
    LODWORD(v29) = 0;
    FigDebugAssert3();
  }
  if ((*(_BYTE *)(a2 + 12) & 1) == 0
    || (*(_BYTE *)(a2 + 36) & 1) == 0
    || *(_QWORD *)(a2 + 40)
    || (*(_QWORD *)(a2 + 24) & 0x8000000000000000) != 0)
  {
    return 0;
  }
  memset(&v45, 0, sizeof(v45));
  CMTimeMake(&v45, 1, 1000);
  v5 = MEMORY[0x1E0CA2E40];
  value = *MEMORY[0x1E0CA2E40];
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 8);
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    memset(&start, 0, 24);
    v6 = (void *)objc_msgSend(*(id *)(a1 + 40), "firstObject");
    v7 = *MEMORY[0x1E0D05D00];
    CMTimeMakeFromDictionary(&start.start, (CFDictionaryRef)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00]));
    memset(&duration, 0, sizeof(duration));
    CMTimeMakeFromDictionary(&duration, (CFDictionaryRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "lastObject"), "objectForKeyedSubscript:", v7));
    *(_OWORD *)&time1.start.value = *(_OWORD *)&start.start.value;
    time1.start.epoch = start.start.epoch;
    time2 = duration;
    if (CMTimeCompare(&time1.start, &time2) > 0)
    {
      FigDebugAssert3();
      return 0;
    }
    time2 = start.start;
    end = duration;
    CMTimeRangeFromTimeToTime(&time1, &time2, &end);
  }
  else
  {
    if ((*(_BYTE *)(a1 + 68) & 1) == 0)
    {
      flags = *(_DWORD *)(v5 + 12);
      epoch = *(_QWORD *)(v5 + 16);
      v10 = *(_QWORD *)(v5 + 24);
      v11 = *(_QWORD *)(v5 + 32);
      v12 = *(_QWORD *)(v5 + 40);
      goto LABEL_15;
    }
    *(_OWORD *)&start.start.value = *(_OWORD *)(a1 + 56);
    start.start.epoch = *(_QWORD *)(a1 + 72);
    duration = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    CMTimeRangeMake(&time1, &start.start, &duration);
  }
  value = time1.start.value;
  flags = time1.start.flags;
  timescale = time1.start.timescale;
  epoch = time1.start.epoch;
  v10 = time1.duration.value;
  v12 = time1.duration.epoch;
  v11 = *(_QWORD *)&time1.duration.timescale;
LABEL_15:
  if ((flags & 1) == 0)
    return 0;
  v13 = 0;
  if ((v11 & 0x100000000) != 0 && !v12)
  {
    v31 = v11;
    if ((v10 & 0x8000000000000000) == 0)
    {
      start.start.value = value;
      start.start.timescale = timescale;
      start.start.flags = flags;
      start.start.epoch = epoch;
      duration = v45;
      CMTimeSubtract(&time1.start, &start.start, &duration);
      value = time1.start.value;
      v15 = time1.start.flags;
      timescale = time1.start.timescale;
      v16 = time1.start.epoch;
      time1.start = v45;
      CMTimeMultiply(&rhs, &time1.start, 2);
      start.start.value = v10;
      *(_QWORD *)&start.start.timescale = v31;
      start.start.epoch = 0;
      CMTimeAdd(&time1.start, &start.start, &rhs);
      v17 = time1.start.value;
      v18 = time1.start.epoch;
      v19 = *(_QWORD *)&time1.start.timescale;
      v20 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)&time1.start.value = *(_OWORD *)a2;
      *(_OWORD *)&time1.start.epoch = v20;
      *(_OWORD *)&time1.duration.timescale = *(_OWORD *)(a2 + 32);
      CMTimeRangeGetEnd(&v39, &time1);
      time1.start.value = value;
      time1.start.timescale = timescale;
      time1.start.flags = v15;
      time1.start.epoch = v16;
      time1.duration.value = v17;
      *(_QWORD *)&time1.duration.timescale = v19;
      time1.duration.epoch = v18;
      CMTimeRangeGetEnd(&v38, &time1);
      v13 = 0;
      if (CMTimeCompare(&v39, &v38) <= 0)
      {
        v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v21 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)&time1.start.value = *(_OWORD *)a2;
        *(_OWORD *)&time1.start.epoch = v21;
        *(_OWORD *)&time1.duration.timescale = *(_OWORD *)(a2 + 32);
        *(_OWORD *)&start.start.value = *(_OWORD *)&time1.start.value;
        start.start.epoch = *(_QWORD *)(a2 + 16);
        duration = v45;
        CMTimeSubtract(&time1.start, &start.start, &duration);
        start.start = v45;
        CMTimeMultiply(&v37, &start.start, 2);
        duration = time1.duration;
        CMTimeAdd(&start.start, &duration, &v37);
        time1.duration = start.start;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v22 = *(void **)(a1 + 40);
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v34;
          v26 = *MEMORY[0x1E0D05D00];
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v34 != v25)
                objc_enumerationMutation(v22);
              v28 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              memset(&duration, 0, sizeof(duration));
              CMTimeMakeFromDictionary(&duration, (CFDictionaryRef)objc_msgSend(v28, "objectForKeyedSubscript:", v26, v29, v30));
              start = time1;
              time2 = duration;
              if (CMTimeRangeContainsTime(&start, &time2))
                objc_msgSend(v13, "addObject:", v28);
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
          }
          while (v24);
        }
      }
    }
  }
  return v13;
}

- (void)addDroppedFrameForPortType:(id)a3 pts:(id *)a4
{
  const __CFAllocator *v6;
  CFDictionaryRef v7;
  uint64_t v8;
  CMTime v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  if ((a4->var2 & 1) != 0)
  {
    v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v9 = *(CMTime *)a4;
    v7 = CMTimeCopyAsDictionary(&v9, v6);
    v8 = *MEMORY[0x1E0D05D00];
    v10[0] = *MEMORY[0x1E0D06D00];
    v10[1] = v8;
    v11[0] = a3;
    v11[1] = v7;
    v10[2] = CFSTR("IsDroppedFrameMetadataKey");
    v11[2] = MEMORY[0x1E0C9AAB0];
    -[BWMetadataTimeMachine addMetadata:](self, "addMetadata:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3));

  }
}

- (id)metadataForPTSRange:(id *)a3 timeout:(float)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v8;
  NSObject *metadataHandlingQueue;
  double v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  void *v16;
  os_log_type_t v18;
  int v19;
  _QWORD block[7];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;
  _BYTE type[12];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (dword_1EE6BE758)
  {
    LODWORD(v24) = 0;
    type[0] = 0;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v31 = 0;
  v32 = &v31;
  v33 = 0x3052000000;
  v34 = __Block_byref_object_copy__2;
  v35 = __Block_byref_object_dispose__2;
  v36 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3052000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  if ((a3->var0.var2 & 1) != 0
    && (a3->var1.var2 & 1) != 0
    && !a3->var1.var3
    && (a3->var1.var0 & 0x8000000000000000) == 0)
  {
    block[1] = 3221225472;
    v8 = *(_OWORD *)&a3->var0.var3;
    v21 = *(_OWORD *)&a3->var0.var0;
    metadataHandlingQueue = self->_metadataHandlingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __53__BWMetadataTimeMachine_metadataForPTSRange_timeout___block_invoke;
    block[3] = &unk_1E491EFA8;
    block[4] = self;
    block[5] = &v24;
    v22 = v8;
    v23 = *(_OWORD *)&a3->var1.var1;
    block[6] = &v31;
    dispatch_sync(metadataHandlingQueue, block);
    v11 = (void *)v32[5];
    if (v11)
    {
      *(float *)&v10 = a4;
      objc_msgSend(v11, "waitForCompletionWithTimeout:", v10);
      v12 = (_QWORD *)v32[5];
      if (v12)
        v12 = (_QWORD *)v12[8];
      v13 = v12;
      v25[5] = (uint64_t)v13;

    }
  }
  if (dword_1EE6BE758)
  {
    v19 = 0;
    v18 = OS_LOG_TYPE_DEFAULT;
    v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v15 = (id)v25[5];
  if (v15)
    v16 = v15;
  else
    v16 = (void *)MEMORY[0x1E0C9AA60];
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v31, 8);
  return v16;
}

void *__53__BWMetadataTimeMachine_metadataForPTSRange_timeout___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  void *result;
  BWMetadataTimeMachineMetadataRequest *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  objc_super v11;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 72);
  v8 = *(_OWORD *)(a1 + 56);
  v9 = v3;
  v10 = *(_OWORD *)(a1 + 88);
  result = -[BWMetadataTimeMachine _metadataForPTSRange:](v2, (uint64_t)&v8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v5 = [BWMetadataTimeMachineMetadataRequest alloc];
    v6 = *(_OWORD *)(a1 + 72);
    v8 = *(_OWORD *)(a1 + 56);
    v9 = v6;
    v10 = *(_OWORD *)(a1 + 88);
    if (v5)
    {
      v11.receiver = v5;
      v11.super_class = (Class)BWMetadataTimeMachineMetadataRequest;
      v5 = (BWMetadataTimeMachineMetadataRequest *)objc_msgSendSuper2(&v11, sel_init);
      if (v5)
      {
        v7 = v9;
        *(_OWORD *)&v5->_ptsRange.start.value = v8;
        *(_OWORD *)&v5->_ptsRange.start.epoch = v7;
        *(_OWORD *)&v5->_ptsRange.duration.timescale = v10;
      }
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v5;
    return (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v8, v9, v10);
  }
  return result;
}

- (id)metadata
{
  NSObject *metadataHandlingQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  metadataHandlingQueue = self->_metadataHandlingQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__BWMetadataTimeMachine_metadata__block_invoke;
  v5[3] = &unk_1E491E9A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(metadataHandlingQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__BWMetadataTimeMachine_metadata__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)waitUntilCapacity:(int)a3 timeout:(float)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _DWORD *v8;
  NSObject *metadataHandlingQueue;
  double v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  _QWORD block[7];
  int v17;
  os_log_type_t type;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (dword_1EE6BE758)
  {
    v19 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v8 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3052000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (self->_capacity >= a3)
  {
    metadataHandlingQueue = self->_metadataHandlingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__BWMetadataTimeMachine_waitUntilCapacity_timeout___block_invoke;
    block[3] = &unk_1E491EFD0;
    block[4] = self;
    block[5] = &v20;
    v17 = a3;
    block[6] = &v24;
    dispatch_sync(metadataHandlingQueue, block);
    v11 = (void *)v25[5];
    if (v11)
    {
      *(float *)&v10 = a4;
      objc_msgSend(v11, "waitForCompletionWithTimeout:", v10);
      v12 = v25;
      v13 = v25[5];
      if (v13)
        LODWORD(v13) = *(_DWORD *)(v13 + 20);
      *((_DWORD *)v21 + 6) = v13;

    }
  }
  if (*v8 == 1)
    kdebug_trace();
  v14 = *((_DWORD *)v21 + 6) >= a3;
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v14;
}

uint64_t __51__BWMetadataTimeMachine_waitUntilCapacity_timeout___block_invoke(uint64_t a1)
{
  uint64_t result;
  BWMetadataTimeMachineWaitRequest *v3;
  int v4;
  objc_super v5;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < *(_DWORD *)(a1 + 56))
  {
    v3 = [BWMetadataTimeMachineWaitRequest alloc];
    if (v3)
    {
      v4 = *(_DWORD *)(a1 + 56);
      v5.receiver = v3;
      v5.super_class = (Class)BWMetadataTimeMachineWaitRequest;
      v3 = (BWMetadataTimeMachineWaitRequest *)objc_msgSendSuper2(&v5, sel_init);
      if (v3)
        v3->_capacity = v4;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v3;
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
  return result;
}

- (void)reset
{
  NSObject *metadataHandlingQueue;
  _QWORD block[5];

  if (!_FigIsNotCurrentDispatchQueue())
    FigDebugAssert3();
  metadataHandlingQueue = self->_metadataHandlingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__BWMetadataTimeMachine_reset__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(metadataHandlingQueue, block);
}

uint64_t __30__BWMetadataTimeMachine_reset__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t i;
  _DWORD *v7;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    v5 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v1);
        v7 = *(_DWORD **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[BWMetadataTimeMachineMetadataRequest completeWithMetadata:](v7, v5);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && v7)
          {
            v7[5] = 0;
            v14.receiver = v7;
            v14.super_class = (Class)BWMetadataTimeMachineWaitRequest;
            objc_msgSendSuper2(&v14, sel_complete);
          }
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v3);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
}

BOOL __47__BWMetadataTimeMachine_setEarliestAllowedPTS___block_invoke_2(_OWORD *a1, void *a2)
{
  __int128 v3;
  CMTimeRange v5;
  CMTime time;

  CMTimeMakeFromDictionary(&time, (CFDictionaryRef)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00]));
  v3 = a1[3];
  *(_OWORD *)&v5.start.value = a1[2];
  *(_OWORD *)&v5.start.epoch = v3;
  *(_OWORD *)&v5.duration.timescale = a1[4];
  return CMTimeRangeContainsTime(&v5, &time) == 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)earliestAllowedPTS
{
  NSObject *metadataHandlingQueue;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3810000000;
  v10 = &unk_1A33536F2;
  v11 = *MEMORY[0x1E0CA2E18];
  v12 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  metadataHandlingQueue = self->_metadataHandlingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__BWMetadataTimeMachine_earliestAllowedPTS__block_invoke;
  block[3] = &unk_1E491E9A8;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(metadataHandlingQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __43__BWMetadataTimeMachine_earliestAllowedPTS__block_invoke(uint64_t a1)
{
  uint64_t v1;
  __n128 *v2;
  __n128 result;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  result = *(__n128 *)(v1 + 56);
  v2[3].n128_u64[0] = *(_QWORD *)(v1 + 72);
  v2[2] = result;
  return result;
}

- (NSString)name
{
  return self->_name;
}

@end
