@implementation AVPlayerItemTrack

+ (AVPlayerItemTrack)playerItemTrackWithFigPlaybackItem:(OpaqueFigPlaybackItem *)a3 readyForInspection:(BOOL)a4 trackID:(int)a5 asset:(id)a6 playerItem:(id)a7
{
  return (AVPlayerItemTrack *)-[AVPlayerItemTrack _initWithFigPlaybackItem:readyForInspection:trackID:asset:playerItem:]([AVPlayerItemTrack alloc], "_initWithFigPlaybackItem:readyForInspection:trackID:asset:playerItem:", a3, a4, *(_QWORD *)&a5, a6, a7);
}

- (AVAssetTrack)assetTrack
{
  AVTelemetryGenerateID();
  return -[AVAsset trackWithTrackID:](self->_playerItemTrack->asset, "trackWithTrackID:", self->_playerItemTrack->trackID);
}

- (id)_initWithFigPlaybackItem:(OpaqueFigPlaybackItem *)a3 readyForInspection:(BOOL)a4 trackID:(int)a5 asset:(id)a6 playerItem:(id)a7
{
  AVPlayerItemTrack *v12;
  AVPlayerItemTrackInternal *v13;
  OpaqueFigPlaybackItem *v14;
  objc_super v17;

  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  v17.receiver = self;
  v17.super_class = (Class)AVPlayerItemTrack;
  v12 = -[AVPlayerItemTrack init](&v17, sel_init);
  if (v12)
  {
    v13 = objc_alloc_init(AVPlayerItemTrackInternal);
    v12->_playerItemTrack = v13;
    if (!v13)
      goto LABEL_7;
    CFRetain(v13);
    v12->_playerItemTrack->weakReferenceToPlayerItem = (AVWeakReference *)(id)objc_msgSend(a7, "_weakReference");
    v14 = a3 ? (OpaqueFigPlaybackItem *)CFRetain(a3) : 0;
    v12->_playerItemTrack->figPlaybackItem = v14;
    v12->_playerItemTrack->figPlaybackItemIsReadyForInspection = a4;
    v12->_playerItemTrack->asset = (AVAsset *)a6;
    v12->_playerItemTrack->trackID = a5;
    v12->_playerItemTrack->disableColorMatching = 0;
    v12->_playerItemTrack->disableColorMatchingWasSet = 0;
    v12->_playerItemTrack->activeHapticChannelIndex = 1;
    v12->_playerItemTrack->activeHapticChannelIndexWasSet = 0;
    v12->_playerItemTrack->sampleBufferOutputs = 0;
    v12->_playerItemTrack->hapticVolume = 1.0;
    v12->_playerItemTrack->hapticVolumeWasSet = 0;
    v12->_playerItemTrack->mutesHaptics = 0;
    v12->_playerItemTrack->mutesHapticsWasSet = 0;
    v12->_playerItemTrack->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplayeritemtrack.ivars");
    if (!a5)
    {
LABEL_7:

      return 0;
    }
  }
  return v12;
}

_QWORD *__30__AVPlayerItemTrack_isEnabled__block_invoke(_QWORD *result)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 72);
  *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 73);
  v1 = *(_QWORD *)(result[4] + 8);
  if (*(_QWORD *)(v1 + 16))
  {
    if (*(_BYTE *)(v1 + 24))
      *(_BYTE *)(*(_QWORD *)(result[7] + 8) + 24) = 1;
  }
  return result;
}

uint64_t __30__AVPlayerItemTrack_isEnabled__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 72) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8)
                                                                            + 24);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 73) = 1;
  return result;
}

- (BOOL)isEnabled
{
  NSObject *ivarAccessQueue;
  uint64_t v4;
  char v5;
  AVPlayerItemTrackInternal *playerItemTrack;
  OpaqueFigPlaybackItem *figPlaybackItem;
  uint64_t trackID;
  uint64_t (*v10)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v11;
  CFTypeRef v12;
  char v13;
  NSObject *v14;
  _QWORD v15[6];
  CFTypeRef cf;
  _QWORD block[8];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  ivarAccessQueue = self->_playerItemTrack->ivarAccessQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__AVPlayerItemTrack_isEnabled__block_invoke;
  block[3] = &unk_1E3031F70;
  block[4] = self;
  block[5] = &v26;
  block[6] = &v22;
  block[7] = &v18;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  if (!*((_BYTE *)v23 + 24))
  {
    if (*((_BYTE *)v19 + 24))
    {
      cf = 0;
      playerItemTrack = self->_playerItemTrack;
      figPlaybackItem = playerItemTrack->figPlaybackItem;
      trackID = playerItemTrack->trackID;
      v10 = *(uint64_t (**)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
      if (v10)
      {
        v11 = v10(figPlaybackItem, trackID, *MEMORY[0x1E0CC5530], *MEMORY[0x1E0C9AE00], &cf);
        v12 = cf;
        if (!v11)
        {
          if (!cf)
            goto LABEL_2;
          v13 = objc_msgSend((id)cf, "BOOLValue");
          *((_BYTE *)v27 + 24) = v13;
          v14 = self->_playerItemTrack->ivarAccessQueue;
          v15[0] = v4;
          v15[1] = 3221225472;
          v15[2] = __30__AVPlayerItemTrack_isEnabled__block_invoke_2;
          v15[3] = &unk_1E302FDB0;
          v15[4] = self;
          v15[5] = &v26;
          av_readwrite_dispatch_queue_write(v14, v15);
          v12 = cf;
        }
        if (v12)
          CFRelease(v12);
      }
    }
  }
LABEL_2:
  v5 = *((_BYTE *)v27 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  return v5;
}

- (void)dealloc
{
  AVPlayerItemTrackInternal *playerItemTrack;
  OpaqueFigPlaybackItem *figPlaybackItem;
  dispatch_object_t *v5;
  objc_super v6;

  playerItemTrack = self->_playerItemTrack;
  if (playerItemTrack)
  {
    figPlaybackItem = playerItemTrack->figPlaybackItem;
    if (figPlaybackItem)
    {
      CFRelease(figPlaybackItem);
      playerItemTrack = self->_playerItemTrack;
    }

    v5 = (dispatch_object_t *)self->_playerItemTrack;
    if (v5[14])
    {
      dispatch_release(v5[14]);
      v5 = (dispatch_object_t *)self->_playerItemTrack;
    }
    CFRelease(v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)AVPlayerItemTrack;
  -[AVPlayerItemTrack dealloc](&v6, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, assetTrack = %@>"), NSStringFromClass(v4), self, -[AVPlayerItemTrack assetTrack](self, "assetTrack"));
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  AVWeakReference *weakReferenceToPlayerItem;
  BOOL result;

  objc_opt_class();
  result = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[AVPlayerItemTrack trackID](self, "trackID");
    if (v5 == objc_msgSend(a3, "trackID"))
    {
      weakReferenceToPlayerItem = self->_playerItemTrack->weakReferenceToPlayerItem;
      if (weakReferenceToPlayerItem == (AVWeakReference *)objc_msgSend(a3, "_weakReferenceToPlayerItem"))
        return 1;
    }
  }
  return result;
}

- (unint64_t)hash
{
  AVPlayerItemTrackInternal *playerItemTrack;
  uint64_t trackID;

  playerItemTrack = self->_playerItemTrack;
  trackID = playerItemTrack->trackID;
  return -[AVWeakReference hash](playerItemTrack->weakReferenceToPlayerItem, "hash") ^ trackID;
}

- (id)_weakReferenceToPlayerItem
{
  return self->_playerItemTrack->weakReferenceToPlayerItem;
}

- (id)_playerItem
{
  return -[AVWeakReference referencedObject](self->_playerItemTrack->weakReferenceToPlayerItem, "referencedObject");
}

- (int)trackID
{
  return self->_playerItemTrack->trackID;
}

- (void)_transferEnabledToFig
{
  uint64_t v3;
  NSObject *v4;
  AVPlayerItemTrackInternal *playerItemTrack;
  OpaqueFigPlaybackItem *figPlaybackItem;
  uint64_t trackID;
  _BOOL4 v8;
  void (*v9)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, uint64_t);
  uint64_t v10;

  v3 = objc_msgSend(-[AVPlayerItemTrack _playerItem](self, "_playerItem"), "_copyStateDispatchQueue");
  if (v3)
  {
    v4 = v3;
    playerItemTrack = self->_playerItemTrack;
    figPlaybackItem = playerItemTrack->figPlaybackItem;
    if (figPlaybackItem)
    {
      trackID = playerItemTrack->trackID;
      v8 = -[AVPlayerItemTrack isEnabled](self, "isEnabled");
      v9 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 16)
                                                                                    + 112);
      if (v9)
      {
        if (v8)
          v10 = *MEMORY[0x1E0C9AE50];
        else
          v10 = *MEMORY[0x1E0C9AE40];
        v9(figPlaybackItem, trackID, *MEMORY[0x1E0CC5530], v10);
      }
    }
    dispatch_release(v4);
  }
}

- (void)setEnabled:(BOOL)enabled
{
  NSObject *ivarAccessQueue;
  void (*v5)(_QWORD);
  NSObject *v6;
  NSObject *v7;
  void (*v8[5])(_QWORD);
  _QWORD block[5];
  BOOL v10;

  ivarAccessQueue = self->_playerItemTrack->ivarAccessQueue;
  v5 = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__AVPlayerItemTrack_setEnabled___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v10 = enabled;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v6 = objc_msgSend(-[AVPlayerItemTrack _playerItem](self, "_playerItem"), "_copyStateDispatchQueue");
  if (v6)
  {
    v7 = v6;
    v8[0] = v5;
    v8[1] = (void (*)(_QWORD))3221225472;
    v8[2] = (void (*)(_QWORD))__32__AVPlayerItemTrack_setEnabled___block_invoke_2;
    v8[3] = (void (*)(_QWORD))&unk_1E302FA10;
    v8[4] = (void (*)(_QWORD))self;
    AVSerializeOnQueueAsyncIfNecessary(v6, v8);
    dispatch_release(v7);
  }
}

uint64_t __32__AVPlayerItemTrack_setEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 72) = *(_BYTE *)(result + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 73) = 1;
  return result;
}

uint64_t __32__AVPlayerItemTrack_setEnabled___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transferEnabledToFig");
}

- (id)fallbackTrack
{
  return (id)objc_msgSend(-[AVPlayerItemTrack _playerItem](self, "_playerItem"), "_trackWithTrackID:", objc_msgSend(-[AVAssetTrack _fallbackTrack](-[AVPlayerItemTrack assetTrack](self, "assetTrack"), "_fallbackTrack"), "trackID"));
}

- (float)currentVideoFrameRate
{
  NSObject *ivarAccessQueue;
  AVPlayerItemTrackInternal *playerItemTrack;
  OpaqueFigPlaybackItem *figPlaybackItem;
  uint64_t trackID;
  uint64_t (*v7)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, _QWORD, CFTypeRef *);
  const __CFAllocator *v8;
  int v9;
  CFTypeRef v10;
  BOOL v11;
  float v12;
  CFTypeID TypeID;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __CFString *Mutable;
  const void *v16;
  uint64_t CStringPtrAndBufferToFree;
  const char *v18;
  float v19;
  CFTypeRef cf;
  _QWORD block[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  ivarAccessQueue = self->_playerItemTrack->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__AVPlayerItemTrack_currentVideoFrameRate__block_invoke;
  block[3] = &unk_1E302FDB0;
  block[4] = self;
  block[5] = &v23;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  if (*((_BYTE *)v24 + 24))
  {
    cf = 0;
    playerItemTrack = self->_playerItemTrack;
    figPlaybackItem = playerItemTrack->figPlaybackItem;
    trackID = playerItemTrack->trackID;
    v7 = *(uint64_t (**)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                 + 40);
    if (v7)
    {
      v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v9 = v7(figPlaybackItem, trackID, *MEMORY[0x1E0CC5510], *MEMORY[0x1E0C9AE00], &cf);
      v10 = cf;
      if (v9)
        v11 = 1;
      else
        v11 = cf == 0;
      if (v11)
      {
        v12 = 0.0;
        if (!cf)
          goto LABEL_22;
        goto LABEL_21;
      }
      TypeID = CFNumberGetTypeID();
      if (TypeID != CFGetTypeID(cf))
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        Mutable = CFStringCreateMutable(v8, 0);
        v16 = (const void *)FigCFCopyCompactDescription();
        CFStringAppendFormat(Mutable, 0, CFSTR("<rdar://100445728> CurrentVideoFrameRate type is not CFNumberRef, value = {%@}\n"), v16);
        if (v16)
          CFRelease(v16);
        v27 = 0;
        CStringPtrAndBufferToFree = FigCFStringGetCStringPtrAndBufferToFree();
        v18 = "<rdar://100445728> failed to get content of CurrentVideoFrameRate";
        if (CStringPtrAndBufferToFree)
          v18 = (const char *)CStringPtrAndBufferToFree;
        qword_1EE2AFD70 = (uint64_t)v18;
        free(v27);
        if (Mutable)
          CFRelease(Mutable);
      }
      objc_msgSend((id)cf, "floatValue");
      v12 = v19;
    }
    else
    {
      v12 = 0.0;
    }
    v10 = cf;
    if (cf)
LABEL_21:
      CFRelease(v10);
  }
  else
  {
    v12 = 0.0;
  }
LABEL_22:
  _Block_object_dispose(&v23, 8);
  return v12;
}

uint64_t __42__AVPlayerItemTrack_currentVideoFrameRate__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(_QWORD *)(v1 + 16))
  {
    if (*(_BYTE *)(v1 + 24))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (id)loudnessInfo
{
  return self->_playerItemTrack->loudnessInfo;
}

- (id)effectiveLoudnessInfo
{
  AVPlayerItemTrackInternal *playerItemTrack;
  OpaqueFigPlaybackItem *figPlaybackItem;
  uint64_t trackID;
  void (*v6)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, _QWORD, void **);
  void *v7;
  void *v9;

  if (!self->_playerItemTrack->figPlaybackItem
    || !-[AVPlayerItemTrack _figPlaybackItemIsReadyForInspection](self, "_figPlaybackItemIsReadyForInspection"))
  {
    return 0;
  }
  v9 = 0;
  playerItemTrack = self->_playerItemTrack;
  figPlaybackItem = playerItemTrack->figPlaybackItem;
  trackID = playerItemTrack->trackID;
  v6 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                        + 40);
  if (v6)
  {
    v6(figPlaybackItem, trackID, *MEMORY[0x1E0CC5528], *MEMORY[0x1E0C9AE00], &v9);
    v7 = v9;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_transferLoudnessInfoToFig
{
  AVPlayerItemTrackInternal *playerItemTrack;
  OpaqueFigPlaybackItem *figPlaybackItem;
  uint64_t trackID;
  NSDictionary *loudnessInfo;
  void (*v6)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, NSDictionary *);

  playerItemTrack = self->_playerItemTrack;
  figPlaybackItem = playerItemTrack->figPlaybackItem;
  if (figPlaybackItem)
  {
    trackID = playerItemTrack->trackID;
    loudnessInfo = playerItemTrack->loudnessInfo;
    v6 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, NSDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                         + 112);
    if (v6)
      v6(figPlaybackItem, trackID, *MEMORY[0x1E0CC5558], loudnessInfo);
  }
}

- (void)setLoudnessInfo:(id)a3
{
  NSDictionary *loudnessInfo;

  loudnessInfo = self->_playerItemTrack->loudnessInfo;
  if (loudnessInfo != a3)
  {

    self->_playerItemTrack->loudnessInfo = (NSDictionary *)objc_msgSend(a3, "copy");
    -[AVPlayerItemTrack _transferLoudnessInfoToFig](self, "_transferLoudnessInfoToFig");
  }
}

- (int)effectiveEQPreset
{
  AVPlayerItemTrackInternal *playerItemTrack;
  OpaqueFigPlaybackItem *figPlaybackItem;
  uint64_t trackID;
  unsigned int (*v6)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v7;
  CFTypeRef cf;

  if (!self->_playerItemTrack->figPlaybackItem)
    return -1;
  if (!-[AVPlayerItemTrack _figPlaybackItemIsReadyForInspection](self, "_figPlaybackItemIsReadyForInspection"))
    return -1;
  cf = 0;
  playerItemTrack = self->_playerItemTrack;
  figPlaybackItem = playerItemTrack->figPlaybackItem;
  trackID = playerItemTrack->trackID;
  v6 = *(unsigned int (**)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (!v6 || v6(figPlaybackItem, trackID, *MEMORY[0x1E0CC5520], *MEMORY[0x1E0C9AE00], &cf))
    return -1;
  v7 = objc_msgSend((id)cf, "intValue");
  if (cf)
    CFRelease(cf);
  return v7;
}

- (BOOL)willTrimShortDurationAudioSamples
{
  AVPlayerItemTrackInternal *playerItemTrack;
  OpaqueFigPlaybackItem *figPlaybackItem;
  uint64_t trackID;
  unsigned int (*v6)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, _QWORD, CFBooleanRef *);
  BOOL v7;
  CFBooleanRef BOOLean;

  if (!self->_playerItemTrack->figPlaybackItem)
    return 1;
  if (!-[AVPlayerItemTrack _figPlaybackItemIsReadyForInspection](self, "_figPlaybackItemIsReadyForInspection"))
    return 1;
  BOOLean = 0;
  playerItemTrack = self->_playerItemTrack;
  figPlaybackItem = playerItemTrack->figPlaybackItem;
  trackID = playerItemTrack->trackID;
  v6 = *(unsigned int (**)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, _QWORD, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (!v6 || v6(figPlaybackItem, trackID, *MEMORY[0x1E0CC5588], *MEMORY[0x1E0C9AE00], &BOOLean))
    return 1;
  v7 = CFBooleanGetValue(BOOLean) != 0;
  if (BOOLean)
    CFRelease(BOOLean);
  return v7;
}

- (id)videoEnhancementFilterOptions
{
  return self->_playerItemTrack->videoEnhancementFilterOptions;
}

- (void)_transferVideoEnhancementOptionsToFig
{
  AVPlayerItemTrackInternal *playerItemTrack;
  OpaqueFigPlaybackItem *figPlaybackItem;
  uint64_t trackID;
  NSDictionary *videoEnhancementFilterOptions;
  void (*v6)(OpaqueFigPlaybackItem *, uint64_t, const __CFString *, NSDictionary *);

  playerItemTrack = self->_playerItemTrack;
  figPlaybackItem = playerItemTrack->figPlaybackItem;
  if (figPlaybackItem)
  {
    trackID = playerItemTrack->trackID;
    videoEnhancementFilterOptions = playerItemTrack->videoEnhancementFilterOptions;
    v6 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, const __CFString *, NSDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 112);
    if (v6)
      v6(figPlaybackItem, trackID, CFSTR("VideoEnhancementFilterOptions"), videoEnhancementFilterOptions);
  }
}

- (void)setVideoEnhancementFilterOptions:(id)a3
{
  NSDictionary *videoEnhancementFilterOptions;

  videoEnhancementFilterOptions = self->_playerItemTrack->videoEnhancementFilterOptions;
  if (videoEnhancementFilterOptions != a3)
  {

    self->_playerItemTrack->videoEnhancementFilterOptions = (NSDictionary *)objc_msgSend(a3, "copy");
    -[AVPlayerItemTrack _transferVideoEnhancementOptionsToFig](self, "_transferVideoEnhancementOptionsToFig");
  }
}

- (BOOL)disableColorMatching
{
  AVPlayerItemTrackInternal *playerItemTrack;

  playerItemTrack = self->_playerItemTrack;
  return playerItemTrack->disableColorMatchingWasSet && playerItemTrack->disableColorMatching;
}

- (void)_transferDisableColorMatchingToFig
{
  AVPlayerItemTrackInternal *playerItemTrack;
  OpaqueFigPlaybackItem *figPlaybackItem;
  uint64_t trackID;
  _BOOL4 disableColorMatching;
  void (*v6)(OpaqueFigPlaybackItem *, uint64_t, const __CFString *, uint64_t);
  uint64_t v7;

  playerItemTrack = self->_playerItemTrack;
  figPlaybackItem = playerItemTrack->figPlaybackItem;
  if (figPlaybackItem)
  {
    if (playerItemTrack->disableColorMatchingWasSet)
    {
      trackID = playerItemTrack->trackID;
      disableColorMatching = playerItemTrack->disableColorMatching;
      v6 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                + 112);
      if (v6)
      {
        if (disableColorMatching)
          v7 = *MEMORY[0x1E0C9AE50];
        else
          v7 = *MEMORY[0x1E0C9AE40];
        v6(figPlaybackItem, trackID, CFSTR("DisableColorMatching"), v7);
      }
    }
  }
}

- (void)setDisableColorMatching:(BOOL)a3
{
  self->_playerItemTrack->disableColorMatching = a3;
  self->_playerItemTrack->disableColorMatchingWasSet = 1;
  -[AVPlayerItemTrack _transferDisableColorMatchingToFig](self, "_transferDisableColorMatchingToFig");
}

- (void)setActiveHapticChannelIndex:(int64_t)a3
{
  self->_playerItemTrack->activeHapticChannelIndex = a3;
  self->_playerItemTrack->activeHapticChannelIndexWasSet = 1;
  -[AVPlayerItemTrack _transferActiveHapticChannelIndexToFig](self, "_transferActiveHapticChannelIndexToFig");
}

- (int64_t)activeHapticChannelIndex
{
  return self->_playerItemTrack->activeHapticChannelIndex;
}

- (void)_transferActiveHapticChannelIndexToFig
{
  AVPlayerItemTrackInternal *playerItemTrack;
  OpaqueFigPlaybackItem *figPlaybackItem;
  uint64_t trackID;
  uint64_t v5;
  void (*v6)(OpaqueFigPlaybackItem *, uint64_t, const __CFString *, uint64_t);

  playerItemTrack = self->_playerItemTrack;
  figPlaybackItem = playerItemTrack->figPlaybackItem;
  if (figPlaybackItem && playerItemTrack->activeHapticChannelIndexWasSet)
  {
    trackID = playerItemTrack->trackID;
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", playerItemTrack->activeHapticChannelIndex);
    v6 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                              + 112);
    if (v6)
      v6(figPlaybackItem, trackID, CFSTR("ActiveHapticChannelIndex"), v5);
  }
}

- (void)setHapticVolume:(float)a3
{
  self->_playerItemTrack->hapticVolume = a3;
  self->_playerItemTrack->hapticVolumeWasSet = 1;
  -[AVPlayerItemTrack _transferHapticVolumeToFig](self, "_transferHapticVolumeToFig");
}

- (float)hapticVolume
{
  return self->_playerItemTrack->hapticVolume;
}

- (void)setMutesHaptics:(BOOL)a3
{
  self->_playerItemTrack->mutesHaptics = a3;
  self->_playerItemTrack->mutesHapticsWasSet = 1;
  -[AVPlayerItemTrack _transferMutesHapticsToFig](self, "_transferMutesHapticsToFig");
}

- (BOOL)mutesHaptics
{
  return self->_playerItemTrack->mutesHaptics;
}

- (void)_transferHapticVolumeToFig
{
  double v2;
  AVPlayerItemTrackInternal *playerItemTrack;
  OpaqueFigPlaybackItem *figPlaybackItem;
  uint64_t trackID;
  uint64_t v6;
  void (*v7)(OpaqueFigPlaybackItem *, uint64_t, const __CFString *, uint64_t);

  playerItemTrack = self->_playerItemTrack;
  figPlaybackItem = playerItemTrack->figPlaybackItem;
  if (figPlaybackItem && playerItemTrack->hapticVolumeWasSet)
  {
    trackID = playerItemTrack->trackID;
    *(float *)&v2 = playerItemTrack->hapticVolume;
    v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
    v7 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                              + 112);
    if (v7)
      v7(figPlaybackItem, trackID, CFSTR("Volume"), v6);
  }
}

- (void)_transferMutesHapticsToFig
{
  AVPlayerItemTrackInternal *playerItemTrack;
  OpaqueFigPlaybackItem *figPlaybackItem;
  uint64_t trackID;
  _BOOL4 mutesHaptics;
  void (*v6)(OpaqueFigPlaybackItem *, uint64_t, const __CFString *, uint64_t);
  uint64_t v7;

  playerItemTrack = self->_playerItemTrack;
  figPlaybackItem = playerItemTrack->figPlaybackItem;
  if (figPlaybackItem)
  {
    if (playerItemTrack->mutesHapticsWasSet)
    {
      trackID = playerItemTrack->trackID;
      mutesHaptics = playerItemTrack->mutesHaptics;
      v6 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                + 112);
      if (v6)
      {
        if (mutesHaptics)
          v7 = *MEMORY[0x1E0C9AE50];
        else
          v7 = *MEMORY[0x1E0C9AE40];
        v6(figPlaybackItem, trackID, CFSTR("Muted"), v7);
      }
    }
  }
}

- (void)_updateTrackExtractionIDArrayProperty
{
  AVPlayerItemTrackInternal *playerItemTrack;
  id v4;
  NSMutableArray *sampleBufferOutputs;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  AVPlayerItemTrackInternal *v10;
  OpaqueFigPlaybackItem *figPlaybackItem;
  uint64_t trackID;
  void (*v13)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, id);
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  playerItemTrack = self->_playerItemTrack;
  if (playerItemTrack->figPlaybackItem && playerItemTrack->sampleBufferOutputs)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    sampleBufferOutputs = self->_playerItemTrack->sampleBufferOutputs;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sampleBufferOutputs, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(sampleBufferOutputs);
          objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "_extractionID")));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sampleBufferOutputs, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }
    v10 = self->_playerItemTrack;
    figPlaybackItem = v10->figPlaybackItem;
    trackID = v10->trackID;
    v13 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                              + 112);
    if (v13)
      v13(figPlaybackItem, trackID, *MEMORY[0x1E0CC5540], v4);

  }
}

- (void)_attachToFigPlaybackItemOfPlayerItem:(id)a3
{
  NSObject *v5;
  AVPlayerItemTrackInternal *playerItemTrack;

  v5 = objc_msgSend(-[AVPlayerItemTrack _playerItem](self, "_playerItem"), "_copyStateDispatchQueue");
  if (v5)
    dispatch_release(v5);
  if (!self->_playerItemTrack->figPlaybackItem)
  {
    self->_playerItemTrack->figPlaybackItem = (OpaqueFigPlaybackItem *)objc_msgSend(a3, "_copyFigPlaybackItem");
    playerItemTrack = self->_playerItemTrack;
    if (playerItemTrack->enabledWasSet)
    {
      -[AVPlayerItemTrack _transferEnabledToFig](self, "_transferEnabledToFig");
      playerItemTrack = self->_playerItemTrack;
    }
    if (playerItemTrack->loudnessInfo)
    {
      -[AVPlayerItemTrack _transferLoudnessInfoToFig](self, "_transferLoudnessInfoToFig");
      playerItemTrack = self->_playerItemTrack;
    }
    if (playerItemTrack->videoEnhancementFilterOptions)
    {
      -[AVPlayerItemTrack _transferVideoEnhancementOptionsToFig](self, "_transferVideoEnhancementOptionsToFig");
      playerItemTrack = self->_playerItemTrack;
    }
    if (playerItemTrack->disableColorMatchingWasSet)
    {
      -[AVPlayerItemTrack _transferDisableColorMatchingToFig](self, "_transferDisableColorMatchingToFig");
      playerItemTrack = self->_playerItemTrack;
    }
    if (playerItemTrack->activeHapticChannelIndexWasSet)
    {
      -[AVPlayerItemTrack _transferActiveHapticChannelIndexToFig](self, "_transferActiveHapticChannelIndexToFig");
      playerItemTrack = self->_playerItemTrack;
    }
    if (playerItemTrack->hapticVolumeWasSet)
    {
      -[AVPlayerItemTrack _transferHapticVolumeToFig](self, "_transferHapticVolumeToFig");
      playerItemTrack = self->_playerItemTrack;
    }
    if (playerItemTrack->mutesHapticsWasSet)
      -[AVPlayerItemTrack _transferMutesHapticsToFig](self, "_transferMutesHapticsToFig");
    -[AVPlayerItemTrack _updateTrackExtractionIDArrayProperty](self, "_updateTrackExtractionIDArrayProperty");
  }
}

- (BOOL)_figPlaybackItemIsReadyForInspection
{
  NSObject *ivarAccessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_playerItemTrack->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__AVPlayerItemTrack__figPlaybackItemIsReadyForInspection__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__AVPlayerItemTrack__figPlaybackItemIsReadyForInspection__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 24);
  return result;
}

- (void)_respondToFigPlaybackItemBecomingReadyForInpection
{
  NSObject *ivarAccessQueue;
  _QWORD block[5];

  ivarAccessQueue = self->_playerItemTrack->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__AVPlayerItemTrack__respondToFigPlaybackItemBecomingReadyForInpection__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

uint64_t __71__AVPlayerItemTrack__respondToFigPlaybackItemBecomingReadyForInpection__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (void)addOutput:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *sampleBufferOutputs;
  uint64_t v12;
  double v13;
  void *v14;
  uint64_t v15;
  AVPlayerItemTrackInternal *playerItemTrack;
  OpaqueFigPlaybackItem *figPlaybackItem;
  uint64_t trackID;
  void (*v19)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, uint64_t);
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot add any AVPlayerItemOutput other than AVPlayerItemSampleBufferOutput to AVPlayerItemTrack"), v6, v7, v8, v9, v10, v21), 0);
    objc_exception_throw(v20);
  }
  sampleBufferOutputs = self->_playerItemTrack->sampleBufferOutputs;
  if (!sampleBufferOutputs)
  {
    self->_playerItemTrack->sampleBufferOutputs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sampleBufferOutputs = self->_playerItemTrack->sampleBufferOutputs;
  }
  if ((-[NSMutableArray containsObject:](sampleBufferOutputs, "containsObject:", a3) & 1) == 0)
  {
    -[NSMutableArray addObject:](self->_playerItemTrack->sampleBufferOutputs, "addObject:", a3);
    objc_msgSend(a3, "_setTrackID:", self->_playerItemTrack->trackID);
    v12 = FigAtomicAdd32();
    objc_msgSend(a3, "_setExtractionID:", v12);
    objc_msgSend(a3, "_attachToPlayerItemTrack:figPlaybackItem:", self, self->_playerItemTrack->figPlaybackItem);
    objc_msgSend(a3, "_advanceInterval");
    if (v13 > 0.0)
    {
      v22 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
      v14 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(a3, "_advanceInterval");
      v23[0] = objc_msgSend(v14, "numberWithDouble:");
      v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      playerItemTrack = self->_playerItemTrack;
      figPlaybackItem = playerItemTrack->figPlaybackItem;
      trackID = playerItemTrack->trackID;
      v19 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 16)
                                                                                     + 112);
      if (v19)
        v19(figPlaybackItem, trackID, *MEMORY[0x1E0CC5548], v15);
    }
    -[AVPlayerItemTrack _updateTrackExtractionIDArrayProperty](self, "_updateTrackExtractionIDArrayProperty");
    objc_msgSend(a3, "_setTimebase:", objc_msgSend(-[AVPlayerItemTrack _playerItem](self, "_playerItem"), "unfoldedTimebase"));
  }
}

- (void)removeOutput:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot remove any AVPlayerItemOutput other than AVPlayerItemSampleBufferOutput from AVPlayerItemTrack"), v6, v7, v8, v9, v10, v12), 0);
    objc_exception_throw(v11);
  }
  if (-[NSMutableArray containsObject:](self->_playerItemTrack->sampleBufferOutputs, "containsObject:", a3))
  {
    -[NSMutableArray removeObject:](self->_playerItemTrack->sampleBufferOutputs, "removeObject:", a3);
    objc_msgSend(a3, "_detachFromPlayerItemTrack");
    objc_msgSend(a3, "_setTimebase:", 0);
    -[AVPlayerItemTrack _updateTrackExtractionIDArrayProperty](self, "_updateTrackExtractionIDArrayProperty");
  }
}

- (NSArray)outputs
{
  NSMutableArray *sampleBufferOutputs;

  sampleBufferOutputs = self->_playerItemTrack->sampleBufferOutputs;
  if (sampleBufferOutputs)
    return (NSArray *)(id)-[NSMutableArray copy](sampleBufferOutputs, "copy");
  else
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

@end
