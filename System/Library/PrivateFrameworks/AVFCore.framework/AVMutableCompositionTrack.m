@implementation AVMutableCompositionTrack

- (void)_notifyAssetThatDurationWillChange
{
  -[AVAsset willChangeValueForKey:](-[AVAssetTrack asset](self, "asset"), "willChangeValueForKey:", CFSTR("duration"));
}

- (void)_notifyAssetThatDurationDidChangeWithSuccess:(BOOL)a3
{
  _BOOL4 v3;
  AVAsset *v5;

  v3 = a3;
  -[AVAsset didChangeValueForKey:](-[AVAssetTrack asset](self, "asset"), "didChangeValueForKey:", CFSTR("duration"));
  if (v3)
  {
    v5 = -[AVAssetTrack asset](self, "asset");
    if (v5)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVAssetDurationDidChangeNotification"), v5);
  }
}

- (void)_notifySelfThatSegmentsWillChange
{
  -[AVMutableCompositionTrack _notifyAssetThatDurationWillChange](self, "_notifyAssetThatDurationWillChange");
  -[AVMutableCompositionTrack willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("segments"));
}

- (void)_notifySelfThatSegmentsDidChangeWithSuccess:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[AVMutableCompositionTrack _notifyAssetThatDurationDidChangeWithSuccess:](self, "_notifyAssetThatDurationDidChangeWithSuccess:");
  -[AVMutableCompositionTrack didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("segments"));
  if (v3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVAssetTrackTimeRangeDidChangeNotification"), self);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVAssetTrackSegmentsDidChangeNotification"), self);
  }
}

- (BOOL)isEnabled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableCompositionTrack;
  return -[AVCompositionTrack isEnabled](&v3, sel_isEnabled);
}

- (void)setEnabled:(BOOL)enabled
{
  uint64_t v4;

  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", enabled);
  -[AVMutableCompositionTrack _setTrackReaderPropertyValue:forKey:](self, "_setTrackReaderPropertyValue:forKey:", v4, *MEMORY[0x1E0CC4848]);
}

- (NSArray)segments
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableCompositionTrack;
  return -[AVCompositionTrack segments](&v3, sel_segments);
}

- (void)setSegments:(NSArray *)segments
{
  OpaqueFigMutableComposition *v5;
  uint64_t v6;
  __int128 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 *v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  unsigned int (*v15)(OpaqueFigMutableComposition *, uint64_t, uint64_t, __int128 *);
  _BOOL8 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = -[AVCompositionTrack _mutableComposition](self, "_mutableComposition");
  v6 = -[NSArray count](segments, "count");
  -[AVMutableCompositionTrack _notifyAssetThatDurationWillChange](self, "_notifyAssetThatDurationWillChange");
  if (v6 < 1)
  {
    v7 = 0;
  }
  else
  {
    v7 = (__int128 *)malloc_type_malloc(108 * v6, 0x1060040CB727B4DuLL);
    if (!v7)
    {
      v16 = 1;
      goto LABEL_18;
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](segments, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      v11 = v7;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(segments);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (v13)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "timeMapping");
          }
          else
          {
            v21 = 0u;
            v22 = 0u;
            v19 = 0u;
            v20 = 0u;
            v17 = 0u;
            v18 = 0u;
          }
          *v11 = v17;
          v11[1] = v18;
          v11[4] = v21;
          v11[5] = v22;
          v11[2] = v19;
          v11[3] = v20;
          *((_QWORD *)v11 + 12) = objc_msgSend(v13, "sourceURL", v17, v18, v19, v20, v21, v22);
          *((_DWORD *)v11 + 26) = objc_msgSend(v13, "sourceTrackID");
          v11 = (__int128 *)((char *)v11 + 108);
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](segments, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }
  }
  v14 = -[AVAssetTrack trackID](self, "trackID");
  v15 = *(unsigned int (**)(OpaqueFigMutableComposition *, uint64_t, uint64_t, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
  if (v15)
    v16 = v15(v5, v14, v6, v7) == 0;
  else
    v16 = 0;
LABEL_18:
  free(v7);
  -[AVMutableCompositionTrack _notifyAssetThatDurationDidChangeWithSuccess:](self, "_notifyAssetThatDurationDidChangeWithSuccess:", v16);
}

- (BOOL)_insertTimeRange:(id *)a3 ofTrack:(id)a4 atTime:(id *)a5 fireKVO:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  OpaqueFigMutableComposition *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(OpaqueFigMutableComposition *, uint64_t, uint64_t);
  signed int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(OpaqueFigMutableComposition *, uint64_t, uint64_t, uint64_t, __int128 *, __int128 *, __int128 *);
  OpaqueFigMutableComposition *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  signed int v27;
  __int128 v29;
  __int128 v30;
  int64_t v31;
  int64_t v32;
  __int128 v33;
  __int128 v34;
  int64_t v35;
  int64_t v36;
  __int128 v37;
  __int128 v38;
  int64_t var3;
  int64_t v40;
  __int128 v41;
  int64_t v42;
  __int128 v43;
  int64_t v44;
  __int128 v45;
  int64_t v46;

  v8 = a6;
  v13 = -[AVCompositionTrack _mutableComposition](self, "_mutableComposition");
  v14 = (void *)objc_msgSend(a4, "asset");
  v15 = objc_msgSend(v14, "_absoluteURL");
  v16 = objc_msgSend(v14, "_mutableComposition");
  if (v8)
    -[AVMutableCompositionTrack _notifySelfThatSegmentsWillChange](self, "_notifySelfThatSegmentsWillChange");
  if (v15)
  {
    v17 = objc_msgSend(v14, "_figAsset");
    v18 = *(uint64_t (**)(OpaqueFigMutableComposition *, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 16)
                                                                                    + 176);
    if (v18)
    {
      v19 = v18(v13, v15, v17);
      if (v19)
        goto LABEL_15;
      v20 = -[AVAssetTrack trackID](self, "trackID");
      v21 = objc_msgSend(a4, "trackID");
      v37 = *(_OWORD *)&a3->var0.var0;
      var3 = a3->var0.var3;
      v33 = *(_OWORD *)&a3->var1.var0;
      v35 = a3->var1.var3;
      v29 = *(_OWORD *)&a5->var0;
      v31 = a5->var3;
      v22 = *(uint64_t (**)(OpaqueFigMutableComposition *, uint64_t, uint64_t, uint64_t, __int128 *, __int128 *, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 88);
      if (v22)
      {
        v45 = v37;
        v46 = var3;
        v43 = v33;
        v44 = v35;
        v41 = v29;
        v42 = v31;
        v23 = v13;
        v24 = v20;
        v25 = v15;
LABEL_11:
        v19 = v22(v23, v24, v25, v21, &v45, &v43, &v41);
        goto LABEL_15;
      }
    }
    goto LABEL_12;
  }
  if (v16)
  {
    v26 = -[AVAssetTrack trackID](self, "trackID");
    v21 = objc_msgSend(a4, "trackID");
    v38 = *(_OWORD *)&a3->var0.var0;
    v40 = a3->var0.var3;
    v34 = *(_OWORD *)&a3->var1.var0;
    v36 = a3->var1.var3;
    v30 = *(_OWORD *)&a5->var0;
    v32 = a5->var3;
    v22 = *(uint64_t (**)(OpaqueFigMutableComposition *, uint64_t, uint64_t, uint64_t, __int128 *, __int128 *, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 184);
    if (v22)
    {
      v45 = v38;
      v46 = v40;
      v43 = v34;
      v44 = v36;
      v41 = v30;
      v42 = v32;
      v23 = v13;
      v24 = v26;
      v25 = v16;
      goto LABEL_11;
    }
LABEL_12:
    v27 = -12782;
    if (!a7)
      goto LABEL_18;
    goto LABEL_16;
  }
  v19 = FigSignalErrorAt();
LABEL_15:
  v27 = v19;
  if (!a7)
    goto LABEL_18;
LABEL_16:
  if (v27)
    *a7 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v27, 0);
LABEL_18:
  if (v8)
    -[AVMutableCompositionTrack _notifySelfThatSegmentsDidChangeWithSuccess:](self, "_notifySelfThatSegmentsDidChangeWithSuccess:", v27 == 0);
  return v27 == 0;
}

- (BOOL)insertTimeRange:(CMTimeRange *)timeRange ofTrack:(AVAssetTrack *)track atTime:(CMTime *)startTime error:(NSError *)outError
{
  __int128 v6;
  CMTime v8;
  _OWORD v9[3];

  v6 = *(_OWORD *)&timeRange->start.epoch;
  v9[0] = *(_OWORD *)&timeRange->start.value;
  v9[1] = v6;
  v9[2] = *(_OWORD *)&timeRange->duration.timescale;
  v8 = *startTime;
  return -[AVMutableCompositionTrack _insertTimeRange:ofTrack:atTime:fireKVO:error:](self, "_insertTimeRange:ofTrack:atTime:fireKVO:error:", v9, track, &v8, 1, outError);
}

- (BOOL)insertTimeRanges:(NSArray *)timeRanges ofTracks:(NSArray *)tracks atTime:(CMTime *)startTime error:(NSError *)outError
{
  OpaqueFigMutableComposition *v9;
  void *v10;
  void *v11;
  void *v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  OpaqueFigMutableComposition *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(OpaqueFigMutableComposition *, uint64_t, uint64_t);
  signed int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFAllocator *v27;
  uint64_t i;
  void *v29;
  CFDictionaryRef v30;
  CFDictionaryRef v31;
  AVMutableCompositionTrack *v32;
  uint64_t v33;
  uint64_t (*v34)(OpaqueFigMutableComposition *, uint64_t, void *, void *, void *, void *, CMTime *);
  signed int v35;
  _BOOL8 v36;
  OpaqueFigMutableComposition *v38;
  AVMutableCompositionTrack *v41;
  uint64_t v42;
  NSArray *v43;
  NSArray *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  CMTime time;
  CMTime v49[2];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v9 = -[AVCompositionTrack _mutableComposition](self, "_mutableComposition");
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v46 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = self;
  -[AVMutableCompositionTrack _notifySelfThatSegmentsWillChange](self, "_notifySelfThatSegmentsWillChange");
  v13 = -[NSArray count](timeRanges, "count");
  if (v13 != -[NSArray count](tracks, "count"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Count of timeRanges array and count of tracks array do not match."), 0));
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v47 = -[NSArray countByEnumeratingWithState:objects:count:](tracks, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v47)
  {
    v14 = *(_QWORD *)v55;
    v44 = timeRanges;
    v45 = *MEMORY[0x1E0C9B0D0];
    v42 = *(_QWORD *)v55;
    v43 = tracks;
LABEL_4:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v55 != v14)
        objc_enumerationMutation(tracks);
      v16 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v15);
      if (objc_msgSend(v16, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")))
      {
        objc_msgSend(v10, "addObject:", v45);
        objc_msgSend(v46, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0));
      }
      else
      {
        v17 = v9;
        v18 = (void *)objc_msgSend(v16, "asset");
        v19 = objc_msgSend(v18, "_absoluteURL");
        v20 = objc_msgSend(v18, "_mutableComposition");
        objc_msgSend(v46, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v16, "trackID")));
        if (v19)
        {
          objc_msgSend(v10, "addObject:", v19);
          v21 = objc_msgSend(v18, "_figAsset");
          v9 = v17;
          v22 = *(uint64_t (**)(OpaqueFigMutableComposition *, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                          + 176);
          if (!v22)
          {
            v35 = -12782;
            goto LABEL_35;
          }
          v23 = v22(v17, v19, v21);
          tracks = v43;
          timeRanges = v44;
          v14 = v42;
          if (v23)
            goto LABEL_34;
        }
        else
        {
          if (!v20)
          {
            v23 = FigSignalErrorAt();
LABEL_34:
            v35 = v23;
LABEL_35:
            v32 = v41;
            goto LABEL_37;
          }
          objc_msgSend(v10, "addObject:", v20);
          v9 = v17;
          tracks = v43;
          timeRanges = v44;
          v14 = v42;
        }
      }
      if (v47 == ++v15)
      {
        v47 = -[NSArray countByEnumeratingWithState:objects:count:](tracks, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
        if (v47)
          goto LABEL_4;
        break;
      }
    }
  }
  v38 = v9;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v24 = -[NSArray countByEnumeratingWithState:objects:count:](timeRanges, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v51;
    v27 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v51 != v26)
          objc_enumerationMutation(timeRanges);
        v29 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        memset(v49, 0, sizeof(v49));
        if (v29)
          objc_msgSend(v29, "CMTimeRangeValue");
        time = v49[0];
        v30 = CMTimeCopyAsDictionary(&time, v27);
        time = v49[1];
        v31 = CMTimeCopyAsDictionary(&time, v27);
        objc_msgSend(v11, "addObject:", v30);
        objc_msgSend(v12, "addObject:", v31);
        if (v30)
          CFRelease(v30);
        if (v31)
          CFRelease(v31);
      }
      v25 = -[NSArray countByEnumeratingWithState:objects:count:](timeRanges, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v25);
  }
  v32 = v41;
  v33 = -[AVAssetTrack trackID](v41, "trackID");
  time = *startTime;
  v34 = *(uint64_t (**)(OpaqueFigMutableComposition *, uint64_t, void *, void *, void *, void *, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 168);
  if (v34)
  {
    v49[0] = time;
    v35 = v34(v38, v33, v10, v46, v11, v12, v49);
  }
  else
  {
    v35 = -12782;
  }
LABEL_37:
  if (outError && v35)
    *outError = (NSError *)AVLocalizedErrorWithUnderlyingOSStatus(v35, 0);
  v36 = v35 == 0;
  -[AVMutableCompositionTrack _notifySelfThatSegmentsDidChangeWithSuccess:](v32, "_notifySelfThatSegmentsDidChangeWithSuccess:", v36);
  return v36;
}

- (void)_insertEmptyTimeRange:(id *)a3 fireKVO:(BOOL)a4
{
  _BOOL4 v4;
  OpaqueFigMutableComposition *v7;
  uint64_t v8;
  uint64_t (*v9)(OpaqueFigMutableComposition *, uint64_t, __int128 *, __int128 *);
  int v10;
  __int128 v11;
  int64_t v12;
  __int128 v13;
  int64_t var3;
  __int128 v15;
  int64_t v16;
  __int128 v17;
  int64_t v18;

  v4 = a4;
  v7 = -[AVCompositionTrack _mutableComposition](self, "_mutableComposition");
  if (v4)
    -[AVMutableCompositionTrack _notifySelfThatSegmentsWillChange](self, "_notifySelfThatSegmentsWillChange");
  v8 = -[AVAssetTrack trackID](self, "trackID");
  v13 = *(_OWORD *)&a3->var0.var0;
  var3 = a3->var0.var3;
  v11 = *(_OWORD *)&a3->var1.var0;
  v12 = a3->var1.var3;
  v9 = *(uint64_t (**)(OpaqueFigMutableComposition *, uint64_t, __int128 *, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                + 104);
  if (v9)
  {
    v17 = v13;
    v18 = var3;
    v15 = v11;
    v16 = v12;
    v10 = v9(v7, v8, &v17, &v15);
    if (!v4)
      return;
  }
  else
  {
    v10 = -12782;
    if (!v4)
      return;
  }
  -[AVMutableCompositionTrack _notifySelfThatSegmentsDidChangeWithSuccess:](self, "_notifySelfThatSegmentsDidChangeWithSuccess:", v10 == 0);
}

- (void)insertEmptyTimeRange:(CMTimeRange *)timeRange
{
  __int128 v3;
  _OWORD v4[3];

  v3 = *(_OWORD *)&timeRange->start.epoch;
  v4[0] = *(_OWORD *)&timeRange->start.value;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&timeRange->duration.timescale;
  -[AVMutableCompositionTrack _insertEmptyTimeRange:fireKVO:](self, "_insertEmptyTimeRange:fireKVO:", v4, 1);
}

- (void)_removeTimeRange:(id *)a3 fireKVO:(BOOL)a4
{
  _BOOL4 v4;
  OpaqueFigMutableComposition *v7;
  uint64_t v8;
  uint64_t (*v9)(OpaqueFigMutableComposition *, uint64_t, __int128 *, __int128 *);
  int v10;
  __int128 v11;
  int64_t v12;
  __int128 v13;
  int64_t var3;
  __int128 v15;
  int64_t v16;
  __int128 v17;
  int64_t v18;

  v4 = a4;
  v7 = -[AVCompositionTrack _mutableComposition](self, "_mutableComposition");
  if (v4)
    -[AVMutableCompositionTrack _notifySelfThatSegmentsWillChange](self, "_notifySelfThatSegmentsWillChange");
  v8 = -[AVAssetTrack trackID](self, "trackID");
  v13 = *(_OWORD *)&a3->var0.var0;
  var3 = a3->var0.var3;
  v11 = *(_OWORD *)&a3->var1.var0;
  v12 = a3->var1.var3;
  v9 = *(uint64_t (**)(OpaqueFigMutableComposition *, uint64_t, __int128 *, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                + 120);
  if (v9)
  {
    v17 = v13;
    v18 = var3;
    v15 = v11;
    v16 = v12;
    v10 = v9(v7, v8, &v17, &v15);
    if (!v4)
      return;
  }
  else
  {
    v10 = -12782;
    if (!v4)
      return;
  }
  -[AVMutableCompositionTrack _notifySelfThatSegmentsDidChangeWithSuccess:](self, "_notifySelfThatSegmentsDidChangeWithSuccess:", v10 == 0);
}

- (void)removeTimeRange:(CMTimeRange *)timeRange
{
  __int128 v3;
  _OWORD v4[3];

  v3 = *(_OWORD *)&timeRange->start.epoch;
  v4[0] = *(_OWORD *)&timeRange->start.value;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&timeRange->duration.timescale;
  -[AVMutableCompositionTrack _removeTimeRange:fireKVO:](self, "_removeTimeRange:fireKVO:", v4, 1);
}

- (void)scaleTimeRange:(CMTimeRange *)timeRange toDuration:(CMTime *)duration
{
  OpaqueFigMutableComposition *v7;
  uint64_t v8;
  unsigned int (*v9)(OpaqueFigMutableComposition *, uint64_t, __int128 *, CMTime *, CMTime *);
  _BOOL8 v10;
  CMTime v11;
  CMTime v12;
  __int128 v13;
  CMTimeEpoch epoch;
  CMTime v15;
  CMTime v16;
  __int128 v17;
  CMTimeEpoch v18;

  v7 = -[AVCompositionTrack _mutableComposition](self, "_mutableComposition");
  -[AVMutableCompositionTrack _notifySelfThatSegmentsWillChange](self, "_notifySelfThatSegmentsWillChange");
  v8 = -[AVAssetTrack trackID](self, "trackID");
  v13 = *(_OWORD *)&timeRange->start.value;
  epoch = timeRange->start.epoch;
  v12 = timeRange->duration;
  v11 = *duration;
  v9 = *(unsigned int (**)(OpaqueFigMutableComposition *, uint64_t, __int128 *, CMTime *, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 136);
  if (v9)
  {
    v17 = v13;
    v18 = epoch;
    v16 = v12;
    v15 = v11;
    v10 = v9(v7, v8, &v17, &v16, &v15) == 0;
  }
  else
  {
    v10 = 0;
  }
  -[AVMutableCompositionTrack _notifySelfThatSegmentsDidChangeWithSuccess:](self, "_notifySelfThatSegmentsDidChangeWithSuccess:", v10, *(_OWORD *)&v11.value, v11.epoch);
}

- (BOOL)validateTrackSegments:(NSArray *)trackSegments error:(NSError *)outError
{
  CMTimeEpoch v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL result;
  uint64_t v13;
  uint64_t v14;
  NSError **v15;
  __int128 v16;
  CMTime time2;
  CMTime time1;
  __int128 v19;
  _OWORD v20[2];
  __int128 v21;
  _OWORD v22[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CMTime v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v16 = *MEMORY[0x1E0CA2E68];
  v6 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v27.epoch = v6;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  *(_OWORD *)&v27.value = v16;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](trackSegments, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v15 = outError;
    v9 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(trackSegments);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        memset(v22, 0, sizeof(v22));
        v21 = 0u;
        v19 = 0u;
        memset(v20, 0, sizeof(v20));
        if (v11)
          objc_msgSend(v11, "timeMapping");
        *(_OWORD *)&time1.value = v21;
        time1.epoch = *(_QWORD *)&v22[0];
        time2 = v27;
        if (CMTimeCompare(&time1, &time2))
        {
          v13 = -11824;
LABEL_25:
          if (!v15)
            return 0;
          v14 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AVFoundationErrorDomain"), v13, 0);
          result = 0;
          *v15 = (NSError *)v14;
          return result;
        }
        if ((BYTE4(v22[1]) & 0x1D) != 1
          || (time1 = *(CMTime *)((char *)v22 + 8),
              *(_OWORD *)&time2.value = v16,
              time2.epoch = v6,
              CMTimeCompare(&time1, &time2) < 1))
        {
          v13 = -11825;
          goto LABEL_25;
        }
        if (objc_msgSend(v11, "sourceURL"))
        {
          if ((BYTE12(v19) & 0x1D) != 1
            || (*(_OWORD *)&time1.value = v19,
                time1.epoch = *(_QWORD *)&v20[0],
                *(_OWORD *)&time2.value = v16,
                time2.epoch = v6,
                CMTimeCompare(&time1, &time2) < 0))
          {
LABEL_22:
            v13 = -11826;
            goto LABEL_25;
          }
          if ((BYTE4(v20[1]) & 0x1D) != 1
            || (time1 = *(CMTime *)((char *)v20 + 8),
                *(_OWORD *)&time2.value = v16,
                time2.epoch = v6,
                CMTimeCompare(&time1, &time2) < 1))
          {
            v13 = -11827;
            goto LABEL_25;
          }
        }
        else if ((BYTE12(v19) & 1) != 0)
        {
          goto LABEL_22;
        }
        time1 = v27;
        time2 = *(CMTime *)((char *)v22 + 8);
        CMTimeAdd(&v27, &time1, &time2);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](trackSegments, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v8)
        continue;
      break;
    }
  }
  return 1;
}

- (void)_setTrackReaderPropertyValue:(void *)a3 forKey:(__CFString *)a4
{
  OpaqueFigMutableComposition *v7;
  uint64_t v8;
  void (*v9)(OpaqueFigMutableComposition *, uint64_t, __CFString *, void *);

  v7 = -[AVCompositionTrack _mutableComposition](self, "_mutableComposition");
  v8 = -[AVAssetTrack trackID](self, "trackID");
  v9 = *(void (**)(OpaqueFigMutableComposition *, uint64_t, __CFString *, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                           + 80);
  if (v9)
    v9(v7, v8, a4, a3);
}

- (CMTimeScale)naturalTimeScale
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableCompositionTrack;
  return -[AVAssetTrack naturalTimeScale](&v3, sel_naturalTimeScale);
}

- (void)setNaturalTimeScale:(CMTimeScale)naturalTimeScale
{
  uint64_t v4;

  if (naturalTimeScale)
    v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  else
    v4 = 0;
  -[AVMutableCompositionTrack _setTrackReaderPropertyValue:forKey:](self, "_setTrackReaderPropertyValue:forKey:", v4, *MEMORY[0x1E0CC6238]);
}

- (NSString)languageCode
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableCompositionTrack;
  return -[AVAssetTrack languageCode](&v3, sel_languageCode);
}

- (void)setLanguageCode:(NSString *)languageCode
{
  -[AVMutableCompositionTrack _setTrackReaderPropertyValue:forKey:](self, "_setTrackReaderPropertyValue:forKey:", languageCode, *MEMORY[0x1E0CC61B8]);
}

- (NSString)extendedLanguageTag
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableCompositionTrack;
  return -[AVAssetTrack extendedLanguageTag](&v3, sel_extendedLanguageTag);
}

- (void)setExtendedLanguageTag:(NSString *)extendedLanguageTag
{
  -[AVMutableCompositionTrack _setTrackReaderPropertyValue:forKey:](self, "_setTrackReaderPropertyValue:forKey:", extendedLanguageTag, *MEMORY[0x1E0CC6180]);
}

- (CGAffineTransform)preferredTransform
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMutableCompositionTrack;
  return (CGAffineTransform *)-[CGAffineTransform preferredTransform](&v4, sel_preferredTransform);
}

- (void)setPreferredTransform:(CGAffineTransform *)preferredTransform
{
  const void *v4;
  CGAffineTransform v5;

  v5 = *preferredTransform;
  v4 = (const void *)FigCreate3x3MatrixArrayFromCGAffineTransform();
  -[AVMutableCompositionTrack _setTrackReaderPropertyValue:forKey:](self, "_setTrackReaderPropertyValue:forKey:", v4, *MEMORY[0x1E0CC61E8], *(_OWORD *)&v5.a, *(_OWORD *)&v5.c, *(_OWORD *)&v5.tx);
  if (v4)
    CFRelease(v4);
}

- (float)preferredVolume
{
  float result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableCompositionTrack;
  -[AVAssetTrack preferredVolume](&v3, sel_preferredVolume);
  return result;
}

- (void)setPreferredVolume:(float)preferredVolume
{
  uint64_t v4;

  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  -[AVMutableCompositionTrack _setTrackReaderPropertyValue:forKey:](self, "_setTrackReaderPropertyValue:forKey:", v4, *MEMORY[0x1E0CC6258]);
}

- (int64_t)alternateGroupID
{
  OpaqueFigMutableComposition *v3;
  uint64_t v4;
  uint64_t (*v5)(OpaqueFigMutableComposition *, uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v6;
  CFTypeRef v7;
  CFTypeID v8;
  CFTypeID TypeID;
  __int16 valuePtr;
  CFTypeRef cf;

  cf = 0;
  valuePtr = 0;
  v3 = -[AVCompositionTrack _mutableComposition](self, "_mutableComposition");
  v4 = -[AVAssetTrack trackID](self, "trackID");
  v5 = *(uint64_t (**)(OpaqueFigMutableComposition *, uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
  if (v5)
  {
    v6 = v5(v3, v4, *MEMORY[0x1E0CC4840], *MEMORY[0x1E0C9AE00], &cf);
    v7 = cf;
    if (!v6)
    {
      if (!cf)
        return valuePtr;
      v8 = CFGetTypeID(cf);
      TypeID = CFNumberGetTypeID();
      v7 = cf;
      if (v8 == TypeID && cf)
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt16Type, &valuePtr);
        v7 = cf;
      }
    }
    if (v7)
      CFRelease(v7);
  }
  return valuePtr;
}

- (void)setAlternateGroupID:(int64_t)a3
{
  uint64_t v4;

  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  -[AVMutableCompositionTrack _setTrackReaderPropertyValue:forKey:](self, "_setTrackReaderPropertyValue:forKey:", v4, *MEMORY[0x1E0CC4840]);
}

- (void)_updateTrackAssociationToTrack:(id)a3 type:(id)a4 operation:(int64_t)a5
{
  const __CFAllocator *v9;
  CFNumberRef v10;
  CFNumberRef v11;
  CFNumberRef v12;
  BOOL v13;
  uint64_t FigBaseObject;
  unsigned int (*v15)(uint64_t);
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  _BOOL4 v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, void *);
  uint64_t v28;
  _QWORD v29[8];
  int v30;
  _BYTE valuePtr[12];

  *(_DWORD *)&valuePtr[8] = 0;
  *(_QWORD *)valuePtr = -[AVAssetTrack trackID](self, "trackID");
  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v10 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, valuePtr);
  v30 = objc_msgSend(a3, "trackID");
  v11 = CFNumberCreate(v9, kCFNumberSInt32Type, &v30);
  v12 = v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13)
  {
    -[AVCompositionTrack _mutableComposition](self, "_mutableComposition");
    FigBaseObject = FigMutableCompositionGetFigBaseObject();
    v15 = *(unsigned int (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v15)
    {
      v28 = *MEMORY[0x1E0CC4838];
      if (!v15(FigBaseObject))
      {
        v16 = *(void **)&valuePtr[4];
        v17 = (void *)objc_msgSend(*(id *)&valuePtr[4], "objectForKey:", a4);
        v18 = objc_msgSend(v17, "count");
        if (v17)
        {
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __75__AVMutableCompositionTrack__updateTrackAssociationToTrack_type_operation___block_invoke;
          v29[3] = &unk_1E30322C8;
          v29[4] = v17;
          v29[5] = v18;
          v29[6] = v10;
          v29[7] = v12;
          v19 = objc_msgSend(v17, "indexOfObjectPassingTest:", v29);
        }
        else
        {
          v19 = 0x7FFFFFFFFFFFFFFFLL;
        }
        v20 = v19 == 0x7FFFFFFFFFFFFFFFLL && a5 == 0;
        v21 = v19 != 0x7FFFFFFFFFFFFFFFLL && a5 == 1;
        if (v20 || v21)
        {
          v22 = v16
              ? (id)objc_msgSend(v16, "mutableCopy")
              : (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v23 = v22;
          v24 = v17
              ? (id)objc_msgSend(v17, "mutableCopy")
              : (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v25 = v24;
          if (v23)
          {
            if (v24)
            {
              if (v20)
              {
                objc_msgSend(v24, "addObject:", v10);
                objc_msgSend(v25, "addObject:", v12);
              }
              else if (v21)
              {
                objc_msgSend(v24, "removeObjectAtIndex:", v19);
                objc_msgSend(v25, "removeObjectAtIndex:", v19);
              }
              objc_msgSend(v23, "setObject:forKey:", v25, a4);
              -[AVCompositionTrack _mutableComposition](self, "_mutableComposition");
              v26 = FigMutableCompositionGetFigBaseObject();
              v27 = *(void (**)(uint64_t, uint64_t, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
              if (v27)
                v27(v26, v28, v23);
            }
          }
        }
      }
    }
  }
  if (*(_QWORD *)&valuePtr[4])
    CFRelease(*(CFTypeRef *)&valuePtr[4]);
  if (v10)
    CFRelease(v10);
  if (v12)
    CFRelease(v12);
}

uint64_t __75__AVMutableCompositionTrack__updateTrackAssociationToTrack_type_operation___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;
  uint64_t result;

  if ((a3 & 1) != 0)
    return 0;
  v5 = a3 + 1;
  if (*(_QWORD *)(a1 + 40) <= (unint64_t)(a3 + 1))
    return 0;
  result = objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 48));
  if ((_DWORD)result)
  {
    result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v5), "isEqual:", *(_QWORD *)(a1 + 56));
    if ((_DWORD)result)
    {
      result = 1;
      *a4 = 1;
    }
  }
  return result;
}

- (void)addTrackAssociationToTrack:(AVCompositionTrack *)compositionTrack type:(AVTrackAssociationType)trackAssociationType
{
  -[AVMutableCompositionTrack _updateTrackAssociationToTrack:type:operation:](self, "_updateTrackAssociationToTrack:type:operation:", compositionTrack, trackAssociationType, 0);
}

- (void)removeTrackAssociationToTrack:(AVCompositionTrack *)compositionTrack type:(AVTrackAssociationType)trackAssociationType
{
  -[AVMutableCompositionTrack _updateTrackAssociationToTrack:type:operation:](self, "_updateTrackAssociationToTrack:type:operation:", compositionTrack, trackAssociationType, 1);
}

- (void)setMetadata:(id)a3
{
  id v4;

  v4 = +[AVMetadataItem _figMetadataPropertyFromMetadataItems:](AVMetadataItem, "_figMetadataPropertyFromMetadataItems:", a3);
  -[AVMutableCompositionTrack _setTrackReaderPropertyValue:forKey:](self, "_setTrackReaderPropertyValue:forKey:", v4, *MEMORY[0x1E0CC4858]);
}

+ (BOOL)expectsPropertyRevisedNotifications
{
  return 0;
}

- (void)replaceFormatDescription:(CMFormatDescriptionRef)originalFormatDescription withFormatDescription:(CMFormatDescriptionRef)replacementFormatDescription
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  CMMediaType MediaType;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  OpaqueFigMutableComposition *v22;
  uint64_t v23;
  unsigned __int16 (*v24)(OpaqueFigMutableComposition *, uint64_t, _QWORD, _QWORD, CFTypeRef *);
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t, uint64_t, void *);
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  AVMutableCompositionTrack *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CFTypeRef cf;
  _QWORD v49[2];
  _QWORD v50[2];
  _BYTE v51[128];
  _QWORD v52[4];

  v52[2] = *MEMORY[0x1E0C80C00];
  cf = 0;
  v8 = *MEMORY[0x1E0CA2270];
  v52[0] = *MEMORY[0x1E0CA2278];
  v52[1] = v8;
  v9 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  if (!originalFormatDescription)
  {
    v38 = (void *)MEMORY[0x1E0C99DA0];
    v39 = *MEMORY[0x1E0C99778];
    v40 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v10, v11, v12, v13, v14, (uint64_t)"originalFormatDescription != NULL");
    goto LABEL_25;
  }
  if (originalFormatDescription == replacementFormatDescription)
    return;
  v15 = (const void *)v9;
  if (replacementFormatDescription)
  {
    MediaType = CMFormatDescriptionGetMediaType(originalFormatDescription);
    if (MediaType != CMFormatDescriptionGetMediaType(replacementFormatDescription))
    {
      v38 = (void *)MEMORY[0x1E0C99DA0];
      v39 = *MEMORY[0x1E0C99778];
      v40 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Media type of the new format description must match that of the existing format description"), v17, v18, v19, v20, v21, v41);
LABEL_25:
      objc_exception_throw((id)objc_msgSend(v38, "exceptionWithName:reason:userInfo:", v39, v40, 0));
    }
  }
  v22 = -[AVCompositionTrack _mutableComposition](self, "_mutableComposition");
  v23 = -[AVAssetTrack trackID](self, "trackID");
  v24 = *(unsigned __int16 (**)(OpaqueFigMutableComposition *, uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
  if (v24)
  {
    v25 = *MEMORY[0x1E0CC4850];
    if (!v24(v22, v23, *MEMORY[0x1E0CC4850], *MEMORY[0x1E0C9AE00], &cf))
    {
      v42 = v25;
      v43 = self;
      v26 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)cf, "count"));
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v27 = (void *)cf;
      v28 = objc_msgSend((id)cf, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v45;
        v31 = *MEMORY[0x1E0CC4818];
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v45 != v30)
              objc_enumerationMutation(v27);
            v33 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            if (!CMFormatDescriptionEqualIgnoringExtensionKeys((CMFormatDescriptionRef)objc_msgSend(v33, "objectForKey:", v31), originalFormatDescription, v15, 0))objc_msgSend(v26, "addObject:", v33);
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
        }
        while (v29);
      }
      if (replacementFormatDescription)
      {
        v34 = *MEMORY[0x1E0CC4810];
        v49[0] = *MEMORY[0x1E0CC4818];
        v49[1] = v34;
        v50[0] = originalFormatDescription;
        v50[1] = replacementFormatDescription;
        objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2));
      }
      v35 = -[AVCompositionTrack _mutableComposition](v43, "_mutableComposition");
      v36 = -[AVAssetTrack trackID](v43, "trackID");
      v37 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 80);
      if (v37)
        v37(v35, v36, v42, v26);
      if (cf)
        CFRelease(cf);
    }
  }
}

@end
