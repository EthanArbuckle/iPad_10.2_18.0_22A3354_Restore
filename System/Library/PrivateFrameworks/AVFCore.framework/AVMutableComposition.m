@implementation AVMutableComposition

+ (AVMutableComposition)composition
{
  return (AVMutableComposition *)objc_alloc_init((Class)a1);
}

+ (AVMutableComposition)compositionWithURLAssetInitializationOptions:(NSDictionary *)URLAssetInitializationOptions
{
  AVMutableComposition *v6;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v6 = (AVMutableComposition *)objc_alloc_init((Class)a1);
  v18 = 0;
  if (!-[AVComposition _setURLAssetInitializationOptions:error:](v6, "_setURLAssetInitializationOptions:error:", URLAssetInitializationOptions, &v18)&& objc_msgSend(v18, "code") == -11999)
  {
    v8 = (void *)objc_msgSend((id)objc_msgSend(v18, "userInfo"), "objectForKey:", CFSTR("AVErrorExceptionKey"));
    v9 = objc_msgSend(v8, "reason");
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v16 = objc_msgSend(v8, "name");
    if (v9)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(": %@"), v9);
    v17 = (void *)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v16, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)CFSTR("Cannot honor specified AVURLAsset initialization options for AVMutableComposition <%p>%@"), v11, v12, v13, v14, v15, (uint64_t)a1), 0);
    objc_exception_throw(v17);
  }
  return v6;
}

- (id)_initWithComposition:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMutableComposition;
  return -[AVComposition _initWithComposition:](&v4, sel__initWithComposition_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[AVComposition _initWithComposition:](+[AVComposition allocWithZone:](AVComposition, "allocWithZone:", a3), "_initWithComposition:", self);
}

- (id)_newTrackForIndex:(int64_t)a3
{
  return -[AVAssetTrack _initWithAsset:trackIndex:]([AVMutableCompositionTrack alloc], "_initWithAsset:trackIndex:", self, a3);
}

- (NSArray)tracks
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableComposition;
  return -[AVComposition tracks](&v3, sel_tracks);
}

- (AVMutableCompositionTrack)trackWithTrackID:(CMPersistentTrackID)trackID
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMutableComposition;
  return (AVMutableCompositionTrack *)-[AVComposition trackWithTrackID:](&v4, sel_trackWithTrackID_, *(_QWORD *)&trackID);
}

- (NSArray)tracksWithMediaType:(AVMediaType)mediaType
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMutableComposition;
  return -[AVComposition tracksWithMediaType:](&v4, sel_tracksWithMediaType_, mediaType);
}

- (NSArray)tracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMutableComposition;
  return -[AVComposition tracksWithMediaCharacteristic:](&v4, sel_tracksWithMediaCharacteristic_, mediaCharacteristic);
}

- (CGSize)naturalSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)AVMutableComposition;
  -[AVComposition naturalSize](&v4, sel_naturalSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setMetadata:(id)a3
{
  id v4;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, _QWORD, id);

  v4 = +[AVMetadataItem _figMetadataPropertyFromMetadataItems:](AVMetadataItem, "_figMetadataPropertyFromMetadataItems:", a3);
  -[AVComposition _mutableComposition](self, "_mutableComposition");
  FigBaseObject = FigMutableCompositionGetFigBaseObject();
  v6 = *(void (**)(uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v6)
    v6(FigBaseObject, *MEMORY[0x1E0CC4830], v4);
}

- (BOOL)insertTimeRange:(CMTimeRange *)timeRange ofAsset:(AVAsset *)asset atTime:(CMTime *)startTime error:(NSError *)outError
{
  OpaqueFigMutableComposition *v10;
  OpaqueFigFormatReader *v11;
  OpaqueFigMutableComposition *v12;
  OpaqueFigMutableComposition *v13;
  id v14;
  id v15;
  uint64_t (*v16)(OpaqueFigFormatReader *, uint64_t *);
  signed int v17;
  OpaqueFigAsset *v18;
  uint64_t (*v19)(OpaqueFigMutableComposition *, OpaqueFigMutableComposition *, OpaqueFigAsset *);
  uint64_t (*v20)(OpaqueFigMutableComposition *, OpaqueFigMutableComposition *, __int128 *, __int128 *, __int128 *);
  OpaqueFigMutableComposition *v21;
  OpaqueFigMutableComposition *v22;
  CMTime *p_duration;
  NSError **v24;
  uint64_t (*v25)(OpaqueFigFormatReader *, uint64_t *);
  uint64_t i;
  uint64_t v27;
  _BOOL8 v28;
  uint64_t (*v30)(_QWORD, __int128 *, __int128 *);
  __int128 v32;
  __int128 v33;
  CMTimeEpoch v34;
  CMTimeEpoch v35;
  __int128 v36;
  __int128 v37;
  CMTimeEpoch v38;
  CMTimeEpoch v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CMTimeEpoch epoch;
  CMTimeEpoch v44;
  CMTimeEpoch v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  CMTimeEpoch v49;
  __int128 v50;
  CMTimeEpoch v51;
  __int128 v52;
  CMTimeEpoch v53;

  v10 = -[AVComposition _mutableComposition](self, "_mutableComposition");
  v11 = -[AVComposition _copyFormatReader](self, "_copyFormatReader");
  v12 = -[AVAsset _absoluteURL](asset, "_absoluteURL");
  v13 = -[AVAsset _mutableComposition](asset, "_mutableComposition");
  v46 = 0;
  v47 = 0;
  v14 = -[AVComposition _mutableTracks](self, "_mutableTracks");
  v15 = (id)objc_msgSend(v14, "copy");
  -[AVMutableComposition willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("duration"));
  -[AVMutableComposition willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("tracks"));
  -[AVMutableComposition _notifyTracksThatSegmentsWillChange:](self, "_notifyTracksThatSegmentsWillChange:", v15);
  v16 = *(uint64_t (**)(OpaqueFigFormatReader *, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v16)
    goto LABEL_17;
  v17 = v16(v11, &v47);
  if (v17)
    goto LABEL_18;
  if (v12)
  {
    v18 = -[AVAsset _figAsset](asset, "_figAsset");
    v19 = *(uint64_t (**)(OpaqueFigMutableComposition *, OpaqueFigMutableComposition *, OpaqueFigAsset *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 176);
    if (v19)
    {
      v17 = v19(v10, v12, v18);
      if (!v17)
      {
        v40 = *(_OWORD *)&timeRange->start.value;
        epoch = timeRange->start.epoch;
        v36 = *(_OWORD *)&timeRange->duration.value;
        v38 = timeRange->duration.epoch;
        v32 = *(_OWORD *)&startTime->value;
        v34 = startTime->epoch;
        v20 = *(uint64_t (**)(OpaqueFigMutableComposition *, OpaqueFigMutableComposition *, __int128 *, __int128 *, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 96);
        if (v20)
        {
          v52 = v40;
          v53 = epoch;
          v50 = v36;
          v51 = v38;
          v48 = v32;
          v49 = v34;
          v21 = v10;
          v22 = v12;
          goto LABEL_11;
        }
        goto LABEL_17;
      }
LABEL_18:
      v24 = outError;
      goto LABEL_19;
    }
LABEL_17:
    v17 = -12782;
    goto LABEL_18;
  }
  p_duration = &timeRange->duration;
  if (v10)
  {
    v41 = *(_OWORD *)&timeRange->start.value;
    v44 = timeRange->start.epoch;
    v37 = *(_OWORD *)&p_duration->value;
    v39 = timeRange->duration.epoch;
    v33 = *(_OWORD *)&startTime->value;
    v35 = startTime->epoch;
    v20 = *(uint64_t (**)(OpaqueFigMutableComposition *, OpaqueFigMutableComposition *, __int128 *, __int128 *, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 192);
    if (v20)
    {
      v52 = v41;
      v53 = v44;
      v50 = v37;
      v51 = v39;
      v48 = v33;
      v49 = v35;
      v21 = v10;
      v22 = v13;
LABEL_11:
      v17 = v20(v21, v22, &v52, &v50, &v48);
      v24 = outError;
      if (v17)
      {
LABEL_19:
        v27 = AVLocalizedErrorWithUnderlyingOSStatus(v17, 0);
        v28 = 0;
        goto LABEL_20;
      }
      goto LABEL_12;
    }
    goto LABEL_17;
  }
  v48 = *(_OWORD *)&startTime->value;
  v49 = startTime->epoch;
  v42 = *(_OWORD *)&p_duration->value;
  v45 = timeRange->duration.epoch;
  v30 = *(uint64_t (**)(_QWORD, __int128 *, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 112);
  v24 = outError;
  if (!v30)
    goto LABEL_29;
  v52 = v48;
  v53 = v49;
  v50 = v42;
  v51 = v45;
  v17 = v30(0, &v52, &v50);
  if (v17)
    goto LABEL_19;
LABEL_12:
  v25 = *(uint64_t (**)(OpaqueFigFormatReader *, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v25)
  {
LABEL_29:
    v17 = -12782;
    goto LABEL_19;
  }
  v17 = v25(v11, &v46);
  if (v17)
    goto LABEL_19;
  for (i = v47; i < v46; ++i)
    objc_msgSend(v14, "addObject:", -[AVMutableComposition _newTrackForIndex:](self, "_newTrackForIndex:", i));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVAssetDurationDidChangeNotification"), self);
  v27 = 0;
  v28 = 1;
LABEL_20:
  -[AVMutableComposition didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("tracks"));
  -[AVMutableComposition didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("duration"));
  -[AVMutableComposition _notifyTracksThatSegmentsDidChange:successfully:](self, "_notifyTracksThatSegmentsDidChange:successfully:", v15, v28);
  if (v24)
    *v24 = (NSError *)v27;
  if (v11)
    CFRelease(v11);
  return v28;
}

- (void)insertTimeRange:(CMTimeRange *)timeRange ofAsset:(AVAsset *)asset atTime:(CMTime *)startTime completionHandler:(void *)completionHandler
{
  __int128 v6;
  _QWORD v7[7];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  CMTime v11;

  v7[1] = 3221225472;
  v6 = *(_OWORD *)&timeRange->start.epoch;
  v8 = *(_OWORD *)&timeRange->start.value;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __73__AVMutableComposition_insertTimeRange_ofAsset_atTime_completionHandler___block_invoke;
  v7[3] = &unk_1E30322A0;
  v9 = v6;
  v10 = *(_OWORD *)&timeRange->duration.timescale;
  v7[4] = self;
  v7[5] = asset;
  v11 = *startTime;
  v7[6] = completionHandler;
  AVLoadValueAsynchronously(asset, (uint64_t)CFSTR("tracks"), (uint64_t)v7);
}

uint64_t __73__AVMutableComposition_insertTimeRange_ofAsset_atTime_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  __int128 v7;
  uint64_t v8;
  _OWORD v9[3];
  uint64_t v10;

  v10 = a2;
  if (!a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_OWORD *)(a1 + 72);
    v9[0] = *(_OWORD *)(a1 + 56);
    v9[1] = v5;
    v9[2] = *(_OWORD *)(a1 + 88);
    v7 = *(_OWORD *)(a1 + 104);
    v8 = *(_QWORD *)(a1 + 120);
    objc_msgSend(v3, "insertTimeRange:ofAsset:atTime:error:", v9, v4, &v7, &v10);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)insertEmptyTimeRange:(CMTimeRange *)timeRange
{
  OpaqueFigMutableComposition *v5;
  NSArray *v6;
  unsigned int (*v7)(OpaqueFigMutableComposition *, __int128 *, CMTime *);
  uint64_t v8;
  CMTime duration;
  __int128 v10;
  CMTimeEpoch epoch;
  CMTime v12;
  __int128 v13;
  CMTimeEpoch v14;

  v5 = -[AVComposition _mutableComposition](self, "_mutableComposition");
  v6 = -[AVMutableComposition tracks](self, "tracks");
  -[AVMutableComposition willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("duration"));
  -[AVMutableComposition _notifyTracksThatSegmentsWillChange:](self, "_notifyTracksThatSegmentsWillChange:", v6);
  v10 = *(_OWORD *)&timeRange->start.value;
  epoch = timeRange->start.epoch;
  duration = timeRange->duration;
  v7 = *(unsigned int (**)(OpaqueFigMutableComposition *, __int128 *, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                          + 112);
  if (!v7 || (v13 = v10, v14 = epoch, v12 = duration, v7(v5, &v13, &v12)))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVAssetDurationDidChangeNotification"), self);
    v8 = 1;
  }
  -[AVMutableComposition didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("duration"), *(_OWORD *)&duration.value, duration.epoch);
  -[AVMutableComposition _notifyTracksThatSegmentsDidChange:successfully:](self, "_notifyTracksThatSegmentsDidChange:successfully:", v6, v8);
}

- (void)removeTimeRange:(CMTimeRange *)timeRange
{
  OpaqueFigMutableComposition *v5;
  NSArray *v6;
  unsigned int (*v7)(OpaqueFigMutableComposition *, __int128 *, CMTime *);
  uint64_t v8;
  CMTime duration;
  __int128 v10;
  CMTimeEpoch epoch;
  CMTime v12;
  __int128 v13;
  CMTimeEpoch v14;

  v5 = -[AVComposition _mutableComposition](self, "_mutableComposition");
  v6 = -[AVMutableComposition tracks](self, "tracks");
  -[AVMutableComposition willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("duration"));
  -[AVMutableComposition _notifyTracksThatSegmentsWillChange:](self, "_notifyTracksThatSegmentsWillChange:", v6);
  v10 = *(_OWORD *)&timeRange->start.value;
  epoch = timeRange->start.epoch;
  duration = timeRange->duration;
  v7 = *(unsigned int (**)(OpaqueFigMutableComposition *, __int128 *, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                          + 128);
  if (!v7 || (v13 = v10, v14 = epoch, v12 = duration, v7(v5, &v13, &v12)))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVAssetDurationDidChangeNotification"), self);
    v8 = 1;
  }
  -[AVMutableComposition didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("duration"), *(_OWORD *)&duration.value, duration.epoch);
  -[AVMutableComposition _notifyTracksThatSegmentsDidChange:successfully:](self, "_notifyTracksThatSegmentsDidChange:successfully:", v6, v8);
}

- (void)scaleTimeRange:(CMTimeRange *)timeRange toDuration:(CMTime *)duration
{
  OpaqueFigMutableComposition *v7;
  NSArray *v8;
  unsigned int (*v9)(OpaqueFigMutableComposition *, __int128 *, CMTime *, CMTime *);
  uint64_t v10;
  CMTime v11;
  CMTime v12;
  __int128 v13;
  CMTimeEpoch epoch;
  CMTime v15;
  CMTime v16;
  __int128 v17;
  CMTimeEpoch v18;

  v7 = -[AVComposition _mutableComposition](self, "_mutableComposition");
  v8 = -[AVMutableComposition tracks](self, "tracks");
  -[AVMutableComposition willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("duration"));
  -[AVMutableComposition _notifyTracksThatSegmentsWillChange:](self, "_notifyTracksThatSegmentsWillChange:", v8);
  v13 = *(_OWORD *)&timeRange->start.value;
  epoch = timeRange->start.epoch;
  v12 = timeRange->duration;
  v11 = *duration;
  v9 = *(unsigned int (**)(OpaqueFigMutableComposition *, __int128 *, CMTime *, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 144);
  if (!v9 || (v17 = v13, v18 = epoch, v16 = v12, v15 = v11, v9(v7, &v17, &v16, &v15)))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVAssetDurationDidChangeNotification"), self);
    v10 = 1;
  }
  -[AVMutableComposition didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("duration"), *(_OWORD *)&v11.value, v11.epoch);
  -[AVMutableComposition _notifyTracksThatSegmentsDidChange:successfully:](self, "_notifyTracksThatSegmentsDidChange:successfully:", v8, v10);
}

- (id)_addMutableTrackWithMediaType:(id)a3 preferredTrackID:(int)a4 fireKVO:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  OpaqueFigMutableComposition *v9;
  id v10;
  int v11;
  unsigned int v12;
  unsigned int (*v13)(OpaqueFigMutableComposition *, uint64_t, _QWORD, uint64_t, unsigned int *);
  unsigned int v14;
  uint64_t v15;
  AVMutableCompositionTrack *v16;
  id v17;
  unsigned int v19;
  unsigned int v20[4];

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v9 = -[AVComposition _mutableComposition](self, "_mutableComposition");
  v19 = 0;
  v10 = -[AVComposition _mutableTracks](self, "_mutableTracks");
  v11 = objc_msgSend(a3, "getCString:maxLength:encoding:", v20, 5, 1);
  v12 = v20[0];
  v13 = *(unsigned int (**)(OpaqueFigMutableComposition *, uint64_t, _QWORD, uint64_t, unsigned int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (!v13)
    return 0;
  v14 = bswap32(v12);
  v15 = v11 ? v14 : 0;
  if (v13(v9, v15, 0, v6, &v19))
    return 0;
  if (v5)
    -[AVMutableComposition willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("tracks"));
  v16 = [AVMutableCompositionTrack alloc];
  v17 = -[AVAssetTrack _initWithAsset:trackID:](v16, "_initWithAsset:trackID:", self, v19);
  objc_msgSend(v10, "addObject:", v17);
  if (v5)
    -[AVMutableComposition didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("tracks"));
  return v17;
}

- (AVMutableCompositionTrack)addMutableTrackWithMediaType:(AVMediaType)mediaType preferredTrackID:(CMPersistentTrackID)preferredTrackID
{
  return (AVMutableCompositionTrack *)-[AVMutableComposition _addMutableTrackWithMediaType:preferredTrackID:fireKVO:](self, "_addMutableTrackWithMediaType:preferredTrackID:fireKVO:", mediaType, *(_QWORD *)&preferredTrackID, 1);
}

- (void)_removeTrack:(id)a3 fireKVO:(BOOL)a4
{
  _BOOL4 v4;
  OpaqueFigMutableComposition *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(OpaqueFigMutableComposition *, uint64_t);

  v4 = a4;
  v7 = -[AVComposition _mutableComposition](self, "_mutableComposition");
  v8 = -[AVComposition _mutableTracks](self, "_mutableTracks");
  v9 = objc_msgSend(v8, "indexOfObject:", a3);
  if (a3)
  {
    if (v8)
    {
      v10 = v9;
      if (v9 != 0x7FFFFFFFFFFFFFFFLL && (AVMutableComposition *)objc_msgSend(a3, "asset") == self)
      {
        if (v4)
          -[AVMutableComposition willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("duration"));
        v11 = objc_msgSend(a3, "trackID");
        v12 = *(unsigned int (**)(OpaqueFigMutableComposition *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 16)
                                                                                    + 40);
        if (v12 && !v12(v7, v11))
        {
          if (v4)
          {
            -[AVMutableComposition willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("tracks"));
            objc_msgSend(v8, "removeObjectAtIndex:", v10);
            -[AVMutableComposition didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("tracks"));
          }
          else
          {
            objc_msgSend(v8, "removeObjectAtIndex:", v10);
          }
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVAssetDurationDidChangeNotification"), self);
        }
      }
    }
  }
  if (v4)
    -[AVMutableComposition didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("duration"));
}

- (void)removeTrack:(AVCompositionTrack *)track
{
  -[AVMutableComposition _removeTrack:fireKVO:](self, "_removeTrack:fireKVO:", track, 1);
}

- (AVMutableCompositionTrack)mutableTrackCompatibleWithTrack:(AVAssetTrack *)track
{
  OpaqueFigMutableComposition *v5;
  AVAsset *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int (*v10)(OpaqueFigMutableComposition *, uint64_t, uint64_t);
  uint64_t v11;
  unsigned int (*v12)(OpaqueFigMutableComposition *, uint64_t, uint64_t, unsigned int *);
  OpaqueFigMutableComposition *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v17;

  v5 = -[AVComposition _mutableComposition](self, "_mutableComposition");
  v17 = 0;
  v6 = -[AVAssetTrack asset](track, "asset");
  v7 = -[AVAsset _absoluteURL](v6, "_absoluteURL");
  v8 = -[AVAsset _mutableComposition](v6, "_mutableComposition");
  if (!track)
    return 0;
  if (v7)
  {
    v9 = -[AVAsset _figAsset](v6, "_figAsset");
    v10 = *(unsigned int (**)(OpaqueFigMutableComposition *, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                         + 176);
    if (!v10)
      return 0;
    if (v10(v5, v7, v9))
      return 0;
    v11 = -[AVAssetTrack trackID](track, "trackID");
    v12 = *(unsigned int (**)(OpaqueFigMutableComposition *, uint64_t, uint64_t, unsigned int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
    if (!v12)
      return 0;
    v13 = v5;
    v14 = v7;
  }
  else
  {
    v15 = v8;
    if (!v8)
      return 0;
    v11 = -[AVAssetTrack trackID](track, "trackID");
    v12 = *(unsigned int (**)(OpaqueFigMutableComposition *, uint64_t, uint64_t, unsigned int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 200);
    if (!v12)
      return 0;
    v13 = v5;
    v14 = v15;
  }
  if (!v12(v13, v14, v11, &v17))
    return -[AVMutableComposition trackWithTrackID:](self, "trackWithTrackID:", v17);
  return 0;
}

- (void)_notifyTracksThatSegmentsWillChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(a3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "willChangeValueForKey:", CFSTR("segments"));
      }
      while (v5 != v7);
      v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)_notifyTracksThatSegmentsDidChange:(id)a3 successfully:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v10, "didChangeValueForKey:", CFSTR("segments"));
        if (v4)
        {
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVAssetTrackTimeRangeDidChangeNotification"), v10);
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVAssetTrackSegmentsDidChangeNotification"), v10);
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
}

@end
