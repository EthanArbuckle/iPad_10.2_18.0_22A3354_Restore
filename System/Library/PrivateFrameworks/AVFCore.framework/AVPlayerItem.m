@implementation AVPlayerItem

uint64_t __22__AVPlayerItem_status__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 272);
  return result;
}

__n128 __24__AVPlayerItem_duration__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  result = *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 460);
  v1[3].n128_u64[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 476);
  v1[2] = result;
  return result;
}

- (BOOL)_suppressesVideoLayers
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__AVPlayerItem__suppressesVideoLayers__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_preferredPixelBufferAttributes
{
  VTPixelBufferAttributesMediatorCopyProperty();
  return 0;
}

void __39__AVPlayerItem__copyStateDispatchQueue__block_invoke(uint64_t a1)
{
  NSObject *v1;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 128);
  v1 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v1)
    dispatch_retain(v1);
}

uint64_t __31__AVPlayerItem_hasEnabledAudio__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 967);
  return result;
}

__n128 __29__AVPlayerItem_loopTimeRange__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __n128 result;
  __int128 v4;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(__n128 *)(v2 + 1008);
  v4 = *(_OWORD *)(v2 + 1040);
  *(_OWORD *)(v1 + 48) = *(_OWORD *)(v2 + 1024);
  *(_OWORD *)(v1 + 64) = v4;
  *(__n128 *)(v1 + 32) = result;
  return result;
}

- (id)_copyStateDispatchQueue
{
  NSObject *ivarAccessQueue;
  void *v3;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__AVPlayerItem__copyStateDispatchQueue__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_player
{
  return (id)objc_msgSend((id)self->_playerItem->allowedAudioSpatializationFormats, "referencedObject");
}

- (id)_nameForLogging
{
  AVPlayerItemInternal *playerItem;
  void *v3;

  playerItem = self->_playerItem;
  if (playerItem && (v3 = *(void **)&playerItem->loopTimeRange.duration.timescale) != 0)
    return (id)objc_msgSend(v3, "name");
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), self);
}

- (void)_markFigAssetAsReadyForInspectionOfMediaSelectionOptions
{
  NSObject *ivarAccessQueue;
  _QWORD block[5];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__AVPlayerItem__markFigAssetAsReadyForInspectionOfMediaSelectionOptions__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

- (id)_currentMediaSelectionFromFigSelectedMediaArray:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AVMediaSelectionGroup *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  AVMediaSelection *v15;
  AVAsset *v16;
  id v17;
  _BOOL4 v19;
  NSArray *obj;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = -[AVPlayerItem _isFigAssetReadyForInspectionOfMediaSelectionOptions](self, "_isFigAssetReadyForInspectionOfMediaSelectionOptions");
  if (v19)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = -[AVAsset availableMediaCharacteristicsWithMediaSelectionOptions](self->_playerItem->asset, "availableMediaCharacteristicsWithMediaSelectionOptions");
    v23 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v23)
    {
      v22 = *(_QWORD *)v30;
      v5 = *MEMORY[0x1E0CC5E98];
      v6 = *MEMORY[0x1E0CC5E88];
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v30 != v22)
            objc_enumerationMutation(obj);
          v24 = v7;
          v8 = -[AVAsset mediaSelectionGroupForMediaCharacteristic:](-[AVPlayerItem asset](self, "asset"), "mediaSelectionGroupForMediaCharacteristic:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v7));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (v27 = 0u,
                v28 = 0u,
                v25 = 0u,
                v26 = 0u,
                (v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v25, v33, 16)) != 0))
          {
            v10 = v9;
            v11 = *(_QWORD *)v26;
LABEL_10:
            v12 = 0;
            while (1)
            {
              if (*(_QWORD *)v26 != v11)
                objc_enumerationMutation(a3);
              v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = objc_msgSend(v13, "objectForKey:", v5);
                if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  if (-[AVMediaSelectionGroup _matchesGroupID:mediaType:](v8, "_matchesGroupID:mediaType:", objc_msgSend(v13, "objectForKey:", v6), v14))
                  {
                    break;
                  }
                }
              }
              if (v10 == ++v12)
              {
                v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
                if (v10)
                  goto LABEL_10;
                goto LABEL_19;
              }
            }
          }
          else
          {
LABEL_19:
            objc_msgSend(v21, "addObject:", -[AVPlayerItem _propertyListForMediaSelection:forGroup:](self, "_propertyListForMediaSelection:forGroup:", +[AVMediaSelectionOption mediaSelectionNilOptionForGroup:](AVMediaSelectionOption, "mediaSelectionNilOptionForGroup:", v8), v8));
          }
          v7 = v24 + 1;
        }
        while (v24 + 1 != v23);
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v23);
    }
  }
  if (a3)
    objc_msgSend(v21, "addObjectsFromArray:", a3);
  v15 = [AVMediaSelection alloc];
  v16 = -[AVPlayerItem asset](self, "asset");
  if (v19)
    v17 = -[AVMediaSelection _initWithAsset:selectedMediaArray:](v15, "_initWithAsset:selectedMediaArray:", v16, v21);
  else
    v17 = -[AVMediaSelection _initWithDeferredLoadingOfAsset:selectedMediaArray:](v15, "_initWithDeferredLoadingOfAsset:selectedMediaArray:", v16, v21);
  return v17;
}

- (AVAsset)asset
{
  return self->_playerItem->asset;
}

- (BOOL)_isFigAssetReadyForInspectionOfMediaSelectionOptions
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__AVPlayerItem__isFigAssetReadyForInspectionOfMediaSelectionOptions__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_selectMediaOption:(id)a3 inMediaSelectionGroup:(id)a4
{
  OpaqueFigPlaybackItem *v7;
  OpaqueFigPlaybackItem *v8;
  NSObject *ivarAccessQueue;
  uint64_t v10;
  uint64_t FigBaseObject;
  void (*v12)(uint64_t, _QWORD, uint64_t);
  _QWORD block[5];

  LODWORD(v7) = -[AVAsset isEqual:](-[AVPlayerItem asset](self, "asset"), "isEqual:", objc_msgSend(a4, "asset"));
  if ((_DWORD)v7)
  {
    if (a3 || (LODWORD(v7) = objc_msgSend(a4, "allowsEmptySelection"), (_DWORD)v7))
    {
      v7 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
      if (v7)
      {
        v8 = v7;
        ivarAccessQueue = self->_playerItem->ivarAccessQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __57__AVPlayerItem__selectMediaOption_inMediaSelectionGroup___block_invoke;
        block[3] = &unk_1E302FA10;
        block[4] = self;
        av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
        v10 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", -[AVPlayerItem _propertyListForMediaSelection:forGroup:](self, "_propertyListForMediaSelection:forGroup:", a3, a4));
        FigBaseObject = FigPlaybackItemGetFigBaseObject();
        v12 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
        if (v12)
          v12(FigBaseObject, *MEMORY[0x1E0CC52E0], v10);
        CFRelease(v8);
        LOBYTE(v7) = 1;
      }
    }
  }
  return (char)v7;
}

__n128 __32__AVPlayerItem_presentationSize__block_invoke(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 944);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = result;
  return result;
}

- (CMTime)duration
{
  NSObject *ivarAccessQueue;
  CMTime *result;
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
  v10 = &unk_1935931BF;
  v11 = *MEMORY[0x1E0CA2E10];
  v12 = *(_QWORD *)(MEMORY[0x1E0CA2E10] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__AVPlayerItem_duration__block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *(CMTime *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (void)setPlaybackLikelyToKeepUpTrigger:(int64_t)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayerItem_setPlaybackLikelyToKeepUpTrigger___block_invoke;
  v5[3] = &unk_1E302FE78;
  v5[4] = self;
  v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updatePlaybackLikelyToKeepUpTriggerOnFigPlaybackItem](self, "_updatePlaybackLikelyToKeepUpTriggerOnFigPlaybackItem");
}

- (id)_ensureAssetWithFigPlaybackItemWithTrackIDs:(id)a3
{
  NSObject *v5;
  NSObject *ivarAccessQueue;
  id v7;
  _QWORD v9[6];
  _QWORD block[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (-[AVAsset _isStreaming](self->_playerItem->asset, "_isStreaming")
    && !+[AVPlayerItem _forStreamingItemsVendAssetWithFigPlaybackItem](AVPlayerItem, "_forStreamingItemsVendAssetWithFigPlaybackItem"))
  {
    ivarAccessQueue = self->_playerItem->ivarAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__AVPlayerItem__ensureAssetWithFigPlaybackItemWithTrackIDs___block_invoke;
    block[3] = &unk_1E302FDD8;
    block[4] = a3;
    block[5] = self;
    block[6] = &v11;
    block[7] = &v15;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  }
  else
  {
    v5 = self->_playerItem->ivarAccessQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__AVPlayerItem__ensureAssetWithFigPlaybackItemWithTrackIDs___block_invoke_2;
    v9[3] = &unk_1E302FD60;
    v9[4] = self;
    v9[5] = &v15;
    av_readwrite_dispatch_queue_read(v5, v9);
  }
  if (*((_BYTE *)v12 + 24))
    objc_msgSend((id)v16[5], "tracks");
  v7 = (id)v16[5];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v7;
}

uint64_t __69__AVPlayerItem__updatePlaybackLikelyToKeepUpTriggerOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "playbackLikelyToKeepUpTrigger");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1 == 1)
      v5 = *MEMORY[0x1E0CC4CB8];
    else
      v5 = *MEMORY[0x1E0CC4CB0];
    return v4(FigBaseObject, *MEMORY[0x1E0CC51B0], v5);
  }
  return result;
}

- (id)_tracks
{
  id v3;
  OpaqueFigPlaybackItem *v4;
  OpaqueFigPlaybackItem *v5;
  uint64_t FigBaseObject;
  unsigned int (*v7)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  CFTypeRef cf;

  v3 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  if (-[AVPlayerItem _isReadyForInspectionOfTracks](self, "_isReadyForInspectionOfTracks")
    || sOKToBlockWhenGettingValuesOfProperties == 1)
  {
    if (-[AVAsset _isStreaming](self->_playerItem->asset, "_isStreaming"))
    {
      v4 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
      if (v4)
      {
        v5 = v4;
        cf = 0;
        FigBaseObject = FigPlaybackItemGetFigBaseObject();
        v7 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 8)
                                                                                 + 48);
        if (v7 && !v7(FigBaseObject, *MEMORY[0x1E0CC5388], *MEMORY[0x1E0C9AE00], &cf))
        {
          v3 = -[AVPlayerItem _tracksWithFPTrackIDArray:fromFigPlaybackItem:](self, "_tracksWithFPTrackIDArray:fromFigPlaybackItem:", cf, v5);
          if (cf)
            CFRelease(cf);
        }
        CFRelease(v5);
      }
    }
    else if (self->_playerItem->asset)
    {
      return -[AVPlayerItem _tracksFromAssetTrackIDs](self, "_tracksFromAssetTrackIDs");
    }
  }
  return v3;
}

- (BOOL)_isReadyForInspectionOfTracks
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AVPlayerItem__isReadyForInspectionOfTracks__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_attachToFigPlayer
{
  const void *v3;
  uint64_t v4;
  NSObject *ivarAccessQueue;
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, _QWORD, _QWORD);
  AVPlayerItemInternal *playerItem;
  AVAsset *asset;
  uint64_t v10;
  __CFDictionary *Mutable;
  id v12;
  const void *v13;
  const void *v14;
  const void **v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, _QWORD, uint64_t, CFNumberRef *);
  int v19;
  CFNumberRef v20;
  id v21;
  void *v22;
  const void *v23;
  NSObject *global_queue;
  NSURL *URL;
  signed int v26;
  void *v27;
  _QWORD v28[5];
  CFNumberRef number;
  _QWORD v30[6];
  uint64_t v31;
  signed int valuePtr;
  _QWORD block[11];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  uint64_t v64;

  v64 = 0;
  v3 = (const void *)objc_msgSend(-[AVPlayerItem _player](self, "_player"), "_copyFigPlayer");
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3052000000;
  v53 = __Block_byref_object_copy__7;
  v54 = __Block_byref_object_dispose__7;
  v55 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3052000000;
  v47 = __Block_byref_object_copy__7;
  v48 = __Block_byref_object_dispose__7;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 1;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3052000000;
  v37 = __Block_byref_object_copy__7;
  v38 = __Block_byref_object_dispose__7;
  v39 = 0;
  v4 = MEMORY[0x1E0C809B0];
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__AVPlayerItem__attachToFigPlayer__block_invoke;
  block[3] = &unk_1E3031E40;
  block[4] = self;
  block[5] = &v60;
  block[6] = &v56;
  block[7] = &v50;
  block[8] = &v44;
  block[9] = &v40;
  block[10] = &v34;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  if (*((_BYTE *)v61 + 24))
  {
    FigBaseObject = FigPlayerGetFigBaseObject();
    v7 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v7)
      v7(FigBaseObject, *MEMORY[0x1E0CC59E0], *MEMORY[0x1E0C9AE50]);
  }
  playerItem = self->_playerItem;
  if (playerItem->figPlaybackItem)
    goto LABEL_63;
  valuePtr = 0;
  v31 = 0;
  asset = playerItem->asset;
  if (!asset)
    goto LABEL_47;
  v10 = *MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v12 = -[AVPlayerItem _nameForLogging](self, "_nameForLogging");
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CC4E80], v12);
  v13 = (const void *)v51[5];
  if (v13)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CC4E78], v13);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CC4E90], (const void *)v35[5]);
  v14 = (const void *)v45[5];
  if (v14)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CC4E70], v14);
  if (*((_BYTE *)v41 + 24))
    v15 = (const void **)MEMORY[0x1E0C9AE50];
  else
    v15 = (const void **)MEMORY[0x1E0C9AE40];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CC4E88], *v15);
  valuePtr = objc_msgSend((id)objc_opt_class(), "_createFigPlaybackItemForFigPlayer:asset:URL:flags:options:playbackItem:", v3, asset, self->_playerItem->URL, 0, Mutable, &v31);
  if (Mutable)
    CFRelease(Mutable);
  if (!v31)
  {
    if (valuePtr)
      goto LABEL_50;
    goto LABEL_47;
  }
  v16 = self->_playerItem->ivarAccessQueue;
  v30[0] = v4;
  v30[1] = 3221225472;
  v30[2] = __34__AVPlayerItem__attachToFigPlayer__block_invoke_2;
  v30[3] = &unk_1E302FE78;
  v30[4] = self;
  v30[5] = v31;
  av_readwrite_dispatch_queue_write(v16, v30);
  -[AVPlayerItem _addFPListeners](self, "_addFPListeners");
  number = 0;
  v17 = FigPlaybackItemGetFigBaseObject();
  v18 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48);
  if (!v18)
    goto LABEL_20;
  v19 = v18(v17, *MEMORY[0x1E0CC5310], v10, &number);
  v20 = number;
  if (!v19 && number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
LABEL_20:
    v20 = number;
  }
  if (v20)
    CFRelease(v20);
  if (!valuePtr
    && -[AVPlayerItem _configurePlaybackItemAndReturnError:](self, "_configurePlaybackItemAndReturnError:", &v64))
  {
    -[AVPlayerItem _updateLimitReadAheadOnFigPlaybackItem](self, "_updateLimitReadAheadOnFigPlaybackItem");
    if (-[AVPlayerItem playbackLikelyToKeepUpTrigger](self, "playbackLikelyToKeepUpTrigger"))
      -[AVPlayerItem _updatePlaybackLikelyToKeepUpTriggerOnFigPlaybackItem](self, "_updatePlaybackLikelyToKeepUpTriggerOnFigPlaybackItem");
    if (-[AVPlayerItem willNeverSeekBackwardsHint](self, "willNeverSeekBackwardsHint"))
      -[AVPlayerItem _updateWillNeverSeekBackwardsHintOnFigPlaybackItem](self, "_updateWillNeverSeekBackwardsHintOnFigPlaybackItem");
    if (-[AVPlayerItem alwaysMonitorsPlayability](self, "alwaysMonitorsPlayability"))
      -[AVPlayerItem _updateAlwaysMonitorsPlayabilityOnFigPlaybackItem](self, "_updateAlwaysMonitorsPlayabilityOnFigPlaybackItem");
    if (-[AVPlayerItem isNonForcedSubtitleDisplayEnabled](self, "isNonForcedSubtitleDisplayEnabled"))
      -[AVPlayerItem _updateNonForcedSubtitleDisplayEnabledOnFigPlaybackItem](self, "_updateNonForcedSubtitleDisplayEnabledOnFigPlaybackItem");
    if (-[AVPlayerItem usesMinimalLatencyForVideoCompositionRendering](self, "usesMinimalLatencyForVideoCompositionRendering"))
    {
      -[AVPlayerItem _updateUsesMinimalLatencyForVideoCompositionRenderingOnFigPlaybackItem](self, "_updateUsesMinimalLatencyForVideoCompositionRenderingOnFigPlaybackItem");
    }
    -[AVPlayerItem _updateRestrictsAutomaticMediaSelectionToAvailableOfflineOptions](self, "_updateRestrictsAutomaticMediaSelectionToAvailableOfflineOptions");
    objc_msgSend(-[AVPlayerItem _cachedTracks](self, "_cachedTracks"), "makeObjectsPerformSelector:withObject:", sel__attachToFigPlaybackItemOfPlayerItem_, self);
    -[AVPlayerItem _evaluateVideoOutputs](self, "_evaluateVideoOutputs");
    -[AVPlayerItem _evaluateLegibleOutputs](self, "_evaluateLegibleOutputs");
    -[AVPlayerItem _evaluateMetadataOutputs](self, "_evaluateMetadataOutputs");
    -[AVPlayerItem _evaluateRenderedLegibleOutputs](self, "_evaluateRenderedLegibleOutputs");
    v21 = -[AVPlayerItem _copyIntegratedTimelineIfCreated](self, "_copyIntegratedTimelineIfCreated");
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "_attachToItem:", self);
      v23 = (const void *)objc_msgSend(-[AVPlayerItem _player](self, "_player"), "_copyInterstitialCoordinatorIfCreated");
      objc_msgSend(v22, "_attachCoordinator:", v23);
    }
    else
    {
      v23 = 0;
    }

    if (v23)
      CFRelease(v23);
    global_queue = dispatch_get_global_queue(0, 0);
    v28[0] = v4;
    v28[1] = 3221225472;
    v28[2] = __34__AVPlayerItem__attachToFigPlayer__block_invoke_3;
    v28[3] = &unk_1E302FA10;
    v28[4] = self;
    dispatch_async(global_queue, v28);
    if (!valuePtr)
    {
      if (v31
        && -[AVAsset statusOfValueForKey:error:](asset, "statusOfValueForKey:error:", CFSTR("streaming"), 0) == 2
        && -[AVAsset _isStreaming](self->_playerItem->asset, "_isStreaming"))
      {
        -[AVPlayerItem _respondToBecomingReadyForBasicInspection](self, "_respondToBecomingReadyForBasicInspection");
      }
LABEL_47:
      if (!*((_BYTE *)v57 + 24)
        && -[AVPlayerItem automaticallyHandlesInterstitialEvents](self, "automaticallyHandlesInterstitialEvents"))
      {
        -[AVPlayerItem _addInterstitialEventCollector](self, "_addInterstitialEventCollector");
      }
    }
  }
LABEL_50:
  if (valuePtr || v64)
  {
    URL = self->_playerItem->URL;
    if (URL)
    {
      if (v64)
      {
LABEL_54:
        -[AVPlayerItem _changeStatusToFailedWithError:](self, "_changeStatusToFailedWithError:");
        goto LABEL_63;
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        if (v64)
          goto LABEL_54;
        v27 = 0;
        v26 = valuePtr;
        goto LABEL_62;
      }
      URL = (NSURL *)-[AVAsset URL](asset, "URL");
      if (v64)
        goto LABEL_54;
    }
    v26 = valuePtr;
    if (URL)
      v27 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", URL, *MEMORY[0x1E0CB3308]);
    else
      v27 = 0;
LABEL_62:
    -[AVPlayerItem _changeStatusToFailedWithError:](self, "_changeStatusToFailedWithError:", AVLocalizedErrorWithUnderlyingOSStatus(v26, v27));
  }
LABEL_63:

  if (v3)
    CFRelease(v3);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);
}

- (id)_cachedTracks
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__AVPlayerItem__cachedTracks__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isNonForcedSubtitleDisplayEnabled
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayerItem_isNonForcedSubtitleDisplayEnabled__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)playbackLikelyToKeepUpTrigger
{
  NSObject *ivarAccessQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AVPlayerItem_playbackLikelyToKeepUpTrigger__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_evaluateVideoOutputs
{
  NSObject *figConfigurationQueue;
  _QWORD block[5];

  figConfigurationQueue = self->_playerItem->figConfigurationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__AVPlayerItem_AVPlayerItemOutputs___evaluateVideoOutputs__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_async(figConfigurationQueue, block);
}

- (void)_evaluateMetadataOutputs
{
  NSObject *figPlaybackItemSetterQueue;
  _QWORD block[5];

  figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__AVPlayerItem_AVPlayerItemOutputs___evaluateMetadataOutputs__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_sync(figPlaybackItemSetterQueue, block);
}

- (void)_evaluateLegibleOutputs
{
  NSObject *figConfigurationQueue;
  _QWORD block[5];

  figConfigurationQueue = self->_playerItem->figConfigurationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__AVPlayerItem_AVPlayerItemOutputs___evaluateLegibleOutputs__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_async(figConfigurationQueue, block);
}

- (BOOL)automaticallyHandlesInterstitialEvents
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
  v9 = 1;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__AVPlayerItem_AVPlayerInterstitialSupport__automaticallyHandlesInterstitialEvents__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)willNeverSeekBackwardsHint
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__AVPlayerItem_willNeverSeekBackwardsHint__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)usesMinimalLatencyForVideoCompositionRendering
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__AVPlayerItem_usesMinimalLatencyForVideoCompositionRendering__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)alwaysMonitorsPlayability
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__AVPlayerItem_alwaysMonitorsPlayability__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_updateRestrictsAutomaticMediaSelectionToAvailableOfflineOptions
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __80__AVPlayerItem__updateRestrictsAutomaticMediaSelectionToAvailableOfflineOptions__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateLimitReadAheadOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__AVPlayerItem__updateLimitReadAheadOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_respondToBecomingReadyForBasicInspectionWithDuration:(id *)a3
{
  __int128 v5;
  int64_t var3;

  if (!-[AVPlayerItem _isReadyForInspectionOfDuration](self, "_isReadyForInspectionOfDuration"))
  {
    if (-[AVAsset statusOfValueForKey:error:](self->_playerItem->asset, "statusOfValueForKey:error:", CFSTR("duration"), 0) == 2)-[AVPlayerItem _markAsReadyForInspectionOfDuration](self, "_markAsReadyForInspectionOfDuration");
    if (-[AVPlayerItem _isReadyForInspectionOfDuration](self, "_isReadyForInspectionOfDuration"))
    {
      v5 = *(_OWORD *)&a3->var0;
      var3 = a3->var3;
      -[AVPlayerItem _informObserversAboutAvailabilityOfDuration:](self, "_informObserversAboutAvailabilityOfDuration:", &v5);
    }
  }
  if (!-[AVAsset _isStreaming](self->_playerItem->asset, "_isStreaming"))
  {
    -[AVPlayerItem _markAsReadyForBasicInspection](self, "_markAsReadyForBasicInspection");
    -[AVPlayerItem _markAsReadyForInspectionOfTracks](self, "_markAsReadyForInspectionOfTracks");
    -[AVPlayerItem _markAsReadyForInspectionOfPresentationSize](self, "_markAsReadyForInspectionOfPresentationSize");
    objc_msgSend(-[AVPlayerItem _cachedTracks](self, "_cachedTracks"), "makeObjectsPerformSelector:", sel__respondToFigPlaybackItemBecomingReadyForInpection);
    -[AVPlayerItem _kickAssetObserversIfAppropriate](self, "_kickAssetObserversIfAppropriate");
    -[AVPlayerItem _informObserversAboutAvailabilityOfTracks:](self, "_informObserversAboutAvailabilityOfTracks:", 0);
    -[AVPlayerItem _informObserversAboutAvailabilityOfPresentationSize](self, "_informObserversAboutAvailabilityOfPresentationSize");
  }
}

- (BOOL)_isReadyForInspectionOfDuration
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__AVPlayerItem__isReadyForInspectionOfDuration__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_markAsReadyForInspectionOfTracks
{
  NSObject *ivarAccessQueue;
  _QWORD block[5];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AVPlayerItem__markAsReadyForInspectionOfTracks__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

- (void)_kickAssetObserversIfAppropriate
{
  if (self->_playerItem->wasInitializedWithURL
    && +[AVPlayerItem _forNonStreamingURLsFireKVOForAssetWhenReadyForInspection](AVPlayerItem, "_forNonStreamingURLsFireKVOForAssetWhenReadyForInspection")&& !BYTE3(self->_playerItem->timedMetadata))
  {
    -[AVPlayerItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("asset"));
    -[AVPlayerItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("asset"));
    BYTE3(self->_playerItem->timedMetadata) = 1;
  }
}

- (void)_informObserversAboutAvailabilityOfTracks:(id)a3
{
  NSObject *ivarAccessQueue;
  uint64_t v6;
  _QWORD v7[6];

  if (!BYTE2(self->_playerItem->timedMetadata))
  {
    -[AVPlayerItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("tracks"));
    if (!a3)
      a3 = -[AVPlayerItem _tracks](self, "_tracks");
    ivarAccessQueue = self->_playerItem->ivarAccessQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__AVPlayerItem__informObserversAboutAvailabilityOfTracks___block_invoke;
    v7[3] = &unk_1E302FCE8;
    v7[4] = self;
    v7[5] = a3;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, v7);
    -[AVPlayerItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("tracks"));
    v6 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVPlayerItemTracksDidChangeNotification"), self, 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v6);
    BYTE2(self->_playerItem->timedMetadata) = 1;
  }
}

- (void)_informObserversAboutAvailabilityOfPresentationSize
{
  NSObject *figPlaybackItemAccessorQueue;
  _QWORD block[5];

  figPlaybackItemAccessorQueue = self->_playerItem->figPlaybackItemAccessorQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AVPlayerItem__informObserversAboutAvailabilityOfPresentationSize__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_async(figPlaybackItemAccessorQueue, block);
}

- (void)_addInterstitialEventCollector
{
  -[AVPlayerItem _addInterstitialEventCollectorLocked:](self, "_addInterstitialEventCollectorLocked:", 0);
}

- (void)_addInterstitialEventCollectorLocked:(BOOL)a3
{
  _BOOL8 v3;
  AVPlayerItemInterstitialEventCollector *v5;
  uint64_t v6;
  _QWORD v7[6];
  _QWORD v8[4];
  id v9;
  id location;

  v3 = a3;
  objc_initWeak(&location, -[AVPlayerItem _player](self, "_player"));
  v5 = [AVPlayerItemInterstitialEventCollector alloc];
  v6 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__AVPlayerItem__addInterstitialEventCollectorLocked___block_invoke;
  v8[3] = &unk_1E3032060;
  objc_copyWeak(&v9, &location);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __53__AVPlayerItem__addInterstitialEventCollectorLocked___block_invoke_2;
  v7[3] = &unk_1E302FCE8;
  v7[4] = self;
  v7[5] = -[AVPlayerItemInterstitialEventCollector initWithCoordinatorGenerator:](v5, "initWithCoordinatorGenerator:", v8);
  -[AVPlayerItem dispatchIVarWrite:locked:block:](self, "dispatchIVarWrite:locked:block:", 1, v3, v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)_tracksFromAssetTrackIDs
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__AVPlayerItem__tracksFromAssetTrackIDs__block_invoke;
  v5[3] = &unk_1E302FDB0;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (int)_createFigPlaybackItemForFigPlayer:(OpaqueFigPlayer *)a3 asset:(id)a4 URL:(id)a5 flags:(unsigned int)a6 options:(__CFDictionary *)a7 playbackItem:(OpaqueFigPlaybackItem *)a8
{
  uint64_t v10;
  uint64_t v14;
  uint64_t (*v15)(OpaqueFigPlayer *, uint64_t, _QWORD, __CFDictionary *, OpaqueFigPlaybackItem **);
  int v17;
  uint64_t (*v18)(OpaqueFigPlayer *, _QWORD, uint64_t, __CFDictionary *, OpaqueFigPlaybackItem **);
  uint64_t v19;
  const void *v20;
  uint64_t (*v21)(OpaqueFigPlayer *, _QWORD, uint64_t, __CFDictionary *, OpaqueFigPlaybackItem **);

  v10 = *(_QWORD *)&a6;
  if (objc_msgSend(a4, "_figAsset"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend(a4, "_shouldOptimizeAccessForLinearMoviePlayback"))
        LODWORD(v10) = v10 | 0x40;
    }
    v14 = objc_msgSend(a4, "_figAsset");
    v15 = *(uint64_t (**)(OpaqueFigPlayer *, uint64_t, _QWORD, __CFDictionary *, OpaqueFigPlaybackItem **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 96);
    if (v15)
      return v15(a3, v14, v10 | 0x80, a7, a8);
    return -12782;
  }
  else if (a5)
  {
    CFGetAllocator(a3);
    figAssetDefaultCreationFlags();
    v17 = FigAssetRemoteCreateWithURL();
    if (!v17)
    {
      v18 = *(uint64_t (**)(OpaqueFigPlayer *, _QWORD, uint64_t, __CFDictionary *, OpaqueFigPlaybackItem **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 96);
      if (v18)
        return v18(a3, 0, v10, a7, a8);
      else
        return -12782;
    }
  }
  else
  {
    v19 = objc_msgSend(a4, "_copyFormatReader");
    if (v19)
    {
      v20 = (const void *)v19;
      CFGetAllocator(a3);
      figAssetDefaultCreationFlags();
      v17 = FigAssetRemoteCreateWithFormatReader();
      if (!v17)
      {
        v21 = *(uint64_t (**)(OpaqueFigPlayer *, _QWORD, uint64_t, __CFDictionary *, OpaqueFigPlaybackItem **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 96);
        if (v21)
          v17 = v21(a3, 0, v10, a7, a8);
        else
          v17 = -12782;
      }
      CFRelease(v20);
    }
    else
    {
      return 0;
    }
  }
  return v17;
}

- (void)_updatePlaybackLikelyToKeepUpTriggerOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__AVPlayerItem__updatePlaybackLikelyToKeepUpTriggerOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

+ (BOOL)_forNonStreamingURLsFireKVOForAssetWhenReadyForInspection
{
  return 0;
}

- (void)_setAsset:(id)a3
{
  id v5;
  NSObject *ivarAccessQueue;
  id v7;
  NSObject *v8;
  _QWORD v9[6];
  _QWORD block[5];
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  if (self->_playerItem->asset != a3)
  {
    -[AVPlayerItem _removeFAListeners](self, "_removeFAListeners");
    v5 = a3;

    self->_playerItem->asset = (AVAsset *)a3;
    -[AVPlayerItem _addFAListeners](self, "_addFAListeners");
    if (!-[AVPlayerItem _isReadyForInspectionOfDuration](self, "_isReadyForInspectionOfDuration")
      && objc_msgSend(a3, "statusOfValueForKey:error:", CFSTR("duration"), 0) == 2)
    {
      -[AVPlayerItem _markAsReadyForInspectionOfDuration](self, "_markAsReadyForInspectionOfDuration");
      v13 = 0uLL;
      v14 = 0;
      -[AVPlayerItem _duration](self, "_duration");
      ivarAccessQueue = self->_playerItem->ivarAccessQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __26__AVPlayerItem__setAsset___block_invoke;
      block[3] = &unk_1E3031E68;
      block[4] = self;
      v11 = v13;
      v12 = v14;
      av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
    }
    if (objc_msgSend(a3, "statusOfValueForKey:error:", CFSTR("tracks"), 0) == 2
      && (objc_msgSend(a3, "_isStreaming") & 1) == 0)
    {
      -[AVPlayerItem _markAsReadyForInspectionOfTracks](self, "_markAsReadyForInspectionOfTracks");
      v7 = -[AVPlayerItem _tracks](self, "_tracks");
      v8 = self->_playerItem->ivarAccessQueue;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __26__AVPlayerItem__setAsset___block_invoke_2;
      v9[3] = &unk_1E302FCE8;
      v9[4] = self;
      v9[5] = v7;
      av_readwrite_dispatch_queue_write(v8, v9);
    }
    if (objc_msgSend(a3, "statusOfValueForKey:error:", CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions"), 0) == 2)
    {
      -[AVPlayerItem _markFigAssetAsReadyForInspectionOfMediaSelectionOptions](self, "_markFigAssetAsReadyForInspectionOfMediaSelectionOptions");
      -[AVPlayerItem _informObserversAboutAvailabilityOfCurrentMediaSelection](self, "_informObserversAboutAvailabilityOfCurrentMediaSelection");
    }
  }
}

- (void)_removeFAListeners
{
  OpaqueFigAsset *v3;
  OpaqueFigAsset *v4;
  id v5;
  id v6;

  v3 = -[AVAsset _figAsset](self->_playerItem->asset, "_figAsset");
  if (v3)
  {
    v4 = v3;
    v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v6 = -[AVPlayerItem _weakReference](self, "_weakReference");
    objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", v6, avplayeritem_figassetNotificationCallback, *MEMORY[0x1E0CC3678], v4);
    CFRelease(v6);
    CFRelease(v4);
  }
}

- (void)_addFAListeners
{
  OpaqueFigAsset *v3;
  OpaqueFigAsset *v4;
  id v5;
  id v6;

  v3 = -[AVAsset _figAsset](self->_playerItem->asset, "_figAsset");
  if (v3)
  {
    v4 = v3;
    v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v6 = -[AVPlayerItem _weakReference](self, "_weakReference");
    CFRetain(v6);
    CFRetain(v4);
    objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", v6, avplayeritem_figassetNotificationCallback, *MEMORY[0x1E0CC3678], v4, 0);
  }
}

- (void)_informObserversAboutAvailabilityOfDuration:(id *)a3
{
  NSObject *ivarAccessQueue;
  NSObject *figPlaybackItemAccessorQueue;
  _QWORD v6[6];
  _QWORD block[6];
  CMTime time2;
  CMTime time1;
  _QWORD v10[4];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3810000000;
  v10[3] = &unk_1935931BF;
  v11 = *a3;
  time1 = *(CMTime *)a3;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  if (CMTimeCompare(&time1, &time2))
  {
    -[AVPlayerItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("duration"));
    ivarAccessQueue = self->_playerItem->ivarAccessQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__AVPlayerItem__informObserversAboutAvailabilityOfDuration___block_invoke_4;
    v6[3] = &unk_1E302FDB0;
    v6[4] = self;
    v6[5] = v10;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, v6);
    -[AVPlayerItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("duration"));
  }
  else
  {
    figPlaybackItemAccessorQueue = self->_playerItem->figPlaybackItemAccessorQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__AVPlayerItem__informObserversAboutAvailabilityOfDuration___block_invoke;
    block[3] = &unk_1E302FD60;
    block[4] = self;
    block[5] = v10;
    dispatch_async(figPlaybackItemAccessorQueue, block);
  }
  _Block_object_dispose(v10, 8);
}

- (AVMediaSelection)currentMediaSelection
{
  NSObject *ivarAccessQueue;
  uint64_t v4;
  AVMediaSelection *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  AVMediaSelectionGroup *v13;
  id v14;
  AVMediaSelection *v15;
  AVAsset *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[6];
  _QWORD block[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  AVTelemetryGenerateID();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3052000000;
  v27 = __Block_byref_object_copy__7;
  v28 = __Block_byref_object_dispose__7;
  v29 = 0;
  if (-[AVPlayerItem _isFigAssetReadyForInspectionOfMediaSelectionOptionsAndFigPlaybackItemIsReadyForInspection](self, "_isFigAssetReadyForInspectionOfMediaSelectionOptionsAndFigPlaybackItemIsReadyForInspection"))
  {
    ivarAccessQueue = self->_playerItem->ivarAccessQueue;
    v4 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__AVPlayerItem_currentMediaSelection__block_invoke;
    block[3] = &unk_1E302FD60;
    block[4] = self;
    block[5] = &v24;
    av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
    v5 = (AVMediaSelection *)v25[5];
    if (!v5)
    {
      v6 = -[AVPlayerItem _currentMediaSelectionFromFigSelectedMediaArray:](self, "_currentMediaSelectionFromFigSelectedMediaArray:", -[AVPlayerItem _figSelectedMediaArray](self, "_figSelectedMediaArray"));
      v25[5] = (uint64_t)v6;
      v7 = self->_playerItem->ivarAccessQueue;
      v22[0] = v4;
      v22[1] = 3221225472;
      v22[2] = __37__AVPlayerItem_currentMediaSelection__block_invoke_2;
      v22[3] = &unk_1E302FDB0;
      v22[4] = self;
      v22[5] = &v24;
      av_readwrite_dispatch_queue_write(v7, v22);
      v5 = (AVMediaSelection *)v25[5];
    }
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (-[AVAsset statusOfValueForKey:error:](-[AVPlayerItem asset](self, "asset"), "statusOfValueForKey:error:", CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions"), 0) == 2)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v9 = -[AVAsset availableMediaCharacteristicsWithMediaSelectionOptions](self->_playerItem->asset, "availableMediaCharacteristicsWithMediaSelectionOptions", 0);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v19;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v9);
            v13 = -[AVAsset mediaSelectionGroupForMediaCharacteristic:](-[AVPlayerItem asset](self, "asset"), "mediaSelectionGroupForMediaCharacteristic:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12));
            v14 = -[AVPlayerItem _mediaOptionsSelectedByClientForKey:](self, "_mediaOptionsSelectedByClientForKey:", v13);
            if (v14)
              objc_msgSend(v8, "addObject:", -[AVPlayerItem _propertyListForMediaSelection:forGroup:](self, "_propertyListForMediaSelection:forGroup:", v14, v13));
            ++v12;
          }
          while (v10 != v12);
          v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
        }
        while (v10);
      }
      v15 = (AVMediaSelection *)-[AVMediaSelection _initWithAsset:selectedMediaArray:]([AVMediaSelection alloc], "_initWithAsset:selectedMediaArray:", -[AVPlayerItem asset](self, "asset"), v8);
    }
    else
    {
      v16 = -[AVPlayerItem asset](self, "asset");
      -[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:](v16, "loadValuesAsynchronouslyForKeys:completionHandler:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions")), &__block_literal_global_529);
      v15 = (AVMediaSelection *)-[AVMediaSelection _initWithAssetWithoutGroupDictionaries:]([AVMediaSelection alloc], "_initWithAssetWithoutGroupDictionaries:", -[AVPlayerItem asset](self, "asset"));
    }
    v5 = v15;
    v25[5] = (uint64_t)v15;
  }
  _Block_object_dispose(&v24, 8);
  return v5;
}

- (void)_informObserversAboutAvailabilityOfCurrentMediaSelection
{
  if (-[AVPlayerItem _isFigAssetReadyForInspectionOfMediaSelectionOptionsAndFigPlaybackItemIsReadyForInspection](self, "_isFigAssetReadyForInspectionOfMediaSelectionOptionsAndFigPlaybackItemIsReadyForInspection"))
  {
    -[AVPlayerItem _setCurrentMediaSelection:](self, "_setCurrentMediaSelection:", -[AVPlayerItem currentMediaSelection](self, "currentMediaSelection"));
  }
}

- (BOOL)_isFigAssetReadyForInspectionOfMediaSelectionOptionsAndFigPlaybackItemIsReadyForInspection
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __106__AVPlayerItem__isFigAssetReadyForInspectionOfMediaSelectionOptionsAndFigPlaybackItemIsReadyForInspection__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setCurrentMediaSelection:(id)a3
{
  NSObject *ivarAccessQueue;
  void *v5;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__AVPlayerItem__setCurrentMediaSelection___block_invoke;
  block[3] = &unk_1E302FE00;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v8 + 24))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v5, "postNotification:", objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("AVPlayerItemMediaSelectionDidChangeNotification"), self));
  }
  _Block_object_dispose(&v7, 8);
}

- (id)_figSelectedMediaArray
{
  OpaqueFigPlaybackItem *v2;
  OpaqueFigPlaybackItem *v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, _QWORD, id *);
  id v7;

  v7 = 0;
  v2 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v2)
  {
    v3 = v2;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v5 = *(void (**)(uint64_t, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v5)
      v5(FigBaseObject, *MEMORY[0x1E0CC52E0], *MEMORY[0x1E0C9AE00], &v7);
    CFRelease(v3);
    v2 = (OpaqueFigPlaybackItem *)v7;
  }
  return v2;
}

uint64_t __24__AVPlayerItem_hasVideo__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 966);
  return result;
}

uint64_t __55__AVPlayerItem__isReadyForInspectionOfPresentationSize__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 225);
  return result;
}

uint64_t __38__AVPlayerItem__suppressesVideoLayers__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 200);
  return result;
}

uint64_t __49__AVPlayerItem_isNonForcedSubtitleDisplayEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 964);
  return result;
}

uint64_t __47__AVPlayerItem__isReadyForInspectionOfDuration__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 226);
  return result;
}

uint64_t __42__AVPlayerItem__isReadyForBasicInspection__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 249);
  return result;
}

uint64_t __31__AVPlayerItem_hasEnabledVideo__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 965);
  return result;
}

- (BOOL)hasEnabledAudio
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__AVPlayerItem_hasEnabledAudio__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __59__AVPlayerItem__markAsReadyForInspectionOfPresentationSize__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 225) = 1;
  return result;
}

uint64_t __39__AVPlayerItem_audioTimePitchAlgorithm__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 504);
  return result;
}

uint64_t __37__AVPlayerItem_isPlaybackBufferEmpty__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 960);
  return result;
}

uint64_t __51__AVPlayerItem__markAsReadyForInspectionOfDuration__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 226) = 1;
  return result;
}

uint64_t __38__AVPlayerItem__hasEnqueuedVideoFrame__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 968);
  return result;
}

uint64_t __36__AVPlayerItem_isPlaybackBufferFull__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 961);
  return result;
}

uint64_t __46__AVPlayerItem__markAsReadyForBasicInspection__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 249) = 1;
  return result;
}

CFTypeRef __35__AVPlayerItem__copyFoldedTimebase__block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 208);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

_QWORD *__59__AVPlayerItem__updateItemIdentifierForCoordinatedPlayback__block_invoke(uint64_t a1)
{
  _QWORD *result;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFAllocator *v10;
  uint64_t i;
  void *v12;
  CFDictionaryRef v13;
  CFDictionaryRef v14;
  uint64_t FigBaseObject;
  void (*v16)(uint64_t, _QWORD, void *);
  uint64_t v17;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, _QWORD, uint64_t);
  uint64_t v21;
  uint64_t v22;
  CMTimeRange range;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  result = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "_playbackCoordinator");
  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(result, "interstitialTimeRangesForPlayerItem:", *(_QWORD *)(a1 + 32));
    if (v4)
    {
      v5 = v4;
      if (objc_msgSend(v4, "count"))
      {
        v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v25;
          v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v25 != v9)
                objc_enumerationMutation(v5);
              v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              if (v12)
                objc_msgSend(v12, "CMTimeRangeValue");
              else
                memset(&range, 0, sizeof(range));
              v13 = CMTimeRangeCopyAsDictionary(&range, v10);
              if (v13)
              {
                v14 = v13;
                objc_msgSend(v6, "addObject:", v13);
                CFRelease(v14);
              }
            }
            v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v8);
        }
        FigBaseObject = FigPlaybackItemGetFigBaseObject();
        v16 = *(void (**)(uint64_t, _QWORD, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
        if (v16)
          v16(FigBaseObject, *MEMORY[0x1E0CC51A0], v6);
      }
    }
    v17 = objc_msgSend(v3, "identifierForPlayerItem:", *(_QWORD *)(a1 + 32));
    if (dword_1ECDECE98)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    result = (_QWORD *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_player", v21, v22), "_isInterstitialPlayer");
    if (!(_DWORD)result || v17)
    {
      v19 = FigPlaybackItemGetFigBaseObject();
      result = (_QWORD *)CMBaseObjectGetVTable();
      v20 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result[1] + 56);
      if (v20)
        return (_QWORD *)v20(v19, *MEMORY[0x1E0CC50F0], v17);
    }
  }
  return result;
}

- (id)_playbackCoordinator
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__AVPlayerItem__playbackCoordinator__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__AVPlayerItem__updatePlaybackPropertiesOnFigPlaybackItem__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t FigBaseObject;
  uint64_t (*v13)(uint64_t, _QWORD, void *);
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "_playbackProperties");
  if (result)
  {
    v2 = (void *)result;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v3 = (void *)_updatePlaybackPropertiesOnFigPlaybackItem_keyMap;
    result = objc_msgSend((id)_updatePlaybackPropertiesOnFigPlaybackItem_keyMap, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (result)
    {
      v4 = result;
      v5 = 0;
      v6 = *(_QWORD *)v15;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
          v9 = objc_msgSend(v2, "objectForKey:", v8);
          if (v9)
          {
            v10 = v9;
            v11 = objc_msgSend((id)_updatePlaybackPropertiesOnFigPlaybackItem_keyMap, "objectForKey:", v8);
            if (!v5)
              v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            objc_msgSend(v5, "setObject:forKey:", v10, v11);
          }
          ++v7;
        }
        while (v4 != v7);
        result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v4 = result;
      }
      while (result);
      if (v5)
      {
        FigBaseObject = FigPlaybackItemGetFigBaseObject();
        result = CMBaseObjectGetVTable();
        v13 = *(uint64_t (**)(uint64_t, _QWORD, void *))(*(_QWORD *)(result + 8) + 56);
        if (v13)
          return v13(FigBaseObject, *MEMORY[0x1E0CC5228], v5);
      }
    }
  }
  return result;
}

- (id)_playbackProperties
{
  void *v3;
  id v4;
  AVPlayerItemInternal *playerItem;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = -[AVPlayerItem gaplessInfo](self, "gaplessInfo");
  if (v4)
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);
  playerItem = self->_playerItem;
  if (playerItem->coordinationIdentifier)
  {
    objc_msgSend(v3, "addEntriesFromDictionary:");
    playerItem = self->_playerItem;
  }
  if (*(_QWORD *)&playerItem->participatesInCoordinatedPlayback)
    objc_msgSend(v3, "addEntriesFromDictionary:");
  return v3;
}

- (id)gaplessInfo
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__AVPlayerItem_gaplessInfo__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_loadedTimeRangesFromFPPlaybableTimeIntervals:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CMTimeEpoch v10;
  uint64_t i;
  void *v12;
  const __CFDictionary *v13;
  const __CFDictionary *v14;
  id obj;
  __int128 v17;
  CMTimeRange start;
  CMTime duration;
  CMTimeRange rhs;
  CMTime lhs;
  CMTime v22;
  CMTime v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  obj = a3;
  if (a3)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v25;
      v8 = *MEMORY[0x1E0CC4FD8];
      v9 = *MEMORY[0x1E0CC4FD0];
      v17 = *MEMORY[0x1E0CA2E68];
      v10 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v25 != v7)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          *(_OWORD *)&v23.value = v17;
          v23.epoch = v10;
          *(_OWORD *)&v22.value = v17;
          v22.epoch = v10;
          v13 = (const __CFDictionary *)objc_msgSend(v12, "objectForKey:", v8);
          v14 = (const __CFDictionary *)objc_msgSend(v12, "objectForKey:", v9);
          if (v13)
            CMTimeMakeFromDictionary(&v23, v13);
          if (v14)
          {
            CMTimeMakeFromDictionary(&lhs, v14);
            rhs.start = v23;
            CMTimeSubtract(&v22, &lhs, &rhs.start);
          }
          memset(&rhs, 0, sizeof(rhs));
          start.start = v23;
          duration = v22;
          CMTimeRangeMake(&rhs, &start.start, &duration);
          start = rhs;
          objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTimeRange:", &start));
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v6);
    }
  }
  return v4;
}

__n128 __42__AVPlayerItem_preferredMinimumResolution__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 result;

  v1 = (__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 920);
  result = *v1;
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = *v1;
  return result;
}

__n128 __38__AVPlayerItem_reversePlaybackEndTime__block_invoke(uint64_t a1)
{
  __n128 *v1;
  uint64_t v2;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(__n128 *)(v2 + 312);
  v1[3].n128_u64[0] = *(_QWORD *)(v2 + 328);
  v1[2] = result;
  return result;
}

__n128 __38__AVPlayerItem_forwardPlaybackEndTime__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = *(__n128 **)(*(_QWORD *)(a1 + 32) + 8);
  result = v2[18];
  v1[3].n128_u64[0] = v2[19].n128_u64[0];
  v1[2] = result;
  return result;
}

- (void)_removeFPListeners
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_playerItem->figPlaybackItem)
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v4 = -[AVPlayerItem _weakReference](self, "_weakReference");
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = -[AVPlayerItem _fpNotificationNames](self, "_fpNotificationNames", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, avplayeritem_fpItemNotificationCallback, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), self->_playerItem->figPlaybackItem);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, AVFigPlaybackItemNotificationCallback_FigPlaybackItemLegibleOutputChanged, *MEMORY[0x1E0CC4D68], self->_playerItem->figPlaybackItem);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, AVFigPlaybackItemNotificationCallback_FigPlaybackItemLegibleOutputWasFlushed, *MEMORY[0x1E0CC4D70], self->_playerItem->figPlaybackItem);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, AVFigPlaybackItemNotificationCallback_MetadataOutputChanged, *MEMORY[0x1E0CC4D78], self->_playerItem->figPlaybackItem);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, AVFigPlaybackItemNotificationCallback_MetadataOutputWasFlushed, *MEMORY[0x1E0CC4D80], self->_playerItem->figPlaybackItem);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, AVFigPlaybackItemNotificationCallback_TaggedMetadataArrayChanged, *MEMORY[0x1E0CC4E50], self->_playerItem->figPlaybackItem);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, AVFigPlaybackItemNotificationCallback_FigPlaybackItemRenderedLegibleOutputChanged, *MEMORY[0x1E0CC4DD8], self->_playerItem->figPlaybackItem);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, AVFigPlaybackItemNotificationCallback_FigPlaybackItemRenderedLegibleOutputWasFlushed, *MEMORY[0x1E0CC4DE0], self->_playerItem->figPlaybackItem);
    CFRelease(v4);
  }
}

void __67__AVPlayerItem__updateAllowedAudioSpatializationFormatsFromFigItem__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, _QWORD, uint64_t, CFBooleanRef *);
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, _QWORD, uint64_t, CFBooleanRef *);
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[6];
  CFBooleanRef v13;
  CFBooleanRef BOOLean;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_copyFigPlaybackItem");
  if (v2)
  {
    v3 = (const void *)v2;
    v13 = 0;
    BOOLean = 0;
    v4 = *MEMORY[0x1E0C9AE00];
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v6 = *(void (**)(uint64_t, _QWORD, uint64_t, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                         + 48);
    if (v6 && (v6(FigBaseObject, *MEMORY[0x1E0CC5060], v4, &BOOLean), BOOLean))
      v7 = 4 * (CFBooleanGetValue(BOOLean) != 0);
    else
      v7 = 0;
    v8 = FigPlaybackItemGetFigBaseObject();
    v9 = *(void (**)(uint64_t, _QWORD, uint64_t, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                         + 48);
    if (v9)
    {
      v9(v8, *MEMORY[0x1E0CC5318], v4, &v13);
      if (v13)
      {
        if (CFBooleanGetValue(v13))
          v7 |= 3uLL;
      }
    }
    if (BOOLean)
      CFRelease(BOOLean);
    if (v13)
      CFRelease(v13);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(NSObject **)(*(_QWORD *)(v10 + 8) + 16);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__AVPlayerItem__updateAllowedAudioSpatializationFormatsFromFigItem__block_invoke_2;
    v12[3] = &unk_1E302FE78;
    v12[4] = v10;
    v12[5] = v7;
    av_readwrite_dispatch_queue_write(v11, v12);
    CFRelease(v3);
  }
}

uint64_t __67__AVPlayerItem__informObserversAboutAvailabilityOfPresentationSize__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD block[5];
  __int128 v7;

  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("presentationSize"));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(v2 + 8) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AVPlayerItem__informObserversAboutAvailabilityOfPresentationSize__block_invoke_3;
  block[3] = &unk_1E30314D8;
  block[4] = v2;
  v7 = *(_OWORD *)(a1 + 40);
  av_readwrite_dispatch_queue_write(v3, block);
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_player"), "_noteNewPresentationSizeForPlayerItem:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("presentationSize"));
  v4 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVPlayerItemPresentationSizeDidChangeNotification"), *(_QWORD *)(a1 + 32), 0);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v4);
}

uint64_t __60__AVPlayerItem__informObserversAboutAvailabilityOfDuration___block_invoke_2(uint64_t a1)
{
  __int128 v2;
  NSObject *v3;
  _QWORD v5[4];
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("duration"));
  v5[0] = MEMORY[0x1E0C809B0];
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16);
  v5[1] = 3221225472;
  v5[2] = __60__AVPlayerItem__informObserversAboutAvailabilityOfDuration___block_invoke_3;
  v5[3] = &unk_1E302FDB0;
  v6 = v2;
  av_readwrite_dispatch_queue_write(v3, v5);
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("duration"));
}

void __67__AVPlayerItem__informObserversAboutAvailabilityOfPresentationSize__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD block[7];

  objc_msgSend(*(id *)(a1 + 32), "_presentationSize");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(v2 + 8) + 128);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AVPlayerItem__informObserversAboutAvailabilityOfPresentationSize__block_invoke_2;
  block[3] = &unk_1E30314D8;
  block[4] = v2;
  block[5] = v4;
  block[6] = v5;
  dispatch_async(v3, block);
}

- (CGSize)_presentationSize
{
  double v3;
  double v4;
  OpaqueFigPlaybackItem *v5;
  OpaqueFigPlaybackItem *v6;
  unsigned int (*v7)(OpaqueFigPlaybackItem *, char *, uint64_t *);
  double v8;
  double v9;
  uint64_t v10;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v5 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v5)
  {
    v6 = v5;
    if (-[AVPlayerItem _isReadyForInspectionOfPresentationSize](self, "_isReadyForInspectionOfPresentationSize")
      || sOKToBlockWhenGettingValuesOfProperties == 1)
    {
      v10 = 0;
      v7 = *(unsigned int (**)(OpaqueFigPlaybackItem *, char *, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 16)
                                                                                     + 8);
      if (v7 && !v7(v6, (char *)&v10 + 4, &v10))
      {
        v4 = *(float *)&v10;
        v3 = *((float *)&v10 + 1);
      }
    }
    CFRelease(v6);
  }
  v8 = v3;
  v9 = v4;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)_getCachedPresentationSize:(CGSize *)a3
{
  _BOOL4 v5;
  BOOL v6;
  CGFloat v7;
  CGFloat v8;

  v5 = -[AVPlayerItem _isReadyForInspectionOfPresentationSize](self, "_isReadyForInspectionOfPresentationSize");
  v6 = v5;
  if (a3 && v5)
  {
    -[AVPlayerItem presentationSize](self, "presentationSize");
    a3->width = v7;
    a3->height = v8;
  }
  return v6;
}

- (CGSize)presentationSize
{
  NSObject *ivarAccessQueue;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  CGSize result;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x3010000000;
  v11 = &unk_1935931BF;
  v12 = *MEMORY[0x1E0C9D820];
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__AVPlayerItem_presentationSize__block_invoke;
  v7[3] = &unk_1E302FD60;
  v7[4] = self;
  v7[5] = &v8;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v7);
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)_isReadyForInspectionOfPresentationSize
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__AVPlayerItem__isReadyForInspectionOfPresentationSize__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__AVPlayerItem__configurePlaybackItemAndReturnError___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, CMTime *, uint64_t);
  CMTime v7;
  CMTime v8;
  CMTime v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(_BYTE *)(v1 + 1128))
  {
    v2 = result;
    *(_OWORD *)&v7.value = *(_OWORD *)(v1 + 1132);
    v7.epoch = *(_QWORD *)(v1 + 1148);
    v9 = *(CMTime *)(v1 + 1164);
    *(_OWORD *)&v8.value = *(_OWORD *)(v1 + 1188);
    v8.epoch = *(_QWORD *)(v1 + 1204);
    v3 = *(unsigned int *)(v1 + 1160);
    v10[0] = *MEMORY[0x1E0CC5490];
    v11[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v10[1] = *MEMORY[0x1E0CC5478];
    v11[1] = NSDictionaryFromCMTime(&v9);
    v10[2] = *MEMORY[0x1E0CC5470];
    v9 = v8;
    v11[2] = NSDictionaryFromCMTime(&v9);
    v10[3] = *MEMORY[0x1E0CC5468];
    v11[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 1156));
    v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 120);
    result = CMBaseObjectGetVTable();
    v6 = *(uint64_t (**)(uint64_t, CMTime *, uint64_t))(*(_QWORD *)(result + 16) + 176);
    if (v6)
    {
      v9 = v7;
      return v6(v5, &v9, v4);
    }
  }
  return result;
}

- (CMTimebaseRef)timebase
{
  OpaqueCMTimebase *v2;
  OpaqueCMTimebase *v3;

  v2 = -[AVPlayerItem _copyProxyFoldedTimebase](self, "_copyProxyFoldedTimebase");
  v3 = v2;
  if (v2)
    CFRelease(v2);
  return v3;
}

- (OpaqueCMTimebase)_copyProxyFoldedTimebase
{
  return (OpaqueCMTimebase *)CFRetain(self->_playerItem->proxyFoldedTimebase);
}

- (NSArray)tracks
{
  NSObject *ivarAccessQueue;
  void *v3;
  NSArray *v4;
  NSArray *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__7;
  v12 = __Block_byref_object_dispose__7;
  v13 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __22__AVPlayerItem_tracks__block_invoke;
  v7[3] = &unk_1E302FD60;
  v7[4] = self;
  v7[5] = &v8;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v7);
  v3 = (void *)v9[5];
  if (v3)
    v4 = v3;
  else
    v4 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v5 = v4;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)_applyMediaSelectionOptions
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD block[7];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[AVPlayerItem _mediaOptionsSelectedByClient](self, "_mediaOptionsSelectedByClient");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v3, "objectForKey:", v9);
        figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
        block[0] = v7;
        block[1] = 3221225472;
        block[2] = __43__AVPlayerItem__applyMediaSelectionOptions__block_invoke;
        block[3] = &unk_1E302FD88;
        block[4] = self;
        block[5] = v10;
        block[6] = v9;
        dispatch_sync(figPlaybackItemSetterQueue, block);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
}

- (id)_mediaOptionsSelectedByClient
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AVPlayerItem__mediaOptionsSelectedByClient__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __58__AVPlayerItem_AVPlayerItemOutputs___evaluateVideoOutputs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t FigBaseObject;
  void (*v11)(uint64_t, _QWORD, void *);
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_copyFigPlaybackItem");
  if (v2)
  {
    v3 = (const void *)v2;
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "_videoOutputs");
    objc_msgSend(*(id *)(a1 + 32), "_updateVideoSuppressionOnFigPlaybackItem:basedOnOutputs:", v3, v4);
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v4);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "_visualContext"));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v11 = *(void (**)(uint64_t, _QWORD, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v11)
      v11(FigBaseObject, *MEMORY[0x1E0CC5420], v5);
    CFRelease(v3);
  }
}

- (id)_videoOutputs
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__AVPlayerItem_AVPlayerItemOutputs___videoOutputs__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_updateVideoSuppressionOnFigPlaybackItem:(OpaqueFigPlaybackItem *)a3 basedOnOutputs:(id)a4
{
  _BOOL8 v5;
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, _QWORD, uint64_t);
  uint64_t v8;

  v5 = -[AVPlayerItem _suppressionForOutputs:](self, "_suppressionForOutputs:", a4);
  -[AVPlayerItem _setSuppressesVideoLayers:](self, "_setSuppressesVideoLayers:", v5);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v7 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v7)
  {
    if (v5)
      v8 = *MEMORY[0x1E0C9AE50];
    else
      v8 = *MEMORY[0x1E0C9AE40];
    v7(FigBaseObject, *MEMORY[0x1E0CC5330], v8);
  }
}

- (void)_updateLegibleSuppressionOnFigPlaybackItem:(OpaqueFigPlaybackItem *)a3 basedOnOutputs:(id)a4
{
  _BOOL4 v4;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, _QWORD, uint64_t);
  uint64_t v7;

  v4 = -[AVPlayerItem _suppressionForOutputs:](self, "_suppressionForOutputs:", a4);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v6 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v6)
  {
    if (v4)
      v7 = *MEMORY[0x1E0C9AE50];
    else
      v7 = *MEMORY[0x1E0C9AE40];
    v6(FigBaseObject, *MEMORY[0x1E0CC5328], v7);
  }
}

- (BOOL)_suppressionForOutputs:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(a3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "suppressesPlayerRendering") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          return v4;
        }
        ++v7;
      }
      while (v5 != v7);
      v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v5 = v4;
      if (v4)
        continue;
      break;
    }
  }
  return v4;
}

- (void)_setSuppressesVideoLayers:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  uint64_t v5;
  _QWORD block[6];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__AVPlayerItem__setSuppressesVideoLayers___block_invoke;
  block[3] = &unk_1E3031820;
  v7 = a3;
  block[4] = self;
  block[5] = &v8;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v9 + 24))
  {
    v5 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVPlayerItemSuppressesVideoLayersDidChangeNotification"), self, 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v5);
  }
  _Block_object_dispose(&v8, 8);
}

- (id)_tracksWithFPTrackIDArray:(id)a3 fromFigPlaybackItem:(OpaqueFigPlaybackItem *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const void *v11;
  CFTypeID v12;
  AVPlayerItemTrack *v13;
  void *v15;
  int valuePtr;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  -[AVPlayerItem _ensureAssetWithFigPlaybackItemWithTrackIDs:](self, "_ensureAssetWithFigPlaybackItemWithTrackIDs:", a3);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(a3);
        v11 = *(const void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = CFGetTypeID(v11);
        if (v12 == CFNumberGetTypeID())
        {
          valuePtr = 0;
          CFNumberGetValue((CFNumberRef)v11, kCFNumberSInt32Type, &valuePtr);
          if (valuePtr)
          {
            v13 = +[AVPlayerItemTrack playerItemTrackWithFigPlaybackItem:readyForInspection:trackID:asset:playerItem:](AVPlayerItemTrack, "playerItemTrackWithFigPlaybackItem:readyForInspection:trackID:asset:playerItem:", a4, 1);
            if (v13)
              objc_msgSend(v15, "addObject:", v13);
          }
        }
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  return v15;
}

uint64_t __40__AVPlayerItem__tracksFromAssetTrackIDs__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  AVPlayerItemTrack *v8;
  AVPlayerItemTrack *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t result;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 112), "tracks");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        v8 = +[AVPlayerItemTrack playerItemTrackWithFigPlaybackItem:readyForInspection:trackID:asset:playerItem:](AVPlayerItemTrack, "playerItemTrackWithFigPlaybackItem:readyForInspection:trackID:asset:playerItem:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 120), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 249), objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "trackID"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 112));
        if (v8)
        {
          v9 = v8;
          v10 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 136), "indexOfObject:", v8);
          if (v10 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v11 = v3;
            v12 = (uint64_t)v9;
          }
          else
          {
            v12 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 136), "objectAtIndex:", v10);
            v11 = v3;
          }
          objc_msgSend(v11, "addObject:", v12);
        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 136) = objc_msgSend(v3, "copy");
  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 136), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __61__AVPlayerItem_AVPlayerItemOutputs___evaluateMetadataOutputs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t FigBaseObject;
  void (*v12)(uint64_t, _QWORD, void *);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_copyFigPlaybackItem");
  if (v2)
  {
    v3 = (const void *)v2;
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "_metadataOutputsForKeys");
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = (void *)objc_msgSend(v4, "allKeys", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "setObject:forKey:", objc_msgSend((id)objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10)), "_figMetadataOutputsDictionaryOptions"), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v12 = *(void (**)(uint64_t, _QWORD, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v12)
      v12(FigBaseObject, *MEMORY[0x1E0CC51F0], v5);
    CFRelease(v3);
  }
}

- (id)_metadataOutputsForKeys
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__AVPlayerItem_AVPlayerItemOutputs___metadataOutputsForKeys__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __68__AVPlayerItem_AVPlayerItemMediaDataCollectors___metadataCollectors__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 600);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __49__AVPlayerItem__markAsReadyForInspectionOfTracks__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 224) = 1;
  return result;
}

uint64_t __34__AVPlayerItem__attachToFigPlayer__block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 120) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __32__AVPlayerItem__attachToPlayer___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 128) = *(_QWORD *)(result + 40);
  return result;
}

void __31__AVPlayerItem__updateTimebase__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(const void **)(v2 + 216);
  if (v3)
  {
    CFRelease(v3);
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_QWORD *)(v2 + 216) = *(_QWORD *)(a1 + 40);
}

uint64_t __45__AVPlayerItem_playbackLikelyToKeepUpTrigger__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 832);
  return result;
}

- (void)_addFPListeners
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_playerItem->figPlaybackItem)
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v4 = -[AVPlayerItem _weakReference](self, "_weakReference");
    CFRetain(v4);
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = -[AVPlayerItem _fpNotificationNames](self, "_fpNotificationNames", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, avplayeritem_fpItemNotificationCallback, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), self->_playerItem->figPlaybackItem, 0);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, AVFigPlaybackItemNotificationCallback_FigPlaybackItemLegibleOutputChanged, *MEMORY[0x1E0CC4D68], self->_playerItem->figPlaybackItem, 0);
    objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, AVFigPlaybackItemNotificationCallback_FigPlaybackItemLegibleOutputWasFlushed, *MEMORY[0x1E0CC4D70], self->_playerItem->figPlaybackItem, 0);
    objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, AVFigPlaybackItemNotificationCallback_MetadataOutputChanged, *MEMORY[0x1E0CC4D78], self->_playerItem->figPlaybackItem, 0);
    objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, AVFigPlaybackItemNotificationCallback_MetadataOutputWasFlushed, *MEMORY[0x1E0CC4D80], self->_playerItem->figPlaybackItem, 0);
    objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, AVFigPlaybackItemNotificationCallback_TaggedMetadataArrayChanged, *MEMORY[0x1E0CC4E50], self->_playerItem->figPlaybackItem, 0);
    objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, AVFigPlaybackItemNotificationCallback_FigPlaybackItemRenderedLegibleOutputChanged, *MEMORY[0x1E0CC4DD8], self->_playerItem->figPlaybackItem, 0);
    objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, AVFigPlaybackItemNotificationCallback_FigPlaybackItemRenderedLegibleOutputWasFlushed, *MEMORY[0x1E0CC4DE0], self->_playerItem->figPlaybackItem, 0);
  }
}

- (id)_fpNotificationNames
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC4DC8], *MEMORY[0x1E0CC4D18], *MEMORY[0x1E0CC4DD0], *MEMORY[0x1E0CC4D20], *MEMORY[0x1E0CC4E38], *MEMORY[0x1E0CC4E48], *MEMORY[0x1E0CC4E40], *MEMORY[0x1E0CC4E30], *MEMORY[0x1E0CC4DB0], *MEMORY[0x1E0CC4E10], *MEMORY[0x1E0CC4DA8], *MEMORY[0x1E0CC4CF0], *MEMORY[0x1E0CC4D28], *MEMORY[0x1E0CC4D00], *MEMORY[0x1E0CC4E68], *MEMORY[0x1E0CC4D10], *MEMORY[0x1E0CC4D30],
               *MEMORY[0x1E0CC4CF8],
               *MEMORY[0x1E0CC4E58],
               *MEMORY[0x1E0CC4D88],
               *MEMORY[0x1E0CC4D90],
               *MEMORY[0x1E0CC4E00],
               *MEMORY[0x1E0CC4E08],
               *MEMORY[0x1E0CC4D50],
               *MEMORY[0x1E0CC4D58],
               *MEMORY[0x1E0CC4D60],
               *MEMORY[0x1E0CC4CD8],
               *MEMORY[0x1E0CC4E60],
               *MEMORY[0x1E0CC4CE8],
               *MEMORY[0x1E0CC4D08],
               *MEMORY[0x1E0CC4DE8],
               *MEMORY[0x1E0CC4D40],
               *MEMORY[0x1E0CC4D48],
               *MEMORY[0x1E0CC4E18],
               *MEMORY[0x1E0CC4D38],
               *MEMORY[0x1E0CC4E28],
               *MEMORY[0x1E0CC4D98],
               *MEMORY[0x1E0CC4E20],
               *MEMORY[0x1E0CC4CD0],
               *MEMORY[0x1E0CC4DC0],
               *MEMORY[0x1E0CC4DB8],
               *MEMORY[0x1E0CC4DA0],
               CFSTR("OverlappedPlaybackItemDidComplete"),
               *MEMORY[0x1E0CC57D8],
               *MEMORY[0x1E0CA4B88],
               0,
               *MEMORY[0x1E0CC4E68],
               *MEMORY[0x1E0CC4D00],
               *MEMORY[0x1E0CC4D28],
               *MEMORY[0x1E0CC4CF0],
               *MEMORY[0x1E0CC4DA8],
               *MEMORY[0x1E0CC4E10],
               *MEMORY[0x1E0CC4DB0],
               *MEMORY[0x1E0CC4E30],
               *MEMORY[0x1E0CC4E40],
               *MEMORY[0x1E0CC4E48],
               *MEMORY[0x1E0CC4E38],
               *MEMORY[0x1E0CC4D20],
               *MEMORY[0x1E0CC4DD0],
               *MEMORY[0x1E0CC4D18],
               *MEMORY[0x1E0CC4DC8]);
}

- (void)_attachToPlayer:(id)a3
{
  id v5;
  id v6;
  unint64_t *p_allowedAudioSpatializationFormats;
  NSObject *v9;
  NSObject *ivarAccessQueue;
  unint64_t allowedAudioSpatializationFormats;
  _QWORD v12[6];

  v5 = (id)objc_msgSend(a3, "_weakReference");
  v6 = v5;
  p_allowedAudioSpatializationFormats = &self->_playerItem->allowedAudioSpatializationFormats;
  while (!__ldaxr(p_allowedAudioSpatializationFormats))
  {
    if (!__stlxr((unint64_t)v5, p_allowedAudioSpatializationFormats))
    {
      v9 = objc_msgSend(a3, "_stateDispatchQueue");
      dispatch_retain(v9);
      ivarAccessQueue = self->_playerItem->ivarAccessQueue;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __32__AVPlayerItem__attachToPlayer___block_invoke;
      v12[3] = &unk_1E302FCE8;
      v12[4] = self;
      v12[5] = v9;
      av_readwrite_dispatch_queue_write(ivarAccessQueue, v12);
      dispatch_set_target_queue((dispatch_object_t)self->_playerItem->figConfigurationQueue, v9);
      return;
    }
  }
  __clrex();
  allowedAudioSpatializationFormats = self->_playerItem->allowedAudioSpatializationFormats;

  if (v6 != (id)allowedAudioSpatializationFormats)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("An AVPlayerItem cannot be associated with more than one instance of AVPlayer"), 0));
}

uint64_t __67__AVPlayerItem__updateAllowedAudioSpatializationFormatsFromFigItem__block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 1408) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __22__AVPlayerItem_tracks__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 144), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)_hasEnqueuedVideoFrame
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__AVPlayerItem__hasEnqueuedVideoFrame__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)tracksPublisher
{
  return +[AVPropertyValuePublisher propertyValuePublisherWithObject:key:notificationName:](AVPropertyValuePublisher, "propertyValuePublisherWithObject:key:notificationName:", self, CFSTR("tracks"), CFSTR("AVPlayerItemTracksDidChangeNotification"));
}

- (id)presentationSizePublisher
{
  return +[AVPropertyValuePublisher propertyValuePublisherWithObject:key:notificationName:](AVPropertyValuePublisher, "propertyValuePublisherWithObject:key:notificationName:", self, CFSTR("presentationSize"), CFSTR("AVPlayerItemPresentationSizeDidChangeNotification"));
}

- (id)nonForcedSubtitleDisplayEnabledPublisher
{
  return +[AVPropertyValuePublisher propertyValuePublisherWithObject:key:notificationName:](AVPropertyValuePublisher, "propertyValuePublisherWithObject:key:notificationName:", self, CFSTR("isNonForcedSubtitleDisplayEnabled"), CFSTR("AVPlayerItemNonForcedSubtitleDisplayEnabledDidChangeNotification"));
}

uint64_t __72__AVPlayerItem__markFigAssetAsReadyForInspectionOfMediaSelectionOptions__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 227) = 1;
  return result;
}

uint64_t __29__AVPlayerItem__cachedTracks__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 136), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  NSObject *ivarAccessQueue;
  uint64_t v12;
  const void *v13;
  uint64_t FigBaseObject;
  void (*v15)(uint64_t, _QWORD, _QWORD);
  objc_super v16;
  _QWORD block[5];

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("timedMetadata")))
  {
    ivarAccessQueue = self->_playerItem->ivarAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__AVPlayerItem_addObserver_forKeyPath_options_context___block_invoke;
    block[3] = &unk_1E302FA10;
    block[4] = self;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
    v12 = objc_msgSend(-[AVPlayerItem _player](self, "_player"), "_copyFigPlayer");
    if (v12)
    {
      v13 = (const void *)v12;
      FigBaseObject = FigPlayerGetFigBaseObject();
      v15 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
      if (v15)
        v15(FigBaseObject, *MEMORY[0x1E0CC59E0], *MEMORY[0x1E0C9AE50]);
      CFRelease(v13);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)AVPlayerItem;
  -[AVPlayerItem addObserver:forKeyPath:options:context:](&v16, sel_addObserver_forKeyPath_options_context_, a3, a4, a5, a6);
}

- (BOOL)hasVideo
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__AVPlayerItem_hasVideo__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __93__AVPlayerItem_AVPlayerItemProtectedContentPrivate___isExternalProtectionRequiredForPlayback__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 969);
  return result;
}

uint64_t __83__AVPlayerItem_AVPlayerInterstitialSupport__automaticallyHandlesInterstitialEvents__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 970);
  return result;
}

uint64_t __73__AVPlayerItem_restrictsAutomaticMediaSelectionToAvailableOfflineOptions__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 963);
  return result;
}

uint64_t __72__AVPlayerItem__timeJumpedNotificationIncludesExtendedDiagnosticPayload__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 1112);
  return result;
}

__n128 __67__AVPlayerItem__informObserversAboutAvailabilityOfPresentationSize__block_invoke_3(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 944) = result;
  return result;
}

uint64_t __66__AVPlayerItem_usesIFrameOnlyPlaybackForHighRateScaledEditsWasSet__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 720);
  return result;
}

uint64_t __65__AVPlayerItem_canUseNetworkResourcesForLiveStreamingWhilePaused__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 512);
  return result;
}

uint64_t __62__AVPlayerItem_usesMinimalLatencyForVideoCompositionRendering__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 824);
  return result;
}

uint64_t __62__AVPlayerItem_refreshesClosedCaptionsImmediatelyAfterSeeking__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 757);
  return result;
}

__n128 __62__AVPlayerItem_preferredMaximumResolutionForExpensiveNetworks__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 result;

  v1 = (__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 904);
  result = *v1;
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = *v1;
  return result;
}

uint64_t __60__AVPlayerItem_decodesAllFramesDuringOrdinaryPlaybackWasSet__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 717);
  return result;
}

uint64_t __58__AVPlayerItem_minimumIntervalForIFrameOnlyPlaybackWasSet__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 748);
  return result;
}

uint64_t __58__AVPlayerItem_continuesPlayingDuringPrerollForRateChange__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 719);
  return result;
}

uint64_t __57__AVPlayerItem_speedThresholdForIFrameOnlyPlaybackWasSet__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 756);
  return result;
}

uint64_t __56__AVPlayerItem_seekingWaitsForVideoCompositionRendering__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 484);
  return result;
}

double __56__AVPlayerItem_preferredPeakBitRateForExpensiveNetworks__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 576);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __56__AVPlayerItem_automaticallyPreservesTimeOffsetFromLive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 410);
  return result;
}

uint64_t __55__AVPlayerItem_savesDownloadedDataToDiskWhenDoneWasSet__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 841);
  return result;
}

uint64_t __55__AVPlayerItem_appliesPerFrameHDRDisplayMetadataWasSet__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 812);
  return result;
}

uint64_t __55__AVPlayerItem_allowedAudioSpatializationFormatsWasSet__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 1416);
  return result;
}

uint64_t __54__AVPlayerItem_advanceTimeForOverlappedPlaybackWasSet__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 408);
  return result;
}

uint64_t __53__AVPlayerItem_AVPlayerItemHaptics__playHapticTracks__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 872);
  return result;
}

uint64_t __53__AVPlayerItem_reversesMoreVideoFramesInMemoryWasSet__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 713);
  return result;
}

uint64_t __52__AVPlayerItem_continuesPlayingDuringPrerollForSeek__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 718);
  return result;
}

uint64_t __51__AVPlayerItem_aggressivelyCachesVideoFramesWasSet__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 715);
  return result;
}

uint64_t __50__AVPlayerItem_imageQueueInterpolationCurveWasSet__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 808);
  return result;
}

uint64_t __48__AVPlayerItem_audioSpatializationAllowedWasSet__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 1401);
  return result;
}

double __47__AVPlayerItem_preferredMaximumAudioSampleRate__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 792);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __46__AVPlayerItem_prefersOfflinePlayableVariants__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 778);
  return result;
}

uint64_t __46__AVPlayerItem_adjustCompressionProfileWasSet__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 680);
  return result;
}

float __45__AVPlayerItem_soundCheckVolumeNormalization__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 648);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __45__AVPlayerItem__isReadyForInspectionOfTracks__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 224);
  return result;
}

uint64_t __43__AVPlayerItem_suppressesAudioOnlyVariants__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 777);
  return result;
}

uint64_t __42__AVPlayerItem_willNeverSeekBackwardsHint__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 1256);
  return result;
}

__n128 __42__AVPlayerItem_preferredMaximumResolution__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 result;

  v1 = (__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 888);
  result = *v1;
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = *v1;
  return result;
}

uint64_t __41__AVPlayerItem_alwaysMonitorsPlayability__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 825);
  return result;
}

uint64_t __40__AVPlayerItem_allowProgressiveSwitchUp__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 842);
  return result;
}

uint64_t __39__AVPlayerItem_blendsVideoFramesWasSet__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 810);
  return result;
}

uint64_t __39__AVPlayerItem_allowProgressiveStartup__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 843);
  return result;
}

uint64_t __39__AVPlayerItem_adjustTargetLevelWasSet__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 672);
  return result;
}

uint64_t __38__AVPlayerItem_allowProgressiveResume__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 844);
  return result;
}

uint64_t __37__AVPlayerItem_currentMediaSelection__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 1072);
  return result;
}

double __36__AVPlayerItem_preferredPeakBitRate__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 568);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __34__AVPlayerItem_variantPreferences__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 784);
  return result;
}

uint64_t __33__AVPlayerItem_videoApertureMode__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 816);
  return result;
}

uint64_t __33__AVPlayerItem_requiresAccessLog__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 776);
  return result;
}

uint64_t __33__AVPlayerItem_audioTapProcessor__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 664);
  return result;
}

uint64_t __33__AVPlayerItem_RTCReportingFlags__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 616);
  return result;
}

float __32__AVPlayerItem_volumeAdjustment__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 652);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __30__AVPlayerItem_limitReadAhead__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 696);
  return result;
}

uint64_t __28__AVPlayerItem_restrictions__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 688);
  return result;
}

- (BOOL)_configurePlaybackItemAndReturnError:(id *)a3
{
  BOOL v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t FigBaseObject;
  void (*v11)(uint64_t, _QWORD, uint64_t);
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, _QWORD, uint64_t);
  uint64_t v15;
  NSObject *figPlaybackItemSetterQueue;
  NSObject *seekQueue;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void (*v22)(uint64_t, _QWORD, id);
  NSObject *ivarAccessQueue;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  NSObject *v38;
  AVPlayerItemInternal *playerItem;
  BOOL result;
  _QWORD v41[6];
  char v42;
  _QWORD v43[5];
  char v44;
  char v45;
  char v46;
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  _QWORD v53[5];
  _QWORD block[5];
  CFTypeRef v55;
  id v56;
  uint64_t v57;
  void *v58;

  v57 = 0;
  v58 = 0;
  v55 = 0;
  v56 = 0;
  if (!self->_playerItem->figPlaybackItem)
    return 1;
  -[AVPlayerItem _getVideoComposition:customVideoCompositorSession:figVideoCompositor:](self, "_getVideoComposition:customVideoCompositorSession:figVideoCompositor:", &v57, &v56, &v55);
  if (v57)
    v5 = v56 == 0;
  else
    v5 = 1;
  if (v5 || (objc_msgSend(v56, "commitCustomVideoCompositorPropertiesAndReturnError:", &v58) & 1) != 0)
  {
    if (-[NSArray count](self->_playerItem->automaticallyLoadedAssetKeys, "count"))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", self->_playerItem->automaticallyLoadedAssetKeys);
      v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      +[AVFigAssetInspectorLoader _mapAssetKeys:toFigAssetPropertySet:figAssetTrackPropertySet:callerName:](AVFigAssetInspectorLoader, "_mapAssetKeys:toFigAssetPropertySet:figAssetTrackPropertySet:callerName:", v6, v7, v8, CFSTR("-[AVPlayerItem _configurePlaybackItem]"));
      if (objc_msgSend(v7, "count"))
      {
        v9 = objc_msgSend(v7, "allObjects");
        FigBaseObject = FigPlaybackItemGetFigBaseObject();
        v11 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
        if (v11)
          v11(FigBaseObject, *MEMORY[0x1E0CC5070], v9);
      }
      if (objc_msgSend(v8, "count"))
      {
        v12 = objc_msgSend(v8, "allObjects");
        v13 = FigPlaybackItemGetFigBaseObject();
        v14 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
        if (v14)
          v14(v13, *MEMORY[0x1E0CC5078], v12);
      }

    }
    v15 = MEMORY[0x1E0C809B0];
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__AVPlayerItem__configurePlaybackItemAndReturnError___block_invoke;
    block[3] = &unk_1E302FA10;
    block[4] = self;
    dispatch_sync(figPlaybackItemSetterQueue, block);
    if (-[AVPlayerItem savesDownloadedDataToDiskWhenDoneWasSet](self, "savesDownloadedDataToDiskWhenDoneWasSet"))
      -[AVPlayerItem setSavesDownloadedDataToDiskWhenDone:](self, "setSavesDownloadedDataToDiskWhenDone:", -[AVPlayerItem savesDownloadedDataToDiskWhenDone](self, "savesDownloadedDataToDiskWhenDone"));
    seekQueue = self->_playerItem->seekQueue;
    v53[0] = v15;
    v53[1] = 3221225472;
    v53[2] = __53__AVPlayerItem__configurePlaybackItemAndReturnError___block_invoke_2;
    v53[3] = &unk_1E302FA10;
    v53[4] = self;
    dispatch_sync(seekQueue, v53);
    v18 = -[AVPlayerItem initialDate](self, "initialDate");
    if (v18)
      -[AVPlayerItem seekToDate:completionHandler:](self, "seekToDate:completionHandler:", v18, 0);
    v19 = -[AVPlayerItem initialEstimatedDate](self, "initialEstimatedDate");
    if (v19)
    {
      v20 = v19;
      v21 = FigPlaybackItemGetFigBaseObject();
      v22 = *(void (**)(uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
      if (v22)
        v22(v21, *MEMORY[0x1E0CC5140], v20);
    }
    -[AVPlayerItem loopTimeRange](self, "loopTimeRange");
    if ((v52 & 1) != 0)
    {
      -[AVPlayerItem loopTimeRange](self, "loopTimeRange");
      if ((v51 & 1) != 0)
      {
        -[AVPlayerItem loopTimeRange](self, "loopTimeRange");
        if (!v50)
        {
          -[AVPlayerItem loopTimeRange](self, "loopTimeRange");
          if ((v49 & 0x8000000000000000) == 0)
            -[AVPlayerItem _updateLoopTimeRangeOnFigPlaybackItem](self, "_updateLoopTimeRangeOnFigPlaybackItem");
        }
      }
    }
    -[AVPlayerItem forwardPlaybackEndTime](self, "forwardPlaybackEndTime");
    if ((v48 & 1) != 0)
      -[AVPlayerItem _updateForwardPlaybackEndTimeOnFigPlaybackItem](self, "_updateForwardPlaybackEndTimeOnFigPlaybackItem");
    -[AVPlayerItem reversePlaybackEndTime](self, "reversePlaybackEndTime");
    if ((v47 & 1) != 0)
      -[AVPlayerItem _updateReversePlaybackEndTimeOnFigPlaybackItem](self, "_updateReversePlaybackEndTimeOnFigPlaybackItem");
    -[AVPlayerItem _timeToPauseBuffering](self, "_timeToPauseBuffering");
    if ((v46 & 1) != 0)
      -[AVPlayerItem _updateTimeToPauseBufferingOnFigPlaybackItem](self, "_updateTimeToPauseBufferingOnFigPlaybackItem");
    -[AVPlayerItem _timeToPausePlayback](self, "_timeToPausePlayback");
    if ((v45 & 1) != 0)
      -[AVPlayerItem _updateTimeToPausePlaybackOnFigPlaybackItem](self, "_updateTimeToPausePlaybackOnFigPlaybackItem");
    if (-[AVPlayerItem advanceTimeForOverlappedPlaybackWasSet](self, "advanceTimeForOverlappedPlaybackWasSet"))
      -[AVPlayerItem _updateAdvanceTimeForOverlappedPlaybackOnFigPlaybackItem](self, "_updateAdvanceTimeForOverlappedPlaybackOnFigPlaybackItem");
    if (-[AVPlayerItem imageQueueInterpolationCurveWasSet](self, "imageQueueInterpolationCurveWasSet"))
      -[AVPlayerItem _updateImageQueueInterpolationCurveOnFigPlaybackItem](self, "_updateImageQueueInterpolationCurveOnFigPlaybackItem");
    if (-[AVPlayerItem blendsVideoFramesWasSet](self, "blendsVideoFramesWasSet"))
      -[AVPlayerItem _updateBlendsVideoFramesOnFigPlaybackItem](self, "_updateBlendsVideoFramesOnFigPlaybackItem");
    if (-[AVPlayerItem appliesPerFrameHDRDisplayMetadataWasSet](self, "appliesPerFrameHDRDisplayMetadataWasSet"))
      -[AVPlayerItem _updateAppliesPerFrameHDRDisplayMetadataOnFigPlaybackItem](self, "_updateAppliesPerFrameHDRDisplayMetadataOnFigPlaybackItem");
    if (-[AVPlayerItem reversesMoreVideoFramesInMemoryWasSet](self, "reversesMoreVideoFramesInMemoryWasSet"))
      -[AVPlayerItem _updateReversesMoreVideoFramesInMemoryOnFigPlaybackItem](self, "_updateReversesMoreVideoFramesInMemoryOnFigPlaybackItem");
    if (-[AVPlayerItem aggressivelyCachesVideoFramesWasSet](self, "aggressivelyCachesVideoFramesWasSet"))
      -[AVPlayerItem _updateAggressivelyCachesVideoFramesOnFigPlaybackItem](self, "_updateAggressivelyCachesVideoFramesOnFigPlaybackItem");
    if (-[AVPlayerItem decodesAllFramesDuringOrdinaryPlaybackWasSet](self, "decodesAllFramesDuringOrdinaryPlaybackWasSet"))
    {
      -[AVPlayerItem _updateDecodesAllFramesDuringOrdinaryPlaybackOnFigPlaybackItem](self, "_updateDecodesAllFramesDuringOrdinaryPlaybackOnFigPlaybackItem");
    }
    if (!-[AVPlayerItem continuesPlayingDuringPrerollForSeek](self, "continuesPlayingDuringPrerollForSeek"))
      -[AVPlayerItem _updateContinuesPlayingDuringPrerollForSeekOnFigPlaybackItem](self, "_updateContinuesPlayingDuringPrerollForSeekOnFigPlaybackItem");
    if (!-[AVPlayerItem continuesPlayingDuringPrerollForRateChange](self, "continuesPlayingDuringPrerollForRateChange"))
      -[AVPlayerItem _updateContinuesPlayingDuringPrerollForRateChangeOnFigPlaybackItem](self, "_updateContinuesPlayingDuringPrerollForRateChangeOnFigPlaybackItem");
    if (-[AVPlayerItem usesIFrameOnlyPlaybackForHighRateScaledEditsWasSet](self, "usesIFrameOnlyPlaybackForHighRateScaledEditsWasSet"))
    {
      -[AVPlayerItem _updateUsesIFrameOnlyPlaybackForHighRateScaledEditsOnFigPlaybackItem](self, "_updateUsesIFrameOnlyPlaybackForHighRateScaledEditsOnFigPlaybackItem");
    }
    if (-[AVPlayerItem minimumIntervalForIFrameOnlyPlaybackWasSet](self, "minimumIntervalForIFrameOnlyPlaybackWasSet"))
      -[AVPlayerItem _updateMinimumIntervalForIFrameOnlyPlaybackOnFigPlaybackItem](self, "_updateMinimumIntervalForIFrameOnlyPlaybackOnFigPlaybackItem");
    if (-[AVPlayerItem speedThresholdForIFrameOnlyPlaybackWasSet](self, "speedThresholdForIFrameOnlyPlaybackWasSet"))
      -[AVPlayerItem _updateSpeedThresholdForIFrameOnlyPlaybackOnFigPlaybackItem](self, "_updateSpeedThresholdForIFrameOnlyPlaybackOnFigPlaybackItem");
    if (-[AVPlayerItem refreshesClosedCaptionsImmediatelyAfterSeeking](self, "refreshesClosedCaptionsImmediatelyAfterSeeking"))
    {
      -[AVPlayerItem _updateRefreshesClosedCaptionsImmediatelyAfterSeekingOnFigPlaybackItem](self, "_updateRefreshesClosedCaptionsImmediatelyAfterSeekingOnFigPlaybackItem");
    }
    if (-[AVPlayerItem audioSpatializationAllowedWasSet](self, "audioSpatializationAllowedWasSet"))
      -[AVPlayerItem _updateAudioSpatializationAllowed](self, "_updateAudioSpatializationAllowed");
    if (-[AVPlayerItem allowedAudioSpatializationFormatsWasSet](self, "allowedAudioSpatializationFormatsWasSet"))
      -[AVPlayerItem _updateAllowedAudioSpatializationFormats](self, "_updateAllowedAudioSpatializationFormats");
    -[AVPlayerItem _updateCanUseNetworkResourcesForLiveStreamingWhilePausedOnFigPlaybackItem](self, "_updateCanUseNetworkResourcesForLiveStreamingWhilePausedOnFigPlaybackItem");
    if (-[AVPlayerItem automaticallyPreservesTimeOffsetFromLive](self, "automaticallyPreservesTimeOffsetFromLive"))
      -[AVPlayerItem _updatePreservesTimeOffsetFromLive](self, "_updatePreservesTimeOffsetFromLive");
    -[AVPlayerItem configuredTimeOffsetFromLive](self, "configuredTimeOffsetFromLive");
    if ((v44 & 1) != 0)
      -[AVPlayerItem _updateConfiguredTimeOffsetFromLiveOnFigPlaybackItem](self, "_updateConfiguredTimeOffsetFromLiveOnFigPlaybackItem");
    if (v57)
      -[AVPlayerItem _applyCurrentVideoComposition](self, "_applyCurrentVideoComposition");
    -[AVPlayerItem _applyCurrentAudioMix](self, "_applyCurrentAudioMix");
    -[AVPlayerItem _updateSeekingWaitsForVideoCompositionRenderingOnFigPlaybackItem](self, "_updateSeekingWaitsForVideoCompositionRenderingOnFigPlaybackItem");
    if ((HIDWORD(self->_playerItem->interstitialEventID) & 0x80000000) == 0)
      -[AVPlayerItem _quietlySetEQPreset:](self, "_quietlySetEQPreset:");
    -[AVPlayerItem _updatePlaybackPropertiesOnFigPlaybackItem](self, "_updatePlaybackPropertiesOnFigPlaybackItem");
    if (((unint64_t)self->_playerItem->rampInOutInfo & 0x8000000000000000) == 0)
      -[AVPlayerItem _quietlySetVariantIndex:](self, "_quietlySetVariantIndex:");
    -[AVPlayerItem _updateSoundCheckVolumeNormalizationOnFigPlaybackItem](self, "_updateSoundCheckVolumeNormalizationOnFigPlaybackItem");
    -[AVPlayerItem _updateVolumeAdjustmentOnFigPlaybackItem](self, "_updateVolumeAdjustmentOnFigPlaybackItem");
    if (-[AVPlayerItem audioTimePitchAlgorithm](self, "audioTimePitchAlgorithm"))
    {
      -[AVPlayerItem _updateFigTimePitchAlgorithmOnFigPlaybackItem](self, "_updateFigTimePitchAlgorithmOnFigPlaybackItem");
      ivarAccessQueue = self->_playerItem->ivarAccessQueue;
      v43[0] = v15;
      v43[1] = 3221225472;
      v43[2] = __53__AVPlayerItem__configurePlaybackItemAndReturnError___block_invoke_3;
      v43[3] = &unk_1E302FA10;
      v43[4] = self;
      av_readwrite_dispatch_queue_write(ivarAccessQueue, v43);
    }
    -[AVPlayerItem _updateLoudnessInfoOnFigPlaybackItem](self, "_updateLoudnessInfoOnFigPlaybackItem");
    -[AVPlayerItem _updateAudioTapProcessorOnFigPlaybackItem](self, "_updateAudioTapProcessorOnFigPlaybackItem");
    if (-[AVPlayerItem adjustTargetLevelWasSet](self, "adjustTargetLevelWasSet"))
      -[AVPlayerItem _updateAdjustTargetLevelOnFigPlaybackItem](self, "_updateAdjustTargetLevelOnFigPlaybackItem");
    if (-[AVPlayerItem adjustCompressionProfileWasSet](self, "adjustCompressionProfileWasSet"))
      -[AVPlayerItem _updateAdjustCompressionProfileOnFigPlaybackItem](self, "_updateAdjustCompressionProfileOnFigPlaybackItem");
    -[AVPlayerItem _applyMediaSelectionOptions](self, "_applyMediaSelectionOptions");
    -[AVPlayerItem _updateTextStyleRulesOnFigPlaybackItem](self, "_updateTextStyleRulesOnFigPlaybackItem");
    if (-[AVPlayerItem textHighlightArray](self, "textHighlightArray"))
      -[AVPlayerItem _updateTextHighlightArrayOnFigPlaybackItem](self, "_updateTextHighlightArrayOnFigPlaybackItem");
    -[AVPlayerItem _updateMediaKindOnFigPlaybackItem](self, "_updateMediaKindOnFigPlaybackItem");
    -[AVPlayerItem _updateRestrictionsOnFigPlaybackItem](self, "_updateRestrictionsOnFigPlaybackItem");
    -[AVPlayerItem _quietlySetServiceIdentifier](self, "_quietlySetServiceIdentifier");
    -[AVPlayerItem _setSyncLayersOnFigPlaybackItem](self, "_setSyncLayersOnFigPlaybackItem");
    -[AVPlayerItem _updateTimebase](self, "_updateTimebase");
    -[AVPlayerItem IFramePrefetchTargetDimensions](self, "IFramePrefetchTargetDimensions");
    v26 = *MEMORY[0x1E0C9D820];
    v25 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (v27 != *MEMORY[0x1E0C9D820] || v24 != v25)
      -[AVPlayerItem _updateIFramePrefetchTargetDimensionsOnFigPlaybackItem](self, "_updateIFramePrefetchTargetDimensionsOnFigPlaybackItem");
    -[AVPlayerItem preferredPeakBitRate](self, "preferredPeakBitRate");
    if (v28 > 0.0)
      -[AVPlayerItem _updatePreferredPeakBitRateOnFigPlaybackItem](self, "_updatePreferredPeakBitRateOnFigPlaybackItem");
    -[AVPlayerItem preferredPeakBitRateForExpensiveNetworks](self, "preferredPeakBitRateForExpensiveNetworks");
    if (v29 > 0.0)
      -[AVPlayerItem _updatePreferredPeakBitRateForExpensiveNetworksOnFigPlaybackItem](self, "_updatePreferredPeakBitRateForExpensiveNetworksOnFigPlaybackItem");
    -[AVPlayerItem preferredMaximumResolution](self, "preferredMaximumResolution");
    if (v31 != v26 || v30 != v25)
      -[AVPlayerItem _updatePreferredMaximumResolutionOnFigPlaybackItem](self, "_updatePreferredMaximumResolutionOnFigPlaybackItem");
    -[AVPlayerItem preferredMaximumResolutionForExpensiveNetworks](self, "preferredMaximumResolutionForExpensiveNetworks");
    if (v33 != v26 || v32 != v25)
      -[AVPlayerItem _updatePreferredMaximumResolutionForExpensiveNetworksOnFigPlaybackItem](self, "_updatePreferredMaximumResolutionForExpensiveNetworksOnFigPlaybackItem");
    -[AVPlayerItem preferredMinimumResolution](self, "preferredMinimumResolution");
    if (v35 != v26 || v34 != v25)
      -[AVPlayerItem _updatePreferredMinimumResolutionOnFigPlaybackItem](self, "_updatePreferredMinimumResolutionOnFigPlaybackItem");
    if ((self->_playerItem->maximumTrailingBufferDuration.value & 1) != 0)
      -[AVPlayerItem _updateMaximumTrailingBufferDurationOnFigPlaybackItem](self, "_updateMaximumTrailingBufferDurationOnFigPlaybackItem");
    -[AVPlayerItem maximumForwardBufferDuration](self, "maximumForwardBufferDuration");
    if ((v42 & 1) != 0)
      -[AVPlayerItem _updateMaximumForwardBufferDurationOnFigPlaybackItem](self, "_updateMaximumForwardBufferDurationOnFigPlaybackItem");
    if (-[AVPlayerItem videoApertureMode](self, "videoApertureMode"))
      -[AVPlayerItem _updateVideoApertureModeOnFigPlaybackItem](self, "_updateVideoApertureModeOnFigPlaybackItem");
    -[AVPlayerItem _updateVariantPreferencesOnFigPlaybackItem](self, "_updateVariantPreferencesOnFigPlaybackItem");
    -[AVPlayerItem preferredMaximumAudioSampleRate](self, "preferredMaximumAudioSampleRate");
    if (v36 != 0.0)
      -[AVPlayerItem _updatePreferredMaximumAudioSampleRateOnFigPlaybackItem](self, "_updatePreferredMaximumAudioSampleRateOnFigPlaybackItem");
    if (-[AVPlayerItem RTCReportingFlags](self, "RTCReportingFlags") != 1)
      -[AVPlayerItem _updateRTCReportingFlagsOnFigPlaybackItem](self, "_updateRTCReportingFlagsOnFigPlaybackItem");
    -[AVPlayerItem _updateRTCReportingCategoryOnFigPlaybackItem](self, "_updateRTCReportingCategoryOnFigPlaybackItem");
    -[AVPlayerItem _updateReportingValuesOnFigPlaybackItem](self, "_updateReportingValuesOnFigPlaybackItem");
    v37 = objc_msgSend(-[AVPlayerItem _metadataCollectors](self, "_metadataCollectors"), "count");
    if (v37)
    {
      v38 = self->_playerItem->figPlaybackItemSetterQueue;
      v41[0] = v15;
      v41[1] = 3221225472;
      v41[2] = __53__AVPlayerItem__configurePlaybackItemAndReturnError___block_invoke_4;
      v41[3] = &unk_1E302FE78;
      v41[4] = self;
      v41[5] = v37;
      dispatch_sync(v38, v41);
    }
    if (-[AVPlayerItem videoEnhancementMode](self, "videoEnhancementMode"))
      -[AVPlayerItem _updateVideoEnhancementModeOnFigPlaybackItem](self, "_updateVideoEnhancementModeOnFigPlaybackItem");
    playerItem = self->_playerItem;
    if (LODWORD(playerItem->preferredPeakBitRateForExpensiveNetworks) != -1)
    {
      -[AVPlayerItem _updateStartsOnFirstEligibleVariantOnFigPlaybackItem](self, "_updateStartsOnFirstEligibleVariantOnFigPlaybackItem");
      playerItem = self->_playerItem;
    }
    if (!BYTE3(playerItem->initialDate))
      -[AVPlayerItem _updateAutoSwitchAtmosStreamVariantsOnFigPlaybackItem](self, "_updateAutoSwitchAtmosStreamVariantsOnFigPlaybackItem");
    if (-[AVPlayerItem _speedRampDataWasSet](self, "_speedRampDataWasSet"))
      -[AVPlayerItem _updateSpeedRampDataOnFigPlaybackItem](self, "_updateSpeedRampDataOnFigPlaybackItem");
    -[AVPlayerItem _markAsFigItemConfigured](self, "_markAsFigItemConfigured");
    if (v55)
      CFRelease(v55);
    return 1;
  }
  result = 0;
  if (a3)
    *a3 = v58;
  return result;
}

- (CMTime)reversePlaybackEndTime
{
  NSObject *ivarAccessQueue;
  CMTime *result;
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
  v10 = &unk_1935931BF;
  v11 = *MEMORY[0x1E0CA2E18];
  v12 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AVPlayerItem_reversePlaybackEndTime__block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *(CMTime *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (CMTime)forwardPlaybackEndTime
{
  NSObject *ivarAccessQueue;
  CMTime *result;
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
  v10 = &unk_1935931BF;
  v11 = *MEMORY[0x1E0CA2E18];
  v12 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AVPlayerItem_forwardPlaybackEndTime__block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *(CMTime *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  NSObject *ivarAccessQueue;
  int v3;
  const AVAudioTimePitchAlgorithm *v4;
  NSString *v5;
  NSString *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__7;
  v13 = __Block_byref_object_dispose__7;
  v14 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__AVPlayerItem_audioTimePitchAlgorithm__block_invoke;
  v8[3] = &unk_1E302FD60;
  v8[4] = self;
  v8[5] = &v9;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v8);
  v3 = dyld_program_sdk_at_least();
  v4 = &AVAudioTimePitchAlgorithmTimeDomain;
  if (!v3)
    v4 = &AVAudioTimePitchAlgorithmLowQualityZeroLatency;
  v5 = *v4;
  if (v10[5])
    v6 = (NSString *)v10[5];
  else
    v6 = v5;
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)_updateCanUseNetworkResourcesForLiveStreamingWhilePausedOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __89__AVPlayerItem__updateCanUseNetworkResourcesForLiveStreamingWhilePausedOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_duration
{
  uint64_t v5;
  OpaqueFigPlaybackItem *v6;
  OpaqueFigPlaybackItem *v7;
  unsigned int (*v8)(OpaqueFigPlaybackItem *, $3CC8671D27C23BF42ADDB32F2B5E48AE *);
  AVAsset *asset;
  unsigned int (*v10)(OpaqueFigPlaybackItem *, $3CC8671D27C23BF42ADDB32F2B5E48AE *);
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  __int128 v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;

  if (sOKToBlockWhenGettingValuesOfProperties == 1)
    v5 = MEMORY[0x1E0CA2E68];
  else
    v5 = MEMORY[0x1E0CA2E10];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)v5;
  retstr->var3 = *(_QWORD *)(v5 + 16);
  v6 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  v7 = v6;
  if (sOKToBlockWhenGettingValuesOfProperties != 1)
  {
    if (!-[AVPlayerItem _isReadyForInspectionOfDuration](self, "_isReadyForInspectionOfDuration"))
    {
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:](self->_playerItem->asset, "loadValuesAsynchronouslyForKeys:completionHandler:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("duration")), &__block_literal_global_6);
LABEL_24:
      if (!v7)
        return result;
      goto LABEL_25;
    }
    if (v7
      && (v10 = *(unsigned int (**)(OpaqueFigPlaybackItem *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16)) != 0
      && !v10(v7, retstr))
    {
      if ((~retstr->var2 & 5) != 0
        || !self
        || (-[AVPlayerItem loopTimeRange](self, "loopTimeRange"), (v15 & 1) == 0)
        || (-[AVPlayerItem loopTimeRange](self, "loopTimeRange"), (v14 & 1) == 0)
        || (-[AVPlayerItem loopTimeRange](self, "loopTimeRange"), v13)
        || (-[AVPlayerItem loopTimeRange](self, "loopTimeRange"), v12 < 0))
      {
LABEL_25:
        CFRelease(v7);
        return result;
      }
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_playerItem->asset;
      if (!result)
      {
        v16 = 0uLL;
        v17 = 0;
        goto LABEL_22;
      }
    }
    else
    {
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_playerItem->asset;
      if (!result)
        goto LABEL_24;
    }
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE duration](result, "duration");
LABEL_22:
    *(_OWORD *)&retstr->var0 = v16;
    retstr->var3 = v17;
    goto LABEL_24;
  }
  if (v6)
  {
    v8 = *(unsigned int (**)(OpaqueFigPlaybackItem *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v8)
    {
      if (!v8(v7, retstr) && (~retstr->var2 & 5) == 0)
      {
        if (self)
        {
          -[AVPlayerItem loopTimeRange](self, "loopTimeRange");
          if ((v21 & 1) != 0)
          {
            -[AVPlayerItem loopTimeRange](self, "loopTimeRange");
            if ((v20 & 1) != 0)
            {
              -[AVPlayerItem loopTimeRange](self, "loopTimeRange");
              if (!v19)
              {
                -[AVPlayerItem loopTimeRange](self, "loopTimeRange");
                if ((v18 & 0x8000000000000000) == 0)
                {
                  asset = self->_playerItem->asset;
                  if (asset)
                  {
                    -[AVAsset duration](asset, "duration");
                    *(_OWORD *)&retstr->var0 = v16;
                    retstr->var3 = v17;
                  }
                }
              }
            }
          }
        }
      }
    }
    goto LABEL_25;
  }
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_playerItem->asset;
  if (result)
  {
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE duration](result, "duration");
    *(_OWORD *)&retstr->var0 = v16;
    retstr->var3 = v17;
  }
  return result;
}

- (void)_updateFigTimePitchAlgorithmOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__AVPlayerItem__updateFigTimePitchAlgorithmOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __31__AVPlayerItem__updateTimebase__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[7];

  v2 = *(_QWORD **)(a1 + 32);
  if (*(_QWORD *)(v2[1] + 128))
  {
    v3 = objc_msgSend(v2, "_copyFigPlaybackItem");
    v4 = objc_msgSend((id)objc_opt_class(), "_copyTimebaseFromFigPlaybackItem:", v3);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(*(_QWORD *)(v5 + 8) + 128);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__AVPlayerItem__updateTimebase__block_invoke_2;
    block[3] = &unk_1E30314D8;
    block[4] = v5;
    block[5] = v4;
    block[6] = v3;
    dispatch_async(v6, block);
  }
}

- (OpaqueFigPlaybackItem)_copyFigPlaybackItemLocked:(BOOL)a3
{
  OpaqueFigPlaybackItem *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__AVPlayerItem__copyFigPlaybackItemLocked___block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  -[AVPlayerItem dispatchIVarWrite:locked:block:](self, "dispatchIVarWrite:locked:block:", 0, a3, v5);
  v3 = (OpaqueFigPlaybackItem *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)dispatchIVarWrite:(BOOL)a3 locked:(BOOL)a4 block:(id)a5
{
  NSObject *ivarAccessQueue;

  if (a4)
  {
    (*((void (**)(id))a5 + 2))(a5);
  }
  else
  {
    ivarAccessQueue = self->_playerItem->ivarAccessQueue;
    if (a3)
      av_readwrite_dispatch_queue_write(ivarAccessQueue, a5);
    else
      av_readwrite_dispatch_queue_read(ivarAccessQueue, a5);
  }
}

CFTypeRef __43__AVPlayerItem__copyFigPlaybackItemLocked___block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 120);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (OpaqueFigPlaybackItem)_copyFigPlaybackItem
{
  return -[AVPlayerItem _copyFigPlaybackItemLocked:](self, "_copyFigPlaybackItemLocked:", 0);
}

+ (OpaqueCMTimebase)_copyTimebaseFromFigPlaybackItem:(OpaqueFigPlaybackItem *)a3
{
  uint64_t FigBaseObject;
  void (*v4)(uint64_t, _QWORD, _QWORD, OpaqueCMTimebase **);
  OpaqueCMTimebase *v6;

  v6 = 0;
  if (!a3)
    return 0;
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v4 = *(void (**)(uint64_t, _QWORD, _QWORD, OpaqueCMTimebase **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (!v4)
    return 0;
  v4(FigBaseObject, *MEMORY[0x1E0CC5380], *MEMORY[0x1E0C9AE00], &v6);
  return v6;
}

- (void)_updateRestrictionsOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__AVPlayerItem__updateRestrictionsOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __78__AVPlayerItem_AVPlayerItemMediaDataCollectors___addMetadataCollector_locked___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t FigBaseObject;
  void (*v4)(uint64_t, _QWORD, uint64_t);
  const void *v5;

  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_metadataCollectors"), "count"));
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v4 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    v4(FigBaseObject, *MEMORY[0x1E0CC50F8], v2);
  v5 = *(const void **)(a1 + 40);
  if (v5)
    CFRelease(v5);
}

- (id)_metadataCollectors
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__AVPlayerItem_AVPlayerItemMediaDataCollectors___metadataCollectors__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)videoEnhancementMode
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__AVPlayerItem_AVPlayerItemVideoEnhancement__videoEnhancementMode__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_quietlySetServiceIdentifier
{
  NSObject *figConfigurationQueue;
  _QWORD block[5];

  figConfigurationQueue = self->_playerItem->figConfigurationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__AVPlayerItem_AVPlayerItemServiceIdentifier_Private___quietlySetServiceIdentifier__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_async(figConfigurationQueue, block);
}

- (AVVideoApertureMode)videoApertureMode
{
  NSObject *ivarAccessQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  const __CFString *v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = CFSTR("CleanAperture");
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__AVPlayerItem_videoApertureMode__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSString *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)usesIFrameOnlyPlaybackForHighRateScaledEditsWasSet
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__AVPlayerItem_usesIFrameOnlyPlaybackForHighRateScaledEditsWasSet__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)textHighlightArray
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__AVPlayerItem_textHighlightArray__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)speedThresholdForIFrameOnlyPlaybackWasSet
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__AVPlayerItem_speedThresholdForIFrameOnlyPlaybackWasSet__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)savesDownloadedDataToDiskWhenDoneWasSet
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__AVPlayerItem_savesDownloadedDataToDiskWhenDoneWasSet__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)reversesMoreVideoFramesInMemoryWasSet
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__AVPlayerItem_reversesMoreVideoFramesInMemoryWasSet__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)refreshesClosedCaptionsImmediatelyAfterSeeking
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__AVPlayerItem_refreshesClosedCaptionsImmediatelyAfterSeeking__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)preferredPeakBitRate
{
  NSObject *ivarAccessQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__AVPlayerItem_preferredPeakBitRate__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)preferredPeakBitRateForExpensiveNetworks
{
  NSObject *ivarAccessQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__AVPlayerItem_preferredPeakBitRateForExpensiveNetworks__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (CGSize)preferredMinimumResolution
{
  NSObject *ivarAccessQueue;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  CGSize result;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x3010000000;
  v11 = &unk_1935931BF;
  v12 = *MEMORY[0x1E0C9D820];
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__AVPlayerItem_preferredMinimumResolution__block_invoke;
  v7[3] = &unk_1E302FD60;
  v7[4] = self;
  v7[5] = &v8;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v7);
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)preferredMaximumResolution
{
  NSObject *ivarAccessQueue;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  CGSize result;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x3010000000;
  v11 = &unk_1935931BF;
  v12 = *MEMORY[0x1E0C9D820];
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__AVPlayerItem_preferredMaximumResolution__block_invoke;
  v7[3] = &unk_1E302FD60;
  v7[4] = self;
  v7[5] = &v8;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v7);
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)preferredMaximumResolutionForExpensiveNetworks
{
  NSObject *ivarAccessQueue;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  CGSize result;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x3010000000;
  v11 = &unk_1935931BF;
  v12 = *MEMORY[0x1E0C9D820];
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__AVPlayerItem_preferredMaximumResolutionForExpensiveNetworks__block_invoke;
  v7[3] = &unk_1E302FD60;
  v7[4] = self;
  v7[5] = &v8;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v7);
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (double)preferredMaximumAudioSampleRate
{
  NSObject *ivarAccessQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__AVPlayerItem_preferredMaximumAudioSampleRate__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)minimumIntervalForIFrameOnlyPlaybackWasSet
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__AVPlayerItem_minimumIntervalForIFrameOnlyPlaybackWasSet__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumForwardBufferDuration
{
  NSObject *ivarAccessQueue;
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
  v10 = &unk_1935931BF;
  v11 = *MEMORY[0x1E0CA2E18];
  v12 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AVPlayerItem_maximumForwardBufferDuration__block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (id)initialEstimatedDate
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__AVPlayerItem_initialEstimatedDate__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)initialDate
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__AVPlayerItem_initialDate__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)imageQueueInterpolationCurveWasSet
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__AVPlayerItem_imageQueueInterpolationCurveWasSet__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)decodesAllFramesDuringOrdinaryPlaybackWasSet
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__AVPlayerItem_decodesAllFramesDuringOrdinaryPlaybackWasSet__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)continuesPlayingDuringPrerollForSeek
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
  v9 = 1;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__AVPlayerItem_continuesPlayingDuringPrerollForSeek__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)continuesPlayingDuringPrerollForRateChange
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
  v9 = 1;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__AVPlayerItem_continuesPlayingDuringPrerollForRateChange__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (CMTime)configuredTimeOffsetFromLive
{
  NSObject *ivarAccessQueue;
  CMTime *result;
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
  v10 = &unk_1935931BF;
  v11 = *MEMORY[0x1E0CA2E18];
  v12 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AVPlayerItem_configuredTimeOffsetFromLive__block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *(CMTime *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (BOOL)blendsVideoFramesWasSet
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__AVPlayerItem_blendsVideoFramesWasSet__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)automaticallyPreservesTimeOffsetFromLive
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__AVPlayerItem_automaticallyPreservesTimeOffsetFromLive__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)audioSpatializationAllowedWasSet
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__AVPlayerItem_audioSpatializationAllowedWasSet__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)appliesPerFrameHDRDisplayMetadataWasSet
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__AVPlayerItem_appliesPerFrameHDRDisplayMetadataWasSet__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)allowedAudioSpatializationFormatsWasSet
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__AVPlayerItem_allowedAudioSpatializationFormatsWasSet__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)aggressivelyCachesVideoFramesWasSet
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__AVPlayerItem_aggressivelyCachesVideoFramesWasSet__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)advanceTimeForOverlappedPlaybackWasSet
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__AVPlayerItem_advanceTimeForOverlappedPlaybackWasSet__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)adjustTargetLevelWasSet
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__AVPlayerItem_adjustTargetLevelWasSet__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)adjustCompressionProfileWasSet
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__AVPlayerItem_adjustCompressionProfileWasSet__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_updateVolumeAdjustmentOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__AVPlayerItem__updateVolumeAdjustmentOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateVariantPreferencesOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __58__AVPlayerItem__updateVariantPreferencesOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateTextStyleRulesOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__AVPlayerItem__updateTextStyleRulesOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateSoundCheckVolumeNormalizationOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__AVPlayerItem__updateSoundCheckVolumeNormalizationOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateSeekingWaitsForVideoCompositionRenderingOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __80__AVPlayerItem__updateSeekingWaitsForVideoCompositionRenderingOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateReportingValuesOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v8[6];
  _QWORD block[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    v10 = 0;
    v11 = &v10;
    v12 = 0x3052000000;
    v13 = __Block_byref_object_copy__7;
    v14 = __Block_byref_object_dispose__7;
    v15 = 0;
    ivarAccessQueue = self->_playerItem->ivarAccessQueue;
    v6 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__AVPlayerItem__updateReportingValuesOnFigPlaybackItem__block_invoke;
    block[3] = &unk_1E302FD60;
    block[4] = self;
    block[5] = &v10;
    av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __55__AVPlayerItem__updateReportingValuesOnFigPlaybackItem__block_invoke_2;
    v8[3] = &unk_1E3031EB8;
    v8[4] = &v10;
    v8[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v8);

    CFRelease(v4);
    _Block_object_dispose(&v10, 8);
  }
}

- (void)_updateRTCReportingCategoryOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__AVPlayerItem__updateRTCReportingCategoryOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updatePlaybackPropertiesOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    if (_updatePlaybackPropertiesOnFigPlaybackItem_keyMapOnce != -1)
      dispatch_once(&_updatePlaybackPropertiesOnFigPlaybackItem_keyMapOnce, &__block_literal_global_525);
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __58__AVPlayerItem__updatePlaybackPropertiesOnFigPlaybackItem__block_invoke_2;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateMediaKindOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__AVPlayerItem__updateMediaKindOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateLoudnessInfoOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__AVPlayerItem__updateLoudnessInfoOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateAudioTapProcessorOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__AVPlayerItem__updateAudioTapProcessorOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_timeToPausePlayback
{
  NSObject *ivarAccessQueue;
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
  v10 = &unk_1935931BF;
  v11 = *MEMORY[0x1E0CA2E18];
  v12 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__AVPlayerItem__timeToPausePlayback__block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_timeToPauseBuffering
{
  NSObject *ivarAccessQueue;
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
  v10 = &unk_1935931BF;
  v11 = *MEMORY[0x1E0CA2E18];
  v12 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__AVPlayerItem__timeToPauseBuffering__block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (void)_setSyncLayersOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__AVPlayerItem__setSyncLayersOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_getVideoComposition:(id *)a3 customVideoCompositorSession:(id *)a4 figVideoCompositor:(OpaqueFigVideoCompositor *)a5
{
  NSObject *ivarAccessQueue;
  OpaqueFigVideoCompositor *v9;
  const void *v10;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__7;
  v26 = __Block_byref_object_dispose__7;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__AVPlayerItem__getVideoComposition_customVideoCompositorSession_figVideoCompositor___block_invoke;
  v11[3] = &unk_1E3031F70;
  v11[4] = self;
  v11[5] = &v22;
  v11[6] = &v16;
  v11[7] = &v12;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v11);
  if (a3)
    *a3 = (id)v23[5];
  if (a4)
    *a4 = (id)v17[5];
  if (a5)
  {
    v9 = (OpaqueFigVideoCompositor *)v13[3];
    if (v9)
      v9 = (OpaqueFigVideoCompositor *)CFRetain(v9);
    *a5 = v9;
  }

  v10 = (const void *)v13[3];
  if (v10)
    CFRelease(v10);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
}

- (unsigned)RTCReportingFlags
{
  NSObject *ivarAccessQueue;
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__AVPlayerItem_RTCReportingFlags__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (CGSize)IFramePrefetchTargetDimensions
{
  NSObject *ivarAccessQueue;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  CGSize result;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x3010000000;
  v11 = &unk_1935931BF;
  v12 = *MEMORY[0x1E0C9D820];
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__AVPlayerItem_IFramePrefetchTargetDimensions__block_invoke;
  v7[3] = &unk_1E302FD60;
  v7[4] = self;
  v7[5] = &v8;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v7);
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

uint64_t __106__AVPlayerItem__isFigAssetReadyForInspectionOfMediaSelectionOptionsAndFigPlaybackItemIsReadyForInspection__block_invoke(uint64_t result)
{
  uint64_t v1;
  BOOL v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(_BYTE *)(v1 + 249))
    v2 = *(_BYTE *)(v1 + 227) != 0;
  else
    v2 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

uint64_t __68__AVPlayerItem__isFigAssetReadyForInspectionOfMediaSelectionOptions__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 227);
  return result;
}

uint64_t __44__AVPlayerItem_AVPlayerItemAVKit__AVKitData__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 864);
  return result;
}

uint64_t __53__AVPlayerItem__addInterstitialEventCollectorLocked___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 608) = *(_QWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "addMediaDataCollector:locked:", *(_QWORD *)(a1 + 40), 1);
}

__n128 __46__AVPlayerItem_IFramePrefetchTargetDimensions__block_invoke(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 848);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = result;
  return result;
}

__n128 __60__AVPlayerItem__informObserversAboutAvailabilityOfDuration___block_invoke_3(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  __n128 result;

  v1 = (__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 460);
  v2 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  result = v2[2];
  v1[1].n128_u64[0] = v2[3].n128_u64[0];
  *v1 = result;
  return result;
}

void __31__AVPlayerItem__updateTimebase__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t *v8;
  const __CFAllocator *v9;
  OpaqueCMClock *HostTimeClock;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  uint64_t v24;
  _QWORD v25[6];
  _QWORD block[4];
  __int128 v27;
  CMTimebaseRef timebaseOut[2];
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  v33 = 0u;
  v34 = 0u;
  v32 = 0u;
  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "loopTimeRange");
  v31 = 0;
  if (*(_QWORD *)(a1 + 40)
    && (BYTE12(v32) & 1) != 0
    && (BYTE4(v34) & 1) != 0
    && !*((_QWORD *)&v34 + 1)
    && (*((_QWORD *)&v33 + 1) & 0x8000000000000000) == 0)
  {
    *(_OWORD *)timebaseOut = v32;
    v29 = v33;
    v30 = v34;
    CMTimebaseCreateLoopingTimebase();
  }
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("timebase"));
  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  v4 = *(_OWORD *)(a1 + 32);
  v5 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16);
  block[1] = 3221225472;
  block[2] = __31__AVPlayerItem__updateTimebase__block_invoke_3;
  block[3] = &unk_1E302FE78;
  v27 = v4;
  av_readwrite_dispatch_queue_write(v5, block);
  if (!*(_QWORD *)(a1 + 40))
  {
    timebaseOut[0] = 0;
    v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    HostTimeClock = CMClockGetHostTimeClock();
    CMTimebaseCreateWithSourceClock(v9, HostTimeClock, timebaseOut);
    FigReadOnlyTimebaseSetTargetTimebase();
    FigReadOnlyTimebaseSetTargetTimebase();
    if (timebaseOut[0])
      CFRelease(timebaseOut[0]);
    objc_msgSend(*(id *)(a1 + 32), "_removeFoldedTBListeners");
    v11 = *(_QWORD *)(a1 + 32);
    v7 = *(NSObject **)(*(_QWORD *)(v11 + 8) + 16);
    v15 = v3;
    v16 = 3221225472;
    v17 = __31__AVPlayerItem__updateTimebase__block_invoke_6;
    v18 = &unk_1E302FA10;
    v19 = v11;
    v8 = &v15;
    goto LABEL_15;
  }
  FigReadOnlyTimebaseSetTargetTimebase();
  if ((BYTE12(v32) & 1) == 0
    || (BYTE4(v34) & 1) == 0
    || *((_QWORD *)&v34 + 1)
    || (*((_QWORD *)&v33 + 1) & 0x8000000000000000) != 0)
  {
    FigReadOnlyTimebaseSetTargetTimebase();
    objc_msgSend(*(id *)(a1 + 32), "_removeFoldedTBListeners");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(NSObject **)(*(_QWORD *)(v6 + 8) + 16);
    v20 = v3;
    v21 = 3221225472;
    v22 = __31__AVPlayerItem__updateTimebase__block_invoke_5;
    v23 = &unk_1E302FA10;
    v24 = v6;
    v8 = &v20;
LABEL_15:
    av_readwrite_dispatch_queue_write(v7, v8);
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 32), "_removeFoldedTBListeners");
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(NSObject **)(*(_QWORD *)(v13 + 8) + 16);
  v25[0] = v3;
  v25[1] = 3221225472;
  v25[2] = __31__AVPlayerItem__updateTimebase__block_invoke_4;
  v25[3] = &unk_1E302FE78;
  v25[4] = v13;
  v25[5] = v31;
  av_readwrite_dispatch_queue_write(v14, v25);
  if (v31)
    objc_msgSend(*(id *)(a1 + 32), "_addFoldedTBListeners");
  FigReadOnlyTimebaseSetTargetTimebase();
LABEL_16:
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("timebase"), v15, v16, v17, v18, v19, v20, v21, v22, v23, v24);
  v12 = *(const void **)(a1 + 48);
  if (v12)
    CFRelease(v12);
}

- (void)_addFoldedTBListeners
{
  OpaqueCMTimebase *v3;
  OpaqueCMTimebase *v4;
  id v5;
  id v6;

  v3 = -[AVPlayerItem _copyFoldedTimebase](self, "_copyFoldedTimebase");
  if (v3)
  {
    v4 = v3;
    v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v6 = -[AVPlayerItem _weakReference](self, "_weakReference");
    CFRetain(v6);
    objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", v6, cmTimebaseNotificationCallback_TimeJumped, *MEMORY[0x1E0CA2E88], v4, 0);
  }
}

- (void)_removeFoldedTBListeners
{
  AVPlayerItemInternal *playerItem;
  OpaqueCMTimebase *v4;
  OpaqueCMTimebase *v5;
  id v6;
  id v7;

  playerItem = self->_playerItem;
  if (playerItem && playerItem->ivarAccessQueue)
  {
    v4 = -[AVPlayerItem _copyFoldedTimebase](self, "_copyFoldedTimebase");
    if (v4)
    {
      v5 = v4;
      CFRelease(v4);
      v6 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
      v7 = -[AVPlayerItem _weakReference](self, "_weakReference");
      objc_msgSend(v6, "removeListenerWithWeakReference:callback:name:object:", v7, cmTimebaseNotificationCallback_TimeJumped, *MEMORY[0x1E0CA2E88], v5);
      CFRelease(v7);
      CFRelease(v5);
    }
  }
}

- (OpaqueCMTimebase)_copyFoldedTimebase
{
  NSObject *ivarAccessQueue;
  OpaqueCMTimebase *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__AVPlayerItem__copyFoldedTimebase__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (OpaqueCMTimebase *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_weakReference
{
  return self->_playerItem->weakReference;
}

- (void)_updateCanPlayAndCanStepPropertiesWhenReadyToPlayWithNotificationPayload:(id)a3 updateStatusToReadyToPlay:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  char v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  char v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  char v18;
  char v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *ivarAccessQueue;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD block[5];
  BOOL v36;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v4 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC4EB0]);
  if (v7)
    v8 = objc_msgSend(v7, "BOOLValue");
  else
    v8 = -[AVPlayerItem _canPlayFastForward](self, "_canPlayFastForward");
  v30 = v8;
  v9 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC4EC0]);
  if (v9)
    v10 = objc_msgSend(v9, "BOOLValue");
  else
    v10 = -[AVPlayerItem _canPlayReverse](self, "_canPlayReverse");
  v11 = v10;
  v12 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC4EB8]);
  if (v12)
    v13 = objc_msgSend(v12, "BOOLValue");
  else
    v13 = -[AVPlayerItem _canPlayFastReverse](self, "_canPlayFastReverse");
  v14 = v13;
  v15 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC4F10]);
  if (v15)
  {
    v16 = v15;
    v17 = objc_msgSend(v15, "BOOLValue");
    v18 = objc_msgSend(v16, "BOOLValue");
  }
  else
  {
    v17 = -[AVPlayerItem _canStepForward](self, "_canStepForward");
    v18 = -[AVPlayerItem _canStepBackward](self, "_canStepBackward");
  }
  v19 = v18;
  if (v4)
    v20 = (void *)objc_msgSend(&unk_1E3093AA8, "arrayByAddingObjectsFromArray:", &unk_1E3093A90);
  else
    v20 = &unk_1E3093A90;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v43;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v43 != v23)
          objc_enumerationMutation(v20);
        -[AVPlayerItem willChangeValueForKey:](self, "willChangeValueForKey:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v24++));
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v22);
  }
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__AVPlayerItem__updateCanPlayAndCanStepPropertiesWhenReadyToPlayWithNotificationPayload_updateStatusToReadyToPlay___block_invoke;
  block[3] = &unk_1E3032088;
  v36 = v4;
  block[4] = self;
  v37 = v30;
  v38 = v11;
  v39 = v14;
  v40 = v17;
  v41 = v19;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v26 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v46, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v32;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v32 != v28)
          objc_enumerationMutation(v20);
        -[AVPlayerItem didChangeValueForKey:](self, "didChangeValueForKey:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v29++));
      }
      while (v27 != v29);
      v27 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v46, 16);
    }
    while (v27);
  }
}

- ($1CE2C3FC342086196D07C2B4E8C70800)loopTimeRange
{
  __int128 v4;
  NSObject *ivarAccessQueue;
  uint64_t *v6;
  __int128 v7;
  $1CE2C3FC342086196D07C2B4E8C70800 *result;
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
  v13 = &unk_1935931BF;
  v4 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v14 = *MEMORY[0x1E0CA2E40];
  v15 = v4;
  v16 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29__AVPlayerItem_loopTimeRange__block_invoke;
  v9[3] = &unk_1E302FD60;
  v9[4] = self;
  v9[5] = &v10;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v9);
  v6 = v11;
  v7 = *((_OWORD *)v11 + 3);
  *(_OWORD *)&retstr->var0.var0 = *((_OWORD *)v11 + 2);
  *(_OWORD *)&retstr->var0.var3 = v7;
  *(_OWORD *)&retstr->var1.var1 = *((_OWORD *)v6 + 4);
  _Block_object_dispose(&v10, 8);
  return result;
}

- (BOOL)_isReadyForBasicInspection
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__AVPlayerItem__isReadyForBasicInspection__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isPlaybackBufferEmpty
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
  v9 = 1;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__AVPlayerItem_isPlaybackBufferEmpty__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isPlaybackBufferFull
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__AVPlayerItem_isPlaybackBufferFull__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_markAsReadyForInspectionOfPresentationSize
{
  NSObject *ivarAccessQueue;
  _QWORD block[5];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__AVPlayerItem__markAsReadyForInspectionOfPresentationSize__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

- (void)_updateTimebase
{
  NSObject *figPlaybackItemAccessorQueue;
  _QWORD block[5];

  figPlaybackItemAccessorQueue = self->_playerItem->figPlaybackItemAccessorQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__AVPlayerItem__updateTimebase__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_async(figPlaybackItemAccessorQueue, block);
}

- (void)_markAsReadyForInspectionOfDuration
{
  NSObject *ivarAccessQueue;
  _QWORD block[5];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__AVPlayerItem__markAsReadyForInspectionOfDuration__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

- (void)_markAsReadyForBasicInspection
{
  NSObject *ivarAccessQueue;
  _QWORD block[5];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AVPlayerItem__markAsReadyForBasicInspection__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

- (void)_invokeReadyForEnqueueingHandlers
{
  void *v3;
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
  if (-[NSMutableDictionary count](self->_playerItem->mediaOptionsSelectedByClient, "count"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", self->_playerItem->mediaOptionsSelectedByClient);
    -[NSMutableDictionary removeAllObjects](self->_playerItem->mediaOptionsSelectedByClient, "removeAllObjects");
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
            objc_enumerationMutation(v3);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++) + 16))();
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)_setAssetToAssetWithFigPlaybackItemIfAppropriate
{
  NSObject *ivarAccessQueue;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  if (+[AVPlayerItem _forStreamingItemsVendAssetWithFigPlaybackItem](AVPlayerItem, "_forStreamingItemsVendAssetWithFigPlaybackItem"))
  {
    if (!self->_playerItem->allowedAudioSpatializationFormatsWasSet)
    {
      v5 = 0;
      v6 = &v5;
      v7 = 0x3052000000;
      v8 = __Block_byref_object_copy__7;
      v9 = __Block_byref_object_dispose__7;
      v10 = 0;
      -[AVPlayerItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("asset"));
      ivarAccessQueue = self->_playerItem->ivarAccessQueue;
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __64__AVPlayerItem__setAssetToAssetWithFigPlaybackItemIfAppropriate__block_invoke;
      v4[3] = &unk_1E302FDB0;
      v4[4] = self;
      v4[5] = &v5;
      av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
      -[AVPlayerItem _setAsset:](self, "_setAsset:", v6[5]);
      -[AVPlayerItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("asset"));
      self->_playerItem->allowedAudioSpatializationFormatsWasSet = 1;

      _Block_object_dispose(&v5, 8);
    }
  }
}

- (AVPlayerItemStatus)status
{
  NSObject *ivarAccessQueue;
  AVPlayerItemStatus v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __22__AVPlayerItem_status__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (BOOL)_forStreamingItemsVendAssetWithFigPlaybackItem
{
  return 0;
}

- (id)_seekableTimeRangesFromFPSeekableTimeIntervals:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CMTimeEpoch v10;
  uint64_t i;
  void *v12;
  const __CFDictionary *v13;
  const __CFDictionary *v14;
  id obj;
  __int128 v17;
  CMTimeRange start;
  CMTime duration;
  CMTimeRange rhs;
  CMTime lhs;
  CMTime v22;
  CMTime v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  obj = a3;
  if (a3)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v25;
      v8 = *MEMORY[0x1E0CC5448];
      v9 = *MEMORY[0x1E0CC5440];
      v17 = *MEMORY[0x1E0CA2E68];
      v10 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v25 != v7)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          *(_OWORD *)&v23.value = v17;
          v23.epoch = v10;
          *(_OWORD *)&v22.value = v17;
          v22.epoch = v10;
          v13 = (const __CFDictionary *)objc_msgSend(v12, "objectForKey:", v8);
          v14 = (const __CFDictionary *)objc_msgSend(v12, "objectForKey:", v9);
          if (v13)
            CMTimeMakeFromDictionary(&v23, v13);
          if (v14)
          {
            CMTimeMakeFromDictionary(&lhs, v14);
            rhs.start = v23;
            CMTimeSubtract(&v22, &lhs, &rhs.start);
          }
          memset(&rhs, 0, sizeof(rhs));
          start.start = v23;
          duration = v22;
          CMTimeRangeMake(&rhs, &start.start, &duration);
          start = rhs;
          objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTimeRange:", &start));
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v6);
    }
  }
  return v4;
}

- (void)_unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:(int)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  int timescale;
  BOOL v7;
  AVPlayerItemInternal *playerItem;
  void (**epoch)(_QWORD, _QWORD);

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  MEMORY[0x194033BF8](self->_playerItem->seekIDMutex, a2);
  timescale = self->_playerItem->initialMaxSnapTime.timescale;
  if (timescale)
    v7 = timescale == (_DWORD)v5;
  else
    v7 = 0;
  if (!v7)
    JUMPOUT(0x194033C04);
  -[AVPlayerItem _postSeekCompletionNotificationWithSeekID:andResult:](self, "_postSeekCompletionNotificationWithSeekID:andResult:", v5, v4);
  playerItem = self->_playerItem;
  epoch = (void (**)(_QWORD, _QWORD))playerItem->initialMaxSnapTime.epoch;
  playerItem->initialMaxSnapTime.timescale = 0;
  self->_playerItem->initialMaxSnapTime.epoch = 0;
  MEMORY[0x194033C04](self->_playerItem->seekIDMutex);
  if (epoch)
  {
    epoch[2](epoch, v4);

  }
}

- (BOOL)_timeJumpedNotificationIncludesExtendedDiagnosticPayload
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__AVPlayerItem__timeJumpedNotificationIncludesExtendedDiagnosticPayload__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_updateAllowedAudioSpatializationFormatsFromFigItem
{
  NSObject *figPlaybackItemAccessorQueue;
  _QWORD block[5];

  figPlaybackItemAccessorQueue = self->_playerItem->figPlaybackItemAccessorQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AVPlayerItem__updateAllowedAudioSpatializationFormatsFromFigItem__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_async(figPlaybackItemAccessorQueue, block);
}

+ (AVPlayerItem)playerItemWithURL:(NSURL *)URL
{
  return (AVPlayerItem *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithURL:", URL);
}

+ (AVPlayerItem)playerItemWithAsset:(AVAsset *)asset
{
  return (AVPlayerItem *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithAsset:", asset);
}

- (AVPlayerItem)initWithURL:(NSURL *)URL
{
  AVPlayerItem *result;

  if (URL)
  {
    result = -[AVPlayerItem initWithAsset:](self, "initWithAsset:", +[AVAsset assetWithURL:](AVAsset, "assetWithURL:"));
    if (result)
      result->_playerItem->wasInitializedWithURL = 1;
  }
  else
  {

    return 0;
  }
  return result;
}

- (AVPlayerItem)initWithAsset:(AVAsset *)asset
{
  int isKindOfClass;
  uint64_t v6;
  int v7;
  uint64_t v8;

  AVTelemetryGenerateID();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((sOKToBlockWhenGettingValuesOfProperties & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = isKindOfClass;
    objc_opt_class();
    if (((objc_opt_isKindOfClass() | v7) & 1) != 0)
      v8 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("duration"), CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions"), 0);
    else
      v8 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("duration"));
    v6 = v8;
  }
  return -[AVPlayerItem initWithAsset:automaticallyLoadedAssetKeys:](self, "initWithAsset:automaticallyLoadedAssetKeys:", asset, v6);
}

- (AVPlayerItem)initWithAsset:(AVAsset *)asset automaticallyLoadedAssetKeys:(NSArray *)automaticallyLoadedAssetKeys
{
  AVPlayerItemInternal *v8;
  BOOL *v9;
  _OWORD *v10;
  char *v11;
  uint64_t v12;
  CMTime *v13;
  AVPlayerItemInternal *playerItem;
  AVPlayerItemInternal *v15;
  __int128 *v16;
  int64_t v17;
  __int128 v18;
  AVPlayerItemInternal *v19;
  AVPlayerItemInternal *v20;
  AVPlayerItemInternal *v21;
  AVPlayerItemInternal *v22;
  BOOL *v23;
  char *v24;
  BOOL *p_decodesAllFramesDuringOrdinaryPlayback;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  unsigned int *p_flags;
  char *v32;
  id v33;
  AVURLAsset *v34;
  AVPlayerItem *v35;
  AVPlayerItem *v36;
  void *v37;
  uint64_t v38;
  objc_class *v39;
  NSString *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  __int128 v47;
  CMTime v48;

  AVTelemetryGenerateID();
  v8 = objc_alloc_init(AVPlayerItemInternal);
  self->_playerItem = v8;
  if (!v8)
  {
LABEL_10:

    return 0;
  }
  CFRetain(v8);
  if (sInvokeOverrideOfInitFromDesignatedInitializer != 1
    || !objc_msgSend((id)objc_opt_class(), "_hasOverrideForSelector:", sel_init)
    || (self = -[AVPlayerItem init](self, "init")) != 0)
  {
    if (!asset)
      goto LABEL_10;
    if ((objc_msgSend((id)objc_opt_class(), "supportsPlayerItems") & 1) == 0)
    {
      v36 = self;
      v37 = (void *)MEMORY[0x1E0C99DA0];
      v38 = *MEMORY[0x1E0C99778];
      v39 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v39);
      v46 = (void *)objc_msgSend(v37, "exceptionWithName:reason:userInfo:", v38, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("%@ does not support playback via AVPlayer"), v41, v42, v43, v44, v45, (uint64_t)v40), 0);
      objc_exception_throw(v46);
    }
    self->_playerItem->weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", self);
    self->_playerItem->timeJumpedNotificationIncludesExtendedDiagnosticPayload = 1;
    v9 = &self->_playerItem->timeJumpedNotificationIncludesExtendedDiagnosticPayload + 4;
    v10 = (_OWORD *)MEMORY[0x1E0CA2E68];
    *((_QWORD *)v9 + 2) = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    *(_OWORD *)v9 = *v10;
    BYTE4(self->_playerItem->initialTime.value) = 1;
    v11 = (char *)&self->_playerItem->recommendedTimeOffsetFromLive.epoch + 4;
    v12 = MEMORY[0x1E0CA2E10];
    *(_OWORD *)v11 = *MEMORY[0x1E0CA2E10];
    *((_QWORD *)v11 + 2) = *(_QWORD *)(v12 + 16);
    v13 = (CMTime *)MEMORY[0x1E0CA2E30];
    self->_playerItem->initialTime.timescale = AVPlayerItemGetFigPlayerSetTimeFlagsForTolerances(MEMORY[0x1E0CA2E30], MEMORY[0x1E0CA2E30]);
    playerItem = self->_playerItem;
    v48 = *(CMTime *)(&playerItem->timeJumpedNotificationIncludesExtendedDiagnosticPayload + 4);
    AVPlayerItemGetFigPlayerSnapTimesForTimeAndTolerances(&v48, v13, v13, (CMTime *)&playerItem->initialTime.flags, (CMTime *)((char *)&playerItem->initialMinSnapTime.value + 4));
    *(_OWORD *)&self->_playerItem->preferredMinimumResolution.height = *MEMORY[0x1E0C9D820];
    LOBYTE(self->_playerItem->presentationSize.width) = 1;
    BYTE2(self->_playerItem->initialDate) = 1;
    v15 = self->_playerItem;
    v16 = (__int128 *)MEMORY[0x1E0CA2E18];
    v17 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v15->forwardPlaybackEndTime.epoch = v17;
    v18 = *v16;
    *(_OWORD *)&v15->forwardPlaybackEndTime.value = *v16;
    v19 = self->_playerItem;
    v19->reversePlaybackEndTime.epoch = v17;
    *(_OWORD *)&v19->reversePlaybackEndTime.value = v18;
    v20 = self->_playerItem;
    v20->timeToPauseBuffering.epoch = v17;
    *(_OWORD *)&v20->timeToPauseBuffering.value = v18;
    v21 = self->_playerItem;
    v21->timeToPausePlayback.epoch = v17;
    *(_OWORD *)&v21->timeToPausePlayback.value = v18;
    self->_playerItem->snapTimeToPausePlayback = 0;
    v22 = self->_playerItem;
    v22->advanceTimeForOverlappedPlayback.epoch = v17;
    *(_OWORD *)&v22->advanceTimeForOverlappedPlayback.value = v18;
    self->_playerItem->advanceTimeForOverlappedPlaybackWasSet = 0;
    self->_playerItem->preservesTimeOffsetFromLive = 0;
    v23 = &self->_playerItem->preservesTimeOffsetFromLive + 2;
    *(_OWORD *)v23 = v18;
    *((_QWORD *)v23 + 2) = v17;
    v24 = (char *)&self->_playerItem->configuredTimeOffsetFromLive.epoch + 4;
    *((_QWORD *)v24 + 2) = v17;
    v47 = v18;
    *(_OWORD *)v24 = v18;
    BYTE6(self->_playerItem->mediaKind) = 1;
    HIBYTE(self->_playerItem->mediaKind) = 1;
    p_decodesAllFramesDuringOrdinaryPlayback = &self->_playerItem->decodesAllFramesDuringOrdinaryPlayback;
    CMTimeMake(&v48, 1, 10);
    *(CMTime *)p_decodesAllFramesDuringOrdinaryPlayback = v48;
    LODWORD(self->_playerItem->minimumIntervalForIFrameOnlyPlayback.epoch) = 0x40000000;
    LOBYTE(self->_playerItem->initialFigTimePitchAlgorithm) = sCanUseExtraNetworkingByDefault;
    BYTE2(self->_playerItem->presentationSize.height) = 1;
    *(_WORD *)((char *)&self->_playerItem->preferredMaximumAudioSampleRate + 3) = 1;
    HIDWORD(self->_playerItem->interstitialEventID) = -1;
    self->_playerItem->rampInOutInfo = (NSDictionary *)-1;
    LODWORD(self->_playerItem->preferredPeakBitRateForExpensiveNetworks) = -1;
    BYTE3(self->_playerItem->initialDate) = 1;
    v26 = 3;
    if (!sConstrainsScalabilityToLosslessVariantsAndSampleRatesByDefault)
      v26 = 0;
    self->_playerItem->initialEstimatedDate = (NSDate *)v26;
    playerItem_createDefaultProxyTimebase();
    playerItem_createDefaultProxyTimebase();
    LODWORD(self->_playerItem->gaplessInfo) = 0;
    HIDWORD(self->_playerItem->gaplessInfo) = 1065353216;
    LOBYTE(self->_playerItem->audioProcessingTap) = 0;
    self->_playerItem->adjustTargetLevelWasSet = 0;
    self->_playerItem->mediaOptionsSelectedByClient = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(_QWORD *)&self->_playerItem->adjustCompressionProfileWasSet = 0;
    self->_playerItem->seekIDMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    self->_playerItem->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplayeritem.ivars");
    self->_playerItem->figConfigurationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplayeritem.figplaybackitem", 0);
    v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    self->_playerItem->figPlaybackItemAccessorQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplayeritem.figplaybackitem.accessor", v27);
    v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    self->_playerItem->figPlaybackItemSetterQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplayeritem.figplaybackitem.setter", v28);
    v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    self->_playerItem->seekQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplayeritem.seek", v29);
    self->_playerItem->itemOutputs = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    self->_playerItem->itemVideoOutputs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_playerItem->itemLegibleOutputsForKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_playerItem->itemMetadataOutputsForKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_playerItem->itemRenderedLegibleOutputsForKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_playerItem->initialVariantIndex = (int64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
    *(_QWORD *)&self->_playerItem->startsOnFirstEligibleVariant = objc_alloc_init(MEMORY[0x1E0C99D20]);
    self->_playerItem->itemCollectors = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_playerItem->videoApertureMode = 0;
    self->_playerItem->cachedTracks = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    LODWORD(self->_playerItem->interstitialEventCollector) = 1;
    *(_QWORD *)&self->_playerItem->loopTimeRange.duration.timescale = (id)-[AVLoggingIdentifier makeDerivedIdentifier](-[AVAsset loggingIdentifier](asset, "loggingIdentifier"), "makeDerivedIdentifier");
    self->_playerItem->loopTimeRange.duration.epoch = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"), "copy");
    if (VTPixelBufferAttributesMediatorCreate())
      goto LABEL_10;
    VTPixelBufferAttributesMediatorSetProperty();
    p_flags = &self->_playerItem->maximumForwardBufferDuration.flags;
    *((_QWORD *)p_flags + 2) = v17;
    *(_OWORD *)p_flags = v47;
    v32 = (char *)&self->_playerItem->initialFigTimePitchAlgorithm + 4;
    *((_QWORD *)v32 + 2) = v17;
    *(_OWORD *)v32 = v47;
    *(_WORD *)&self->_playerItem->haveInitialSamples = 1;
    self->_playerItem->mostRecentlyAppliedAudioMix = (AVAudioMix *)4;
    self->_playerItem->audioSpatializationAllowed = 0;
    v33 = -[AVAsset _absoluteURL](asset, "_absoluteURL");
    -[AVPlayerItem _setURL:](self, "_setURL:", v33);
    if (-[AVAsset _playbackItem](asset, "_playbackItem"))
    {
      v34 = +[AVURLAsset URLAssetWithURL:options:](AVURLAsset, "URLAssetWithURL:options:", v33, 0);
      v35 = self;
    }
    else
    {
      v35 = self;
      v34 = (AVURLAsset *)asset;
    }
    -[AVPlayerItem _setAsset:](v35, "_setAsset:", v34);
    self->_playerItem->automaticallyLoadedAssetKeys = (NSArray *)-[NSArray copy](automaticallyLoadedAssetKeys, "copy");
    LOBYTE(self->_playerItem->currentMediaSelection) = 0;
    HIDWORD(self->_playerItem->initialMaxSnapTime.value) = FPSupport_InitialSeekIDForSource();
    LOBYTE(self->_playerItem->interstitialEventID) = 1;
    self->_playerItem->figCPEProtector = (OpaqueFigCPEProtector *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return self;
}

- (void)_setURL:(id)a3
{
  if (!self->_playerItem->URL)
    self->_playerItem->URL = (NSURL *)a3;
}

__n128 __36__AVPlayerItem__timeToPausePlayback__block_invoke(uint64_t a1)
{
  __n128 *v1;
  uint64_t v2;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(__n128 *)(v2 + 360);
  v1[3].n128_u64[0] = *(_QWORD *)(v2 + 376);
  v1[2] = result;
  return result;
}

void __31__AVPlayerItem__updateTimebase__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(const void **)(v2 + 208);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 208) = 0;
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_QWORD *)(v2 + 208) = *(_QWORD *)(a1 + 40);
}

- (BOOL)hasEnabledVideo
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__AVPlayerItem_hasEnabledVideo__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

__n128 __44__AVPlayerItem_maximumForwardBufferDuration__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  result = *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 516);
  v1[3].n128_u64[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 532);
  v1[2] = result;
  return result;
}

__n128 __44__AVPlayerItem_configuredTimeOffsetFromLive__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  result = *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 412);
  v1[3].n128_u64[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 428);
  v1[2] = result;
  return result;
}

__n128 __37__AVPlayerItem__timeToPauseBuffering__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = *(__n128 **)(*(_QWORD *)(a1 + 32) + 8);
  result = v2[21];
  v1[3].n128_u64[0] = v2[22].n128_u64[0];
  v1[2] = result;
  return result;
}

uint64_t __32__AVPlayerItem_loadedTimeRanges__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1000), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __40__AVPlayerItem_isPlaybackLikelyToKeepUp__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 962);
  return result;
}

- (BOOL)_addToPlayQueueOfFigPlayerOfPlayer:(id)a3 afterFigPlaybackItemOfItem:(id)a4
{
  if (self->_playerItem->previousItem)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], 0x1E303AFB8, 0));
  -[AVPlayerItem _attachToFigPlayer](self, "_attachToFigPlayer");
  self->_playerItem->previousItem = (AVPlayerItem *)-[AVPlayerConnection initWithWeakReferenceToPlayer:weakReferenceToPlayerItem:]([AVPlayerConnection alloc], "initWithWeakReferenceToPlayer:weakReferenceToPlayerItem:", objc_msgSend(a3, "_weakReference"), -[AVPlayerItem _weakReference](self, "_weakReference"));
  return -[AVPlayerItem addItemToPlayQueueAfterPlaybackItemOfItem:](self->_playerItem->previousItem, "addItemToPlayQueueAfterPlaybackItemOfItem:", a4);
}

- (void)_setPlaybackCoordinator:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__AVPlayerItem__setPlaybackCoordinator___block_invoke;
  block[3] = &unk_1E302FE00;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (a3 && *((_BYTE *)v8 + 24))
    -[AVPlayerItem _updateItemIdentifierForCoordinatedPlayback](self, "_updateItemIdentifierForCoordinatedPlayback");
  _Block_object_dispose(&v7, 8);
}

- (void)_updateItemIdentifierForCoordinatedPlayback
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59__AVPlayerItem__updateItemIdentifierForCoordinatedPlayback__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __31__AVPlayerItem__updateTimebase__block_invoke_5(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 208);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 208) = 0;
  }
}

uint64_t __42__AVPlayerItem__setSuppressesVideoLayers___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 200) != v2)
  {
    *(_BYTE *)(v1 + 200) = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (id)_nextItem
{
  return self->_playerItem->seekCompletionHandler;
}

uint64_t __72__AVPlayerItem_AVPlayerItemServiceIdentifier_Private__serviceIdentifier__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1120), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __66__AVPlayerItem_AVPlayerItemVideoEnhancement__videoEnhancementMode__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1080);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __60__AVPlayerItem_AVPlayerItemOutputs___metadataOutputsForKeys__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 184), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __59__AVPlayerItem_AVPlayerItemOutputs___legibleOutputsForKeys__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 176), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __59__AVPlayerItem_AVPlayerItemHaptics__hapticPlaybackLocality__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 880);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __55__AVPlayerItem__updateReportingValuesOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 632), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __50__AVPlayerItem_AVPlayerItemOutputs___videoOutputs__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 168), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __45__AVPlayerItem__mediaOptionsSelectedByClient__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1360), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __36__AVPlayerItem_initialEstimatedDate__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 768);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __36__AVPlayerItem__playbackCoordinator__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1096);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __34__AVPlayerItem_textHighlightArray__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 496);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __34__AVPlayerItem_seekableTimeRanges__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 984), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __33__AVPlayerItem_reportingCategory__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 624), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __30__AVPlayerItem_textStyleRules__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 488);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __28__AVPlayerItem_loudnessInfo__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 656), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __27__AVPlayerItem_initialDate__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 760);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __27__AVPlayerItem_gaplessInfo__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 640);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __25__AVPlayerItem_mediaKind__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 704), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __24__AVPlayerItem_audioMix__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 264);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __53__AVPlayerItem__configurePlaybackItemAndReturnError___block_invoke_3(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 504);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 504) = 0;
  }
}

uint64_t __27__AVPlayerItem__syncLayers__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 152), "allObjects"), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

__n128 __46__AVPlayerItem_setPreferredMinimumResolution___block_invoke(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 920) = result;
  return result;
}

uint64_t __58__AVPlayerItem__informObserversAboutAvailabilityOfTracks___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 144) = result;
  return result;
}

void __60__AVPlayerItem__informObserversAboutAvailabilityOfDuration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  NSObject *v4;
  _QWORD block[4];
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "_duration");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_OWORD *)(v2 + 32) = v7;
  *(_QWORD *)(v2 + 48) = v8;
  block[0] = MEMORY[0x1E0C809B0];
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 128);
  block[1] = 3221225472;
  block[2] = __60__AVPlayerItem__informObserversAboutAvailabilityOfDuration___block_invoke_2;
  block[3] = &unk_1E302FDB0;
  v6 = v3;
  dispatch_async(v4, block);
}

+ (BOOL)automaticallyNotifiesObserversOfStatus
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfPresentationSize
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfPlaybackLikelyToKeepUp
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfPlaybackBufferEmpty
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfLoadedTimeRanges
{
  return 0;
}

__n128 __55__AVPlayerItem__currentTimeWithOptionalFoldedTimebase___block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  result = *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1132);
  v1[3].n128_u64[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1148);
  v1[2] = result;
  return result;
}

id __37__AVPlayerItem_currentMediaSelection__block_invoke_2(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1072) = result;
  return result;
}

uint64_t __115__AVPlayerItem__updateCanPlayAndCanStepPropertiesWhenReadyToPlayWithNotificationPayload_updateStatusToReadyToPlay___block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 272) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 940) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 936) = *(_BYTE *)(result + 41);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 938) = *(_BYTE *)(result + 42);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 939) = *(_BYTE *)(result + 42);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 937) = *(_BYTE *)(result + 43);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 941) = *(_BYTE *)(result + 44);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 942) = *(_BYTE *)(result + 45);
  return result;
}

uint64_t __58__AVPlayerItem__updateVariantPreferencesOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  char v1;
  uint64_t v2;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v5)(uint64_t, _QWORD, uint64_t);

  v1 = objc_msgSend(*(id *)(a1 + 32), "variantPreferences");
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v1 & 0xF ^ 3);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v5 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v5)
    return v5(FigBaseObject, *MEMORY[0x1E0CC53A0], v2);
  return result;
}

- (AVVariantPreferences)variantPreferences
{
  NSObject *ivarAccessQueue;
  AVVariantPreferences v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__AVPlayerItem_variantPreferences__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

CFTypeRef __85__AVPlayerItem__getVideoComposition_customVideoCompositorSession_figVideoCompositor___block_invoke(_QWORD *a1)
{
  CFTypeRef result;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = *(id *)(*(_QWORD *)(a1[4] + 8) + 1264);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = *(id *)(*(_QWORD *)(a1[4] + 8) + 1280);
  result = *(CFTypeRef *)(*(_QWORD *)(a1[4] + 8) + 1288);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  return result;
}

_QWORD *__42__AVPlayerItem__setCurrentMediaSelection___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;

  v1 = *(void **)(*(_QWORD *)(result[4] + 8) + 1072);
  if (v1 != (void *)result[5])
  {
    v2 = result;

    result = (id)v2[5];
    *(_QWORD *)(*(_QWORD *)(v2[4] + 8) + 1072) = result;
    *(_BYTE *)(*(_QWORD *)(v2[6] + 8) + 24) = 1;
  }
  return result;
}

uint64_t __49__AVPlayerItem_setPlaybackLikelyToKeepUpTrigger___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 832) = *(_QWORD *)(result + 40);
  return result;
}

id __34__AVPlayerItem__attachToFigPlayer__block_invoke(_QWORD *a1)
{
  id result;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 248);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 608) != 0;
  result = *(id *)(*(_QWORD *)(a1[4] + 8) + 1304);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = result;
  *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40) = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 1312);
  *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 1320);
  *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 40) = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 1064);
  return result;
}

uint64_t __57__AVPlayerItem__updateAudioTapProcessorOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);

  v1 = objc_msgSend(*(id *)(a1 + 32), "audioTapProcessor");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
    return v4(FigBaseObject, *MEMORY[0x1E0CC5048], v1);
  return result;
}

- (opaqueMTAudioProcessingTap)audioTapProcessor
{
  NSObject *ivarAccessQueue;
  opaqueMTAudioProcessingTap *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__AVPlayerItem_audioTapProcessor__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (opaqueMTAudioProcessingTap *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __80__AVPlayerItem__updateSeekingWaitsForVideoCompositionRenderingOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "seekingWaitsForVideoCompositionRendering");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC52D8], v5);
  }
  return result;
}

- (BOOL)seekingWaitsForVideoCompositionRendering
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__AVPlayerItem_seekingWaitsForVideoCompositionRendering__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __80__AVPlayerItem__updateRestrictsAutomaticMediaSelectionToAvailableOfflineOptions__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "restrictsAutomaticMediaSelectionToAvailableOfflineOptions");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC52B0], v5);
  }
  return result;
}

- (BOOL)restrictsAutomaticMediaSelectionToAvailableOfflineOptions
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__AVPlayerItem_restrictsAutomaticMediaSelectionToAvailableOfflineOptions__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__AVPlayerItem__updateLimitReadAheadOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "limitReadAhead");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE40];
    else
      v5 = *MEMORY[0x1E0C9AE50];
    return v4(FigBaseObject, *MEMORY[0x1E0CC5120], v5);
  }
  return result;
}

- (BOOL)limitReadAhead
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__AVPlayerItem_limitReadAhead__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __89__AVPlayerItem__updateCanUseNetworkResourcesForLiveStreamingWhilePausedOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "canUseNetworkResourcesForLiveStreamingWhilePaused");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE40];
    else
      v5 = *MEMORY[0x1E0C9AE50];
    return v4(FigBaseObject, *MEMORY[0x1E0CC5200], v5);
  }
  return result;
}

- (BOOL)canUseNetworkResourcesForLiveStreamingWhilePaused
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
  v9 = sCanUseExtraNetworkingByDefault;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__AVPlayerItem_canUseNetworkResourcesForLiveStreamingWhilePaused__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __52__AVPlayerItem__updateRestrictionsOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  CFNumberRef v1;
  CFNumberRef v2;
  uint64_t FigBaseObject;
  void (*v4)(uint64_t, _QWORD, CFNumberRef);
  uint64_t valuePtr;

  valuePtr = objc_msgSend(*(id *)(a1 + 32), "restrictions");
  v1 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt64Type, &valuePtr);
  if (v1)
  {
    v2 = v1;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v4 = *(void (**)(uint64_t, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v4)
      v4(FigBaseObject, *MEMORY[0x1E0CC52A8], v2);
    CFRelease(v2);
  }
}

- (unint64_t)restrictions
{
  NSObject *ivarAccessQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__AVPlayerItem_restrictions__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)addMediaDataCollector:(id)a3 locked:(BOOL)a4
{
  _BOOL8 v4;
  char v8;
  _QWORD v9[8];
  char v10;
  _QWORD v11[3];
  char v12;

  v4 = a4;
  v8 = objc_msgSend(a3, "_attachToPlayerItem:", self);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__AVPlayerItem_AVPlayerItemMediaDataCollectors__addMediaDataCollector_locked___block_invoke;
  v9[3] = &unk_1E30320D8;
  v9[4] = self;
  v9[5] = a3;
  v10 = v8 ^ 1;
  v9[6] = v11;
  v9[7] = a2;
  -[AVPlayerItem dispatchIVarWrite:locked:block:](self, "dispatchIVarWrite:locked:block:", 1, v4, v9);
  _Block_object_dispose(v11, 8);
}

uint64_t __78__AVPlayerItem_AVPlayerItemMediaDataCollectors__addMediaDataCollector_locked___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t result;
  void *v9;
  uint64_t v10;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 592), "containsObject:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    || !*(_BYTE *)(a1 + 64)
    && (v7 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 592), "arrayByAddingObject:", *(_QWORD *)(a1 + 40)), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 592), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 592) = v7, *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))|| *(_BYTE *)(a1 + 64))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(*(objc_class **)(a1 + 32), *(const char **)(a1 + 56), (uint64_t)CFSTR("Cannot attach a collector that is already attached"), v2, v3, v4, v5, v6, v10), 0);
    objc_exception_throw(v9);
  }
  result = needsTaggedRanges();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_addMetadataCollector:locked:", *(_QWORD *)(a1 + 40), 1);
  return result;
}

- (void)_addMetadataCollector:(id)a3 locked:(BOOL)a4
{
  _BOOL8 v4;
  OpaqueFigPlaybackItem *v7;
  uint64_t v8;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v10[6];
  _QWORD v11[6];

  v4 = a4;
  v7 = -[AVPlayerItem _copyFigPlaybackItemLocked:](self, "_copyFigPlaybackItemLocked:", a4);
  v8 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__AVPlayerItem_AVPlayerItemMediaDataCollectors___addMetadataCollector_locked___block_invoke;
  v11[3] = &unk_1E302FCE8;
  v11[4] = self;
  v11[5] = a3;
  -[AVPlayerItem dispatchIVarWrite:locked:block:](self, "dispatchIVarWrite:locked:block:", 1, v4, v11);
  if (v7)
  {
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __78__AVPlayerItem_AVPlayerItemMediaDataCollectors___addMetadataCollector_locked___block_invoke_2;
    v10[3] = &unk_1E302FE78;
    v10[4] = self;
    v10[5] = v7;
    dispatch_async(figPlaybackItemSetterQueue, v10);
  }
}

uint64_t __78__AVPlayerItem_AVPlayerItemMediaDataCollectors___addMetadataCollector_locked___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 600), "addObject:", *(_QWORD *)(a1 + 40));
}

void __60__AVPlayerItem_AVPlayerItemOutputs___evaluateLegibleOutputs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t FigBaseObject;
  void (*v11)(uint64_t, _QWORD, void *);
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_copyFigPlaybackItem");
  if (v2)
  {
    v3 = (const void *)v2;
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "_legibleOutputsForKeys");
    objc_msgSend(*(id *)(a1 + 32), "_updateLegibleSuppressionOnFigPlaybackItem:basedOnOutputs:", v3, objc_msgSend(v4, "allValues"));
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v4);
          objc_msgSend(v5, "setObject:forKey:", objc_msgSend((id)objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9)), "_figLegibleOutputsDictionaryOptions"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v11 = *(void (**)(uint64_t, _QWORD, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v11)
      v11(FigBaseObject, *MEMORY[0x1E0CC51A8], v5);
    CFRelease(v3);
  }
}

- (id)_legibleOutputsForKeys
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__AVPlayerItem_AVPlayerItemOutputs___legibleOutputsForKeys__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __69__AVPlayerItem__updateSoundCheckVolumeNormalizationOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  CFNumberRef v2;
  CFNumberRef v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, CFNumberRef);
  int valuePtr;

  objc_msgSend(*(id *)(a1 + 32), "soundCheckVolumeNormalization");
  valuePtr = v1;
  v2 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberFloat32Type, &valuePtr);
  if (v2)
  {
    v3 = v2;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v5 = *(void (**)(uint64_t, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v5)
      v5(FigBaseObject, *MEMORY[0x1E0CC52F8], v3);
    CFRelease(v3);
  }
}

- (float)soundCheckVolumeNormalization
{
  NSObject *ivarAccessQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AVPlayerItem_soundCheckVolumeNormalization__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __56__AVPlayerItem__updateVolumeAdjustmentOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  CFNumberRef v2;
  CFNumberRef v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, CFNumberRef);
  int valuePtr;

  objc_msgSend(*(id *)(a1 + 32), "volumeAdjustment");
  valuePtr = v1;
  v2 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberFloat32Type, &valuePtr);
  if (v2)
  {
    v3 = v2;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v5 = *(void (**)(uint64_t, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v5)
      v5(FigBaseObject, *MEMORY[0x1E0CC5428], v3);
    CFRelease(v3);
  }
}

- (float)volumeAdjustment
{
  NSObject *ivarAccessQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 1065353216;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__AVPlayerItem_volumeAdjustment__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__AVPlayerItem__updateLoudnessInfoOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);

  v1 = objc_msgSend(*(id *)(a1 + 32), "loudnessInfo");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
    return v4(FigBaseObject, *MEMORY[0x1E0CC51C8], v1);
  return result;
}

- (id)loudnessInfo
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__AVPlayerItem_loudnessInfo__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__AVPlayerItem__updateRTCReportingCategoryOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);

  v1 = objc_msgSend(*(id *)(a1 + 32), "reportingCategory");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
    return v4(FigBaseObject, *MEMORY[0x1E0CC5258], v1);
  return result;
}

- (id)reportingCategory
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__AVPlayerItem_reportingCategory__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__AVPlayerItem__updateMediaKindOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);

  result = objc_msgSend(*(id *)(a1 + 32), "mediaKind");
  if (result)
  {
    v2 = result;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    result = CMBaseObjectGetVTable();
    v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
    if (v4)
      return v4(FigBaseObject, *MEMORY[0x1E0CC51E8], v2);
  }
  return result;
}

- (id)mediaKind
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__AVPlayerItem_mediaKind__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __83__AVPlayerItem_AVPlayerItemServiceIdentifier_Private___quietlySetServiceIdentifier__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);

  result = objc_msgSend(*(id *)(a1 + 32), "serviceIdentifier");
  if (result)
  {
    v2 = result;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    result = CMBaseObjectGetVTable();
    v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
    if (v4)
      return v4(FigBaseObject, *MEMORY[0x1E0CC52E8], v2);
  }
  return result;
}

- (NSString)serviceIdentifier
{
  NSObject *ivarAccessQueue;
  NSString *v3;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__AVPlayerItem_AVPlayerItemServiceIdentifier_Private__serviceIdentifier__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__AVPlayerItem__updateTextStyleRulesOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v5)(uint64_t, _QWORD, id);

  v1 = objc_msgSend(*(id *)(a1 + 32), "textStyleRules");
  if (v1)
    v2 = +[AVTextStyleRule propertyListForTextStyleRules:](AVTextStyleRule, "propertyListForTextStyleRules:", v1);
  else
    v2 = 0;
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v5 = *(uint64_t (**)(uint64_t, _QWORD, id))(*(_QWORD *)(result + 8) + 56);
  if (v5)
    return v5(FigBaseObject, *MEMORY[0x1E0CC5350], v2);
  return result;
}

- (NSArray)textStyleRules
{
  NSObject *ivarAccessQueue;
  NSArray *v3;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__AVPlayerItem_textStyleRules__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__AVPlayerItem__setSyncLayersOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v5)(uint64_t, _QWORD, void *);
  void *v6;

  v1 = (void *)objc_msgSend(*(id *)(a1 + 32), "_syncLayers");
  v2 = objc_msgSend(v1, "count");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v5 = *(uint64_t (**)(uint64_t, _QWORD, void *))(*(_QWORD *)(result + 8) + 56);
  if (v5)
  {
    if (v2)
      v6 = v1;
    else
      v6 = 0;
    return v5(FigBaseObject, *MEMORY[0x1E0CC5340], v6);
  }
  return result;
}

- (id)_syncLayers
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__AVPlayerItem__syncLayers__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (CMTime)currentTime
{
  CMTime *result;
  CMTime *v6;

  result = -[AVPlayerItem _copyFoldedTimebase](self, "_copyFoldedTimebase");
  v6 = result;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  retstr->value = 0;
  if (self)
    result = -[AVPlayerItem _currentTimeWithOptionalFoldedTimebase:](self, "_currentTimeWithOptionalFoldedTimebase:", result);
  if (v6)
    CFRelease(v6);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_currentTimeWithOptionalFoldedTimebase:(SEL)a3
{
  OpaqueFigPlaybackItem *v7;
  uint64_t *v8;
  unsigned int (*v9)(OpaqueFigPlaybackItem *, uint64_t *);
  NSObject *seekQueue;
  uint64_t *v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD v13[6];
  CMTime v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  uint64_t v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3810000000;
  v18 = &unk_1935931BF;
  v19 = *MEMORY[0x1E0CA2E18];
  v20 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v7 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v7)
  {
    if (a4)
    {
      CMTimebaseGetTime(&v14, a4);
      *(CMTime *)(v16 + 4) = v14;
LABEL_7:
      CFRelease(v7);
      goto LABEL_8;
    }
    v8 = v16;
    v9 = *(unsigned int (**)(OpaqueFigPlaybackItem *, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                           + 32);
    if (v9 && !v9(v7, v8 + 4))
      goto LABEL_7;
  }
  seekQueue = self->_playerItem->seekQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__AVPlayerItem__currentTimeWithOptionalFoldedTimebase___block_invoke;
  v13[3] = &unk_1E302FD60;
  v13[4] = self;
  v13[5] = &v15;
  dispatch_sync(seekQueue, v13);
  if (v7)
    goto LABEL_7;
LABEL_8:
  v11 = v16;
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v16 + 2);
  retstr->var3 = v11[6];
  _Block_object_dispose(&v15, 8);
  return result;
}

__n128 __33__AVPlayerItem_setLoopTimeRange___block_invoke(uint64_t a1)
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  uint64_t v6;
  __int128 v7;
  CMTimeRange v8;
  CMTimeRange range1;

  v2 = *(_OWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&range1.start.value = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&range1.start.epoch = v3;
  *(_OWORD *)&range1.duration.timescale = *(_OWORD *)(a1 + 80);
  v4 = v2[64];
  *(_OWORD *)&v8.start.value = v2[63];
  *(_OWORD *)&v8.start.epoch = v4;
  *(_OWORD *)&v8.duration.timescale = v2[65];
  if (!CMTimeRangeEqual(&range1, &v8))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    result = *(__n128 *)(a1 + 48);
    v7 = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(v6 + 1040) = *(_OWORD *)(a1 + 80);
    *(__n128 *)(v6 + 1008) = result;
    *(_OWORD *)(v6 + 1024) = v7;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (NSArray)loadedTimeRanges
{
  NSObject *ivarAccessQueue;
  void *v3;
  NSArray *v4;
  NSArray *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__7;
  v12 = __Block_byref_object_dispose__7;
  v13 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__AVPlayerItem_loadedTimeRanges__block_invoke;
  v7[3] = &unk_1E302FD60;
  v7[4] = self;
  v7[5] = &v8;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v7);
  v3 = (void *)v9[5];
  if (v3)
    v4 = v3;
  else
    v4 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v5 = v4;
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __53__AVPlayerItem__configurePlaybackItemAndReturnError___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, uint64_t);
  int v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, _QWORD, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, uint64_t);
  int v14;
  uint64_t v15;
  void (*v16)(uint64_t, _QWORD, uint64_t);
  uint64_t v17;
  int v18;
  uint64_t v19;
  void (*v20)(uint64_t, _QWORD, uint64_t);
  uint64_t v21;
  int v22;
  uint64_t v23;
  void (*v24)(uint64_t, _QWORD, uint64_t);
  uint64_t v25;
  int v26;
  uint64_t v27;
  void (*v28)(uint64_t, _QWORD, uint64_t);
  uint64_t v29;
  int v30;
  uint64_t v31;
  void (*v32)(uint64_t, _QWORD, uint64_t);
  uint64_t v33;
  int v34;
  uint64_t v35;
  void (*v36)(uint64_t, _QWORD, uint64_t);
  uint64_t v37;
  const void *Float64;
  uint64_t v39;
  void (*v40)(uint64_t, _QWORD, const void *);

  v2 = objc_msgSend(*(id *)(a1 + 32), "_isExternalProtectionRequiredForPlayback");
  v3 = *MEMORY[0x1E0C9AE50];
  if (v2)
  {
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v5 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v5)
      v5(FigBaseObject, *MEMORY[0x1E0CC5280], v3);
  }
  v6 = objc_msgSend(*(id *)(a1 + 32), "playHapticTracks");
  v7 = *MEMORY[0x1E0C9AE40];
  v8 = FigPlaybackItemGetFigBaseObject();
  v9 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v9)
  {
    if (v6)
      v10 = v3;
    else
      v10 = v7;
    v9(v8, *MEMORY[0x1E0CC5210], v10);
  }
  v11 = objc_msgSend(*(id *)(a1 + 32), "hapticPlaybackLocality");
  v12 = FigPlaybackItemGetFigBaseObject();
  v13 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v13)
    v13(v12, *MEMORY[0x1E0CC5158], v11);
  v14 = objc_msgSend(*(id *)(a1 + 32), "suppressesAudioOnlyVariants");
  v15 = FigPlaybackItemGetFigBaseObject();
  v16 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v16)
  {
    if (v14)
      v17 = v3;
    else
      v17 = v7;
    v16(v15, *MEMORY[0x1E0CC5338], v17);
  }
  v18 = objc_msgSend(*(id *)(a1 + 32), "prefersOfflinePlayableVariants");
  v19 = FigPlaybackItemGetFigBaseObject();
  v20 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v20)
  {
    if (v18)
      v21 = v3;
    else
      v21 = v7;
    v20(v19, *MEMORY[0x1E0CC5238], v21);
  }
  v22 = objc_msgSend(*(id *)(a1 + 32), "requiresAccessLog");
  v23 = FigPlaybackItemGetFigBaseObject();
  v24 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v24)
  {
    if (v22)
      v25 = v3;
    else
      v25 = v7;
    v24(v23, *MEMORY[0x1E0CC5150], v25);
  }
  v26 = objc_msgSend(*(id *)(a1 + 32), "allowProgressiveSwitchUp");
  v27 = FigPlaybackItemGetFigBaseObject();
  v28 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v28)
  {
    if (v26)
      v29 = v3;
    else
      v29 = v7;
    v28(v27, *MEMORY[0x1E0CC5018], v29);
  }
  v30 = objc_msgSend(*(id *)(a1 + 32), "allowProgressiveStartup");
  v31 = FigPlaybackItemGetFigBaseObject();
  v32 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v32)
  {
    if (v30)
      v33 = v3;
    else
      v33 = v7;
    v32(v31, *MEMORY[0x1E0CC5010], v33);
  }
  v34 = objc_msgSend(*(id *)(a1 + 32), "allowProgressiveResume");
  v35 = FigPlaybackItemGetFigBaseObject();
  v36 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v36)
  {
    if (v34)
      v37 = v3;
    else
      v37 = v7;
    v36(v35, *MEMORY[0x1E0CC5008], v37);
  }
  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1448) > 0.0)
  {
    Float64 = (const void *)FigCFNumberCreateFloat64();
    v39 = FigPlaybackItemGetFigBaseObject();
    v40 = *(void (**)(uint64_t, _QWORD, const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v40)
      v40(v39, *MEMORY[0x1E0CC5030], Float64);
    if (Float64)
      CFRelease(Float64);
  }
}

- (BOOL)playHapticTracks
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__AVPlayerItem_AVPlayerItemHaptics__playHapticTracks__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isExternalProtectionRequiredForPlayback
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __93__AVPlayerItem_AVPlayerItemProtectedContentPrivate___isExternalProtectionRequiredForPlayback__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)hapticPlaybackLocality
{
  NSObject *ivarAccessQueue;
  NSString *v3;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__AVPlayerItem_AVPlayerItemHaptics__hapticPlaybackLocality__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)suppressesAudioOnlyVariants
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__AVPlayerItem_suppressesAudioOnlyVariants__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)requiresAccessLog
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__AVPlayerItem_requiresAccessLog__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)prefersOfflinePlayableVariants
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
  v9 = 1;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__AVPlayerItem_prefersOfflinePlayableVariants__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)allowProgressiveSwitchUp
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__AVPlayerItem_allowProgressiveSwitchUp__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)allowProgressiveStartup
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__AVPlayerItem_allowProgressiveStartup__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)allowProgressiveResume
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__AVPlayerItem_allowProgressiveResume__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__AVPlayerItem_allowedAudioSpatializationFormats__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 1408);
  return result;
}

uint64_t __24__AVPlayerItem_delegate__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 256);
  return result;
}

uint64_t __61__AVPlayerItem__updateFigTimePitchAlgorithmOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);

  v1 = objc_msgSend(*(id *)(a1 + 32), "audioTimePitchAlgorithm");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
    return v4(FigBaseObject, *MEMORY[0x1E0CC5368], v1);
  return result;
}

uint64_t __55__AVPlayerItem__updateReportingValuesOnFigPlaybackItem__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
    return v4(FigBaseObject, *MEMORY[0x1E0CC50D0], v1);
  return result;
}

__n128 __48__AVPlayerItem_setMaximumForwardBufferDuration___block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 result;

  v1 = (__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 516);
  result = *(__n128 *)(a1 + 40);
  v1[1].n128_u64[0] = *(_QWORD *)(a1 + 56);
  *v1 = result;
  return result;
}

- (NSArray)seekableTimeRanges
{
  NSObject *ivarAccessQueue;
  void *v3;
  NSArray *v4;
  NSArray *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__7;
  v12 = __Block_byref_object_dispose__7;
  v13 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__AVPlayerItem_seekableTimeRanges__block_invoke;
  v7[3] = &unk_1E302FD60;
  v7[4] = self;
  v7[5] = &v8;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v7);
  v3 = (void *)v9[5];
  if (v3)
    v4 = v3;
  else
    v4 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v5 = v4;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (NSObject)AVKitData
{
  NSObject *ivarAccessQueue;
  NSObject *v3;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__AVPlayerItem_AVPlayerItemAVKit__AVKitData__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_applyCurrentAudioMix
{
  AVAudioMix *v3;
  AVPlayerItemInternal *playerItem;
  AVAudioMix *handlersToCallWhenReadyForEnqueueing;
  AVAudioMix *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  AVMutableAudioMixInputParameters *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->_playerItem->figPlaybackItem)
  {
    v3 = -[AVPlayerItem audioMix](self, "audioMix");
    playerItem = self->_playerItem;
    handlersToCallWhenReadyForEnqueueing = (AVAudioMix *)playerItem->handlersToCallWhenReadyForEnqueueing;
    if (v3 != handlersToCallWhenReadyForEnqueueing)
    {
      v6 = v3;
      if (!-[AVAudioMix isEqual:](v3, "isEqual:", playerItem->handlersToCallWhenReadyForEnqueueing))
      {
        v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", -[AVAudioMix inputParameters](v6, "inputParameters"));
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v8 = -[AVAudioMix inputParameters](handlersToCallWhenReadyForEnqueueing, "inputParameters");
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v26 != v11)
                objc_enumerationMutation(v8);
              v13 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "trackID");
              if (!-[AVAudioMix audioMixInputParametersForTrackID:](v6, "audioMixInputParametersForTrackID:", v13))
              {
                v14 = +[AVMutableAudioMixInputParameters audioMixInputParameters](AVMutableAudioMixInputParameters, "audioMixInputParameters");
                -[AVMutableAudioMixInputParameters setTrackID:](v14, "setTrackID:", v13);
                objc_msgSend(v7, "addObject:", v14);
              }
            }
            v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
          }
          while (v10);
        }
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v22 != v17)
                objc_enumerationMutation(v7);
              v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
              v20 = objc_msgSend(v19, "trackID");
              -[AVPlayerItem _setAudioProcessingEffectsAccordingToInputParameters:forTrackID:](self, "_setAudioProcessingEffectsAccordingToInputParameters:forTrackID:", v19, v20);
              -[AVPlayerItem _setAudioCurvesAccordingToInputParameters:forTrackID:](self, "_setAudioCurvesAccordingToInputParameters:forTrackID:", v19, v20);
              if ((_DWORD)v20)
              {
                -[AVPlayerItem _setAudioTapProcessor:forTrackID:](self, "_setAudioTapProcessor:forTrackID:", objc_msgSend(v19, "audioTapProcessor"), v20);
                -[AVPlayerItem _setAudioTimePitchAlgorithm:forTrackID:](self, "_setAudioTimePitchAlgorithm:forTrackID:", objc_msgSend(v19, "audioTimePitchAlgorithm"), v20);
                -[AVPlayerItem _setAudioEffectParameters:previousEffects:forTrackID:](self, "_setAudioEffectParameters:previousEffects:forTrackID:", objc_msgSend(v19, "effects"), objc_msgSend(-[AVAudioMix audioMixInputParametersForTrackID:](handlersToCallWhenReadyForEnqueueing, "audioMixInputParametersForTrackID:", v20), "effects"), v20);
              }
            }
            v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v16);
        }

        self->_playerItem->handlersToCallWhenReadyForEnqueueing = (NSMutableArray *)-[AVAudioMix copy](v6, "copy");
      }
    }
  }
}

- (AVAudioMix)audioMix
{
  NSObject *ivarAccessQueue;
  AVAudioMix *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  AVTelemetryGenerateID();
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  v12 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__AVPlayerItem_audioMix__block_invoke;
  v6[3] = &unk_1E302FD60;
  v6[4] = self;
  v6[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v6);
  v4 = (AVAudioMix *)(id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isPlaybackLikelyToKeepUp
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__AVPlayerItem_isPlaybackLikelyToKeepUp__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __40__AVPlayerItem__setPlaybackCoordinator___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id location;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1096);
  if (v1 != *(void **)(a1 + 40))
  {

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1096) = *(id *)(a1 + 40);
    v3 = *(_QWORD **)(a1 + 32);
    if (*(_QWORD *)(v3[1] + 1104))
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1104));

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1104) = 0;
      v3 = *(_QWORD **)(a1 + 32);
    }
    objc_initWeak(&location, v3);
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = *(_QWORD *)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__AVPlayerItem__setPlaybackCoordinator___block_invoke_2;
    v6[3] = &unk_1E302FA38;
    objc_copyWeak(&v7, &location);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1104) = (id)objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", 0x1E304B538, v5, 0, v6);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)setLoopTimeRange:(id *)a3
{
  unsigned int var2;
  unsigned int v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *p_var1;
  NSObject *ivarAccessQueue;
  __int128 v9;
  _QWORD v10[6];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CMTime time2;
  CMTime time1;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  var2 = a3->var0.var2;
  if ((var2 & 1) == 0
    || (v6 = a3->var1.var2, (v6 & 1) == 0)
    || ((p_var1 = &a3->var1, a3->var1.var3) || p_var1->var0 < 0 || ((v6 | var2) & 0x10) == 0)
    && (a3->var1.var3
     || p_var1->var0 < 0
     || (*(_OWORD *)&time1.value = *(_OWORD *)&p_var1->var0,
         time1.epoch = a3->var1.var3,
         time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68],
         CMTimeCompare(&time1, &time2))))
  {
    ivarAccessQueue = self->_playerItem->ivarAccessQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __33__AVPlayerItem_setLoopTimeRange___block_invoke;
    v10[3] = &unk_1E3031FD0;
    v9 = *(_OWORD *)&a3->var0.var3;
    v11 = *(_OWORD *)&a3->var0.var0;
    v12 = v9;
    v13 = *(_OWORD *)&a3->var1.var1;
    v10[4] = self;
    v10[5] = &v16;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, v10);
    if (*((_BYTE *)v17 + 24))
    {
      -[AVPlayerItem _updateTimebase](self, "_updateTimebase");
      -[AVPlayerItem _updateLoopTimeRangeOnFigPlaybackItem](self, "_updateLoopTimeRangeOnFigPlaybackItem");
    }
  }
  _Block_object_dispose(&v16, 8);
}

- (void)_updateLoopTimeRangeOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  CMTimeEpoch v5;
  const __CFAllocator *v6;
  CFDictionaryRef v7;
  uint64_t FigBaseObject;
  void (*v9)(uint64_t, _QWORD, CFDictionaryRef);
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD, _QWORD);
  __int128 v12;
  CMTimeRange time1;
  CMTime time2;
  CMTimeRange v15;

  memset(&v15, 0, sizeof(v15));
  if (self)
    -[AVPlayerItem loopTimeRange](self, "loopTimeRange");
  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    if ((v15.start.flags & 0x1D) != 1)
      goto LABEL_12;
    *(_OWORD *)&time1.start.value = *(_OWORD *)&v15.start.value;
    time1.start.epoch = v15.start.epoch;
    v12 = *MEMORY[0x1E0CA2E68];
    *(_OWORD *)&time2.value = *MEMORY[0x1E0CA2E68];
    v5 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    time2.epoch = v5;
    if (CMTimeCompare(&time1.start, &time2) < 0)
      goto LABEL_12;
    if ((v15.duration.flags & 0x1D) == 1
      && (time1.start = v15.duration,
          *(_OWORD *)&time2.value = v12,
          time2.epoch = v5,
          CMTimeCompare(&time1.start, &time2) >= 1))
    {
      v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      time1 = v15;
      v7 = CMTimeRangeCopyAsDictionary(&time1, v6);
      FigBaseObject = FigPlaybackItemGetFigBaseObject();
      v9 = *(void (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
      if (v9)
        v9(FigBaseObject, *MEMORY[0x1E0CC51C0], v7);
      if (v7)
        CFRelease(v7);
    }
    else
    {
LABEL_12:
      v10 = FigPlaybackItemGetFigBaseObject();
      v11 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
      if (v11)
        v11(v10, *MEMORY[0x1E0CC51C0], 0);
    }
    CFRelease(v4);
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
    if (dyld_program_sdk_at_least())
      sRaiseExceptionWhenSeekingToANonNumericTime = 1;
    if ((dyld_program_sdk_at_least() & 1) == 0)
      sOKToBlockWhenGettingValuesOfProperties = 1;
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      sInvokeOverrideOfInitFromDesignatedInitializer = 1;
      sCanUseExtraNetworkingByDefault = 1;
    }
    if ((dyld_program_sdk_at_least() & 1) == 0)
      sConstrainsScalabilityToLosslessVariantsAndSampleRatesByDefault = 1;
  }
}

- (void)setAllowedAudioSpatializationFormats:(AVAudioSpatializationFormats)allowedAudioSpatializationFormats
{
  NSObject *ivarAccessQueue;
  _QWORD v5[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__AVPlayerItem_setAllowedAudioSpatializationFormats___block_invoke;
  v5[3] = &unk_1E302FE78;
  v5[4] = self;
  v5[5] = allowedAudioSpatializationFormats;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateAllowedAudioSpatializationFormats](self, "_updateAllowedAudioSpatializationFormats");
}

- (void)_updateAllowedAudioSpatializationFormats
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__AVPlayerItem__updateAllowedAudioSpatializationFormats__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __58__AVPlayerItem__updatePlaybackPropertiesOnFigPlaybackItem__block_invoke()
{
  id v0;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", *MEMORY[0x1E0CC55D0], CFSTR("GaplessInfoHeuristicInfoKey"), *MEMORY[0x1E0CC55C0], CFSTR("GaplessInfoEncodingDelayInFramesKey"), *MEMORY[0x1E0CC55C8], CFSTR("GaplessInfoEncodingDrainInFramesKey"), *MEMORY[0x1E0CC55B8], CFSTR("GaplessInfoDurationInFramesKey"), *MEMORY[0x1E0CC55D8], CFSTR("GaplessInfoLastPacketsResyncKey"), *MEMORY[0x1E0CC55E0], CFSTR("RampInOutInfoInDuration"), *MEMORY[0x1E0CC55E8], CFSTR("RampInOutInfoOutDuration"), *MEMORY[0x1E0CC55B0], CFSTR("AudibleDRMInfoGroupID"), 0);
  _updatePlaybackPropertiesOnFigPlaybackItem_keyMap = result;
  return result;
}

id __21__AVPlayerItem_error__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 280);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __53__AVPlayerItem_setAllowedAudioSpatializationFormats___block_invoke(uint64_t result)
{
  char v1;
  uint64_t v2;
  uint64_t v3;

  v1 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 1416) = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 1408) = *(_QWORD *)(result + 40);
  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v3 = *(_QWORD *)(v2 + 1408);
  if ((v3 & 4) == 0)
  {
    if (v3)
      return result;
    v1 = 0;
  }
  *(_BYTE *)(v2 + 1400) = v1;
  return result;
}

CFTypeRef __43__AVPlayerItem_setAudioTimePitchAlgorithm___block_invoke(uint64_t a1)
{
  const void *v2;
  CFTypeRef result;

  v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 504);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 504) = 0;
  }
  result = *(CFTypeRef *)(a1 + 40);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 504) = result;
  return result;
}

- (void)setPreferredForwardBufferDuration:(NSTimeInterval)preferredForwardBufferDuration
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  CMTime v10;
  CMTime v11;

  memset(&v11, 0, sizeof(v11));
  if (preferredForwardBufferDuration < 0.0)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"preferredForwardBufferDuration >= 0.0"), 0);
    objc_exception_throw(v9);
  }
  if (preferredForwardBufferDuration <= 0.0)
    v11 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  else
    CMTimeMakeWithSeconds(&v11, preferredForwardBufferDuration, 1000);
  v10 = v11;
  -[AVPlayerItem setMaximumForwardBufferDuration:](self, "setMaximumForwardBufferDuration:", &v10);
}

- (void)setMaximumForwardBufferDuration:(id *)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__AVPlayerItem_setMaximumForwardBufferDuration___block_invoke;
  v5[3] = &unk_1E3031E68;
  v5[4] = self;
  v6 = *a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateMaximumForwardBufferDurationOnFigPlaybackItem](self, "_updateMaximumForwardBufferDurationOnFigPlaybackItem");
}

- (void)_updateMaximumForwardBufferDurationOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__AVPlayerItem__updateMaximumForwardBufferDurationOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)setAudioTimePitchAlgorithm:(AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  NSObject *ivarAccessQueue;
  _QWORD v5[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__AVPlayerItem_setAudioTimePitchAlgorithm___block_invoke;
  v5[3] = &unk_1E302FE78;
  v5[4] = self;
  v5[5] = audioTimePitchAlgorithm;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateFigTimePitchAlgorithmOnFigPlaybackItem](self, "_updateFigTimePitchAlgorithmOnFigPlaybackItem");
}

- (NSError)error
{
  NSObject *ivarAccessQueue;
  NSError *v3;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __21__AVPlayerItem_error__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSError *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

__n128 __84__AVPlayerItem__seekToTime_toleranceBefore_toleranceAfter_seekID_completionHandler___block_invoke(uint64_t a1)
{
  __n128 result;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __n128 *v8;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_copyFigPlaybackItem");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1128) = 0;
  }
  else
  {
    if ((*(_BYTE *)(a1 + 60) & 1) != 0
      && (*(_BYTE *)(a1 + 84) & 1) != 0
      && !*(_QWORD *)(a1 + 88)
      && (*(_QWORD *)(a1 + 72) & 0x8000000000000000) == 0
      && (*(_DWORD *)(a1 + 108) & 0x1D) == 1)
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1132;
      v4 = *(_OWORD *)(a1 + 120);
      v5 = *(_QWORD *)(a1 + 136);
    }
    else
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1132;
      v4 = *(_OWORD *)(a1 + 96);
      v5 = *(_QWORD *)(a1 + 112);
    }
    *(_QWORD *)(v3 + 16) = v5;
    *(_OWORD *)v3 = v4;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1156) = 0;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1160) = *(_DWORD *)(a1 + 144);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1164;
    v7 = *(_OWORD *)(a1 + 148);
    *(_QWORD *)(v6 + 16) = *(_QWORD *)(a1 + 164);
    *(_OWORD *)v6 = v7;
    v8 = (__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1188);
    result = *(__n128 *)(a1 + 172);
    v8[1].n128_u64[0] = *(_QWORD *)(a1 + 188);
    *v8 = result;
  }
  return result;
}

- (void)seekToTime:(CMTime *)time toleranceBefore:(CMTime *)toleranceBefore toleranceAfter:(CMTime *)toleranceAfter completionHandler:(void *)completionHandler
{
  uint64_t v11;
  CMTime v12;
  CMTime v13;
  CMTime v14;

  v11 = -[AVPlayerItem makeSeekID](self, "makeSeekID");
  v14 = *time;
  v13 = *toleranceBefore;
  v12 = *toleranceAfter;
  -[AVPlayerItem _seekToTime:toleranceBefore:toleranceAfter:seekID:completionHandler:](self, "_seekToTime:toleranceBefore:toleranceAfter:seekID:completionHandler:", &v14, &v13, &v12, v11, completionHandler);
}

- (int)makeSeekID
{
  int v3;

  MEMORY[0x194033BF8](self->_playerItem->seekIDMutex, a2);
  v3 = -[AVPlayerItem _CreateSeekID](self, "_CreateSeekID");
  MEMORY[0x194033C04](self->_playerItem->seekIDMutex);
  return v3;
}

- (void)_seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 seekID:(int)a6 completionHandler:(id)a7
{
  uint64_t v8;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  char flags;
  CMTimeEpoch v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CMTimeEpoch epoch;
  uint64_t FigPlayerSetTimeFlagsForTolerances;
  NSObject *seekQueue;
  __int128 v35;
  CFDictionaryRef v36;
  uint64_t v37;
  const void *v38;
  void (*v39)(const void *, CMTimeRange *, uint64_t);
  uint64_t v40;
  unsigned int (*v41)(uint64_t, CMTimeRange *, uint64_t);
  void (*v42)(const void *, CMTimeRange *, uint64_t);
  const void *v43;
  void *v44;
  uint64_t v45;
  const __CFAllocator *v46;
  const __CFString *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  _QWORD block[6];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  int64_t var3;
  CMTime v63;
  int v64;
  CMTime v65;
  CMTime v66;
  CMTime v67;
  CMTime v68;
  CMTime rhs;
  CMTime time;
  CMTime lhs;
  CMTimeRange time1;
  CMTime v73;
  CMTime time2;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  CMTime v79;
  CMTimeRange v80;
  _QWORD v81[5];
  _QWORD v82[8];

  v8 = *(_QWORD *)&a6;
  v82[5] = *MEMORY[0x1E0C80C00];
  v19 = -[AVPlayerItem delegate](self, "delegate");
  memset(&v80, 0, sizeof(v80));
  if (self)
  {
    -[AVPlayerItem loopTimeRange](self, "loopTimeRange");
    flags = v80.start.flags;
  }
  else
  {
    flags = 0;
  }
  v79 = (CMTime)*a3;
  v75 = 0;
  v76 = &v75;
  v77 = 0x2020000000;
  v78 = 0;
  if ((flags & 1) != 0
    && (v80.duration.flags & 1) != 0
    && !v80.duration.epoch
    && (v80.duration.value & 0x8000000000000000) == 0
    && (a3->var2 & 0x1D) == 1)
  {
    time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    memset(&v73, 0, sizeof(v73));
    time1 = v80;
    CMTimeRangeGetEnd(&v73, &time1);
    v79 = (CMTime)*a3;
    *(_OWORD *)&time1.start.value = *(_OWORD *)&a3->var0;
    time1.start.epoch = a3->var3;
    lhs = v80.start;
    if ((CMTimeCompare(&time1.start, &lhs) & 0x80000000) == 0)
    {
      time = (CMTime)*a3;
      time1 = v80;
      CMTimeFoldIntoRange(&lhs, &time, &time1);
      v79 = lhs;
    }
    lhs = v73;
    time = v79;
    CMTimeSubtract(&time1.start, &lhs, &time);
    time2 = time1.start;
    CMTimeMake(&rhs, 1, 1000);
    lhs = time2;
    CMTimeSubtract(&time1.start, &lhs, &rhs);
    time2 = time1.start;
    lhs = (CMTime)*a5;
    time = time1.start;
    CMTimeMinimum(&time1.start, &lhs, &time);
    *(_OWORD *)&a5->var0 = *(_OWORD *)&time1.start.value;
    a5->var3 = time1.start.epoch;
  }
  if (v19
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v19, "playerItem:shouldSeekToTime:toleranceBefore:toleranceAfter:", self, a3, a4, a5) & 1) == 0)
  {
    -[AVPlayerItem _cancelPendingSeekAndRegisterSeekID:withCompletionHandler:](self, "_cancelPendingSeekAndRegisterSeekID:withCompletionHandler:", v8, a7);
    -[AVPlayerItem _unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:finished:](self, "_unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:finished:", v8, 0);
    goto LABEL_35;
  }
  if (sRaiseExceptionWhenSeekingToANonNumericTime == 1 && (a3->var2 & 0x11) != 1)
  {
    v46 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    *(_OWORD *)&time1.start.value = *(_OWORD *)&a3->var0;
    time1.start.epoch = a3->var3;
    v47 = (id)CMTimeCopyDescription(v46, &time1.start);
    v53 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Seeking is not possible to time %@"), v48, v49, v50, v51, v52, (uint64_t)v47), 0);
    objc_exception_throw(v53);
  }
  if ((a4->var2 & 1) == 0)
  {
    v44 = (void *)MEMORY[0x1E0C99DA0];
    v45 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("toleranceBefore seekToTime must be valid"), v14, v15, v16, v17, v18, v54);
    goto LABEL_42;
  }
  *(_OWORD *)&time1.start.value = *(_OWORD *)&a4->var0;
  time1.start.epoch = a4->var3;
  v55 = *MEMORY[0x1E0CA2E68];
  *(_OWORD *)&time2.value = *MEMORY[0x1E0CA2E68];
  v21 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  time2.epoch = v21;
  if (CMTimeCompare(&time1.start, &time2) < 0)
  {
    v44 = (void *)MEMORY[0x1E0C99DA0];
    v45 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("toleranceBefore seekToTime may not be negative"), v22, v23, v24, v25, v26, v54);
    goto LABEL_42;
  }
  if ((a5->var2 & 1) == 0)
  {
    v44 = (void *)MEMORY[0x1E0C99DA0];
    v45 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("toleranceAfter seekToTime must be valid"), v22, v23, v24, v25, v26, v54);
    goto LABEL_42;
  }
  *(_OWORD *)&time1.start.value = *(_OWORD *)&a5->var0;
  time1.start.epoch = a5->var3;
  *(_OWORD *)&time2.value = v55;
  time2.epoch = v21;
  if (CMTimeCompare(&time1.start, &time2) < 0)
  {
    v44 = (void *)MEMORY[0x1E0C99DA0];
    v45 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("toleranceAfter seekToTime may not be negative"), v27, v28, v29, v30, v31, v54);
LABEL_42:
    objc_exception_throw((id)objc_msgSend(v44, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v45, 0));
  }
  v68 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  epoch = v68.epoch;
  v56 = *(_OWORD *)&v68.value;
  v67 = v68;
  *(_OWORD *)&time1.start.value = *(_OWORD *)&a3->var0;
  time1.start.epoch = a3->var3;
  time2 = (CMTime)*a4;
  v73 = (CMTime)*a5;
  AVPlayerItemGetFigPlayerSnapTimesForTimeAndTolerances(&time1.start, &time2, &v73, &v68, &v67);
  *(_OWORD *)&time1.start.value = *(_OWORD *)&a4->var0;
  time1.start.epoch = a4->var3;
  time2 = (CMTime)*a5;
  FigPlayerSetTimeFlagsForTolerances = AVPlayerItemGetFigPlayerSetTimeFlagsForTolerances(&time1.start, &time2);
  seekQueue = self->_playerItem->seekQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__AVPlayerItem__seekToTime_toleranceBefore_toleranceAfter_seekID_completionHandler___block_invoke;
  block[3] = &unk_1E3031E90;
  block[4] = self;
  block[5] = &v75;
  v58 = *(_OWORD *)&v80.start.value;
  v59 = *(_OWORD *)&v80.start.epoch;
  v35 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  v60 = *(_OWORD *)&v80.duration.timescale;
  v61 = v35;
  v63 = v79;
  v64 = FigPlayerSetTimeFlagsForTolerances;
  v65 = v68;
  v66 = v67;
  dispatch_sync(seekQueue, block);
  if (v76[3])
  {
    v81[0] = *MEMORY[0x1E0CC5490];
    v82[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", FigPlayerSetTimeFlagsForTolerances);
    v81[1] = *MEMORY[0x1E0CC5480];
    v82[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
    v81[2] = *MEMORY[0x1E0CC5478];
    time1.start = v68;
    v82[2] = NSDictionaryFromCMTime(&time1.start);
    v81[3] = *MEMORY[0x1E0CC5470];
    time1.start = v67;
    v36 = NSDictionaryFromCMTime(&time1.start);
    v81[4] = *MEMORY[0x1E0CC5488];
    v82[3] = v36;
    v82[4] = &unk_1E3093688;
    v37 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 5);
    -[AVPlayerItem _cancelPendingSeekAndRegisterSeekID:withCompletionHandler:](self, "_cancelPendingSeekAndRegisterSeekID:withCompletionHandler:", v8, a7);
    v38 = (const void *)objc_msgSend(-[AVPlayerItem _player](self, "_player"), "_copyInterstitialCoordinatorIfCreated");
    time2 = (CMTime)*a3;
    if (v38)
    {
      v39 = *(void (**)(const void *, CMTimeRange *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                        + 72);
      if (v39)
      {
        time1.start = time2;
        v39(v38, &time1, v8);
      }
    }
    v40 = v76[3];
    time2 = (CMTime)*a3;
    v41 = *(unsigned int (**)(uint64_t, CMTimeRange *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                         + 176);
    if (v41 && (time1.start = time2, !v41(v40, &time1, v37)))
    {
      if (!v38)
        goto LABEL_35;
    }
    else
    {
      -[AVPlayerItem _unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:finished:](self, "_unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:finished:", v8, 0);
      if (!v38)
        goto LABEL_35;
      v42 = *(void (**)(const void *, CMTimeRange *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                        + 72);
      if (v42)
      {
        *(_OWORD *)&time1.start.value = v56;
        time1.start.epoch = epoch;
        v42(v38, &time1, 0xFFFFFFFFLL);
      }
    }
    CFRelease(v38);
  }
  else if (a7)
  {
    (*((void (**)(id, uint64_t))a7 + 2))(a7, 1);
  }
LABEL_35:
  v43 = (const void *)v76[3];
  if (v43)
    CFRelease(v43);
  _Block_object_dispose(&v75, 8);
}

- (id)delegate
{
  NSObject *ivarAccessQueue;
  void *v3;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__AVPlayerItem_delegate__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)_CreateSeekID
{
  int value_high;

  value_high = HIDWORD(self->_playerItem->initialMaxSnapTime.value);
  HIDWORD(self->_playerItem->initialMaxSnapTime.value) = FPSupport_IncrementSeekID();
  return value_high;
}

uint64_t __56__AVPlayerItem__updateAllowedAudioSpatializationFormats__block_invoke(uint64_t a1)
{
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  _QWORD *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, _QWORD);
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, _QWORD);

  v1 = objc_msgSend(*(id *)(a1 + 32), "allowedAudioSpatializationFormats");
  v2 = *MEMORY[0x1E0CC5060];
  v3 = *MEMORY[0x1E0C9AE40];
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v5)
    v5(FigBaseObject, v2, v3);
  v6 = *MEMORY[0x1E0CC5318];
  v7 = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v9)
    result = v9(v7, v6, v3);
  v10 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if ((v1 & 4) != 0)
  {
    v11 = FigPlaybackItemGetFigBaseObject();
    result = CMBaseObjectGetVTable();
    v12 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(result + 8) + 56);
    if (v12)
      result = v12(v11, v2, *v10);
  }
  if ((v1 & 3) != 0)
  {
    v13 = FigPlaybackItemGetFigBaseObject();
    result = CMBaseObjectGetVTable();
    v14 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(result + 8) + 56);
    if (v14)
      return v14(v13, v6, *v10);
  }
  return result;
}

- (AVAudioSpatializationFormats)allowedAudioSpatializationFormats
{
  NSObject *ivarAccessQueue;
  AVAudioSpatializationFormats v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayerItem_allowedAudioSpatializationFormats__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __86__AVPlayerItem__updatePreferredMaximumResolutionForExpensiveNetworksOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  CFDictionaryRef DictionaryRepresentation;
  uint64_t FigBaseObject;
  void (*v3)(uint64_t, _QWORD, CFDictionaryRef);
  CGSize v4;

  objc_msgSend(*(id *)(a1 + 32), "preferredMaximumResolutionForExpensiveNetworks");
  DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v4);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v3 = *(void (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v3)
    v3(FigBaseObject, *MEMORY[0x1E0CC5298], DictionaryRepresentation);
  CFRelease(DictionaryRepresentation);
}

uint64_t __76__AVPlayerItem__updateContinuesPlayingDuringPrerollForSeekOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "continuesPlayingDuringPrerollForSeek");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC50E8], v5);
  }
  return result;
}

uint64_t __72__AVPlayerItem__markAsReadyForInspectionOfRecommendedTimeOffsetFromLive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 228) = 1;
  return result;
}

uint64_t __69__AVPlayerItem_setCanUseNetworkResourcesForLiveStreamingWhilePaused___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 512) = *(_BYTE *)(result + 40);
  return result;
}

id __68__AVPlayerItem_AVPlayerItemMediaDataCollectors__mediaDataCollectors__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 592);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

__n128 __66__AVPlayerItem_setPreferredMaximumResolutionForExpensiveNetworks___block_invoke(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 904) = result;
  return result;
}

void __66__AVPlayerItem__updatePreferredMinimumResolutionOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  CFDictionaryRef DictionaryRepresentation;
  uint64_t FigBaseObject;
  void (*v3)(uint64_t, _QWORD, CFDictionaryRef);
  CGSize v4;

  objc_msgSend(*(id *)(a1 + 32), "preferredMinimumResolution");
  DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v4);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v3 = *(void (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v3)
    v3(FigBaseObject, *MEMORY[0x1E0CC52A0], DictionaryRepresentation);
  CFRelease(DictionaryRepresentation);
}

id __60__AVPlayerItem__ensureAssetWithFigPlaybackItemWithTrackIDs___block_invoke(uint64_t a1)
{
  id result;

  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 240)) & 1) == 0)
  {

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 240) = *(id *)(a1 + 32);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 232) = +[AVAsset assetWithURL:figPlaybackItem:trackIDs:dynamicBehavior:](AVAsset, "assetWithURL:figPlaybackItem:trackIDs:dynamicBehavior:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 8), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 120), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 240), 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 232);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
  return result;
}

void __57__AVPlayerItem__selectMediaOption_inMediaSelectionGroup___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1072) = 0;
}

void __57__AVPlayerItem__markAsNeedingNewAssetWithFigPlaybackItem__block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 240) = 0;
}

uint64_t __56__AVPlayerItem_setContinuesPlayingDuringPrerollForSeek___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 718) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __56__AVPlayerItem_selectMediaOption_inMediaSelectionGroup___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_selectMediaOption:inMediaSelectionGroup:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  result = objc_msgSend(*(id *)(a1 + 32), "_isFigAssetReadyForInspectionOfMediaSelectionOptionsAndFigPlaybackItemIsReadyForInspection");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_cacheMediaSelectionOption:forMediaSelectionGroup:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

uint64_t __56__AVPlayerItem__setMediaOptionsSelectedByClient_forKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  v2 = a1[4];
  v3 = *(void **)(*(_QWORD *)(a1[5] + 8) + 1360);
  if (v2)
    return objc_msgSend(v3, "setObject:forKey:", v2, a1[6]);
  else
    return objc_msgSend(v3, "removeObjectForKey:", a1[6]);
}

uint64_t __55__AVPlayerItem_addObserver_forKeyPath_options_context___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 248) = 1;
  return result;
}

uint64_t __48__AVPlayerItem_AVPlayerItemAVKit__setAVKitData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "copyWithZone:", 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 864) = result;
  return result;
}

uint64_t __46__AVPlayerItem_setWillNeverSeekBackwardsHint___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 1256) = *(_BYTE *)(result + 40);
  return result;
}

id __44__AVPlayerItem_AVPlayerItemOutputs__outputs__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 160);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __44__AVPlayerItem_setAllowProgressiveSwitchUp___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 842) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __43__AVPlayerItem_setAllowProgressiveStartup___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 843) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __43__AVPlayerItem__applyMediaSelectionOptions__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_selectMediaOption:inMediaSelectionGroup:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if ((objc_msgSend(*(id *)(a1 + 32), "_isReadyForBasicInspection") & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "_setMediaOptionsSelectedByClient:forKey:", 0, *(_QWORD *)(a1 + 48));
  result = objc_msgSend(*(id *)(a1 + 48), "_isStreamingGroup");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_setMediaOptionsSelectedByClient:forKey:", 0, *(_QWORD *)(a1 + 48));
  return result;
}

void __31__AVPlayerItem__updateTimebase__block_invoke_6(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 208);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 208) = 0;
  }
}

uint64_t __29__AVPlayerItem_setMediaKind___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 704);
  if (v1 != *(void **)(result + 40))
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 40), "copy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 704) = result;
  }
  return result;
}

uint64_t __28__AVPlayerItem_setDelegate___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 256) = *(_QWORD *)(result + 40);
  return result;
}

__n128 __26__AVPlayerItem__setAsset___block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 result;

  v1 = (__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 460);
  result = *(__n128 *)(a1 + 40);
  v1[1].n128_u64[0] = *(_QWORD *)(a1 + 56);
  *v1 = result;
  return result;
}

- (NSArray)outputs
{
  NSObject *ivarAccessQueue;
  NSArray *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  AVTelemetryGenerateID();
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  v12 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__AVPlayerItem_AVPlayerItemOutputs__outputs__block_invoke;
  v6[3] = &unk_1E302FD60;
  v6[4] = self;
  v6[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v6);
  v4 = (NSArray *)(id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (NSArray)mediaDataCollectors
{
  NSObject *ivarAccessQueue;
  NSArray *v3;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__AVPlayerItem_AVPlayerItemMediaDataCollectors__mediaDataCollectors__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_updateTaggedMetadataArray:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[AVPlayerItem mediaDataCollectors](self, "mediaDataCollectors", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if (needsTaggedRanges())
          objc_msgSend(v9, "_updateTaggedRangeMetadataArray:", a3);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
}

- (void)setAVKitData:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *ivarAccessQueue;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  _QWORD block[6];

  if (a3)
  {
    if ((objc_msgSend(a3, "conformsToProtocol:", &unk_1EE2B1580) & 1) != 0)
    {
      if ((objc_msgSend(a3, "conformsToProtocol:", &unk_1EE2B3C90) & 1) != 0)
        goto LABEL_4;
      v12 = (void *)MEMORY[0x1E0C99DA0];
      v13 = *MEMORY[0x1E0C99778];
      v14 = "newAVKitData == nil || [newAVKitData conformsToProtocol:@protocol(NSCopying)]";
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C99DA0];
      v13 = *MEMORY[0x1E0C99778];
      v14 = "newAVKitData == nil || [newAVKitData conformsToProtocol:@protocol(NSObject)]";
    }
    v15 = (void *)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v6, v7, v8, v9, v10, (uint64_t)v14), 0);
    objc_exception_throw(v15);
  }
LABEL_4:
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AVPlayerItem_AVPlayerItemAVKit__setAVKitData___block_invoke;
  block[3] = &unk_1E302FCE8;
  block[4] = self;
  block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

- (void)setWillNeverSeekBackwardsHint:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__AVPlayerItem_setWillNeverSeekBackwardsHint___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateWillNeverSeekBackwardsHintOnFigPlaybackItem](self, "_updateWillNeverSeekBackwardsHintOnFigPlaybackItem");
}

- (void)setPreferredMinimumResolution:(CGSize)a3
{
  NSObject *ivarAccessQueue;
  _QWORD block[5];
  CGSize v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AVPlayerItem_setPreferredMinimumResolution___block_invoke;
  block[3] = &unk_1E30314D8;
  block[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  -[AVPlayerItem _updatePreferredMinimumResolutionOnFigPlaybackItem](self, "_updatePreferredMinimumResolutionOnFigPlaybackItem");
}

- (void)setPreferredMaximumResolutionForExpensiveNetworks:(CGSize)preferredMaximumResolutionForExpensiveNetworks
{
  NSObject *ivarAccessQueue;
  _QWORD block[5];
  CGSize v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__AVPlayerItem_setPreferredMaximumResolutionForExpensiveNetworks___block_invoke;
  block[3] = &unk_1E30314D8;
  block[4] = self;
  v6 = preferredMaximumResolutionForExpensiveNetworks;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  -[AVPlayerItem _updatePreferredMaximumResolutionForExpensiveNetworksOnFigPlaybackItem](self, "_updatePreferredMaximumResolutionForExpensiveNetworksOnFigPlaybackItem");
}

- (void)setMediaKind:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__AVPlayerItem_setMediaKind___block_invoke;
  v5[3] = &unk_1E302FCE8;
  v5[4] = self;
  v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateMediaKindOnFigPlaybackItem](self, "_updateMediaKindOnFigPlaybackItem");
}

- (void)setDelegate:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__AVPlayerItem_setDelegate___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

- (void)setContinuesPlayingDuringPrerollForSeek:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__AVPlayerItem_setContinuesPlayingDuringPrerollForSeek___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateContinuesPlayingDuringPrerollForSeekOnFigPlaybackItem](self, "_updateContinuesPlayingDuringPrerollForSeekOnFigPlaybackItem");
}

- (void)setCanUseNetworkResourcesForLiveStreamingWhilePaused:(BOOL)canUseNetworkResourcesForLiveStreamingWhilePaused
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__AVPlayerItem_setCanUseNetworkResourcesForLiveStreamingWhilePaused___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = canUseNetworkResourcesForLiveStreamingWhilePaused;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateCanUseNetworkResourcesForLiveStreamingWhilePausedOnFigPlaybackItem](self, "_updateCanUseNetworkResourcesForLiveStreamingWhilePausedOnFigPlaybackItem");
}

- (void)setAllowProgressiveSwitchUp:(BOOL)a3
{
  OpaqueFigPlaybackItem *v5;
  NSObject *ivarAccessQueue;
  uint64_t v7;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v9[5];
  BOOL v10;
  _QWORD block[5];
  BOOL v12;

  v5 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AVPlayerItem_setAllowProgressiveSwitchUp___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v12 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (v5)
  {
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __44__AVPlayerItem_setAllowProgressiveSwitchUp___block_invoke_2;
    v9[3] = &__block_descriptor_41_e5_v8__0l;
    v9[4] = v5;
    v10 = a3;
    dispatch_sync(figPlaybackItemSetterQueue, v9);
    CFRelease(v5);
  }
}

- (void)setAllowProgressiveStartup:(BOOL)a3
{
  OpaqueFigPlaybackItem *v5;
  NSObject *ivarAccessQueue;
  uint64_t v7;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v9[5];
  BOOL v10;
  _QWORD block[5];
  BOOL v12;

  v5 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AVPlayerItem_setAllowProgressiveStartup___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v12 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (v5)
  {
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __43__AVPlayerItem_setAllowProgressiveStartup___block_invoke_2;
    v9[3] = &__block_descriptor_41_e5_v8__0l;
    v9[4] = v5;
    v10 = a3;
    dispatch_sync(figPlaybackItemSetterQueue, v9);
    CFRelease(v5);
  }
}

- (void)selectMediaOption:(AVMediaSelectionOption *)mediaSelectionOption inMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD block[7];
  os_log_type_t type;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  AVTelemetryGenerateID();
  if (dword_1ECDECE98)
  {
    v11 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AVPlayerItem_selectMediaOption_inMediaSelectionGroup___block_invoke;
  block[3] = &unk_1E302FD88;
  block[4] = self;
  block[5] = mediaSelectionOption;
  block[6] = mediaSelectionGroup;
  dispatch_sync(figPlaybackItemSetterQueue, block);
}

- (void)dealloc
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v4;
  AVPlayerItemInternal *playerItem;
  NSObject *ivarAccessQueue;
  NSObject *figConfigurationQueue;
  NSObject *seekQueue;
  uint64_t FigBaseObject;
  uint64_t v10;
  void (*v11)(uint64_t);
  AVPlayerItemInternal *v12;
  OpaqueCMTimebase *unfoldedFigTimebase;
  OpaqueCMTimebase *proxyUnfoldedTimebase;
  OpaqueCMTimebase *foldedTimebase;
  OpaqueCMTimebase *proxyFoldedTimebase;
  double delayPreparingItemDuration;
  AVPlayerItemInternal *v18;
  AVWeakReference *playerReference;
  NSArray *textHighlightArray;
  AVPlayerItemInternal *v21;
  OpaqueVTPixelBufferAttributesMediator *pixelBufferAttributeMediator;
  AVPlayerItemInternal *v23;
  OpaqueFigPlaybackItem *figPlaybackItem;
  AVPlayerItemInternal *v25;
  AVWeakReference *clientsOriginalVideoComposition;
  AVPlayerItemInternal *v27;
  NSDictionary *loudnessInfo;
  AVPlayerItemInternal *v29;
  NSObject *stateDispatchQueue;
  NSObject *figPlaybackItemAccessorQueue;
  NSObject *figPlaybackItemSetterQueue;
  AVPlayerItemInternal *v33;
  uint64_t v34;
  uint64_t v35;
  objc_super v36;
  os_log_type_t type;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECE98)
  {
    v38 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (self->_playerItem)
  {
    if (dword_1ECDECE98)
    {
      v38 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[AVPlayerItem _removeFAListeners](self, "_removeFAListeners", v34, v35);
    -[AVPlayerItem _removeFPListeners](self, "_removeFPListeners");
    -[AVPlayerItem _removeFoldedTBListeners](self, "_removeFoldedTBListeners");
    -[NSMutableArray _detatchFromPlayerItem](self->_playerItem->itemMetadataCollectors, "_detatchFromPlayerItem");

    playerItem = self->_playerItem;
    if (*(_QWORD *)&playerItem->isRenderingSpatialAudio)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", *(_QWORD *)&self->_playerItem->isRenderingSpatialAudio);

      playerItem = self->_playerItem;
    }
    ivarAccessQueue = playerItem->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      playerItem = self->_playerItem;
    }
    figConfigurationQueue = playerItem->figConfigurationQueue;
    if (figConfigurationQueue)
    {
      dispatch_release(figConfigurationQueue);
      playerItem = self->_playerItem;
    }
    seekQueue = playerItem->seekQueue;
    if (seekQueue)
    {
      dispatch_release(seekQueue);
      playerItem = self->_playerItem;
    }
    if (playerItem->figPlaybackItem)
    {
      FigBaseObject = FigPlaybackItemGetFigBaseObject();
      if (FigBaseObject)
      {
        v10 = FigBaseObject;
        v11 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
        if (v11)
          v11(v10);
      }
    }
    v12 = self->_playerItem;
    unfoldedFigTimebase = v12->unfoldedFigTimebase;
    if (unfoldedFigTimebase)
    {
      CFRelease(unfoldedFigTimebase);
      self->_playerItem->unfoldedFigTimebase = 0;
      v12 = self->_playerItem;
    }
    proxyUnfoldedTimebase = v12->proxyUnfoldedTimebase;
    if (proxyUnfoldedTimebase)
    {
      CFRelease(proxyUnfoldedTimebase);
      self->_playerItem->proxyUnfoldedTimebase = 0;
      v12 = self->_playerItem;
    }
    foldedTimebase = v12->foldedTimebase;
    if (foldedTimebase)
    {
      CFRelease(foldedTimebase);
      self->_playerItem->foldedTimebase = 0;
      v12 = self->_playerItem;
    }
    proxyFoldedTimebase = v12->proxyFoldedTimebase;
    if (proxyFoldedTimebase)
    {
      CFRelease(proxyFoldedTimebase);
      self->_playerItem->proxyFoldedTimebase = 0;
      v12 = self->_playerItem;
    }
    delayPreparingItemDuration = v12->delayPreparingItemDuration;
    if (delayPreparingItemDuration != 0.0)
    {
      CFRelease(*(CFTypeRef *)&delayPreparingItemDuration);
      self->_playerItem->delayPreparingItemDuration = 0.0;
      v12 = self->_playerItem;
    }

    v18 = self->_playerItem;
    playerReference = v18->playerReference;
    if (playerReference)
    {
      CFRelease(playerReference);
      self->_playerItem->playerReference = 0;
      v18 = self->_playerItem;
    }
    textHighlightArray = v18->textHighlightArray;
    if (textHighlightArray)
    {
      CFRelease(textHighlightArray);
      self->_playerItem->textHighlightArray = 0;
      v18 = self->_playerItem;
    }

    v21 = self->_playerItem;
    pixelBufferAttributeMediator = v21->pixelBufferAttributeMediator;
    if (pixelBufferAttributeMediator)
    {
      CFRelease(pixelBufferAttributeMediator);
      v21 = self->_playerItem;
    }

    v23 = self->_playerItem;
    figPlaybackItem = v23->figPlaybackItem;
    if (figPlaybackItem)
    {
      CFRelease(figPlaybackItem);
      self->_playerItem->figPlaybackItem = 0;
      v23 = self->_playerItem;
    }

    v25 = self->_playerItem;
    clientsOriginalVideoComposition = v25->clientsOriginalVideoComposition;
    if (clientsOriginalVideoComposition)
    {
      CFRelease(clientsOriginalVideoComposition);
      v25 = self->_playerItem;
    }

    v27 = self->_playerItem;
    loudnessInfo = v27->loudnessInfo;
    if (loudnessInfo)
    {
      CFRelease(loudnessInfo);
      self->_playerItem->loudnessInfo = 0;
      v27 = self->_playerItem;
    }

    v29 = self->_playerItem;
    if (v29->initialMaxSnapTime.epoch)
    {
      NSLog(&CFSTR("AVPlayerItem %p deallocated while a pending seek is still in progress; leaking completion handler. Use -cancelP"
               "endingSeeks to deallocate an AVPlayerItem safely while a seek operation is still pending.").isa,
        self);
      v29 = self->_playerItem;
    }
    if (v29->seekIDMutex)
    {
      FigSimpleMutexDestroy();
      v29 = self->_playerItem;
    }
    stateDispatchQueue = v29->stateDispatchQueue;
    if (stateDispatchQueue)
    {
      dispatch_release(stateDispatchQueue);
      v29 = self->_playerItem;
    }
    figPlaybackItemAccessorQueue = v29->figPlaybackItemAccessorQueue;
    if (figPlaybackItemAccessorQueue)
    {
      dispatch_release(figPlaybackItemAccessorQueue);
      v29 = self->_playerItem;
    }
    figPlaybackItemSetterQueue = v29->figPlaybackItemSetterQueue;
    if (figPlaybackItemSetterQueue)
    {
      dispatch_release(figPlaybackItemSetterQueue);
      v29 = self->_playerItem;
    }

    v33 = self->_playerItem;
    if (v33)
    {
      CFRelease(v33);
      self->_playerItem = 0;
    }
  }
  v36.receiver = self;
  v36.super_class = (Class)AVPlayerItem;
  -[AVPlayerItem dealloc](&v36, sel_dealloc, v34);
}

- (void)_updateWillNeverSeekBackwardsHintOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__AVPlayerItem__updateWillNeverSeekBackwardsHintOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updatePreferredMinimumResolutionOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD block[5];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__AVPlayerItem__updatePreferredMinimumResolutionOnFigPlaybackItem__block_invoke;
    block[3] = &unk_1E302FA10;
    block[4] = self;
    dispatch_sync(figPlaybackItemSetterQueue, block);
    CFRelease(v4);
  }
}

- (void)_updatePreferredMaximumResolutionForExpensiveNetworksOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD block[5];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__AVPlayerItem__updatePreferredMaximumResolutionForExpensiveNetworksOnFigPlaybackItem__block_invoke;
    block[3] = &unk_1E302FA10;
    block[4] = self;
    dispatch_sync(figPlaybackItemSetterQueue, block);
    CFRelease(v4);
  }
}

- (void)_updateContinuesPlayingDuringPrerollForSeekOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __76__AVPlayerItem__updateContinuesPlayingDuringPrerollForSeekOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_setMediaOptionsSelectedByClient:(id)a3 forKey:(id)a4
{
  NSObject *ivarAccessQueue;
  _QWORD block[7];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AVPlayerItem__setMediaOptionsSelectedByClient_forKey___block_invoke;
  block[3] = &unk_1E302FD88;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

- (void)_respondToBecomingReadyForBasicInspection
{
  __int128 v2;
  uint64_t v3;

  v2 = *MEMORY[0x1E0CA2E18];
  v3 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  -[AVPlayerItem _respondToBecomingReadyForBasicInspectionWithDuration:](self, "_respondToBecomingReadyForBasicInspectionWithDuration:", &v2);
}

- (void)_removeFromItems
{
  AVPlayerItemInternal *playerItem;
  _QWORD *seekCompletionHandler;
  uint64_t v4;

  playerItem = self->_playerItem;
  seekCompletionHandler = playerItem->seekCompletionHandler;
  v4 = *(_QWORD *)&playerItem->nextSeekIDToGenerate;
  if (v4)
  {
    *(_QWORD *)(*(_QWORD *)(v4 + 8) + 1240) = seekCompletionHandler;
    playerItem = self->_playerItem;
  }
  if (seekCompletionHandler)
  {
    *(_QWORD *)(seekCompletionHandler[1] + 1232) = *(_QWORD *)&playerItem->nextSeekIDToGenerate;
    playerItem = self->_playerItem;
  }
  *(_QWORD *)&playerItem->nextSeekIDToGenerate = 0;
  self->_playerItem->seekCompletionHandler = 0;
}

- (id)_propertyListForMediaSelection:(id)a3 forGroup:(id)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  if (!a3)
  {
    v4 = +[AVMediaSelectionOption mediaSelectionNilOptionForGroup:](AVMediaSelectionOption, "mediaSelectionNilOptionForGroup:", a4);
    if (!v4)
      return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  }
  v5 = (void *)objc_msgSend(v4, "propertyList");
  v6 = v5 ? (id)objc_msgSend(v5, "mutableCopy") : (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = v6;
  v8 = objc_msgSend(v4, "dictionary");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v7, "addEntriesFromDictionary:", v8);
  if (v7)
    return (id)objc_msgSend(v7, "copy");
  else
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
}

- (id)_previousItem
{
  return *(id *)&self->_playerItem->nextSeekIDToGenerate;
}

- (void)_markAsReadyForInspectionOfRecommendedTimeOffsetFromLive
{
  NSObject *ivarAccessQueue;
  _QWORD block[5];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__AVPlayerItem__markAsReadyForInspectionOfRecommendedTimeOffsetFromLive__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

- (void)_markAsNeedingNewAssetWithFigPlaybackItem
{
  NSObject *ivarAccessQueue;
  _QWORD block[5];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__AVPlayerItem__markAsNeedingNewAssetWithFigPlaybackItem__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

- (void)_cacheMediaSelectionOption:(id)a3 forMediaSelectionGroup:(id)a4
{
  if (-[AVAsset isEqual:](-[AVPlayerItem asset](self, "asset"), "isEqual:", objc_msgSend(a4, "asset")))
  {
    if (!a3)
    {
      if (!objc_msgSend(a4, "allowsEmptySelection"))
        return;
      a3 = +[AVMediaSelectionOption mediaSelectionNilOptionForGroup:](AVMediaSelectionOption, "mediaSelectionNilOptionForGroup:", a4);
    }
    -[AVPlayerItem _setMediaOptionsSelectedByClient:forKey:](self, "_setMediaOptionsSelectedByClient:forKey:", a3, a4);
  }
}

+ (BOOL)automaticallyNotifiesObserversOfTracks
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfSeekableTimeRanges
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfPlaybackBufferFull
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfHasEnabledVideo
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfHasEnabledAudio
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfAsset
{
  return 0;
}

+ (AVPlayerItem)playerItemWithAsset:(AVAsset *)asset automaticallyLoadedAssetKeys:(NSArray *)automaticallyLoadedAssetKeys
{
  return (AVPlayerItem *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithAsset:automaticallyLoadedAssetKeys:", asset, automaticallyLoadedAssetKeys);
}

- (AVPlayerItem)init
{
  objc_super v3;

  if (self->_playerItem)
  {
    v3.receiver = self;
    v3.super_class = (Class)AVPlayerItem;
    return -[AVPlayerItem init](&v3, sel_init);
  }
  else
  {

    return 0;
  }
}

+ (BOOL)_hasOverrideForSelector:(SEL)a3
{
  Method InstanceMethod;
  objc_class *v5;

  InstanceMethod = class_getInstanceMethod((Class)a1, a3);
  v5 = (objc_class *)objc_opt_self();
  return InstanceMethod != class_getInstanceMethod(v5, a3);
}

- (id)copyWithZone:(_NSZone *)a3 newAssetOptions:(id)a4
{
  void *v7;
  AVPlayerItemInternal *playerItem;
  AVURLAsset *asset;
  void *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  AVMediaSelectionGroup *v16;
  AVMediaSelection *v17;
  NSObject *ivarAccessQueue;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[24];
  _BYTE v30[24];
  _BYTE v31[24];
  _BYTE v32[48];
  _BYTE v33[48];
  _BYTE v34[24];
  _BYTE v35[24];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_opt_class();
  if (dyld_program_sdk_at_least())
    v7 = (void *)objc_opt_class();
  playerItem = self->_playerItem;
  asset = (AVURLAsset *)playerItem->asset;
  if (asset)
  {
    if (a4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        asset = +[AVURLAsset URLAssetWithURL:options:](AVURLAsset, "URLAssetWithURL:options:", -[AVURLAsset URL](asset, "URL"), a4);
    }
    v10 = (void *)objc_msgSend((id)objc_msgSend(v7, "allocWithZone:", a3), "initWithAsset:", asset);
  }
  else
  {
    if (!playerItem->URL)
      return 0;
    v10 = (void *)objc_msgSend((id)objc_msgSend(v7, "allocWithZone:", a3), "initWithURL:", self->_playerItem->URL);
  }
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setVideoComposition:", -[AVPlayerItem videoComposition](self, "videoComposition"));
    objc_msgSend(v11, "setAudioMix:", -[AVPlayerItem audioMix](self, "audioMix"));
    objc_msgSend(v11, "setTextStyleRules:", -[AVPlayerItem textStyleRules](self, "textStyleRules"));
    objc_msgSend(v11, "setTextHighlightArray:", -[AVPlayerItem textHighlightArray](self, "textHighlightArray"));
    objc_msgSend(v11, "setRequiresAccessLog:", -[AVPlayerItem requiresAccessLog](self, "requiresAccessLog"));
    objc_msgSend(v11, "setSuppressesAudioOnlyVariants:", -[AVPlayerItem suppressesAudioOnlyVariants](self, "suppressesAudioOnlyVariants"));
    objc_msgSend(v11, "setPrefersOfflinePlayableVariants:", -[AVPlayerItem prefersOfflinePlayableVariants](self, "prefersOfflinePlayableVariants"));
    -[AVPlayerItem forwardPlaybackEndTime](self, "forwardPlaybackEndTime");
    objc_msgSend(v11, "setForwardPlaybackEndTime:", v35);
    -[AVPlayerItem reversePlaybackEndTime](self, "reversePlaybackEndTime");
    objc_msgSend(v11, "setReversePlaybackEndTime:", v34);
    -[AVPlayerItem timeToPauseBuffering](self, "timeToPauseBuffering");
    if ((v33[36] & 1) != 0)
    {
      -[AVPlayerItem timeToPauseBuffering](self, "timeToPauseBuffering");
      objc_msgSend(v11, "setTimeToPauseBuffering:", v33);
    }
    -[AVPlayerItem timeToPausePlayback](self, "timeToPausePlayback");
    if ((v32[36] & 1) != 0)
    {
      -[AVPlayerItem timeToPausePlayback](self, "timeToPausePlayback");
      objc_msgSend(v11, "setTimeToPausePlayback:", v32);
    }
    if (-[AVPlayerItem snapTimeToPausePlayback](self, "snapTimeToPausePlayback"))
      objc_msgSend(v11, "setSnapTimeToPausePlayback:", 1);
    if (-[AVPlayerItem advanceTimeForOverlappedPlaybackWasSet](self, "advanceTimeForOverlappedPlaybackWasSet"))
    {
      -[AVPlayerItem advanceTimeForOverlappedPlayback](self, "advanceTimeForOverlappedPlayback");
      objc_msgSend(v11, "setAdvanceTimeForOverlappedPlayback:", v31);
    }
    if (-[AVPlayerItem automaticallyPreservesTimeOffsetFromLive](self, "automaticallyPreservesTimeOffsetFromLive"))
      objc_msgSend(v11, "setAutomaticallyPreservesTimeOffsetFromLive:", 1);
    -[AVPlayerItem configuredTimeOffsetFromLive](self, "configuredTimeOffsetFromLive");
    objc_msgSend(v11, "setConfiguredTimeOffsetFromLive:", v30);
    if (-[AVPlayerItem imageQueueInterpolationCurveWasSet](self, "imageQueueInterpolationCurveWasSet"))
      objc_msgSend(v11, "setImageQueueInterpolationCurve:", -[AVPlayerItem imageQueueInterpolationCurve](self, "imageQueueInterpolationCurve"));
    if (-[AVPlayerItem blendsVideoFramesWasSet](self, "blendsVideoFramesWasSet"))
      objc_msgSend(v11, "setBlendsVideoFrames:", -[AVPlayerItem blendsVideoFrames](self, "blendsVideoFrames"));
    if (-[AVPlayerItem appliesPerFrameHDRDisplayMetadataWasSet](self, "appliesPerFrameHDRDisplayMetadataWasSet"))
      objc_msgSend(v11, "setAppliesPerFrameHDRDisplayMetadata:", -[AVPlayerItem appliesPerFrameHDRDisplayMetadata](self, "appliesPerFrameHDRDisplayMetadata"));
    if (-[AVPlayerItem reversesMoreVideoFramesInMemoryWasSet](self, "reversesMoreVideoFramesInMemoryWasSet"))
      objc_msgSend(v11, "setReversesMoreVideoFramesInMemory:", -[AVPlayerItem reversesMoreVideoFramesInMemory](self, "reversesMoreVideoFramesInMemory"));
    if (-[AVPlayerItem aggressivelyCachesVideoFramesWasSet](self, "aggressivelyCachesVideoFramesWasSet"))
      objc_msgSend(v11, "setAggressivelyCachesVideoFrames:", -[AVPlayerItem aggressivelyCachesVideoFrames](self, "aggressivelyCachesVideoFrames"));
    if (-[AVPlayerItem decodesAllFramesDuringOrdinaryPlaybackWasSet](self, "decodesAllFramesDuringOrdinaryPlaybackWasSet"))
    {
      objc_msgSend(v11, "setDecodesAllFramesDuringOrdinaryPlayback:", -[AVPlayerItem decodesAllFramesDuringOrdinaryPlayback](self, "decodesAllFramesDuringOrdinaryPlayback"));
    }
    objc_msgSend(v11, "setLoudnessInfo:", -[AVPlayerItem loudnessInfo](self, "loudnessInfo"));
    objc_msgSend(v11, "setAVKitData:", -[AVPlayerItem AVKitData](self, "AVKitData"));
    objc_msgSend(v11, "setServiceIdentifier:", -[AVPlayerItem serviceIdentifier](self, "serviceIdentifier"));
    -[AVPlayerItem soundCheckVolumeNormalization](self, "soundCheckVolumeNormalization");
    objc_msgSend(v11, "setSoundCheckVolumeNormalization:");
    -[AVPlayerItem volumeAdjustment](self, "volumeAdjustment");
    objc_msgSend(v11, "setVolumeAdjustment:");
    objc_msgSend(v11, "setMediaKind:", -[AVPlayerItem mediaKind](self, "mediaKind"));
    objc_msgSend(v11, "setRestrictions:", -[AVPlayerItem restrictions](self, "restrictions"));
    objc_msgSend(v11, "setAutomaticallyHandlesInterstitialEvents:", -[AVPlayerItem automaticallyHandlesInterstitialEvents](self, "automaticallyHandlesInterstitialEvents"));
    if (-[AVPlayerItem adjustTargetLevelWasSet](self, "adjustTargetLevelWasSet"))
    {
      -[AVPlayerItem adjustTargetLevel](self, "adjustTargetLevel");
      objc_msgSend(v11, "setAdjustTargetLevel:");
    }
    if (-[AVPlayerItem adjustCompressionProfileWasSet](self, "adjustCompressionProfileWasSet"))
      objc_msgSend(v11, "setAdjustCompressionProfile:", -[AVPlayerItem adjustCompressionProfile](self, "adjustCompressionProfile"));
    objc_msgSend(v11, "setPlayHapticTracks:", -[AVPlayerItem playHapticTracks](self, "playHapticTracks"));
    objc_msgSend(v11, "setHapticPlaybackLocality:", -[AVPlayerItem hapticPlaybackLocality](self, "hapticPlaybackLocality"));
    objc_msgSend(v11, "setContinuesPlayingDuringPrerollForRateChange:", -[AVPlayerItem continuesPlayingDuringPrerollForRateChange](self, "continuesPlayingDuringPrerollForRateChange"));
    objc_msgSend(v11, "setContinuesPlayingDuringPrerollForSeek:", -[AVPlayerItem continuesPlayingDuringPrerollForSeek](self, "continuesPlayingDuringPrerollForSeek"));
    if (-[AVPlayerItem usesIFrameOnlyPlaybackForHighRateScaledEditsWasSet](self, "usesIFrameOnlyPlaybackForHighRateScaledEditsWasSet"))
    {
      objc_msgSend(v11, "setUsesIFrameOnlyPlaybackForHighRateScaledEdits:", -[AVPlayerItem usesIFrameOnlyPlaybackForHighRateScaledEdits](self, "usesIFrameOnlyPlaybackForHighRateScaledEdits"));
    }
    if (-[AVPlayerItem minimumIntervalForIFrameOnlyPlaybackWasSet](self, "minimumIntervalForIFrameOnlyPlaybackWasSet"))
    {
      -[AVPlayerItem minimumIntervalForIFrameOnlyPlayback](self, "minimumIntervalForIFrameOnlyPlayback");
      objc_msgSend(v11, "setMinimumIntervalForIFrameOnlyPlayback:", v29);
    }
    if (-[AVPlayerItem speedThresholdForIFrameOnlyPlaybackWasSet](self, "speedThresholdForIFrameOnlyPlaybackWasSet"))
    {
      -[AVPlayerItem speedThresholdForIFrameOnlyPlayback](self, "speedThresholdForIFrameOnlyPlayback");
      objc_msgSend(v11, "setSpeedThresholdForIFrameOnlyPlayback:");
    }
    if (-[AVPlayerItem refreshesClosedCaptionsImmediatelyAfterSeeking](self, "refreshesClosedCaptionsImmediatelyAfterSeeking"))
    {
      objc_msgSend(v11, "setRefreshesClosedCaptionsImmediatelyAfterSeeking:", -[AVPlayerItem refreshesClosedCaptionsImmediatelyAfterSeeking](self, "refreshesClosedCaptionsImmediatelyAfterSeeking"));
    }
    if (-[AVPlayerItem audioSpatializationAllowedWasSet](self, "audioSpatializationAllowedWasSet"))
      objc_msgSend(v11, "setAudioSpatializationAllowed:", -[AVPlayerItem isAudioSpatializationAllowed](self, "isAudioSpatializationAllowed"));
    if (-[AVPlayerItem allowedAudioSpatializationFormatsWasSet](self, "allowedAudioSpatializationFormatsWasSet"))
      objc_msgSend(v11, "setAllowedAudioSpatializationFormats:", -[AVPlayerItem allowedAudioSpatializationFormats](self, "allowedAudioSpatializationFormats"));
    if (-[AVPlayerItem variantPreferences](self, "variantPreferences"))
      objc_msgSend(v11, "setVariantPreferences:", -[AVPlayerItem variantPreferences](self, "variantPreferences"));
    -[AVPlayerItem preferredMaximumAudioSampleRate](self, "preferredMaximumAudioSampleRate");
    objc_msgSend(v11, "setPreferredMaximumAudioSampleRate:");
    objc_msgSend(v11, "setPrefersOfflinePlayableVariants:", -[AVPlayerItem prefersOfflinePlayableVariants](self, "prefersOfflinePlayableVariants"));
    objc_msgSend(v11, "setAutoSwitchAtmosStreamVariants:", -[AVPlayerItem autoSwitchAtmosStreamVariants](self, "autoSwitchAtmosStreamVariants"));
    if (-[AVAsset statusOfValueForKey:error:](self->_playerItem->asset, "statusOfValueForKey:error:", CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions"), 0) == 2)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v12 = -[AVAsset availableMediaCharacteristicsWithMediaSelectionOptions](self->_playerItem->asset, "availableMediaCharacteristicsWithMediaSelectionOptions");
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v26 != v14)
              objc_enumerationMutation(v12);
            v16 = -[AVAsset mediaSelectionGroupForMediaCharacteristic:](self->_playerItem->asset, "mediaSelectionGroupForMediaCharacteristic:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
            if (v16)
            {
              v17 = -[AVPlayerItem currentMediaSelection](self, "currentMediaSelection");
              if (!-[AVMediaSelection mediaSelectionCriteriaCanBeAppliedAutomaticallyToMediaSelectionGroup:](v17, "mediaSelectionCriteriaCanBeAppliedAutomaticallyToMediaSelectionGroup:", v16))objc_msgSend(v11, "selectMediaOption:inMediaSelectionGroup:", -[AVMediaSelection selectedMediaOptionInMediaSelectionGroup:](v17, "selectedMediaOptionInMediaSelectionGroup:", v16), v16);
            }
          }
          v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
        }
        while (v13);
      }
    }
    else
    {
      objc_msgSend(v11, "setNonForcedSubtitleDisplayEnabled:", -[AVPlayerItem isNonForcedSubtitleDisplayEnabled](self, "isNonForcedSubtitleDisplayEnabled"));
    }
    objc_msgSend(v11, "setVideoEnhancementMode:", -[AVPlayerItem videoEnhancementMode](self, "videoEnhancementMode"));
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    ivarAccessQueue = self->_playerItem->ivarAccessQueue;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __45__AVPlayerItem_copyWithZone_newAssetOptions___block_invoke;
    v20[3] = &unk_1E302FD60;
    v20[4] = self;
    v20[5] = &v21;
    av_readwrite_dispatch_queue_read(ivarAccessQueue, v20);
    if (*((_DWORD *)v22 + 6) != -1)
      objc_msgSend(v11, "setStartsOnFirstEligibleVariant:", -[AVPlayerItem startsOnFirstEligibleVariant](self, "startsOnFirstEligibleVariant"));
    _Block_object_dispose(&v21, 8);
  }
  return v11;
}

uint64_t __45__AVPlayerItem_copyWithZone_newAssetOptions___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 584);
  return result;
}

- (id)copyWithZone:(NSZone *)zone
{
  return -[AVPlayerItem copyWithZone:newAssetOptions:](self, "copyWithZone:newAssetOptions:", zone, 0);
}

- (id)copy
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPlayerItem;
  return -[AVPlayerItem copy](&v3, sel_copy);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (-[AVPlayerItem asset](self, "asset"))
  {
    v6 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("asset = %@"), -[AVPlayerItem asset](self, "asset"));
  }
  else if (-[AVPlayerItem _URL](self, "_URL"))
  {
    v6 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("URL = %@"), -[AVPlayerItem _URL](self, "_URL"));
  }
  else
  {
    v6 = CFSTR("with no asset and no URL");
  }
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@>"), v5, self, v6);
}

- (id)identifier
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__AVPlayerItem_identifier__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __26__AVPlayerItem_identifier__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1064), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setTimeJumpedNotificationIncludesExtendedDiagnosticPayload:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[5];
  BOOL v5;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__AVPlayerItem__setTimeJumpedNotificationIncludesExtendedDiagnosticPayload___block_invoke;
  v4[3] = &unk_1E302FD38;
  v4[4] = self;
  v5 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __76__AVPlayerItem__setTimeJumpedNotificationIncludesExtendedDiagnosticPayload___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 1112) = *(_BYTE *)(result + 40);
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  objc_super v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("_externalProtectionRequiredForPlayback")))
    return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVPlayerItem _isExternalProtectionRequiredForPlayback](self, "_isExternalProtectionRequiredForPlayback"));
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("timebase")))
    return -[AVPlayerItem timebase](self, "timebase");
  v6.receiver = self;
  v6.super_class = (Class)AVPlayerItem;
  return -[AVPlayerItem valueForUndefinedKey:](&v6, sel_valueForUndefinedKey_, a3);
}

uint64_t __53__AVPlayerItem__configurePlaybackItemAndReturnError___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);

  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
    return v4(FigBaseObject, *MEMORY[0x1E0CC50F8], v1);
  return result;
}

- (id)_copyPlayer
{
  NSObject *ivarAccessQueue;
  void *v3;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__AVPlayerItem__copyPlayer__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __27__AVPlayerItem__copyPlayer__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1424), "referencedObject");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_playerConnection
{
  return self->_playerItem->previousItem;
}

- (void)processWaitingMetricEventTimelineCompletionHandlers
{
  NSObject *ivarAccessQueue;
  uint64_t v4;
  _QWORD *v5;
  uint64_t FigBaseObject;
  uint64_t (*v7)(uint64_t, _QWORD, _QWORD, _QWORD *);
  signed int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *global_queue;
  _QWORD v14[7];
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD block[6];
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3052000000;
  v18[3] = __Block_byref_object_copy__7;
  v18[4] = __Block_byref_object_dispose__7;
  v18[5] = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AVPlayerItem_processWaitingMetricEventTimelineCompletionHandlers__block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v19;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  v5 = v20 + 3;
  if (v20[3])
    goto LABEL_4;
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v7 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v7)
  {
    v8 = -12782;
    goto LABEL_7;
  }
  v8 = v7(FigBaseObject, *MEMORY[0x1E0CC51F8], *MEMORY[0x1E0C9AE00], v5);
  if (v8)
  {
LABEL_7:
    v10 = AVLocalizedErrorWithUnderlyingOSStatus(v8, 0);
    goto LABEL_5;
  }
LABEL_4:
  v9 = self->_playerItem->ivarAccessQueue;
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __67__AVPlayerItem_processWaitingMetricEventTimelineCompletionHandlers__block_invoke_2;
  v16[3] = &unk_1E302FDB0;
  v16[4] = self;
  v16[5] = &v19;
  av_readwrite_dispatch_queue_write(v9, v16);
  v10 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11800, 0);
LABEL_5:
  v11 = v10;
  v12 = self->_playerItem->ivarAccessQueue;
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __67__AVPlayerItem_processWaitingMetricEventTimelineCompletionHandlers__block_invoke_3;
  v15[3] = &unk_1E302FDB0;
  v15[4] = self;
  v15[5] = v18;
  av_readwrite_dispatch_queue_write(v12, v15);
  global_queue = dispatch_get_global_queue(0, 0);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __67__AVPlayerItem_processWaitingMetricEventTimelineCompletionHandlers__block_invoke_4;
  v14[3] = &unk_1E3031E18;
  v14[5] = v18;
  v14[6] = &v19;
  v14[4] = v11;
  dispatch_async(global_queue, v14);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v19, 8);
}

CFTypeRef __67__AVPlayerItem_processWaitingMetricEventTimelineCompletionHandlers__block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1464);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __67__AVPlayerItem_processWaitingMetricEventTimelineCompletionHandlers__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  const void *v2;
  const void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(const void **)(v1 + 1464);
  v3 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  *(_QWORD *)(v1 + 1464) = v3;
  if (v3)
    CFRetain(v3);
  if (v2)
    CFRelease(v2);
}

uint64_t __67__AVPlayerItem_processWaitingMetricEventTimelineCompletionHandlers__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1456), "count");
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 1456));
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1456), "removeAllObjects");
  }
  return result;
}

void __67__AVPlayerItem_processWaitingMetricEventTimelineCompletionHandlers__block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  const void *v7;
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
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i) + 16))();
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }
  v7 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v7)
    CFRelease(v7);

}

uint64_t __34__AVPlayerItem__attachToFigPlayer__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processWaitingMetricEventTimelineCompletionHandlers");
}

- (void)_removeFromPlayQueueOfFigPlayerOfAttachedPlayer
{
  -[AVPlayerItem removeItemFromPlayQueue](self->_playerItem->previousItem, "removeItemFromPlayQueue");

  self->_playerItem->previousItem = 0;
}

- (void)_insertAfterItem:(id)a3
{
  _QWORD *v5;

  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AVPlayerItem.m"), 4533, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("previousItem != nil"));
  v5 = *(_QWORD **)(*((_QWORD *)a3 + 1) + 1240);
  if (v5)
  {
    *(_QWORD *)(v5[1] + 1232) = self;
    v5 = *(_QWORD **)(*((_QWORD *)a3 + 1) + 1240);
  }
  self->_playerItem->seekCompletionHandler = v5;
  *(_QWORD *)(*((_QWORD *)a3 + 1) + 1240) = self;
  *(_QWORD *)&self->_playerItem->nextSeekIDToGenerate = a3;
}

- (id)_URL
{
  return self->_playerItem->URL;
}

uint64_t __26__AVPlayerItem__setAsset___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 144) = result;
  return result;
}

id __60__AVPlayerItem__ensureAssetWithFigPlaybackItemWithTrackIDs___block_invoke_2(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 232);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __64__AVPlayerItem__setAssetToAssetWithFigPlaybackItemIfAppropriate__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id result;

  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = (void *)v2[29];
  if (!v3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 232) = +[AVAsset assetWithURL:figPlaybackItem:trackIDs:dynamicBehavior:](AVAsset, "assetWithURL:figPlaybackItem:trackIDs:dynamicBehavior:", v2[1], v2[15], 0, 1);
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 232);
  }
  result = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_markAssetWithFigPlaybackItemAsNeedingNewTracks
{
  NSObject *ivarAccessQueue;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  uint64_t v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3052000000;
  v7 = __Block_byref_object_copy__7;
  v8 = __Block_byref_object_dispose__7;
  v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__AVPlayerItem__markAssetWithFigPlaybackItemAsNeedingNewTracks__block_invoke;
  v3[3] = &unk_1E302FD60;
  v3[4] = self;
  v3[5] = &v4;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v3);
  objc_msgSend((id)v5[5], "_tracksDidChange");

  _Block_object_dispose(&v4, 8);
}

id __63__AVPlayerItem__markAssetWithFigPlaybackItemAsNeedingNewTracks__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 232);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

__n128 __60__AVPlayerItem__informObserversAboutAvailabilityOfDuration___block_invoke_4(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  __n128 result;

  v1 = (__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 460);
  v2 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  result = v2[2];
  v1[1].n128_u64[0] = v2[3].n128_u64[0];
  *v1 = result;
  return result;
}

- (void)_changeStatusToFailedWithError:(id)a3
{
  NSUInteger v5;
  NSUInteger v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *ivarAccessQueue;
  _QWORD block[6];

  if (-[AVPlayerItem status](self, "status") != AVPlayerItemStatusFailed)
  {
    -[AVPlayerItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("status"));
    -[AVPlayerItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("error"));
    v5 = -[NSArray count](-[AVPlayerItemErrorLog events](-[AVPlayerItem errorLog](self, "errorLog"), "events"), "count");
    if (v5)
    {
      v6 = v5;
      v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v8 = (void *)objc_msgSend(a3, "userInfo");
      v9 = *MEMORY[0x1E0C9AFA8];
      v10 = objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0C9AFA8]);
      if (v10)
        objc_msgSend(v7, "appendFormat:", CFSTR("%@, "), v10);
      objc_msgSend(v7, "appendFormat:", CFSTR("See -[AVPlayerItem errorLog] for %d events"), v6);
      v11 = (id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "mutableCopy");
      objc_msgSend(v11, "setObject:forKey:", v7, v9);
      a3 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", objc_msgSend(a3, "domain"), objc_msgSend(a3, "code"), v11);
    }
    ivarAccessQueue = self->_playerItem->ivarAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__AVPlayerItem__changeStatusToFailedWithError___block_invoke;
    block[3] = &unk_1E302FCE8;
    block[4] = self;
    block[5] = a3;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
    -[AVPlayerItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("error"));
    -[AVPlayerItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("status"));
    if (objc_msgSend((id)objc_msgSend(a3, "domain"), "isEqualToString:", CFSTR("AVFoundationErrorDomain")))
    {
      if (objc_msgSend(a3, "code") == -11819)
        -[AVAsset _serverHasDied](-[AVPlayerItem asset](self, "asset"), "_serverHasDied");
    }
  }
}

uint64_t __47__AVPlayerItem__changeStatusToFailedWithError___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(_QWORD *)(v1 + 272) != 2)
  {
    v2 = result;
    *(_QWORD *)(v1 + 272) = 2;
    result = objc_msgSend(*(id *)(result + 40), "copy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 280) = result;
  }
  return result;
}

- (NSArray)automaticallyLoadedAssetKeys
{
  NSArray *result;

  result = self->_playerItem->automaticallyLoadedAssetKeys;
  if (!result)
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return result;
}

- (id)_trackWithTrackID:(int)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[AVPlayerItem _tracks](self, "_tracks", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "assetTrack"), "trackID") == a3)
      return v9;
    if (v6 == ++v8)
    {
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)_enabledTrackFormatDescriptions
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = -[AVPlayerItem tracks](self, "tracks");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v9, "assetTrack"), "isEnabled"))
          objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v9, "assetTrack"), "formatDescriptions"));
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v3;
}

- (void)_makeReadyForEnqueueingWithCompletionHandler:(id)a3
{
  OpaqueFigPlaybackItem *figPlaybackItem;
  uint64_t (*v6)(OpaqueFigPlaybackItem *, _QWORD, char *);
  signed int v7;
  int v8;
  uint64_t v9;
  OpaqueFigPlaybackItem *v10;
  uint64_t (*v11)(OpaqueFigPlaybackItem *, uint64_t, char *);
  uint64_t v12;
  OpaqueFigPlaybackItem *v13;
  uint64_t (*v14)(OpaqueFigPlaybackItem *, uint64_t, char *);
  signed int v15;
  AVPlayerItemInternal *playerItem;
  void *v17;
  char v18;

  -[AVPlayerItem _attachToFigPlayer](self, "_attachToFigPlayer");
  figPlaybackItem = self->_playerItem->figPlaybackItem;
  if (figPlaybackItem)
  {
    v18 = 0;
    v6 = *(uint64_t (**)(OpaqueFigPlaybackItem *, _QWORD, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                           + 48);
    if (v6)
    {
      v7 = v6(figPlaybackItem, 0, &v18);
      if (!v7)
      {
        v8 = 1;
        goto LABEL_9;
      }
    }
    else
    {
      v7 = -12782;
    }
    -[AVPlayerItem _changeStatusToFailedWithError:](self, "_changeStatusToFailedWithError:", AVLocalizedErrorWithUnderlyingOSStatus(v7, 0));
    v8 = 0;
LABEL_9:
    if (v18)
      -[AVPlayerItem _respondToBecomingReadyForBasicInspection](self, "_respondToBecomingReadyForBasicInspection");
    if (!v8)
    {
LABEL_19:
      if (v7)
        goto LABEL_28;
      v12 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0CC50A8]);
      v18 = 0;
      v13 = self->_playerItem->figPlaybackItem;
      v14 = *(uint64_t (**)(OpaqueFigPlaybackItem *, uint64_t, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 48);
      if (v14)
      {
        v15 = v14(v13, v12, &v18);
        if (!v15)
        {
LABEL_25:
          if (v18)
            BYTE1(self->_playerItem->timedMetadata) = 1;
          if (!v15)
          {
            if (!-[AVPlayerItem _isReadyForBasicInspection](self, "_isReadyForBasicInspection")
              || (playerItem = self->_playerItem, !LOBYTE(playerItem->timedMetadata))
              || !BYTE1(playerItem->timedMetadata))
            {
              if (a3)
              {
                v17 = (void *)objc_msgSend(a3, "copy");
                -[NSMutableDictionary addObject:](self->_playerItem->mediaOptionsSelectedByClient, "addObject:", v17);

              }
              return;
            }
          }
LABEL_28:
          -[AVPlayerItem _invokeReadyForEnqueueingHandlers](self, "_invokeReadyForEnqueueingHandlers");
          if (a3)
            (*((void (**)(id))a3 + 2))(a3);
          return;
        }
      }
      else
      {
        v15 = -12782;
      }
      -[AVPlayerItem _changeStatusToFailedWithError:](self, "_changeStatusToFailedWithError:", AVLocalizedErrorWithUnderlyingOSStatus(v15, 0));
      goto LABEL_25;
    }
    v9 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0CC5188]);
    v18 = 0;
    v10 = self->_playerItem->figPlaybackItem;
    v11 = *(uint64_t (**)(OpaqueFigPlaybackItem *, uint64_t, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 48);
    if (v11)
    {
      v7 = v11(v10, v9, &v18);
      if (!v7)
      {
LABEL_17:
        if (v18)
          LOBYTE(self->_playerItem->timedMetadata) = 1;
        goto LABEL_19;
      }
    }
    else
    {
      v7 = -12782;
    }
    -[AVPlayerItem _changeStatusToFailedWithError:](self, "_changeStatusToFailedWithError:", AVLocalizedErrorWithUnderlyingOSStatus(v7, 0));
    goto LABEL_17;
  }
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (BOOL)_canPlayFastForward
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, _QWORD, _QWORD, CFBooleanRef *);
  BOOL v7;
  CFBooleanRef BOOLean;

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (!v3)
    return 0;
  v4 = v3;
  if ((-[AVPlayerItem status](self, "status") == AVPlayerItemStatusReadyToPlay
     || sOKToBlockWhenGettingValuesOfProperties == 1)
    && (BOOLean = 0,
        FigBaseObject = FigPlaybackItemGetFigBaseObject(),
        (v6 = *(void (**)(uint64_t, _QWORD, _QWORD, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48)) != 0)
    && (v6(FigBaseObject, *MEMORY[0x1E0CC50B8], *MEMORY[0x1E0C9AE00], &BOOLean), BOOLean))
  {
    v7 = CFBooleanGetValue(BOOLean) != 0;
    if (BOOLean)
      CFRelease(BOOLean);
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v4);
  return v7;
}

- (BOOL)canPlayFastForward
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__AVPlayerItem_canPlayFastForward__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__AVPlayerItem_canPlayFastForward__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 936);
  return result;
}

- (BOOL)_canPlayFastReverse
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, _QWORD, _QWORD, CFBooleanRef *);
  BOOL v7;
  CFBooleanRef BOOLean;

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (!v3)
    return 0;
  v4 = v3;
  if ((-[AVPlayerItem status](self, "status") == AVPlayerItemStatusReadyToPlay
     || sOKToBlockWhenGettingValuesOfProperties == 1)
    && (BOOLean = 0,
        FigBaseObject = FigPlaybackItemGetFigBaseObject(),
        (v6 = *(void (**)(uint64_t, _QWORD, _QWORD, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48)) != 0)
    && (v6(FigBaseObject, *MEMORY[0x1E0CC50C0], *MEMORY[0x1E0C9AE00], &BOOLean), BOOLean))
  {
    v7 = CFBooleanGetValue(BOOLean) != 0;
    if (BOOLean)
      CFRelease(BOOLean);
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v4);
  return v7;
}

- (BOOL)canPlayFastReverse
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__AVPlayerItem_canPlayFastReverse__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__AVPlayerItem_canPlayFastReverse__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 937);
  return result;
}

- (BOOL)_isAFileBasedItemThatsReadyToPlay
{
  if (-[AVPlayerItem status](self, "status") == AVPlayerItemStatusReadyToPlay)
    return !-[AVAsset _isStreaming](self->_playerItem->asset, "_isStreaming");
  else
    return 0;
}

- (BOOL)_canPlayReverse
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, _QWORD, _QWORD, CFBooleanRef *);
  BOOL v7;
  CFBooleanRef BOOLean;

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (!v3)
    return 0;
  v4 = v3;
  if (-[AVPlayerItem status](self, "status") == AVPlayerItemStatusReadyToPlay
    && (BOOLean = 0,
        FigBaseObject = FigPlaybackItemGetFigBaseObject(),
        (v6 = *(void (**)(uint64_t, _QWORD, _QWORD, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48)) != 0)
    && (v6(FigBaseObject, *MEMORY[0x1E0CC50C8], *MEMORY[0x1E0C9AE00], &BOOLean), BOOLean))
  {
    v7 = CFBooleanGetValue(BOOLean) != 0;
    if (BOOLean)
      CFRelease(BOOLean);
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v4);
  return v7;
}

- (BOOL)canPlayReverse
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__AVPlayerItem_canPlayReverse__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__AVPlayerItem_canPlayReverse__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 938);
  return result;
}

- (BOOL)canPlaySlowForward
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__AVPlayerItem_canPlaySlowForward__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__AVPlayerItem_canPlaySlowForward__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 940);
  return result;
}

- (BOOL)canPlaySlowReverse
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__AVPlayerItem_canPlaySlowReverse__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__AVPlayerItem_canPlaySlowReverse__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 939);
  return result;
}

- (BOOL)_canStepForward
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, _QWORD, _QWORD, CFBooleanRef *);
  BOOL v7;
  CFBooleanRef BOOLean;

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (!v3)
    return 0;
  v4 = v3;
  if ((-[AVPlayerItem status](self, "status") == AVPlayerItemStatusReadyToPlay
     || sOKToBlockWhenGettingValuesOfProperties == 1)
    && (BOOLean = 0,
        FigBaseObject = FigPlaybackItemGetFigBaseObject(),
        (v6 = *(void (**)(uint64_t, _QWORD, _QWORD, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48)) != 0)
    && (v6(FigBaseObject, *MEMORY[0x1E0CC5320], *MEMORY[0x1E0C9AE00], &BOOLean), BOOLean))
  {
    v7 = CFBooleanGetValue(BOOLean) != 0;
    if (BOOLean)
      CFRelease(BOOLean);
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v4);
  return v7;
}

- (BOOL)canStepForward
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__AVPlayerItem_canStepForward__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__AVPlayerItem_canStepForward__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 941);
  return result;
}

- (BOOL)canStepBackward
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__AVPlayerItem_canStepBackward__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__AVPlayerItem_canStepBackward__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 942);
  return result;
}

- (void)_updatePreservesTimeOffsetFromLive
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50__AVPlayerItem__updatePreservesTimeOffsetFromLive__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __50__AVPlayerItem__updatePreservesTimeOffsetFromLive__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "automaticallyPreservesTimeOffsetFromLive");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC5080], v5);
  }
  return result;
}

- (void)setAutomaticallyPreservesTimeOffsetFromLive:(BOOL)automaticallyPreservesTimeOffsetFromLive
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__AVPlayerItem_setAutomaticallyPreservesTimeOffsetFromLive___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = automaticallyPreservesTimeOffsetFromLive;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updatePreservesTimeOffsetFromLive](self, "_updatePreservesTimeOffsetFromLive");
}

uint64_t __60__AVPlayerItem_setAutomaticallyPreservesTimeOffsetFromLive___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 410) = *(_BYTE *)(result + 40);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_configuredTimeOffsetFromLive
{
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v8;
  uint64_t FigBaseObject;
  unsigned int (*v10)(uint64_t, _QWORD, _QWORD, CFDictionaryRef *);
  CMTimeValue v11;
  CMTimeScale v12;
  CMTimeFlags v13;
  CMTimeEpoch v14;
  CMTime v15;
  CFDictionaryRef dictionaryRepresentation;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  value = *MEMORY[0x1E0CA2E18];
  flags = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  result = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (result)
  {
    v8 = result;
    if (-[AVPlayerItem _isReadyForInspectionOfRecommendedTimeOffsetFromLive](self, "_isReadyForInspectionOfRecommendedTimeOffsetFromLive")|| sOKToBlockWhenGettingValuesOfProperties == 1)
    {
      dictionaryRepresentation = 0;
      FigBaseObject = FigPlaybackItemGetFigBaseObject();
      v10 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFDictionaryRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 8)
                                                                                      + 48);
      if (v10)
      {
        if (!v10(FigBaseObject, *MEMORY[0x1E0CC5360], *MEMORY[0x1E0C9AE00], &dictionaryRepresentation))
        {
          CMTimeMakeFromDictionary(&v15, dictionaryRepresentation);
          value = v15.value;
          flags = v15.flags;
          timescale = v15.timescale;
          epoch = v15.epoch;
          if (dictionaryRepresentation)
            CFRelease(dictionaryRepresentation);
        }
      }
    }
    CFRelease(v8);
  }
  if ((flags & 1) == 0)
  {
    result = -[AVPlayerItem configuredTimeOffsetFromLive](self, "configuredTimeOffsetFromLive");
    value = v11;
    flags = v13;
    timescale = v12;
    epoch = v14;
  }
  retstr->var0 = value;
  retstr->var1 = timescale;
  retstr->var2 = flags;
  retstr->var3 = epoch;
  return result;
}

- (void)_updateConfiguredTimeOffsetFromLiveOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__AVPlayerItem__updateConfiguredTimeOffsetFromLiveOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __68__AVPlayerItem__updateConfiguredTimeOffsetFromLiveOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  void *v1;
  const __CFAllocator *v2;
  CFDictionaryRef v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, CFDictionaryRef);
  CMTime v6[2];

  memset(&v6[1], 0, sizeof(CMTime));
  v1 = *(void **)(a1 + 32);
  if (v1)
    objc_msgSend(v1, "configuredTimeOffsetFromLive");
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v6[0] = v6[1];
  v3 = CMTimeCopyAsDictionary(v6, v2);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v5 = *(void (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v5)
    v5(FigBaseObject, *MEMORY[0x1E0CC5360], v3);
  if (v3)
    CFRelease(v3);
}

- (void)setConfiguredTimeOffsetFromLive:(CMTime *)configuredTimeOffsetFromLive
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  CMTime v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__AVPlayerItem_setConfiguredTimeOffsetFromLive___block_invoke;
  v5[3] = &unk_1E3031E68;
  v5[4] = self;
  v6 = *configuredTimeOffsetFromLive;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateConfiguredTimeOffsetFromLiveOnFigPlaybackItem](self, "_updateConfiguredTimeOffsetFromLiveOnFigPlaybackItem");
}

__n128 __48__AVPlayerItem_setConfiguredTimeOffsetFromLive___block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 result;

  v1 = (__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 412);
  result = *(__n128 *)(a1 + 40);
  v1[1].n128_u64[0] = *(_QWORD *)(a1 + 56);
  *v1 = result;
  return result;
}

- (BOOL)_isReadyForInspectionOfRecommendedTimeOffsetFromLive
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__AVPlayerItem__isReadyForInspectionOfRecommendedTimeOffsetFromLive__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __68__AVPlayerItem__isReadyForInspectionOfRecommendedTimeOffsetFromLive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 228);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_recommendedTimeOffsetFromLive
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v6;
  uint64_t FigBaseObject;
  void (*v8)(uint64_t, _QWORD, _QWORD, const __CFDictionary **);
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  CMTime v11;
  const __CFDictionary *v12;

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  result = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (result)
  {
    v6 = result;
    if (-[AVPlayerItem _isReadyForInspectionOfRecommendedTimeOffsetFromLive](self, "_isReadyForInspectionOfRecommendedTimeOffsetFromLive")|| sOKToBlockWhenGettingValuesOfProperties == 1)
    {
      v12 = 0;
      FigBaseObject = FigPlaybackItemGetFigBaseObject();
      v8 = *(void (**)(uint64_t, _QWORD, _QWORD, const __CFDictionary **))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 8)
                                                                                   + 48);
      if (v8)
      {
        v8(FigBaseObject, *MEMORY[0x1E0CC5270], *MEMORY[0x1E0C9AE00], &v12);
        v9 = v12;
      }
      else
      {
        v9 = 0;
      }
      CMTimeMakeFromDictionary(&v11, v9);
      *(_OWORD *)&retstr->var0 = *(_OWORD *)&v11.value;
      v10 = v12;
      retstr->var3 = v11.epoch;
      if (v10)
        CFRelease(v10);
    }
    CFRelease(v6);
  }
  return result;
}

- (CMTime)recommendedTimeOffsetFromLive
{
  NSObject *ivarAccessQueue;
  CMTime *result;
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
  v10 = &unk_1935931BF;
  v11 = *MEMORY[0x1E0CA2E18];
  v12 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__AVPlayerItem_recommendedTimeOffsetFromLive__block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *(CMTime *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __45__AVPlayerItem_recommendedTimeOffsetFromLive__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  result = *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 436);
  v1[3].n128_u64[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 452);
  v1[2] = result;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentUnfoldedTime
{
  if (self)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE _currentTimeWithOptionalFoldedTimebase:](self, "_currentTimeWithOptionalFoldedTimebase:", 0);
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return self;
}

- (void)_cancelPendingSeekAndRegisterSeekID:(int)a3 withCompletionHandler:(id)a4
{
  AVPlayerItem *v6;
  AVPlayerItemInternal *playerItem;
  void (**epoch)(_QWORD, _QWORD);
  uint64_t timescale;
  AVPlayerItem *v10;

  MEMORY[0x194033BF8](self->_playerItem->seekIDMutex, a2);
  v6 = self;
  playerItem = self->_playerItem;
  epoch = (void (**)(_QWORD, _QWORD))playerItem->initialMaxSnapTime.epoch;
  if (epoch)
    playerItem->initialMaxSnapTime.epoch = 0;
  timescale = playerItem->initialMaxSnapTime.timescale;
  self->_playerItem->initialMaxSnapTime.timescale = a3;
  if (a4)
  {
    self->_playerItem->initialMaxSnapTime.epoch = objc_msgSend(a4, "copy");
    v10 = self;
    v6 = self;
  }
  MEMORY[0x194033C04](v6->_playerItem->seekIDMutex);
  if ((_DWORD)timescale)
    -[AVPlayerItem _postSeekCompletionNotificationWithSeekID:andResult:](self, "_postSeekCompletionNotificationWithSeekID:andResult:", timescale, 0);
  if (epoch)
  {
    epoch[2](epoch, 0);

  }
}

- (void)_postSeekCompletionNotificationWithSeekID:(int)a3 andResult:(BOOL)a4
{
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;

  if (a4)
    v5 = CFSTR("AVPlayerItemSeekDidCompleteNotification");
  else
    v5 = CFSTR("AVPlayerItemSeekDidCancelNotification");
  v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3), CFSTR("AVPlayerItemSeekIDKey"), 0);
  v7 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", v5, self, v6);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v7);
}

- (void)seekToTime:(CMTime *)time
{
  CMTime v3;

  v3 = *time;
  -[AVPlayerItem seekToTime:completionHandler:](self, "seekToTime:completionHandler:", &v3, 0);
}

- (void)seekToTime:(CMTime *)time toleranceBefore:(CMTime *)toleranceBefore toleranceAfter:(CMTime *)toleranceAfter
{
  uint64_t v9;
  CMTime v10;
  CMTime v11;
  CMTime v12;

  v9 = -[AVPlayerItem makeSeekID](self, "makeSeekID");
  v12 = *time;
  v11 = *toleranceBefore;
  v10 = *toleranceAfter;
  -[AVPlayerItem _seekToTime:toleranceBefore:toleranceAfter:seekID:completionHandler:](self, "_seekToTime:toleranceBefore:toleranceAfter:seekID:completionHandler:", &v12, &v11, &v10, v9, 0);
}

- (void)seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 seekID:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  int v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  __int128 v19;
  int64_t v20;
  __int128 v21;
  int64_t v22;
  __int128 v23;
  int64_t var3;

  if (!a6)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = CFSTR("Invalid SeekID");
    goto LABEL_6;
  }
  v10 = *(_QWORD *)&a6;
  v14 = FPSupport_SeekIDGetSource();
  if (v14 != FPSupport_SeekIDGetSource())
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = CFSTR("seekID was not created by this player item");
LABEL_6:
    v18 = (void *)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v17, (uint64_t)a4, (uint64_t)a5, *(uint64_t *)&a6, v6, v7, v19), 0);
    objc_exception_throw(v18);
  }
  v23 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  v21 = *(_OWORD *)&a4->var0;
  v22 = a4->var3;
  v19 = *(_OWORD *)&a5->var0;
  v20 = a5->var3;
  -[AVPlayerItem _seekToTime:toleranceBefore:toleranceAfter:seekID:completionHandler:](self, "_seekToTime:toleranceBefore:toleranceAfter:seekID:completionHandler:", &v23, &v21, &v19, v10, 0);
}

- (void)seekToTime:(CMTime *)time completionHandler:(void *)completionHandler
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  CMTime v12;

  v7 = -[AVPlayerItem makeSeekID](self, "makeSeekID");
  v12 = *time;
  v10 = *MEMORY[0x1E0CA2E30];
  v11 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
  v8 = v10;
  v9 = v11;
  -[AVPlayerItem _seekToTime:toleranceBefore:toleranceAfter:seekID:completionHandler:](self, "_seekToTime:toleranceBefore:toleranceAfter:seekID:completionHandler:", &v12, &v10, &v8, v7, completionHandler);
}

- (void)cancelPendingSeeks
{
  AVPlayerItemInternal *playerItem;
  uint64_t timescale;

  MEMORY[0x194033BF8](self->_playerItem->seekIDMutex, a2);
  playerItem = self->_playerItem;
  timescale = playerItem->initialMaxSnapTime.timescale;
  MEMORY[0x194033C04](playerItem->seekIDMutex);
  -[AVPlayerItem _unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:finished:](self, "_unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:finished:", timescale, 0);
}

- (NSDate)currentDate
{
  OpaqueFigPlaybackItem *v2;
  OpaqueFigPlaybackItem *v3;
  uint64_t FigBaseObject;
  unsigned int (*v5)(uint64_t, _QWORD, _QWORD, id *);
  NSDate *v6;
  id v8;

  v2 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (!v2)
    return 0;
  v3 = v2;
  v8 = 0;
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v5 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v5 && !v5(FigBaseObject, *MEMORY[0x1E0CC5100], *MEMORY[0x1E0C9AE00], &v8))
    v6 = (NSDate *)v8;
  else
    v6 = 0;
  CFRelease(v3);
  return v6;
}

- (BOOL)seekToDate:(NSDate *)date completionHandler:(void *)completionHandler
{
  uint64_t v7;
  OpaqueFigPlaybackItem *v8;
  OpaqueFigPlaybackItem *v9;
  unsigned int (*v10)(OpaqueFigPlaybackItem *, NSDate *, uint64_t);
  BOOL v11;

  v7 = -[AVPlayerItem makeSeekID](self, "makeSeekID");
  v8 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v8)
  {
    v9 = v8;
    -[AVPlayerItem _cancelPendingSeekAndRegisterSeekID:withCompletionHandler:](self, "_cancelPendingSeekAndRegisterSeekID:withCompletionHandler:", v7, completionHandler);
    v10 = *(unsigned int (**)(OpaqueFigPlaybackItem *, NSDate *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 16)
                                                                                    + 128);
    if (v10 && !v10(v9, date, v7))
    {
      v11 = 1;
    }
    else
    {
      -[AVPlayerItem _unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:finished:](self, "_unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:finished:", v7, 0);
      v11 = 0;
    }
    CFRelease(v9);
  }
  else
  {
    -[AVPlayerItem _postSeekCompletionNotificationWithSeekID:andResult:](self, "_postSeekCompletionNotificationWithSeekID:andResult:", v7, 0);
    if (completionHandler)
      (*((void (**)(void *, _QWORD))completionHandler + 2))(completionHandler, 0);
    return 0;
  }
  return v11;
}

- (BOOL)seekToDate:(NSDate *)date
{
  NSObject *v5;
  NSObject *v6;
  uint64_t IsNotCurrentDispatchQueue;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = -[AVPlayerItem _copyStateDispatchQueue](self, "_copyStateDispatchQueue");
  if (v5)
  {
    v6 = v5;
    IsNotCurrentDispatchQueue = _FigIsNotCurrentDispatchQueue();
    if ((_DWORD)IsNotCurrentDispatchQueue)
    {
      if (dword_1ECDECE98)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        IsNotCurrentDispatchQueue = fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      AVPotentialRaceCondition(IsNotCurrentDispatchQueue);
    }
    dispatch_release(v6);
  }
  return -[AVPlayerItem seekToDate:completionHandler:](self, "seekToDate:completionHandler:", date, 0, v10, v11);
}

- (void)setInitialDate:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__AVPlayerItem_setInitialDate___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

id __31__AVPlayerItem_setInitialDate___block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 760) = result;
  return result;
}

- (id)currentEstimatedDate
{
  OpaqueFigPlaybackItem *v2;
  OpaqueFigPlaybackItem *v3;
  uint64_t FigBaseObject;
  unsigned int (*v5)(uint64_t, _QWORD, _QWORD, id *);
  id v6;
  id v8;

  v2 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (!v2)
    return 0;
  v3 = v2;
  v8 = 0;
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v5 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v5 && !v5(FigBaseObject, *MEMORY[0x1E0CC5140], *MEMORY[0x1E0C9AE00], &v8))
    v6 = v8;
  else
    v6 = 0;
  CFRelease(v3);
  return v6;
}

- (void)setInitialEstimatedDate:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__AVPlayerItem_setInitialEstimatedDate___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

id __40__AVPlayerItem_setInitialEstimatedDate___block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 768) = result;
  return result;
}

- (void)stepByCount:(NSInteger)stepCount
{
  id v5;
  const void *v6;
  OpaqueFigPlaybackItem *v7;
  OpaqueFigPlaybackItem *v8;
  void (*v9)(const void *, NSInteger);

  AVTelemetryGenerateID();
  v5 = -[AVPlayerItem _player](self, "_player");
  v6 = (const void *)objc_msgSend(v5, "_copyFigPlayer");
  v7 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  v8 = v7;
  if (v7 && v6)
  {
    objc_msgSend(v5, "pause");
    v9 = *(void (**)(const void *, NSInteger))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
    if (v9)
      v9(v6, stepCount);
  }
  else if (!v7)
  {
    goto LABEL_7;
  }
  CFRelease(v8);
LABEL_7:
  if (v6)
    CFRelease(v6);
}

- (void)_updateForwardPlaybackEndTimeOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__AVPlayerItem__updateForwardPlaybackEndTimeOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __62__AVPlayerItem__updateForwardPlaybackEndTimeOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  void *v1;
  CFDictionaryRef v2;
  uint64_t FigBaseObject;
  void (*v4)(uint64_t, _QWORD, CFDictionaryRef);
  CMTime time;

  v1 = *(void **)(a1 + 32);
  if (v1)
    objc_msgSend(v1, "forwardPlaybackEndTime");
  else
    memset(&time, 0, sizeof(time));
  v2 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v4 = *(void (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    v4(FigBaseObject, *MEMORY[0x1E0CC5130], v2);
  if (v2)
    CFRelease(v2);
}

- (void)setForwardPlaybackEndTime:(CMTime *)forwardPlaybackEndTime
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  CMTime v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__AVPlayerItem_setForwardPlaybackEndTime___block_invoke;
  v5[3] = &unk_1E3031E68;
  v5[4] = self;
  v6 = *forwardPlaybackEndTime;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateForwardPlaybackEndTimeOnFigPlaybackItem](self, "_updateForwardPlaybackEndTimeOnFigPlaybackItem");
}

__n128 __42__AVPlayerItem_setForwardPlaybackEndTime___block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 32) + 8);
  result = *(__n128 *)(a1 + 40);
  v1[19].n128_u64[0] = *(_QWORD *)(a1 + 56);
  v1[18] = result;
  return result;
}

- (void)_updateReversePlaybackEndTimeOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__AVPlayerItem__updateReversePlaybackEndTimeOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __62__AVPlayerItem__updateReversePlaybackEndTimeOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  void *v1;
  CFDictionaryRef v2;
  uint64_t FigBaseObject;
  void (*v4)(uint64_t, _QWORD, CFDictionaryRef);
  CMTime time;

  v1 = *(void **)(a1 + 32);
  if (v1)
    objc_msgSend(v1, "reversePlaybackEndTime");
  else
    memset(&time, 0, sizeof(time));
  v2 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v4 = *(void (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    v4(FigBaseObject, *MEMORY[0x1E0CC52B8], v2);
  if (v2)
    CFRelease(v2);
}

- (void)setReversePlaybackEndTime:(CMTime *)reversePlaybackEndTime
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  CMTime v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__AVPlayerItem_setReversePlaybackEndTime___block_invoke;
  v5[3] = &unk_1E3031E68;
  v5[4] = self;
  v6 = *reversePlaybackEndTime;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateReversePlaybackEndTimeOnFigPlaybackItem](self, "_updateReversePlaybackEndTimeOnFigPlaybackItem");
}

__n128 __42__AVPlayerItem_setReversePlaybackEndTime___block_invoke(uint64_t a1)
{
  uint64_t v1;
  __n128 result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(__n128 *)(a1 + 40);
  *(_QWORD *)(v1 + 328) = *(_QWORD *)(a1 + 56);
  *(__n128 *)(v1 + 312) = result;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeToPauseBuffering
{
  OpaqueFigPlaybackItem *v5;
  OpaqueFigPlaybackItem *v6;
  uint64_t FigBaseObject;
  unsigned int (*v8)(uint64_t, _QWORD, _QWORD, CFDictionaryRef *);
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v10;
  CMTime v11;
  CFDictionaryRef dictionaryRepresentation;
  CMTime v13;

  v13 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  v5 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v5)
  {
    v6 = v5;
    dictionaryRepresentation = 0;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v8 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFDictionaryRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 8)
                                                                                   + 48);
    if (v8)
    {
      if (!v8(FigBaseObject, *MEMORY[0x1E0CC5370], *MEMORY[0x1E0C9AE00], &dictionaryRepresentation))
      {
        CMTimeMakeFromDictionary(&v11, dictionaryRepresentation);
        v13 = v11;
        if (dictionaryRepresentation)
          CFRelease(dictionaryRepresentation);
      }
    }
    CFRelease(v6);
  }
  else
  {
    result = -[AVPlayerItem _timeToPauseBuffering](self, "_timeToPauseBuffering");
    v13 = v10;
  }
  *(CMTime *)retstr = v13;
  return result;
}

- (void)_updateTimeToPauseBufferingOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__AVPlayerItem__updateTimeToPauseBufferingOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __60__AVPlayerItem__updateTimeToPauseBufferingOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  void *v1;
  CFDictionaryRef v2;
  uint64_t FigBaseObject;
  void (*v4)(uint64_t, _QWORD, CFDictionaryRef);
  CMTime time;

  v1 = *(void **)(a1 + 32);
  if (v1)
    objc_msgSend(v1, "_timeToPauseBuffering");
  else
    memset(&time, 0, sizeof(time));
  v2 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v4 = *(void (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    v4(FigBaseObject, *MEMORY[0x1E0CC5370], v2);
  if (v2)
    CFRelease(v2);
}

- (void)setTimeToPauseBuffering:(id *)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__AVPlayerItem_setTimeToPauseBuffering___block_invoke;
  v5[3] = &unk_1E3031E68;
  v5[4] = self;
  v6 = *a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateTimeToPauseBufferingOnFigPlaybackItem](self, "_updateTimeToPauseBufferingOnFigPlaybackItem");
}

__n128 __40__AVPlayerItem_setTimeToPauseBuffering___block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 32) + 8);
  result = *(__n128 *)(a1 + 40);
  v1[22].n128_u64[0] = *(_QWORD *)(a1 + 56);
  v1[21] = result;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeToPausePlayback
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v6;
  uint64_t FigBaseObject;
  unsigned int (*v8)(uint64_t, _QWORD, _QWORD, CFDictionaryRef *);
  CFDictionaryRef v9;
  CMTime v10;
  CFDictionaryRef dictionaryRepresentation;

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  result = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (result)
  {
    v6 = result;
    dictionaryRepresentation = 0;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v8 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFDictionaryRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 8)
                                                                                   + 48);
    if (v8 && !v8(FigBaseObject, *MEMORY[0x1E0CC5378], *MEMORY[0x1E0C9AE00], &dictionaryRepresentation))
    {
      CMTimeMakeFromDictionary(&v10, dictionaryRepresentation);
      *(_OWORD *)&retstr->var0 = *(_OWORD *)&v10.value;
      v9 = dictionaryRepresentation;
      retstr->var3 = v10.epoch;
      if (v9)
        CFRelease(v9);
    }
    CFRelease(v6);
  }
  else
  {
    if (self)
      result = -[AVPlayerItem _timeToPausePlayback](self, "_timeToPausePlayback");
    else
      memset(&v10, 0, sizeof(v10));
    *(CMTime *)retstr = v10;
  }
  return result;
}

- (void)_updateTimeToPausePlaybackOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59__AVPlayerItem__updateTimeToPausePlaybackOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __59__AVPlayerItem__updateTimeToPausePlaybackOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  void *v1;
  CFDictionaryRef v2;
  uint64_t FigBaseObject;
  void (*v4)(uint64_t, _QWORD, CFDictionaryRef);
  CMTime time;

  v1 = *(void **)(a1 + 32);
  if (v1)
    objc_msgSend(v1, "_timeToPausePlayback");
  else
    memset(&time, 0, sizeof(time));
  v2 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v4 = *(void (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    v4(FigBaseObject, *MEMORY[0x1E0CC5378], v2);
  if (v2)
    CFRelease(v2);
}

- (void)setTimeToPausePlayback:(id *)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__AVPlayerItem_setTimeToPausePlayback___block_invoke;
  v5[3] = &unk_1E3031E68;
  v5[4] = self;
  v6 = *a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateTimeToPausePlaybackOnFigPlaybackItem](self, "_updateTimeToPausePlaybackOnFigPlaybackItem");
}

__n128 __39__AVPlayerItem_setTimeToPausePlayback___block_invoke(uint64_t a1)
{
  uint64_t v1;
  __n128 result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(__n128 *)(a1 + 40);
  *(_QWORD *)(v1 + 376) = *(_QWORD *)(a1 + 56);
  *(__n128 *)(v1 + 360) = result;
  return result;
}

- (unsigned)_snapTimeToPausePlayback
{
  NSObject *ivarAccessQueue;
  unsigned __int8 v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__AVPlayerItem__snapTimeToPausePlayback__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__AVPlayerItem__snapTimeToPausePlayback__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 409);
  return result;
}

- (unsigned)snapTimeToPausePlayback
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  uint64_t FigBaseObject;
  unsigned int (*v6)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  unsigned __int8 v7;
  CFTypeRef cf;

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (!v3)
    return -[AVPlayerItem _snapTimeToPausePlayback](self, "_snapTimeToPausePlayback");
  v4 = v3;
  cf = (CFTypeRef)*MEMORY[0x1E0C9AE40];
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v6 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (v6 && !v6(FigBaseObject, *MEMORY[0x1E0CC52F0], *MEMORY[0x1E0C9AE00], &cf))
  {
    v7 = FigCFEqual();
    if (cf)
      CFRelease(cf);
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v4);
  return v7;
}

- (void)_updateSnapTimeToPausePlaybackOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__AVPlayerItem__updateSnapTimeToPausePlaybackOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __63__AVPlayerItem__updateSnapTimeToPausePlaybackOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "_snapTimeToPausePlayback");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC52F0], v5);
  }
  return result;
}

- (void)setSnapTimeToPausePlayback:(unsigned __int8)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  unsigned __int8 v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__AVPlayerItem_setSnapTimeToPausePlayback___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateSnapTimeToPausePlaybackOnFigPlaybackItem](self, "_updateSnapTimeToPausePlaybackOnFigPlaybackItem");
}

uint64_t __43__AVPlayerItem_setSnapTimeToPausePlayback___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 409) = *(_BYTE *)(result + 40) != 0;
  return result;
}

- (id)imageQueueInterpolationCurve
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__AVPlayerItem_imageQueueInterpolationCurve__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__AVPlayerItem_imageQueueInterpolationCurve__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 800), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_updateImageQueueInterpolationCurveOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__AVPlayerItem__updateImageQueueInterpolationCurveOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __68__AVPlayerItem__updateImageQueueInterpolationCurveOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);

  v1 = objc_msgSend(*(id *)(a1 + 32), "imageQueueInterpolationCurve");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
    return v4(FigBaseObject, *MEMORY[0x1E0CC5180], v1);
  return result;
}

- (void)setImageQueueInterpolationCurve:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__AVPlayerItem_setImageQueueInterpolationCurve___block_invoke;
  v5[3] = &unk_1E302FCE8;
  v5[4] = self;
  v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateImageQueueInterpolationCurveOnFigPlaybackItem](self, "_updateImageQueueInterpolationCurveOnFigPlaybackItem");
}

uint64_t __48__AVPlayerItem_setImageQueueInterpolationCurve___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 808) = 1;

  result = objc_msgSend(*(id *)(a1 + 40), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 800) = result;
  return result;
}

- (BOOL)blendsVideoFrames
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__AVPlayerItem_blendsVideoFrames__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__AVPlayerItem_blendsVideoFrames__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 809);
  return result;
}

- (void)_updateBlendsVideoFramesOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__AVPlayerItem__updateBlendsVideoFramesOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __57__AVPlayerItem__updateBlendsVideoFramesOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "blendsVideoFrames");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC50A0], v5);
  }
  return result;
}

- (void)setBlendsVideoFrames:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__AVPlayerItem_setBlendsVideoFrames___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateBlendsVideoFramesOnFigPlaybackItem](self, "_updateBlendsVideoFramesOnFigPlaybackItem");
}

uint64_t __37__AVPlayerItem_setBlendsVideoFrames___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 810) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 809) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)appliesPerFrameHDRDisplayMetadata
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
  v9 = 1;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayerItem_appliesPerFrameHDRDisplayMetadata__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__AVPlayerItem_appliesPerFrameHDRDisplayMetadata__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 811);
  return result;
}

- (void)_updateAppliesPerFrameHDRDisplayMetadataOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __73__AVPlayerItem__updateAppliesPerFrameHDRDisplayMetadataOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __73__AVPlayerItem__updateAppliesPerFrameHDRDisplayMetadataOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "appliesPerFrameHDRDisplayMetadata");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC5248], v5);
  }
  return result;
}

- (void)setAppliesPerFrameHDRDisplayMetadata:(BOOL)appliesPerFrameHDRDisplayMetadata
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__AVPlayerItem_setAppliesPerFrameHDRDisplayMetadata___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = appliesPerFrameHDRDisplayMetadata;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateAppliesPerFrameHDRDisplayMetadataOnFigPlaybackItem](self, "_updateAppliesPerFrameHDRDisplayMetadataOnFigPlaybackItem");
}

uint64_t __53__AVPlayerItem_setAppliesPerFrameHDRDisplayMetadata___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 812) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 811) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)reversesMoreVideoFramesInMemory
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__AVPlayerItem_reversesMoreVideoFramesInMemory__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__AVPlayerItem_reversesMoreVideoFramesInMemory__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 712);
  return result;
}

- (void)_updateReversesMoreVideoFramesInMemoryOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __71__AVPlayerItem__updateReversesMoreVideoFramesInMemoryOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __71__AVPlayerItem__updateReversesMoreVideoFramesInMemoryOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "reversesMoreVideoFramesInMemory");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC52C0], v5);
  }
  return result;
}

- (void)setReversesMoreVideoFramesInMemory:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__AVPlayerItem_setReversesMoreVideoFramesInMemory___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateReversesMoreVideoFramesInMemoryOnFigPlaybackItem](self, "_updateReversesMoreVideoFramesInMemoryOnFigPlaybackItem");
}

uint64_t __51__AVPlayerItem_setReversesMoreVideoFramesInMemory___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 712) = *(_BYTE *)(result + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 713) = 1;
  return result;
}

- (BOOL)aggressivelyCachesVideoFrames
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AVPlayerItem_aggressivelyCachesVideoFrames__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__AVPlayerItem_aggressivelyCachesVideoFrames__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 714);
  return result;
}

- (void)_updateAggressivelyCachesVideoFramesOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__AVPlayerItem__updateAggressivelyCachesVideoFramesOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __69__AVPlayerItem__updateAggressivelyCachesVideoFramesOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "aggressivelyCachesVideoFrames");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC5000], v5);
  }
  return result;
}

- (void)setAggressivelyCachesVideoFrames:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayerItem_setAggressivelyCachesVideoFrames___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateAggressivelyCachesVideoFramesOnFigPlaybackItem](self, "_updateAggressivelyCachesVideoFramesOnFigPlaybackItem");
}

uint64_t __49__AVPlayerItem_setAggressivelyCachesVideoFrames___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 715) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 714) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)decodesAllFramesDuringOrdinaryPlayback
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__AVPlayerItem_decodesAllFramesDuringOrdinaryPlayback__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__AVPlayerItem_decodesAllFramesDuringOrdinaryPlayback__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 716);
  return result;
}

- (void)_updateDecodesAllFramesDuringOrdinaryPlaybackOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __78__AVPlayerItem__updateDecodesAllFramesDuringOrdinaryPlaybackOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __78__AVPlayerItem__updateDecodesAllFramesDuringOrdinaryPlaybackOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "decodesAllFramesDuringOrdinaryPlayback");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC5108], v5);
  }
  return result;
}

- (void)setDecodesAllFramesDuringOrdinaryPlayback:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__AVPlayerItem_setDecodesAllFramesDuringOrdinaryPlayback___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateDecodesAllFramesDuringOrdinaryPlaybackOnFigPlaybackItem](self, "_updateDecodesAllFramesDuringOrdinaryPlaybackOnFigPlaybackItem");
}

uint64_t __58__AVPlayerItem_setDecodesAllFramesDuringOrdinaryPlayback___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 717) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 716) = *(_BYTE *)(result + 40);
  return result;
}

- (OpaqueCMTimebase)_copyProxyUnfoldedTimebase
{
  return (OpaqueCMTimebase *)CFRetain(self->_playerItem->proxyUnfoldedTimebase);
}

- (OpaqueCMTimebase)_copyUnfoldedFigTimebase
{
  NSObject *ivarAccessQueue;
  OpaqueCMTimebase *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__AVPlayerItem__copyUnfoldedFigTimebase__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (OpaqueCMTimebase *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

CFTypeRef __40__AVPlayerItem__copyUnfoldedFigTimebase__block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 216);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (OpaqueCMTimebase)unfoldedTimebase
{
  OpaqueCMTimebase *v2;
  OpaqueCMTimebase *v3;

  v2 = -[AVPlayerItem _copyProxyUnfoldedTimebase](self, "_copyProxyUnfoldedTimebase");
  v3 = v2;
  if (v2)
    CFRelease(v2);
  return v3;
}

- (void)_updateRTCReportingFlagsOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__AVPlayerItem__updateRTCReportingFlagsOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __57__AVPlayerItem__updateRTCReportingFlagsOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  CFNumberRef v1;
  uint64_t FigBaseObject;
  void (*v3)(uint64_t, _QWORD, CFNumberRef);
  int valuePtr;

  valuePtr = objc_msgSend(*(id *)(a1 + 32), "RTCReportingFlags");
  v1 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v3 = *(void (**)(uint64_t, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v3)
    v3(FigBaseObject, *MEMORY[0x1E0CC5260], v1);
  if (v1)
    CFRelease(v1);
}

- (void)setRTCReportingFlags:(unsigned int)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  unsigned int v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__AVPlayerItem_setRTCReportingFlags___block_invoke;
  v5[3] = &unk_1E30317D0;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateRTCReportingFlagsOnFigPlaybackItem](self, "_updateRTCReportingFlagsOnFigPlaybackItem");
}

uint64_t __37__AVPlayerItem_setRTCReportingFlags___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 616) = *(_DWORD *)(result + 40);
  return result;
}

- (void)setReportingCategory:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__AVPlayerItem_setReportingCategory___block_invoke;
  v5[3] = &unk_1E302FCE8;
  v5[4] = self;
  v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateRTCReportingCategoryOnFigPlaybackItem](self, "_updateRTCReportingCategoryOnFigPlaybackItem");
}

void __37__AVPlayerItem_setReportingCategory___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 624);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 624) = objc_msgSend(*(id *)(a1 + 40), "copy");

}

- (void)_updateReportingValuesProperty:(id)a3 forKey:(id)a4
{
  NSObject *ivarAccessQueue;
  _QWORD block[7];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AVPlayerItem__updateReportingValuesProperty_forKey___block_invoke;
  block[3] = &unk_1E302FD88;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  -[AVPlayerItem _updateReportingValuesOnFigPlaybackItem](self, "_updateReportingValuesOnFigPlaybackItem");
}

uint64_t __54__AVPlayerItem__updateReportingValuesProperty_forKey___block_invoke(_QWORD *a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(a1[4] + 8) + 632);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 632) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2 = *(void **)(*(_QWORD *)(a1[4] + 8) + 632);
  }
  return objc_msgSend(v2, "setObject:forKey:", a1[5], a1[6]);
}

- (void)setReportingValueWithNumber:(id)a3 forKey:(id)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Value is not a number."), v8, v9, v10, v11, v12, v14), 0);
    objc_exception_throw(v13);
  }
  -[AVPlayerItem _updateReportingValuesProperty:forKey:](self, "_updateReportingValuesProperty:forKey:", a3, a4);
}

- (void)setReportingValueWithString:(id)a3 forKey:(id)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Value is not a string."), v8, v9, v10, v11, v12, v14), 0);
    objc_exception_throw(v13);
  }
  -[AVPlayerItem _updateReportingValuesProperty:forKey:](self, "_updateReportingValuesProperty:forKey:", a3, a4);
}

- (void)setLimitReadAhead:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__AVPlayerItem_setLimitReadAhead___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateLimitReadAheadOnFigPlaybackItem](self, "_updateLimitReadAheadOnFigPlaybackItem");
}

uint64_t __34__AVPlayerItem_setLimitReadAhead___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 696) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)allowsExtendedReadAhead
{
  CMTime v4;
  CMTime time1;
  CMTime v6;

  memset(&v6, 0, sizeof(v6));
  CMTimeMake(&v6, 50, 1);
  if (self)
    -[AVPlayerItem maximumForwardBufferDuration](self, "maximumForwardBufferDuration");
  else
    memset(&time1, 0, sizeof(time1));
  v4 = v6;
  return CMTimeCompare(&time1, &v4) != 0;
}

- (void)setAllowsExtendedReadAhead:(BOOL)a3
{
  _BOOL4 v3;
  CMTimeEpoch epoch;
  CMTime v6;
  CMTime time1;
  CMTime v8;

  v3 = a3;
  memset(&v8, 0, sizeof(v8));
  CMTimeMake(&v8, 50, 1);
  if (!v3)
  {
    *(_OWORD *)&v6.value = *(_OWORD *)&v8.value;
    epoch = v8.epoch;
LABEL_8:
    v6.epoch = epoch;
    -[AVPlayerItem setMaximumForwardBufferDuration:](self, "setMaximumForwardBufferDuration:", &v6);
    return;
  }
  if (self)
    -[AVPlayerItem maximumForwardBufferDuration](self, "maximumForwardBufferDuration");
  else
    memset(&time1, 0, sizeof(time1));
  v6 = v8;
  if (!CMTimeCompare(&time1, &v6))
  {
    *(_OWORD *)&v6.value = *MEMORY[0x1E0CA2E18];
    epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    goto LABEL_8;
  }
}

- (NSTimeInterval)preferredForwardBufferDuration
{
  double v2;
  CMTime v4[2];

  v2 = 0.0;
  if (self)
  {
    memset(&v4[1], 0, sizeof(CMTime));
    -[AVPlayerItem maximumForwardBufferDuration](self, "maximumForwardBufferDuration");
    if ((unsigned __int128)0 >> 96 == 1)
    {
      v4[0] = v4[1];
      return CMTimeGetSeconds(v4);
    }
  }
  return v2;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumTrailingBufferDuration
{
  NSObject *ivarAccessQueue;
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
  v10 = &unk_1935931BF;
  v11 = *MEMORY[0x1E0CA2E18];
  v12 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__AVPlayerItem_maximumTrailingBufferDuration__block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __45__AVPlayerItem_maximumTrailingBufferDuration__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  result = *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 540);
  v1[3].n128_u64[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 556);
  v1[2] = result;
  return result;
}

- (void)_updateMaximumTrailingBufferDurationOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__AVPlayerItem__updateMaximumTrailingBufferDurationOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __69__AVPlayerItem__updateMaximumTrailingBufferDurationOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  void *v1;
  int v2;
  CFNumberRef v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, CFNumberRef);
  CMTime v6;
  CMTime time1;
  CMTime v8;

  memset(&v8, 0, sizeof(v8));
  v1 = *(void **)(a1 + 32);
  if (v1)
    objc_msgSend(v1, "maximumTrailingBufferDuration");
  time1 = v8;
  v6 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (CMTimeCompare(&time1, &v6) < 0)
  {
    v2 = -1;
  }
  else
  {
    time1 = v8;
    v2 = (int)(CMTimeGetSeconds(&time1) + 0.5);
  }
  LODWORD(time1.value) = v2;
  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &time1);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v5 = *(void (**)(uint64_t, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v5)
    v5(FigBaseObject, *MEMORY[0x1E0CC51E0], v3);
  if (v3)
    CFRelease(v3);
}

- (void)setMaximumTrailingBufferDuration:(id *)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayerItem_setMaximumTrailingBufferDuration___block_invoke;
  v5[3] = &unk_1E3031E68;
  v5[4] = self;
  v6 = *a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateMaximumTrailingBufferDurationOnFigPlaybackItem](self, "_updateMaximumTrailingBufferDurationOnFigPlaybackItem");
}

__n128 __49__AVPlayerItem_setMaximumTrailingBufferDuration___block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 result;

  v1 = (__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 540);
  result = *(__n128 *)(a1 + 40);
  v1[1].n128_u64[0] = *(_QWORD *)(a1 + 56);
  *v1 = result;
  return result;
}

void __68__AVPlayerItem__updateMaximumForwardBufferDurationOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  void *v1;
  CFNumberRef v2;
  uint64_t FigBaseObject;
  void (*v4)(uint64_t, _QWORD, CFNumberRef);
  CMTime v5;
  Float64 valuePtr;

  v1 = *(void **)(a1 + 32);
  if (v1)
    objc_msgSend(v1, "maximumForwardBufferDuration");
  else
    memset(&v5, 0, sizeof(v5));
  valuePtr = CMTimeGetSeconds(&v5);
  v2 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberFloat64Type, &valuePtr);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v4 = *(void (**)(uint64_t, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    v4(FigBaseObject, *MEMORY[0x1E0CC5230], v2);
  if (v2)
    CFRelease(v2);
}

- (void)_updateAlwaysMonitorsPlayabilityOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__AVPlayerItem__updateAlwaysMonitorsPlayabilityOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __65__AVPlayerItem__updateAlwaysMonitorsPlayabilityOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "alwaysMonitorsPlayability");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC5020], v5);
  }
  return result;
}

- (void)setAlwaysMonitorsPlayability:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AVPlayerItem_setAlwaysMonitorsPlayability___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateAlwaysMonitorsPlayabilityOnFigPlaybackItem](self, "_updateAlwaysMonitorsPlayabilityOnFigPlaybackItem");
}

uint64_t __45__AVPlayerItem_setAlwaysMonitorsPlayability___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 825) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __66__AVPlayerItem__updateWillNeverSeekBackwardsHintOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "willNeverSeekBackwardsHint");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE40];
    else
      v5 = *MEMORY[0x1E0C9AE50];
    return v4(FigBaseObject, *MEMORY[0x1E0CC5268], v5);
  }
  return result;
}

- (BOOL)savesDownloadedDataToDiskWhenDone
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayerItem_savesDownloadedDataToDiskWhenDone__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__AVPlayerItem_savesDownloadedDataToDiskWhenDone__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 840);
  return result;
}

- (void)setSavesDownloadedDataToDiskWhenDone:(BOOL)a3
{
  OpaqueFigPlaybackItem *v5;
  NSObject *ivarAccessQueue;
  uint64_t v7;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v9[5];
  BOOL v10;
  _QWORD block[5];
  BOOL v12;

  v5 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__AVPlayerItem_setSavesDownloadedDataToDiskWhenDone___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v12 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (v5)
  {
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __53__AVPlayerItem_setSavesDownloadedDataToDiskWhenDone___block_invoke_2;
    v9[3] = &__block_descriptor_41_e5_v8__0l;
    v10 = a3;
    v9[4] = v5;
    dispatch_sync(figPlaybackItemSetterQueue, v9);
    CFRelease(v5);
  }
}

uint64_t __53__AVPlayerItem_setSavesDownloadedDataToDiskWhenDone___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 840) = *(_BYTE *)(result + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 841) = 1;
  return result;
}

uint64_t __53__AVPlayerItem_setSavesDownloadedDataToDiskWhenDone___block_invoke_2(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = *(unsigned __int8 *)(a1 + 40);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC52C8], v5);
  }
  return result;
}

- (void)_markAsFigItemConfigured
{
  NSObject *ivarAccessQueue;
  _QWORD block[5];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__AVPlayerItem__markAsFigItemConfigured__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

uint64_t __40__AVPlayerItem__markAsFigItemConfigured__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 845) = 1;
  return result;
}

- (BOOL)_isFigItemConfigured
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__AVPlayerItem__isFigItemConfigured__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__AVPlayerItem__isFigItemConfigured__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 845);
  return result;
}

+ (BOOL)automaticallyNotifiesObserversOfSavesDownloadedDataToDiskWhenDone
{
  return 0;
}

- (void)_updateContinuesPlayingDuringPrerollForRateChangeOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __82__AVPlayerItem__updateContinuesPlayingDuringPrerollForRateChangeOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __82__AVPlayerItem__updateContinuesPlayingDuringPrerollForRateChangeOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "continuesPlayingDuringPrerollForRateChange");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC50E0], v5);
  }
  return result;
}

- (void)setContinuesPlayingDuringPrerollForRateChange:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__AVPlayerItem_setContinuesPlayingDuringPrerollForRateChange___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateContinuesPlayingDuringPrerollForRateChangeOnFigPlaybackItem](self, "_updateContinuesPlayingDuringPrerollForRateChangeOnFigPlaybackItem");
}

uint64_t __62__AVPlayerItem_setContinuesPlayingDuringPrerollForRateChange___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 719) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)usesIFrameOnlyPlaybackForHighRateScaledEdits
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__AVPlayerItem_usesIFrameOnlyPlaybackForHighRateScaledEdits__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__AVPlayerItem_usesIFrameOnlyPlaybackForHighRateScaledEdits__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 721);
  return result;
}

- (void)_updateUsesIFrameOnlyPlaybackForHighRateScaledEditsOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __84__AVPlayerItem__updateUsesIFrameOnlyPlaybackForHighRateScaledEditsOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __84__AVPlayerItem__updateUsesIFrameOnlyPlaybackForHighRateScaledEditsOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "usesIFrameOnlyPlaybackForHighRateScaledEdits");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC5390], v5);
  }
  return result;
}

- (void)setUsesIFrameOnlyPlaybackForHighRateScaledEdits:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__AVPlayerItem_setUsesIFrameOnlyPlaybackForHighRateScaledEdits___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateUsesIFrameOnlyPlaybackForHighRateScaledEditsOnFigPlaybackItem](self, "_updateUsesIFrameOnlyPlaybackForHighRateScaledEditsOnFigPlaybackItem");
}

uint64_t __64__AVPlayerItem_setUsesIFrameOnlyPlaybackForHighRateScaledEdits___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 720) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 721) = *(_BYTE *)(result + 40);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumIntervalForIFrameOnlyPlayback
{
  NSObject *ivarAccessQueue;
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
  v10 = &unk_1935931BF;
  v11 = *MEMORY[0x1E0CA2E18];
  v12 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AVPlayerItem_minimumIntervalForIFrameOnlyPlayback__block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __52__AVPlayerItem_minimumIntervalForIFrameOnlyPlayback__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  result = *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 724);
  v1[3].n128_u64[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 740);
  v1[2] = result;
  return result;
}

- (void)_updateMinimumIntervalForIFrameOnlyPlaybackOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __76__AVPlayerItem__updateMinimumIntervalForIFrameOnlyPlaybackOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __76__AVPlayerItem__updateMinimumIntervalForIFrameOnlyPlaybackOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  void *v1;
  CFDictionaryRef v2;
  uint64_t FigBaseObject;
  void (*v4)(uint64_t, _QWORD, CFDictionaryRef);
  CMTime time;

  v1 = *(void **)(a1 + 32);
  if (v1)
    objc_msgSend(v1, "minimumIntervalForIFrameOnlyPlayback");
  else
    memset(&time, 0, sizeof(time));
  v2 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v4 = *(void (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    v4(FigBaseObject, *MEMORY[0x1E0CC5208], v2);
  if (v2)
    CFRelease(v2);
}

- (void)setMinimumIntervalForIFrameOnlyPlayback:(id *)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__AVPlayerItem_setMinimumIntervalForIFrameOnlyPlayback___block_invoke;
  v5[3] = &unk_1E3031E68;
  v5[4] = self;
  v6 = *a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateMinimumIntervalForIFrameOnlyPlaybackOnFigPlaybackItem](self, "_updateMinimumIntervalForIFrameOnlyPlaybackOnFigPlaybackItem");
}

__n128 __56__AVPlayerItem_setMinimumIntervalForIFrameOnlyPlayback___block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 748) = 1;
  v1 = (__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 724);
  result = *(__n128 *)(a1 + 40);
  v1[1].n128_u64[0] = *(_QWORD *)(a1 + 56);
  *v1 = result;
  return result;
}

- (float)speedThresholdForIFrameOnlyPlayback
{
  NSObject *ivarAccessQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__AVPlayerItem_speedThresholdForIFrameOnlyPlayback__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __51__AVPlayerItem_speedThresholdForIFrameOnlyPlayback__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 752);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_updateSpeedThresholdForIFrameOnlyPlaybackOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __75__AVPlayerItem__updateSpeedThresholdForIFrameOnlyPlaybackOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __75__AVPlayerItem__updateSpeedThresholdForIFrameOnlyPlaybackOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  CFNumberRef v2;
  uint64_t FigBaseObject;
  void (*v4)(uint64_t, _QWORD, CFNumberRef);
  int valuePtr;

  objc_msgSend(*(id *)(a1 + 32), "speedThresholdForIFrameOnlyPlayback");
  valuePtr = v1;
  v2 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberFloatType, &valuePtr);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v4 = *(void (**)(uint64_t, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    v4(FigBaseObject, *MEMORY[0x1E0CC5170], v2);
  if (v2)
    CFRelease(v2);
}

- (void)setSpeedThresholdForIFrameOnlyPlayback:(float)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  float v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__AVPlayerItem_setSpeedThresholdForIFrameOnlyPlayback___block_invoke;
  v5[3] = &unk_1E30317D0;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateSpeedThresholdForIFrameOnlyPlaybackOnFigPlaybackItem](self, "_updateSpeedThresholdForIFrameOnlyPlaybackOnFigPlaybackItem");
}

float __55__AVPlayerItem_setSpeedThresholdForIFrameOnlyPlayback___block_invoke(uint64_t a1)
{
  float result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 756) = 1;
  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 752) = result;
  return result;
}

- (void)_updateRefreshesClosedCaptionsImmediatelyAfterSeekingOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __86__AVPlayerItem__updateRefreshesClosedCaptionsImmediatelyAfterSeekingOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __86__AVPlayerItem__updateRefreshesClosedCaptionsImmediatelyAfterSeekingOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "refreshesClosedCaptionsImmediatelyAfterSeeking");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC5358], v5);
  }
  return result;
}

- (void)setRefreshesClosedCaptionsImmediatelyAfterSeeking:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__AVPlayerItem_setRefreshesClosedCaptionsImmediatelyAfterSeeking___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateRefreshesClosedCaptionsImmediatelyAfterSeekingOnFigPlaybackItem](self, "_updateRefreshesClosedCaptionsImmediatelyAfterSeekingOnFigPlaybackItem");
}

uint64_t __66__AVPlayerItem_setRefreshesClosedCaptionsImmediatelyAfterSeeking___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 757) = *(_BYTE *)(result + 40);
  return result;
}

- (void)_setAudioCurvesAccordingToInputParameters:(id)a3 forTrackID:(int)a4
{
  uint64_t v4;
  OpaqueFigPlaybackItem *v7;
  OpaqueFigPlaybackItem *v8;
  uint64_t v9;
  uint64_t (*v10)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, uint64_t);
  int v11;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD block[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;

  v4 = *(_QWORD *)&a4;
  v7 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(a3, "_figAudioCurves");
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    if ((_DWORD)v4)
    {
      v10 = *(uint64_t (**)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                        + 112);
      if (v10)
        v11 = v10(v8, v4, *MEMORY[0x1E0CC54F8], v9);
      else
        v11 = -12782;
      *((_DWORD *)v15 + 6) = v11;
    }
    else
    {
      figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__AVPlayerItem__setAudioCurvesAccordingToInputParameters_forTrackID___block_invoke;
      block[3] = &unk_1E3031988;
      block[5] = &v14;
      block[6] = v8;
      block[4] = v9;
      dispatch_sync(figPlaybackItemSetterQueue, block);
    }
    _Block_object_dispose(&v14, 8);
    CFRelease(v8);
  }
}

uint64_t __69__AVPlayerItem__setAudioCurvesAccordingToInputParameters_forTrackID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t FigBaseObject;
  uint64_t (*v4)(uint64_t, const __CFString *, uint64_t);
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v4 = *(uint64_t (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    result = v4(FigBaseObject, CFSTR("AudioCurves"), v2);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_setAudioProcessingEffectsAccordingToInputParameters:(id)a3 forTrackID:(int)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  OpaqueFigPlaybackItem *figPlaybackItem;
  void (*v15)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, void *);
  uint64_t FigBaseObject;
  void (*v17)(uint64_t, _QWORD, void *);
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = *(_QWORD *)&a4;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = (void *)objc_msgSend(a3, "effects", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        if (objc_msgSend(v13, "isMemberOfClass:", objc_opt_class()))
        {
          objc_msgSend(v7, "addObject:", objc_msgSend(v13, "_figIdentifier"));
          objc_msgSend(v7, "addObject:", objc_msgSend(v13, "_figAudioProperties"));
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }
  if (objc_msgSend(v7, "count"))
  {
    figPlaybackItem = self->_playerItem->figPlaybackItem;
    if ((_DWORD)v4)
    {
      v15 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, void *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 16)
                                                                                    + 112);
      if (v15)
        v15(figPlaybackItem, v4, *MEMORY[0x1E0CC5508], v7);
    }
    else
    {
      FigBaseObject = FigPlaybackItemGetFigBaseObject();
      v17 = *(void (**)(uint64_t, _QWORD, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
      if (v17)
        v17(FigBaseObject, *MEMORY[0x1E0CC5050], v7);
    }
  }
}

- (void)_setAudioTapProcessor:(opaqueMTAudioProcessingTap *)a3 forTrackID:(int)a4
{
  uint64_t v4;
  OpaqueFigPlaybackItem *figPlaybackItem;
  void (*v7)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, opaqueMTAudioProcessingTap *);

  v4 = *(_QWORD *)&a4;
  figPlaybackItem = self->_playerItem->figPlaybackItem;
  v7 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, opaqueMTAudioProcessingTap *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 112);
  if (v7)
    v7(figPlaybackItem, v4, *MEMORY[0x1E0CC5500], a3);
}

- (void)_setAudioTimePitchAlgorithm:(id)a3 forTrackID:(int)a4
{
  uint64_t v4;
  OpaqueFigPlaybackItem *figPlaybackItem;
  void (*v7)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, id);

  v4 = *(_QWORD *)&a4;
  figPlaybackItem = self->_playerItem->figPlaybackItem;
  v7 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                           + 112);
  if (v7)
    v7(figPlaybackItem, v4, *MEMORY[0x1E0CC5580], a3);
}

- (void)_setAudioEffectParameters:(id)a3 previousEffects:(id)a4 forTrackID:(int)a5
{
  uint64_t v5;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  OpaqueFigPlaybackItem *figPlaybackItem;
  void (*v19)(OpaqueFigPlaybackItem *, uint64_t, uint64_t, uint64_t);
  OpaqueFigPlaybackItem *v20;
  void *v21;
  float v22;
  uint64_t v23;
  void (*v24)(OpaqueFigPlaybackItem *, uint64_t, const __CFString *, uint64_t);
  OpaqueFigPlaybackItem *v25;
  uint64_t v26;
  const __CFString *v27;
  OpaqueFigPlaybackItem *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t j;
  uint64_t v35;
  OpaqueFigPlaybackItem *v36;
  void (*v37)(OpaqueFigPlaybackItem *, uint64_t, const __CFString *, uint64_t);
  OpaqueFigPlaybackItem *v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  uint64_t v42;
  OpaqueFigPlaybackItem *v43;
  const __CFString *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id obj;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[5];
  _QWORD v61[5];
  uint64_t v62;
  uint64_t v63;
  _BYTE v64[128];
  _QWORD v65[4];
  _QWORD v66[4];
  _BYTE v67[128];
  uint64_t v68;

  v5 = *(_QWORD *)&a5;
  v68 = *MEMORY[0x1E0C80C00];
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = MEMORY[0x1E0C809B0];
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __69__AVPlayerItem__setAudioEffectParameters_previousEffects_forTrackID___block_invoke;
  v61[3] = &unk_1E3031F00;
  v61[4] = v9;
  objc_msgSend(a4, "enumerateObjectsUsingBlock:", v61);
  v60[0] = v10;
  v60[1] = 3221225472;
  v60[2] = __69__AVPlayerItem__setAudioEffectParameters_previousEffects_forTrackID___block_invoke_2;
  v60[3] = &unk_1E3031F00;
  v51 = v9;
  v60[4] = v9;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v60);
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = a3;
  v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v57;
    v49 = *MEMORY[0x1E0CC5598];
    v48 = *MEMORY[0x1E0CC55A8];
    v47 = *MEMORY[0x1E0CC55A0];
    v46 = *MEMORY[0x1E0CC5590];
    v45 = *MEMORY[0x1E0CC5570];
    v44 = (const __CFString *)*MEMORY[0x1E0CC5578];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v57 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        if (objc_msgSend(v15, "isMemberOfClass:", objc_opt_class()))
        {
          v66[0] = MEMORY[0x1E0C9AAB0];
          v65[0] = v49;
          v65[1] = v48;
          v66[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "minimumCutOffFrequency"));
          v65[2] = v47;
          v66[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "maximumCutOffFrequency"));
          v65[3] = v46;
          v16 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v15, "bypassThreshold");
          v66[3] = objc_msgSend(v16, "numberWithFloat:");
          v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 4);
          figPlaybackItem = self->_playerItem->figPlaybackItem;
          v19 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                          + 112);
          if (v19)
            v19(figPlaybackItem, v5, v45, v17);
          v20 = self->_playerItem->figPlaybackItem;
          v21 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v15, "sweepValue", v44);
          v23 = objc_msgSend(v21, "numberWithDouble:", v22);
          v24 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 112);
          if (v24)
          {
            v25 = v20;
            v26 = v5;
            v27 = v44;
LABEL_14:
            v24(v25, v26, v27, v23);
            continue;
          }
        }
        else if (objc_msgSend(v15, "isMemberOfClass:", objc_opt_class()))
        {
          v28 = self->_playerItem->figPlaybackItem;
          v23 = objc_msgSend(v15, "data");
          v24 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 112);
          if (v24)
          {
            v25 = v28;
            v26 = v5;
            v27 = CFSTR("CinematicAudioParameters");
            goto LABEL_14;
          }
        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
    }
    while (v12);
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v29 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v64, 16, v44);
  if (!v29)
    return;
  v30 = v29;
  v31 = *(_QWORD *)v53;
  v32 = *MEMORY[0x1E0CC5598];
  v33 = (const __CFString *)*MEMORY[0x1E0CC5570];
  do
  {
    for (j = 0; j != v30; ++j)
    {
      if (*(_QWORD *)v53 != v31)
        objc_enumerationMutation(v51);
      v35 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
      if (v35 == objc_opt_class())
      {
        v62 = v32;
        v63 = MEMORY[0x1E0C9AAA0];
        v42 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
        v43 = self->_playerItem->figPlaybackItem;
        v37 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 112);
        if (!v37)
          continue;
        v38 = v43;
        v39 = v5;
        v40 = v33;
        v41 = v42;
        goto LABEL_28;
      }
      if (v35 == objc_opt_class())
      {
        v36 = self->_playerItem->figPlaybackItem;
        v37 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 112);
        if (v37)
        {
          v38 = v36;
          v39 = v5;
          v40 = CFSTR("CinematicAudioParameters");
          v41 = 0;
LABEL_28:
          v37(v38, v39, v40, v41);
          continue;
        }
      }
    }
    v30 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
  }
  while (v30);
}

uint64_t __69__AVPlayerItem__setAudioEffectParameters_previousEffects_forTrackID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_opt_class());
}

uint64_t __69__AVPlayerItem__setAudioEffectParameters_previousEffects_forTrackID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObject:", objc_opt_class());
}

- (void)setAudioMix:(AVAudioMix *)audioMix
{
  NSObject *ivarAccessQueue;
  void (*v6)(_QWORD);
  NSObject *v7;
  NSObject *v8;
  void (*v9[5])(_QWORD);
  _QWORD block[6];

  AVTelemetryGenerateID();
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v6 = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__AVPlayerItem_setAudioMix___block_invoke;
  block[3] = &unk_1E302FCE8;
  block[4] = audioMix;
  block[5] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayerItem _copyStateDispatchQueue](self, "_copyStateDispatchQueue");
  if (v7)
  {
    v8 = v7;
    v9[0] = v6;
    v9[1] = (void (*)(_QWORD))3221225472;
    v9[2] = (void (*)(_QWORD))__28__AVPlayerItem_setAudioMix___block_invoke_2;
    v9[3] = (void (*)(_QWORD))&unk_1E302FA10;
    v9[4] = (void (*)(_QWORD))self;
    AVSerializeOnQueueAsyncIfNecessary(v7, v9);
    dispatch_release(v8);
  }
}

uint64_t __28__AVPlayerItem_setAudioMix___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 264);
  if (*(void **)(result + 32) != v1)
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 32), "copy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 264) = result;
  }
  return result;
}

uint64_t __28__AVPlayerItem_setAudioMix___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyCurrentAudioMix");
}

- (void)_setDelayPreparingItemForTestingOnly:(double)a3
{
  OpaqueFigPlaybackItem *v5;
  NSObject *ivarAccessQueue;
  uint64_t v7;
  const void *Float64;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v10[6];
  _QWORD block[6];

  v5 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__AVPlayerItem__setDelayPreparingItemForTestingOnly___block_invoke;
  block[3] = &unk_1E302FE78;
  block[4] = self;
  *(double *)&block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (v5)
  {
    Float64 = (const void *)FigCFNumberCreateFloat64();
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __53__AVPlayerItem__setDelayPreparingItemForTestingOnly___block_invoke_2;
    v10[3] = &__block_descriptor_48_e5_v8__0l;
    v10[4] = v5;
    v10[5] = Float64;
    dispatch_sync(figPlaybackItemSetterQueue, v10);
    if (Float64)
      CFRelease(Float64);
    CFRelease(v5);
  }
}

double __53__AVPlayerItem__setDelayPreparingItemForTestingOnly___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1448) = result;
  return result;
}

uint64_t __53__AVPlayerItem__setDelayPreparingItemForTestingOnly___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);

  v1 = *(_QWORD *)(a1 + 40);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
    return v4(FigBaseObject, *MEMORY[0x1E0CC5030], v1);
  return result;
}

- (double)_delayPreparingItemForTestingOnly
{
  OpaqueFigPlaybackItem *v3;
  NSObject *figPlaybackItemAccessorQueue;
  const void *v5;
  double v6;
  _QWORD block[7];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  figPlaybackItemAccessorQueue = self->_playerItem->figPlaybackItemAccessorQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AVPlayerItem__delayPreparingItemForTestingOnly__block_invoke;
  block[3] = &unk_1E3031F48;
  block[5] = &v9;
  block[6] = v3;
  block[4] = &v13;
  dispatch_sync(figPlaybackItemAccessorQueue, block);
  if (v3)
    CFRelease(v3);
  v5 = (const void *)v14[3];
  if (v5)
    CFRelease(v5);
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

uint64_t __49__AVPlayerItem__delayPreparingItemForTestingOnly__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t FigBaseObject;
  void (*v4)(uint64_t, _QWORD, _QWORD, uint64_t);
  uint64_t result;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v4 = *(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v4)
    v4(FigBaseObject, *MEMORY[0x1E0CC5030], *MEMORY[0x1E0C9AE00], v2 + 24);
  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (result)
  {
    result = FigCFNumberGetFloat64();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  }
  return result;
}

- (AVVideoComposition)videoComposition
{
  AVVideoComposition *v4;

  AVTelemetryGenerateID();
  v4 = 0;
  -[AVPlayerItem _getVideoComposition:customVideoCompositorSession:figVideoCompositor:](self, "_getVideoComposition:customVideoCompositorSession:figVideoCompositor:", &v4, 0, 0);
  return v4;
}

- (void)_applyCurrentVideoComposition
{
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v4;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, _QWORD, __CFDictionary *);
  void *value;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  CGSize v15;

  v14 = 0;
  v12 = 0;
  v13 = 0;
  v10 = 0;
  v11 = 0;
  value = 0;
  v9 = 0;
  if (self->_playerItem->figPlaybackItem)
  {
    -[AVPlayerItem _getVideoComposition:customVideoCompositorSession:figVideoCompositor:](self, "_getVideoComposition:customVideoCompositorSession:figVideoCompositor:", &v14, &v13, &value);
    objc_msgSend(v14, "videoCompositionOutputColorPropertiesWithCustomCompositor:formatDescriptions:colorPrimaries:transferFunction:yCbCrMatrix:perFrameHDRDisplayMetadataPolicy:", v13, -[AVPlayerItem _enabledTrackFormatDescriptions](self, "_enabledTrackFormatDescriptions"), &v12, &v11, &v10, &v9);
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (Mutable)
    {
      v4 = Mutable;
      if (v14)
        objc_msgSend(v14, "frameDuration");
      FigCFDictionarySetCMTime();
      objc_msgSend(v14, "sourceTrackIDForFrameTiming");
      FigCFDictionarySetInt32();
      objc_msgSend(v14, "renderSize");
      DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v15);
      FigCFDictionarySetValue();
      objc_msgSend(v14, "renderScale");
      FigCFDictionarySetFloat();
      FigCFDictionarySetValue();
      FigCFDictionarySetValue();
      FigCFDictionarySetValue();
      objc_msgSend(v9, "isEqual:", CFSTR("PerFrameHDRDisplayMetadataPolicy_Generate"));
      FigCFDictionarySetValue();
      objc_msgSend(v14, "_serializableInstructions");
      FigCFDictionarySetValue();
      objc_msgSend(v14, "sourceSampleDataTrackIDs");
      FigCFDictionarySetValue();
      AVVideoCompositionSerializeSourceTrackWindows((void *)objc_msgSend(v14, "sourceVideoTrackWindowsForTrackIDs"));
      FigCFDictionarySetValue();
      AVVideoCompositionSerializeSourceTrackWindows((void *)objc_msgSend(v14, "sourceSampleDataTrackWindowsForTrackIDs"));
      FigCFDictionarySetValue();
      CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E0CC53B8], value);
      FigBaseObject = FigPlaybackItemGetFigBaseObject();
      v7 = *(void (**)(uint64_t, _QWORD, __CFDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
      if (v7)
        v7(FigBaseObject, *MEMORY[0x1E0CC53B0], v4);
      CFRelease(v4);
      if (DictionaryRepresentation)
        CFRelease(DictionaryRepresentation);
    }
  }
  if (value)
    CFRelease(value);
}

- (void)setVideoComposition:(AVVideoComposition *)videoComposition
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *ivarAccessQueue;
  void (*v12)(_QWORD);
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  void (*v19[5])(_QWORD);
  _QWORD block[7];
  const __CFString *v21;
  const __CFString **v22;
  uint64_t v23;
  char v24;

  AVTelemetryGenerateID();
  if (videoComposition)
  {
    v21 = 0;
    if (-[AVVideoComposition _isValidReturningExceptionReason:](videoComposition, "_isValidReturningExceptionReason:", &v21))
    {
      if (!-[AVVideoComposition animationTool](videoComposition, "animationTool"))
        goto LABEL_4;
      v15 = (void *)MEMORY[0x1E0C99DA0];
      v16 = *MEMORY[0x1E0C99778];
      v17 = CFSTR("AVVideoCompositions using AVVideoCompositionCoreAnimationTool cannot be used with AVPlayerItem. AVVideoCompositionCoreAnimationTool is for offline rendering only.");
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0C99DA0];
      v16 = *MEMORY[0x1E0C99778];
      v17 = v21;
    }
    v18 = (void *)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v17, v6, v7, v8, v9, v10, (uint64_t)v19[0]), 0);
    objc_exception_throw(v18);
  }
LABEL_4:
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v12 = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__AVPlayerItem_setVideoComposition___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = videoComposition;
  block[6] = &v21;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v22 + 24))
  {
    v13 = -[AVPlayerItem _copyStateDispatchQueue](self, "_copyStateDispatchQueue");
    v14 = v13;
    if (v13)
    {
      v19[0] = v12;
      v19[1] = (void (*)(_QWORD))3221225472;
      v19[2] = __36__AVPlayerItem_setVideoComposition___block_invoke_2;
      v19[3] = (void (*)(_QWORD))&unk_1E302FA10;
      v19[4] = (void (*)(_QWORD))self;
      AVSerializeOnQueueAsyncIfNecessary(v13, v19);
      dispatch_release(v14);
    }
  }
  _Block_object_dispose(&v21, 8);
}

id __36__AVPlayerItem_setVideoComposition___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id result;
  uint64_t v4;
  const void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1272), "referencedObject") != *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    || (v2 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1272), "referencedObject"), "_changeSeed"), result = (id)objc_msgSend(*(id *)(a1 + 40), "_changeSeed"), (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2 != (_QWORD)result) != 0))
  {

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1264) = objc_msgSend(*(id *)(a1 + 40), "_deepCopy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1272) = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 1264));
    v7 = 0;
    v8 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1264), "_copyFigVideoCompositor:andSession:recyclingSession:forFigRemaker:error:", &v8, &v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1280), 0, 0);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(const void **)(v4 + 1288);
    if (v5)
    {
      CFRelease(v5);
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    }
    *(_QWORD *)(v4 + 1288) = v8;
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1280);
    if (v6 != v7)
    {
      objc_msgSend(v6, "detachVideoComposition");
      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1280);
    }
    result = v6;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1280) = v7;
  }
  return result;
}

void __36__AVPlayerItem_setVideoComposition___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  CFTypeRef cf;
  id v5;
  uint64_t v6;

  v2 = *(_QWORD **)(a1 + 32);
  if (*(_QWORD *)(v2[1] + 120))
  {
    v5 = 0;
    v6 = 0;
    cf = 0;
    objc_msgSend(v2, "_getVideoComposition:customVideoCompositorSession:figVideoCompositor:", &v6, &v5, &cf);
    if (v6)
    {
      v3 = 0;
      if (v5 && !objc_msgSend(v5, "commitCustomVideoCompositorPropertiesAndReturnError:", &v3))
        objc_msgSend(*(id *)(a1 + 32), "_changeStatusToFailedWithError:", v3);
      else
        objc_msgSend(*(id *)(a1 + 32), "_applyCurrentVideoComposition", v3);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_setVideoCompositionInstructions:", 0);
      objc_msgSend(*(id *)(a1 + 32), "_setVideoCompositor:", cf);
    }
    if (cf)
      CFRelease(cf);
  }
}

- (void)_setVideoCompositionFrameDuration:(id *)a3
{
  const __CFAllocator *v3;
  CFDictionaryRef v4;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, _QWORD, CFDictionaryRef);
  CMTime v7;

  if (self->_playerItem->figPlaybackItem)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v7 = *(CMTime *)a3;
    v4 = CMTimeCopyAsDictionary(&v7, v3);
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v6 = *(void (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v6)
      v6(FigBaseObject, *MEMORY[0x1E0CC53D8], v4);
    CFRelease(v4);
  }
}

- (void)_setVideoCompositionSourceTrackIDForFrameTiming:(int)a3
{
  uint64_t v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, uint64_t);

  if (self->_playerItem->figPlaybackItem)
  {
    v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v5 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v5)
      v5(FigBaseObject, *MEMORY[0x1E0CC5408], v3);
  }
}

- (void)_setVideoCompositionRenderSize:(CGSize)a3
{
  CFDictionaryRef DictionaryRepresentation;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, CFDictionaryRef);

  if (self->_playerItem->figPlaybackItem)
  {
    DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(a3);
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v5 = *(void (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v5)
      v5(FigBaseObject, *MEMORY[0x1E0CC53E8], DictionaryRepresentation);
    CFRelease(DictionaryRepresentation);
  }
}

- (void)_setVideoCompositionRenderScale:(float)a3
{
  CFNumberRef v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, CFNumberRef);
  float valuePtr;

  valuePtr = a3;
  if (self->_playerItem->figPlaybackItem)
  {
    v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberFloatType, &valuePtr);
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v5 = *(void (**)(uint64_t, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v5)
      v5(FigBaseObject, *MEMORY[0x1E0CC53F0], v3);
    CFRelease(v3);
  }
}

- (void)_setVideoCompositionColorPrimaries:(id)a3
{
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, id);

  if (self->_playerItem->figPlaybackItem)
  {
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v5 = *(void (**)(uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v5)
      v5(FigBaseObject, *MEMORY[0x1E0CC53C0], a3);
  }
}

- (void)_setVideoCompositionColorYCbCrMatrix:(id)a3
{
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, id);

  if (self->_playerItem->figPlaybackItem)
  {
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v5 = *(void (**)(uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v5)
      v5(FigBaseObject, *MEMORY[0x1E0CC53D0], a3);
  }
}

- (void)_setVideoCompositionColorTransferFunction:(id)a3
{
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, id);

  if (self->_playerItem->figPlaybackItem)
  {
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v5 = *(void (**)(uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v5)
      v5(FigBaseObject, *MEMORY[0x1E0CC53C8], a3);
  }
}

- (void)_setVideoCompositionHDRDisplayMetadataPolicy:(id)a3
{
  int v3;
  uint64_t v4;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, uint64_t, _QWORD);
  _QWORD *v7;

  if (self->_playerItem->figPlaybackItem)
  {
    v3 = objc_msgSend(a3, "isEqual:", CFSTR("PerFrameHDRDisplayMetadataPolicy_Generate"));
    v4 = *MEMORY[0x1E0CC53E0];
    if (v3)
    {
      FigBaseObject = FigPlaybackItemGetFigBaseObject();
      v6 = *(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
      if (!v6)
        return;
      v7 = (_QWORD *)MEMORY[0x1E0CC6290];
    }
    else
    {
      FigBaseObject = FigPlaybackItemGetFigBaseObject();
      v6 = *(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
      if (!v6)
        return;
      v7 = (_QWORD *)MEMORY[0x1E0CC6298];
    }
    v6(FigBaseObject, v4, *v7);
  }
}

- (void)_setVideoCompositionInstructions:(id)a3
{
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, id);

  if (self->_playerItem->figPlaybackItem)
  {
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v5 = *(void (**)(uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v5)
      v5(FigBaseObject, *MEMORY[0x1E0CC53A8], a3);
  }
}

- (void)_setVideoCompositionSourceSampleDataTrackIDs:(id)a3
{
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, id);

  if (self->_playerItem->figPlaybackItem)
  {
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v5 = *(void (**)(uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v5)
      v5(FigBaseObject, *MEMORY[0x1E0CC53F8], a3);
  }
}

- (void)_setVideoCompositor:(void *)a3
{
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, void *);

  if (self->_playerItem->figPlaybackItem)
  {
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v5 = *(void (**)(uint64_t, _QWORD, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v5)
      v5(FigBaseObject, *MEMORY[0x1E0CC53B8], a3);
  }
}

- (id)customVideoCompositor
{
  id v4;

  AVTelemetryGenerateID();
  v4 = 0;
  -[AVPlayerItem _getVideoComposition:customVideoCompositorSession:figVideoCompositor:](self, "_getVideoComposition:customVideoCompositorSession:figVideoCompositor:", 0, &v4, 0);
  return (id)objc_msgSend(v4, "customVideoCompositor");
}

- (void)setSeekingWaitsForVideoCompositionRendering:(BOOL)seekingWaitsForVideoCompositionRendering
{
  NSObject *ivarAccessQueue;
  _QWORD block[6];
  BOOL v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__AVPlayerItem_setSeekingWaitsForVideoCompositionRendering___block_invoke;
  block[3] = &unk_1E3031820;
  v6 = seekingWaitsForVideoCompositionRendering;
  block[4] = self;
  block[5] = &v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v8 + 24))
    -[AVPlayerItem _updateSeekingWaitsForVideoCompositionRenderingOnFigPlaybackItem](self, "_updateSeekingWaitsForVideoCompositionRenderingOnFigPlaybackItem");
  _Block_object_dispose(&v7, 8);
}

uint64_t __60__AVPlayerItem_setSeekingWaitsForVideoCompositionRendering___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(result + 48);
  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (v1 != *(unsigned __int8 *)(v2 + 484))
  {
    *(_BYTE *)(v2 + 484) = v1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)_updateUsesMinimalLatencyForVideoCompositionRenderingOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __86__AVPlayerItem__updateUsesMinimalLatencyForVideoCompositionRenderingOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __86__AVPlayerItem__updateUsesMinimalLatencyForVideoCompositionRenderingOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "usesMinimalLatencyForVideoCompositionRendering");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC5398], v5);
  }
  return result;
}

- (void)setUsesMinimalLatencyForVideoCompositionRendering:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  _QWORD block[6];
  BOOL v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__AVPlayerItem_setUsesMinimalLatencyForVideoCompositionRendering___block_invoke;
  block[3] = &unk_1E3031820;
  v6 = a3;
  block[4] = self;
  block[5] = &v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v8 + 24))
    -[AVPlayerItem _updateUsesMinimalLatencyForVideoCompositionRenderingOnFigPlaybackItem](self, "_updateUsesMinimalLatencyForVideoCompositionRenderingOnFigPlaybackItem");
  _Block_object_dispose(&v7, 8);
}

uint64_t __66__AVPlayerItem_setUsesMinimalLatencyForVideoCompositionRendering___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 824) != v2)
  {
    *(_BYTE *)(v1 + 824) = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

+ (BOOL)automaticallyNotifiesObserversOfUsesMinimalLatencyForVideoCompositionRendering
{
  return 0;
}

- (void)_updateTextHighlightArrayOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __58__AVPlayerItem__updateTextHighlightArrayOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __58__AVPlayerItem__updateTextHighlightArrayOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);

  v1 = objc_msgSend(*(id *)(a1 + 32), "textHighlightArray");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
    return v4(FigBaseObject, *MEMORY[0x1E0CC5348], v1);
  return result;
}

- (void)setTextStyleRules:(NSArray *)textStyleRules
{
  NSObject *ivarAccessQueue;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__AVPlayerItem_setTextStyleRules___block_invoke;
  block[3] = &unk_1E302FE00;
  block[4] = textStyleRules;
  block[5] = self;
  block[6] = &v6;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v7 + 24))
    -[AVPlayerItem _updateTextStyleRulesOnFigPlaybackItem](self, "_updateTextStyleRulesOnFigPlaybackItem");
  _Block_object_dispose(&v6, 8);
}

uint64_t __34__AVPlayerItem_setTextStyleRules___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 488);
  if (*(void **)(result + 32) != v1)
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 32), "copy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 488) = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)setTextHighlightArray:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AVPlayerItem_setTextHighlightArray___block_invoke;
  block[3] = &unk_1E302FE00;
  block[4] = self;
  block[5] = a3;
  block[6] = &v6;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v7 + 24))
    -[AVPlayerItem _updateTextHighlightArrayOnFigPlaybackItem](self, "_updateTextHighlightArrayOnFigPlaybackItem");
  _Block_object_dispose(&v6, 8);
}

uint64_t __38__AVPlayerItem_setTextHighlightArray___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 496);
  if (v1 != *(void **)(result + 40))
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 40), "copy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 496) = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (float)progressTowardsPlaybackLikelyToKeepUp
{
  OpaqueFigPlaybackItem *v2;
  OpaqueFigPlaybackItem *v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, _QWORD, CFNumberRef *);
  CFNumberRef number;
  float valuePtr;

  valuePtr = 0.0;
  v2 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (!v2)
    return 0.0;
  v3 = v2;
  number = 0;
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v5 = *(void (**)(uint64_t, _QWORD, _QWORD, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v5)
  {
    v5(FigBaseObject, *MEMORY[0x1E0CC5240], *MEMORY[0x1E0C9AE00], &number);
    if (number)
    {
      CFNumberGetValue(number, kCFNumberFloatType, &valuePtr);
      CFRelease(number);
    }
  }
  CFRelease(v3);
  return valuePtr;
}

- (BOOL)startsOnFirstEligibleVariant
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__AVPlayerItem_startsOnFirstEligibleVariant__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__AVPlayerItem_startsOnFirstEligibleVariant__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                             + 584) == 1;
  return result;
}

- (void)_updateStartsOnFirstEligibleVariantOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__AVPlayerItem__updateStartsOnFirstEligibleVariantOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __68__AVPlayerItem__updateStartsOnFirstEligibleVariantOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "startsOnFirstEligibleVariant");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC5308], v5);
  }
  return result;
}

- (void)setStartsOnFirstEligibleVariant:(BOOL)startsOnFirstEligibleVariant
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__AVPlayerItem_setStartsOnFirstEligibleVariant___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = startsOnFirstEligibleVariant;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateStartsOnFirstEligibleVariantOnFigPlaybackItem](self, "_updateStartsOnFirstEligibleVariantOnFigPlaybackItem");
}

uint64_t __48__AVPlayerItem_setStartsOnFirstEligibleVariant___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 584) = *(unsigned __int8 *)(result + 40);
  return result;
}

- (id)playabilityMetrics
{
  id result;
  id v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, _QWORD, id *);
  id v6;
  id v7;

  v7 = 0;
  result = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (result)
  {
    v3 = result;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v5 = *(void (**)(uint64_t, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v5)
    {
      v5(FigBaseObject, *MEMORY[0x1E0CC5218], *MEMORY[0x1E0C9AE00], &v7);
      if (v7)
        v6 = v7;
    }
    CFRelease(v3);
    return v7;
  }
  return result;
}

- (id)_seekableTimeRanges
{
  OpaqueFigPlaybackItem *v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  CFTypeRef v6;
  id v7;
  CFTypeRef cf;

  cf = 0;
  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3
    && (-[AVPlayerItem _isReadyForBasicInspection](self, "_isReadyForBasicInspection")
     || -[AVPlayerItem _isReadyForInspectionOfDuration](self, "_isReadyForInspectionOfDuration")
     || sOKToBlockWhenGettingValuesOfProperties == 1)
    && (FigBaseObject = FigPlaybackItemGetFigBaseObject(),
        (v5 = *(void (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48)) != 0))
  {
    v5(FigBaseObject, *MEMORY[0x1E0CC52D0], *MEMORY[0x1E0C9AE00], &cf);
    v6 = cf;
  }
  else
  {
    v6 = 0;
  }
  v7 = -[AVPlayerItem _seekableTimeRangesFromFPSeekableTimeIntervals:](self, "_seekableTimeRangesFromFPSeekableTimeIntervals:", v6);
  if (cf)
    CFRelease(cf);
  if (v3)
    CFRelease(v3);
  return v7;
}

- (double)seekableTimeRangesLastModifiedTime
{
  NSObject *ivarAccessQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__AVPlayerItem_seekableTimeRangesLastModifiedTime__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __50__AVPlayerItem_seekableTimeRangesLastModifiedTime__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 992);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_loadedTimeRanges
{
  OpaqueFigPlaybackItem *v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  CFTypeRef v6;
  id v7;
  CFTypeRef cf;

  cf = 0;
  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3
    && (FigBaseObject = FigPlaybackItemGetFigBaseObject(),
        (v5 = *(void (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48)) != 0))
  {
    v5(FigBaseObject, *MEMORY[0x1E0CC5220], *MEMORY[0x1E0C9AE00], &cf);
    v6 = cf;
  }
  else
  {
    v6 = 0;
  }
  v7 = -[AVPlayerItem _loadedTimeRangesFromFPPlaybableTimeIntervals:](self, "_loadedTimeRangesFromFPPlaybableTimeIntervals:", v6);
  if (cf)
    CFRelease(cf);
  if (v3)
    CFRelease(v3);
  return v7;
}

- (void)setGaplessInfo:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__AVPlayerItem_setGaplessInfo___block_invoke;
  block[3] = &unk_1E302FE00;
  block[4] = a3;
  block[5] = self;
  block[6] = &v6;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v7 + 24))
    -[AVPlayerItem _updatePlaybackPropertiesOnFigPlaybackItem](self, "_updatePlaybackPropertiesOnFigPlaybackItem");
  _Block_object_dispose(&v6, 8);
}

uint64_t __31__AVPlayerItem_setGaplessInfo___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 640);
  if (*(void **)(result + 32) != v1)
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 32), "copy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 640) = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (id)configurationGroup
{
  const __CFString *v2;
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, _QWORD, _QWORD, const __CFString **);
  const __CFString *v8;

  v2 = CFSTR("Default");
  v8 = CFSTR("Default");
  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v6 = *(void (**)(uint64_t, _QWORD, _QWORD, const __CFString **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
    if (v6)
      v6(FigBaseObject, *MEMORY[0x1E0CC50D8], *MEMORY[0x1E0C9AE00], &v8);
    CFRelease(v4);
    return (id)v8;
  }
  return (id)v2;
}

- (int64_t)variantIndex
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  uint64_t FigBaseObject;
  unsigned int (*v6)(uint64_t, _QWORD, _QWORD, CFNumberRef *);
  BOOL v7;
  CFNumberRef number;
  int64_t valuePtr;

  valuePtr = -1;
  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    number = 0;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v6 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                               + 48);
    if (v6)
    {
      if (v6(FigBaseObject, *MEMORY[0x1E0CC5250], *MEMORY[0x1E0C9AE00], &number))
        v7 = 1;
      else
        v7 = number == 0;
      if (!v7)
      {
        CFNumberGetValue(number, kCFNumberNSIntegerType, &valuePtr);
        CFRelease(number);
      }
    }
    CFRelease(v4);
    return valuePtr;
  }
  else if ((uint64_t)self->_playerItem->rampInOutInfo < 0)
  {
    return -1;
  }
  else
  {
    return (int64_t)self->_playerItem->rampInOutInfo;
  }
}

- (double)liveUpdateInterval
{
  OpaqueFigPlaybackItem *v2;
  OpaqueFigPlaybackItem *v3;
  uint64_t FigBaseObject;
  unsigned int (*v5)(uint64_t, _QWORD, _QWORD, CFNumberRef *);
  BOOL v6;
  CFNumberRef number;
  double valuePtr;

  valuePtr = 0.0;
  v2 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (!v2)
    return 0.0;
  v3 = v2;
  number = 0;
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v5 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
  if (v5)
  {
    if (v5(FigBaseObject, *MEMORY[0x1E0CC51B8], *MEMORY[0x1E0C9AE00], &number))
      v6 = 1;
    else
      v6 = number == 0;
    if (!v6)
    {
      CFNumberGetValue(number, kCFNumberDoubleType, &valuePtr);
      CFRelease(number);
    }
  }
  CFRelease(v3);
  return valuePtr;
}

- (void)_quietlySetVariantIndex:(int64_t)a3
{
  CFNumberRef v3;
  CFNumberRef v4;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, _QWORD, CFNumberRef);
  int64_t valuePtr;

  valuePtr = a3;
  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberNSIntegerType, &valuePtr);
  if (v3)
  {
    v4 = v3;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v6 = *(void (**)(uint64_t, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v6)
      v6(FigBaseObject, *MEMORY[0x1E0CC5250], v4);
    CFRelease(v4);
  }
}

- (void)setVariantIndex:(int64_t)a3
{
  AVPlayerItemInternal *playerItem;

  if ((a3 & 0x8000000000000000) == 0)
  {
    playerItem = self->_playerItem;
    if (playerItem->figPlaybackItem)
      -[AVPlayerItem _quietlySetVariantIndex:](self, "_quietlySetVariantIndex:");
    else
      playerItem->rampInOutInfo = (NSDictionary *)a3;
  }
}

+ (BOOL)automaticallyNotifiesObserversOfVariantIndex
{
  return 0;
}

- (id)currentStableVariantID
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__AVPlayerItem_currentStableVariantID__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__AVPlayerItem_currentStableVariantID__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1352), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setSoundCheckVolumeNormalization:(float)a3
{
  NSObject *ivarAccessQueue;
  _QWORD block[6];
  float v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AVPlayerItem_setSoundCheckVolumeNormalization___block_invoke;
  block[3] = &unk_1E3032018;
  v6 = a3;
  block[4] = self;
  block[5] = &v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v8 + 24))
    -[AVPlayerItem _updateSoundCheckVolumeNormalizationOnFigPlaybackItem](self, "_updateSoundCheckVolumeNormalizationOnFigPlaybackItem");
  _Block_object_dispose(&v7, 8);
}

uint64_t __49__AVPlayerItem_setSoundCheckVolumeNormalization___block_invoke(uint64_t result)
{
  float v1;
  uint64_t v2;

  v1 = *(float *)(result + 48);
  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (v1 != *(float *)(v2 + 648))
  {
    *(float *)(v2 + 648) = v1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)setVolumeAdjustment:(float)a3
{
  NSObject *ivarAccessQueue;
  _QWORD block[6];
  float v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__AVPlayerItem_setVolumeAdjustment___block_invoke;
  block[3] = &unk_1E3032018;
  v6 = a3;
  block[4] = self;
  block[5] = &v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v8 + 24))
    -[AVPlayerItem _updateVolumeAdjustmentOnFigPlaybackItem](self, "_updateVolumeAdjustmentOnFigPlaybackItem");
  _Block_object_dispose(&v7, 8);
}

uint64_t __36__AVPlayerItem_setVolumeAdjustment___block_invoke(uint64_t result)
{
  float v1;
  uint64_t v2;

  v1 = *(float *)(result + 48);
  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (v1 != *(float *)(v2 + 652))
  {
    *(float *)(v2 + 652) = v1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)_updateAdjustTargetLevelOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__AVPlayerItem__updateAdjustTargetLevelOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __57__AVPlayerItem__updateAdjustTargetLevelOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  CFNumberRef v2;
  CFNumberRef v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, CFNumberRef);
  int valuePtr;

  objc_msgSend(*(id *)(a1 + 32), "adjustTargetLevel");
  valuePtr = v1;
  v2 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberFloat32Type, &valuePtr);
  if (v2)
  {
    v3 = v2;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v5 = *(void (**)(uint64_t, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v5)
      v5(FigBaseObject, *MEMORY[0x1E0CC4FF0], v3);
    CFRelease(v3);
  }
}

- (void)setAdjustTargetLevel:(float)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  float v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__AVPlayerItem_setAdjustTargetLevel___block_invoke;
  v5[3] = &unk_1E30317D0;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateAdjustTargetLevelOnFigPlaybackItem](self, "_updateAdjustTargetLevelOnFigPlaybackItem");
}

float __37__AVPlayerItem_setAdjustTargetLevel___block_invoke(uint64_t a1)
{
  float result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 672) = 1;
  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 676) = result;
  return result;
}

- (float)adjustTargetLevel
{
  NSObject *ivarAccessQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__AVPlayerItem_adjustTargetLevel__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __33__AVPlayerItem_adjustTargetLevel__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 676);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_updateAdjustCompressionProfileOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __64__AVPlayerItem__updateAdjustCompressionProfileOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __64__AVPlayerItem__updateAdjustCompressionProfileOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  CFNumberRef v1;
  CFNumberRef v2;
  uint64_t FigBaseObject;
  void (*v4)(uint64_t, _QWORD, CFNumberRef);
  int valuePtr;

  valuePtr = objc_msgSend(*(id *)(a1 + 32), "adjustCompressionProfile");
  v1 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
  if (v1)
  {
    v2 = v1;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v4 = *(void (**)(uint64_t, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v4)
      v4(FigBaseObject, *MEMORY[0x1E0CC4FE8], v2);
    CFRelease(v2);
  }
}

- (void)setAdjustCompressionProfile:(unsigned int)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  unsigned int v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__AVPlayerItem_setAdjustCompressionProfile___block_invoke;
  v5[3] = &unk_1E30317D0;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateAdjustCompressionProfileOnFigPlaybackItem](self, "_updateAdjustCompressionProfileOnFigPlaybackItem");
}

uint64_t __44__AVPlayerItem_setAdjustCompressionProfile___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 680) = 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 684) = *(_DWORD *)(result + 40);
  return result;
}

- (unsigned)adjustCompressionProfile
{
  NSObject *ivarAccessQueue;
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__AVPlayerItem_adjustCompressionProfile__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__AVPlayerItem_adjustCompressionProfile__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 684);
  return result;
}

- (id)_mediaOptionsSelectedByClientForKey:(id)a3
{
  NSObject *ivarAccessQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  v12 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AVPlayerItem__mediaOptionsSelectedByClientForKey___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __52__AVPlayerItem__mediaOptionsSelectedByClientForKey___block_invoke(_QWORD *a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 1360), "objectForKey:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

- (void)_removeMediaOptionsSelectedByClient
{
  NSObject *ivarAccessQueue;
  _QWORD block[5];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__AVPlayerItem__removeMediaOptionsSelectedByClient__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

uint64_t __51__AVPlayerItem__removeMediaOptionsSelectedByClient__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1360), "removeAllObjects");
}

- (void)_clearCachedMediaSelectionGroup:(id)a3
{
  -[AVPlayerItem _setMediaOptionsSelectedByClient:forKey:](self, "_setMediaOptionsSelectedByClient:forKey:", 0, a3);
}

- (BOOL)_hasSelectionInCachedMediaSelectionGroup:(id)a3
{
  return -[AVPlayerItem _mediaOptionsSelectedByClientForKey:](self, "_mediaOptionsSelectedByClientForKey:", a3) != 0;
}

- (id)_propertyListForSelectedMediaOptionUsingFigSelectedMediaArrayObtainedFromGroup:(id)a3
{
  OpaqueFigPlaybackItem *v4;
  uint64_t FigBaseObject;
  unsigned int (*v6)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CFTypeRef cf;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  cf = 0;
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v6 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (v6
    && !v6(FigBaseObject, *MEMORY[0x1E0CC52E0], *MEMORY[0x1E0C9AE00], &cf)
    && (v19 = 0u,
        v20 = 0u,
        v17 = 0u,
        v18 = 0u,
        v7 = (void *)cf,
        (v8 = objc_msgSend((id)cf, "countByEnumeratingWithState:objects:count:", &v17, v22, 16)) != 0))
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = *MEMORY[0x1E0CC5E98];
    v12 = *MEMORY[0x1E0CC5E88];
LABEL_5:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
      if (objc_msgSend(a3, "_matchesGroupID:mediaType:", objc_msgSend(v14, "objectForKey:", v12), objc_msgSend(v14, "objectForKey:", v11)))break;
      if (v9 == ++v13)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        v15 = 0;
        if (v9)
          goto LABEL_5;
        goto LABEL_13;
      }
    }
    v15 = v14;
    if (v4)
      goto LABEL_14;
  }
  else
  {
    v15 = 0;
LABEL_13:
    if (v4)
LABEL_14:
      CFRelease(v4);
  }
  if (cf)
    CFRelease(cf);
  return v15;
}

- (void)selectMediaOptionAutomaticallyInMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD block[6];
  os_log_type_t type;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  AVTelemetryGenerateID();
  if (-[AVAsset isEqual:](-[AVPlayerItem asset](self, "asset"), "isEqual:", -[AVMediaSelectionGroup asset](mediaSelectionGroup, "asset")))
  {
    if (dword_1ECDECE98)
    {
      v9 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__AVPlayerItem_selectMediaOptionAutomaticallyInMediaSelectionGroup___block_invoke;
    block[3] = &unk_1E302FCE8;
    block[4] = self;
    block[5] = mediaSelectionGroup;
    dispatch_sync(figPlaybackItemSetterQueue, block);
  }
}

void __68__AVPlayerItem_selectMediaOptionAutomaticallyInMediaSelectionGroup___block_invoke(uint64_t a1)
{
  const void *v2;
  _QWORD *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t FigBaseObject;
  void (*v9)(uint64_t, _QWORD, uint64_t);
  _QWORD block[5];

  v2 = (const void *)objc_msgSend(*(id *)(a1 + 32), "_copyFigPlaybackItem");
  v3 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    v4 = *(NSObject **)(v3[1] + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__AVPlayerItem_selectMediaOptionAutomaticallyInMediaSelectionGroup___block_invoke_2;
    block[3] = &unk_1E302FA10;
    block[4] = v3;
    av_readwrite_dispatch_queue_write(v4, block);
    v5 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_propertyListForMediaSelection:forGroup:", 0, *(_QWORD *)(a1 + 40)), "mutableCopy");
    v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    objc_msgSend(v5, "setObject:forKey:", v6, *MEMORY[0x1E0CC5458]);
    v7 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v5);
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v9 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v9)
      v9(FigBaseObject, *MEMORY[0x1E0CC52E0], v7);
    objc_msgSend(*(id *)(a1 + 32), "_clearCachedMediaSelectionGroup:", *(_QWORD *)(a1 + 40));
    CFRelease(v2);
  }
  else
  {
    objc_msgSend(v3, "_clearCachedMediaSelectionGroup:", *(_QWORD *)(a1 + 40));
  }
}

void __68__AVPlayerItem_selectMediaOptionAutomaticallyInMediaSelectionGroup___block_invoke_2(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1072) = 0;
}

- (BOOL)playerAppliesAutomaticMediaSelectionToGroup:(id)a3
{
  id v5;

  if (!-[AVAsset isEqual:](-[AVPlayerItem asset](self, "asset"), "isEqual:", objc_msgSend(a3, "asset")))
    return 0;
  if (-[AVPlayerItem _isFigAssetReadyForInspectionOfMediaSelectionOptionsAndFigPlaybackItemIsReadyForInspection](self, "_isFigAssetReadyForInspectionOfMediaSelectionOptionsAndFigPlaybackItemIsReadyForInspection"))
  {
    v5 = -[AVPlayerItem _propertyListForSelectedMediaOptionUsingFigSelectedMediaArrayObtainedFromGroup:](self, "_propertyListForSelectedMediaOptionUsingFigSelectedMediaArrayObtainedFromGroup:", a3);
    return objc_msgSend((id)objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CC5460]), "BOOLValue");
  }
  if (!-[AVPlayerItem _hasSelectionInCachedMediaSelectionGroup:](self, "_hasSelectionInCachedMediaSelectionGroup:", a3))
    return objc_msgSend(-[AVPlayerItem _player](self, "_player"), "appliesMediaSelectionCriteriaAutomatically");
  else
    return 0;
}

- (AVMediaSelectionOption)selectedMediaOptionInMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup
{
  AVMediaSelectionOption *v5;
  AVMediaSelectionOption *v7;
  AVMediaSelectionOption *v8;

  if (!-[AVAsset isEqual:](-[AVPlayerItem asset](self, "asset"), "isEqual:", -[AVMediaSelectionGroup asset](mediaSelectionGroup, "asset")))return 0;
  if (-[AVPlayerItem _isFigAssetReadyForInspectionOfMediaSelectionOptionsAndFigPlaybackItemIsReadyForInspection](self, "_isFigAssetReadyForInspectionOfMediaSelectionOptionsAndFigPlaybackItemIsReadyForInspection"))
  {
    v5 = -[AVMediaSelectionGroup mediaSelectionOptionWithPropertyList:](mediaSelectionGroup, "mediaSelectionOptionWithPropertyList:", -[AVPlayerItem _propertyListForSelectedMediaOptionUsingFigSelectedMediaArrayObtainedFromGroup:](self, "_propertyListForSelectedMediaOptionUsingFigSelectedMediaArrayObtainedFromGroup:", mediaSelectionGroup));
    if (-[AVMediaSelectionOption _representsNilSelection](v5, "_representsNilSelection"))
      return 0;
    else
      return v5;
  }
  else
  {
    v7 = -[AVPlayerItem _mediaOptionsSelectedByClientForKey:](self, "_mediaOptionsSelectedByClientForKey:", mediaSelectionGroup);
    if (v7)
    {
      v8 = v7;
      if (-[AVMediaSelectionOption _representsNilSelection](v7, "_representsNilSelection"))
        return 0;
      else
        return v8;
    }
    else
    {
      return -[AVMediaSelectionGroup defaultOption](mediaSelectionGroup, "defaultOption");
    }
  }
}

- (void)setRestrictsAutomaticMediaSelectionToAvailableOfflineOptions:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[5];
  BOOL v5;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__AVPlayerItem_setRestrictsAutomaticMediaSelectionToAvailableOfflineOptions___block_invoke;
  v4[3] = &unk_1E302FD38;
  v4[4] = self;
  v5 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __77__AVPlayerItem_setRestrictsAutomaticMediaSelectionToAvailableOfflineOptions___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 963) = *(_BYTE *)(result + 40);
  return result;
}

- (void)_updateNonForcedSubtitleDisplayEnabledOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __71__AVPlayerItem__updateNonForcedSubtitleDisplayEnabledOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __71__AVPlayerItem__updateNonForcedSubtitleDisplayEnabledOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "isNonForcedSubtitleDisplayEnabled");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC5110], v5);
  }
  return result;
}

- (BOOL)_isNonForcedSubtitleDisplayEnabled
{
  OpaqueFigPlaybackItem *v2;
  OpaqueFigPlaybackItem *v3;
  uint64_t FigBaseObject;
  unsigned int (*v5)(uint64_t, _QWORD, _QWORD, CFBooleanRef *);
  BOOL v6;
  CFBooleanRef BOOLean;

  v2 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (!v2)
    return 0;
  v3 = v2;
  BOOLean = 0;
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v5 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                              + 48);
  if (v5 && !v5(FigBaseObject, *MEMORY[0x1E0CC5110], *MEMORY[0x1E0C9AE00], &BOOLean) && BOOLean)
  {
    v6 = CFBooleanGetValue(BOOLean) != 0;
    CFRelease(BOOLean);
  }
  else
  {
    v6 = 0;
  }
  CFRelease(v3);
  return v6;
}

- (void)setNonForcedSubtitleDisplayEnabled:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__AVPlayerItem_setNonForcedSubtitleDisplayEnabled___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateNonForcedSubtitleDisplayEnabledOnFigPlaybackItem](self, "_updateNonForcedSubtitleDisplayEnabledOnFigPlaybackItem");
  objc_msgSend(-[AVPlayerItem _player](self, "_player"), "_noteNewNonForcedSubtitleDisplayEnabledForPlayerItem:", self);
}

uint64_t __51__AVPlayerItem_setNonForcedSubtitleDisplayEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 964) = *(_BYTE *)(result + 40);
  return result;
}

- (OpaqueFigCPEProtector)_copyFigCPEProtector
{
  NSObject *ivarAccessQueue;
  uint64_t v4;
  uint64_t *v5;
  uint64_t CMBaseObject;
  void (*v7)(uint64_t, _QWORD, _QWORD, uint64_t *);
  NSObject *v8;
  const void *v9;
  const void *v10;
  OpaqueFigCPEProtector *v11;
  _QWORD v13[6];
  _QWORD block[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__AVPlayerItem__copyFigCPEProtector__block_invoke;
  block[3] = &unk_1E3031A40;
  block[4] = self;
  block[5] = &v15;
  block[6] = &v19;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  if (v16[3])
  {
    v5 = v20;
    if (v20[3])
    {
      CFRelease((CFTypeRef)v20[3]);
      v5 = v20;
      v20[3] = 0;
    }
    CMBaseObject = FigAssetGetCMBaseObject();
    v7 = *(void (**)(uint64_t, _QWORD, _QWORD, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v7)
      v7(CMBaseObject, *MEMORY[0x1E0CC3938], *MEMORY[0x1E0C9AE00], v5 + 3);
    v8 = self->_playerItem->ivarAccessQueue;
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __36__AVPlayerItem__copyFigCPEProtector__block_invoke_2;
    v13[3] = &unk_1E302FDB0;
    v13[4] = self;
    v13[5] = &v19;
    av_readwrite_dispatch_queue_write(v8, v13);
    v9 = (const void *)v20[3];
    if (v9)
      CFRetain(v9);
  }
  v10 = (const void *)v16[3];
  if (v10)
    CFRelease(v10);
  v11 = (OpaqueFigCPEProtector *)v20[3];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v11;
}

CFTypeRef __36__AVPlayerItem__copyFigCPEProtector__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  int v5;
  CFTypeRef v6;
  CFTypeRef result;

  v2 = a1[4];
  v3 = *(_QWORD *)(v2 + 8);
  if (!*(_QWORD *)(v3 + 1440))
  {
    v4 = objc_msgSend(*(id *)(v3 + 112), "_isStreaming");
    v2 = a1[4];
    if ((v4 & 1) == 0)
    {
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(v2 + 8) + 112), "hasProtectedContent");
      v2 = a1[4];
      if (v5)
      {
        v6 = (CFTypeRef)objc_msgSend(*(id *)(*(_QWORD *)(v2 + 8) + 112), "_figAsset");
        if (v6)
          v6 = CFRetain(v6);
        *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v6;
        v2 = a1[4];
      }
    }
  }
  result = *(CFTypeRef *)(*(_QWORD *)(v2 + 8) + 1440);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

void __36__AVPlayerItem__copyFigCPEProtector__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(const void **)(v2 + 1440);
  if (v3)
  {
    CFRelease(v3);
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_QWORD *)(v2 + 1440) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

- (NSArray)timedMetadata
{
  return (NSArray *)self->_playerItem->currentStableVariantID;
}

- (void)_setTimedMetadata:(id)a3
{
  NSString *v5;

  if (objc_msgSend(a3, "count"))
    v5 = (NSString *)objc_msgSend(a3, "copy");
  else
    v5 = 0;

  self->_playerItem->currentStableVariantID = v5;
}

- (void)_removeSyncLayer:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__AVPlayerItem__removeSyncLayer___block_invoke;
  v5[3] = &unk_1E302FCE8;
  v5[4] = self;
  v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _setSyncLayersOnFigPlaybackItem](self, "_setSyncLayersOnFigPlaybackItem");
}

uint64_t __33__AVPlayerItem__removeSyncLayer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 152), "count");
  if (v2)
  {
    v3 = v2;
    for (i = 0; i != v3; ++i)
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 152), "pointerAtIndex:", i) == *(_QWORD *)(a1 + 40))
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 152), "replacePointerAtIndex:withPointer:", i, 0);
    }
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 152), "compact");
}

- (void)_addSyncLayer:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__AVPlayerItem__addSyncLayer___block_invoke;
  v5[3] = &unk_1E302FCE8;
  v5[4] = self;
  v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _setSyncLayersOnFigPlaybackItem](self, "_setSyncLayersOnFigPlaybackItem");
}

uint64_t __30__AVPlayerItem__addSyncLayer___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 152);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 152) = (id)objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 152);
  }
  return objc_msgSend(v2, "addPointer:", *(_QWORD *)(a1 + 40));
}

- (id)_playbackItemNotificationPayloadToError:(__CFDictionary *)a3
{
  CFTypeID v5;
  const __CFBoolean *Value;
  _BOOL4 v7;
  id result;
  const __CFNumber *v9;
  CFTypeID v10;
  const void *v11;
  id v12;
  signed int valuePtr;

  if (!a3)
    return 0;
  v5 = CFGetTypeID(a3);
  if (v5 != CFDictionaryGetTypeID())
    return 0;
  Value = (const __CFBoolean *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CC4FA8]);
  if (Value)
    v7 = CFBooleanGetValue(Value) != 0;
  else
    v7 = 0;
  result = (id)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CC4FA0]);
  valuePtr = 0;
  if (result)
  {
    v9 = (const __CFNumber *)result;
    v10 = CFGetTypeID(result);
    if (v10 == CFNumberGetTypeID())
    {
      v12 = 0;
      -[AVPlayerItem _getVideoComposition:customVideoCompositorSession:figVideoCompositor:](self, "_getVideoComposition:customVideoCompositorSession:figVideoCompositor:", 0, &v12, 0);
      CFNumberGetValue(v9, kCFNumberSInt32Type, &valuePtr);
      if (valuePtr != -16180 || !v12 || (result = (id)objc_msgSend(v12, "getAndClearClientError")) == 0)
      {
        v11 = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CC4E98]);
        result = (id)AVErrorWithNSErrorAndOSStatus((uint64_t)v11, valuePtr, 0);
        if (v7)
          return (id)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11870, (void *)objc_msgSend(result, "userInfo"));
      }
      return result;
    }
    return 0;
  }
  return result;
}

- (BOOL)_hasEnabledVideo
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  uint64_t FigBaseObject;
  unsigned int (*v6)(uint64_t, _QWORD, _QWORD, CFBooleanRef *);
  BOOL v7;
  CFBooleanRef BOOLean;

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (!v3)
    return 0;
  v4 = v3;
  if ((-[AVPlayerItem _isReadyForInspectionOfTracks](self, "_isReadyForInspectionOfTracks")
     || sOKToBlockWhenGettingValuesOfProperties == 1)
    && (BOOLean = 0,
        FigBaseObject = FigPlaybackItemGetFigBaseObject(),
        (v6 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 8)
                                                                                     + 48)) != 0)
    && !v6(FigBaseObject, *MEMORY[0x1E0CC5168], *MEMORY[0x1E0C9AE00], &BOOLean)
    && BOOLean)
  {
    v7 = CFBooleanGetValue(BOOLean) != 0;
    if (BOOLean)
      CFRelease(BOOLean);
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v4);
  return v7;
}

- (BOOL)isRenderingSpatialAudio
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__AVPlayerItem_isRenderingSpatialAudio__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__AVPlayerItem_isRenderingSpatialAudio__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 1088);
  return result;
}

- (BOOL)_hasEnabledAudio
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  uint64_t FigBaseObject;
  unsigned int (*v6)(uint64_t, _QWORD, _QWORD, CFBooleanRef *);
  BOOL v7;
  CFBooleanRef BOOLean;

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (!v3)
    return 0;
  v4 = v3;
  if ((-[AVPlayerItem _isReadyForInspectionOfTracks](self, "_isReadyForInspectionOfTracks")
     || sOKToBlockWhenGettingValuesOfProperties == 1)
    && (BOOLean = 0,
        FigBaseObject = FigPlaybackItemGetFigBaseObject(),
        (v6 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 8)
                                                                                     + 48)) != 0)
    && !v6(FigBaseObject, *MEMORY[0x1E0CC5160], *MEMORY[0x1E0C9AE00], &BOOLean)
    && BOOLean)
  {
    v7 = CFBooleanGetValue(BOOLean) != 0;
    if (BOOLean)
      CFRelease(BOOLean);
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v4);
  return v7;
}

uint64_t __44__AVPlayerItem_setAllowProgressiveSwitchUp___block_invoke_2(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = *(unsigned __int8 *)(a1 + 40);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC5018], v5);
  }
  return result;
}

uint64_t __43__AVPlayerItem_setAllowProgressiveStartup___block_invoke_2(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = *(unsigned __int8 *)(a1 + 40);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC5010], v5);
  }
  return result;
}

- (void)setAllowProgressiveResume:(BOOL)a3
{
  OpaqueFigPlaybackItem *v5;
  NSObject *ivarAccessQueue;
  uint64_t v7;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v9[5];
  BOOL v10;
  _QWORD block[5];
  BOOL v12;

  v5 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__AVPlayerItem_setAllowProgressiveResume___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v12 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (v5)
  {
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __42__AVPlayerItem_setAllowProgressiveResume___block_invoke_2;
    v9[3] = &__block_descriptor_41_e5_v8__0l;
    v9[4] = v5;
    v10 = a3;
    dispatch_sync(figPlaybackItemSetterQueue, v9);
    CFRelease(v5);
  }
}

uint64_t __42__AVPlayerItem_setAllowProgressiveResume___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 844) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __42__AVPlayerItem_setAllowProgressiveResume___block_invoke_2(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = *(unsigned __int8 *)(a1 + 40);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC5008], v5);
  }
  return result;
}

- (void)_updateIFramePrefetchTargetDimensionsOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __70__AVPlayerItem__updateIFramePrefetchTargetDimensionsOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __70__AVPlayerItem__updateIFramePrefetchTargetDimensionsOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  CFDictionaryRef DictionaryRepresentation;
  uint64_t FigBaseObject;
  void (*v3)(uint64_t, _QWORD, CFDictionaryRef);
  CGSize v4;

  objc_msgSend(*(id *)(a1 + 32), "IFramePrefetchTargetDimensions");
  DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v4);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v3 = *(void (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v3)
    v3(FigBaseObject, *MEMORY[0x1E0CC5178], DictionaryRepresentation);
  if (DictionaryRepresentation)
    CFRelease(DictionaryRepresentation);
}

- (void)setIFramePrefetchTargetDimensions:(CGSize)a3
{
  NSObject *ivarAccessQueue;
  _QWORD block[5];
  CGSize v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AVPlayerItem_setIFramePrefetchTargetDimensions___block_invoke;
  block[3] = &unk_1E30314D8;
  block[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  -[AVPlayerItem _updateIFramePrefetchTargetDimensionsOnFigPlaybackItem](self, "_updateIFramePrefetchTargetDimensionsOnFigPlaybackItem");
}

__n128 __50__AVPlayerItem_setIFramePrefetchTargetDimensions___block_invoke(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 848) = result;
  return result;
}

+ (BOOL)automaticallyNotifiesObserversOfAllowProgressiveSwitchUp
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfAllowProgressiveStartup
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfAllowProgressiveResume
{
  return 0;
}

- (void)_updatePreferredPeakBitRateOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__AVPlayerItem__updatePreferredPeakBitRateOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __60__AVPlayerItem__updatePreferredPeakBitRateOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v5)(uint64_t, _QWORD, uint64_t);

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "preferredPeakBitRate");
  v2 = objc_msgSend(v1, "numberWithDouble:");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v5 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v5)
    return v5(FigBaseObject, *MEMORY[0x1E0CC5090], v2);
  return result;
}

- (void)setPreferredPeakBitRate:(double)preferredPeakBitRate
{
  NSObject *ivarAccessQueue;
  _QWORD v5[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__AVPlayerItem_setPreferredPeakBitRate___block_invoke;
  v5[3] = &unk_1E302FE78;
  v5[4] = self;
  *(double *)&v5[5] = preferredPeakBitRate;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updatePreferredPeakBitRateOnFigPlaybackItem](self, "_updatePreferredPeakBitRateOnFigPlaybackItem");
}

double __40__AVPlayerItem_setPreferredPeakBitRate___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 568) = result;
  return result;
}

- (void)_updatePreferredPeakBitRateForExpensiveNetworksOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __80__AVPlayerItem__updatePreferredPeakBitRateForExpensiveNetworksOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __80__AVPlayerItem__updatePreferredPeakBitRateForExpensiveNetworksOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  double v1;
  uint64_t v2;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v5)(uint64_t, _QWORD, uint64_t);

  objc_msgSend(*(id *)(a1 + 32), "preferredPeakBitRateForExpensiveNetworks");
  if (v1 <= 0.0)
    v2 = 0;
  else
    v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v5 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v5)
    return v5(FigBaseObject, *MEMORY[0x1E0CC5098], v2);
  return result;
}

- (void)setPreferredPeakBitRateForExpensiveNetworks:(double)preferredPeakBitRateForExpensiveNetworks
{
  NSObject *ivarAccessQueue;
  _QWORD v5[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__AVPlayerItem_setPreferredPeakBitRateForExpensiveNetworks___block_invoke;
  v5[3] = &unk_1E302FE78;
  v5[4] = self;
  *(double *)&v5[5] = preferredPeakBitRateForExpensiveNetworks;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updatePreferredPeakBitRateForExpensiveNetworksOnFigPlaybackItem](self, "_updatePreferredPeakBitRateForExpensiveNetworksOnFigPlaybackItem");
}

double __60__AVPlayerItem_setPreferredPeakBitRateForExpensiveNetworks___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 576) = result;
  return result;
}

- (float)maximumBitRate
{
  double v2;

  -[AVPlayerItem preferredPeakBitRate](self, "preferredPeakBitRate");
  return v2;
}

- (void)setMaximumBitRate:(float)a3
{
  -[AVPlayerItem setPreferredPeakBitRate:](self, "setPreferredPeakBitRate:", a3);
}

- (void)_updatePreferredMaximumResolutionOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD block[5];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__AVPlayerItem__updatePreferredMaximumResolutionOnFigPlaybackItem__block_invoke;
    block[3] = &unk_1E302FA10;
    block[4] = self;
    dispatch_sync(figPlaybackItemSetterQueue, block);
    CFRelease(v4);
  }
}

void __66__AVPlayerItem__updatePreferredMaximumResolutionOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  CFDictionaryRef DictionaryRepresentation;
  uint64_t FigBaseObject;
  void (*v3)(uint64_t, _QWORD, CFDictionaryRef);
  CGSize v4;

  objc_msgSend(*(id *)(a1 + 32), "preferredMaximumResolution");
  DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v4);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v3 = *(void (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v3)
    v3(FigBaseObject, *MEMORY[0x1E0CC5290], DictionaryRepresentation);
  CFRelease(DictionaryRepresentation);
}

- (void)setPreferredMaximumResolution:(CGSize)preferredMaximumResolution
{
  NSObject *ivarAccessQueue;
  _QWORD block[5];
  CGSize v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AVPlayerItem_setPreferredMaximumResolution___block_invoke;
  block[3] = &unk_1E30314D8;
  block[4] = self;
  v6 = preferredMaximumResolution;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  -[AVPlayerItem _updatePreferredMaximumResolutionOnFigPlaybackItem](self, "_updatePreferredMaximumResolutionOnFigPlaybackItem");
}

__n128 __46__AVPlayerItem_setPreferredMaximumResolution___block_invoke(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 888) = result;
  return result;
}

- (void)_renderingSuppressionDidChangeForOutput:(id)a3
{
  NSObject *figConfigurationQueue;
  _QWORD v4[6];

  figConfigurationQueue = self->_playerItem->figConfigurationQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__AVPlayerItem__renderingSuppressionDidChangeForOutput___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(figConfigurationQueue, v4);
}

void __56__AVPlayerItem__renderingSuppressionDidChangeForOutput___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const void *v8;
  void *v9;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_copyFigPlaybackItem");
  if (v2)
  {
    v3 = (const void *)v2;
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "_videoOutputs");
    v5 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_legibleOutputsForKeys"), "allValues");
    v6 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_renderedLegibleOutputsForKeys"), "allValues");
    if (objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 40)))
    {
      objc_msgSend(*(id *)(a1 + 32), "_updateVideoSuppressionOnFigPlaybackItem:basedOnOutputs:", v3, v4);
LABEL_10:
      CFRelease(v3);
      return;
    }
    if (objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 40)))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v3;
      v9 = v5;
    }
    else
    {
      if (!objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 40)))
        goto LABEL_10;
      v7 = *(void **)(a1 + 32);
      v8 = v3;
      v9 = v6;
    }
    objc_msgSend(v7, "_updateLegibleSuppressionOnFigPlaybackItem:basedOnOutputs:", v8, v9);
    goto LABEL_10;
  }
}

- (void)setRequiresAccessLog:(BOOL)a3
{
  OpaqueFigPlaybackItem *v5;
  NSObject *ivarAccessQueue;
  uint64_t v7;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v9[5];
  BOOL v10;
  _QWORD block[5];
  BOOL v12;

  v5 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__AVPlayerItem_setRequiresAccessLog___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v12 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (v5)
  {
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __37__AVPlayerItem_setRequiresAccessLog___block_invoke_2;
    v9[3] = &__block_descriptor_41_e5_v8__0l;
    v9[4] = v5;
    v10 = a3;
    dispatch_sync(figPlaybackItemSetterQueue, v9);
    CFRelease(v5);
  }
}

uint64_t __37__AVPlayerItem_setRequiresAccessLog___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 776) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __37__AVPlayerItem_setRequiresAccessLog___block_invoke_2(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = *(unsigned __int8 *)(a1 + 40);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC5150], v5);
  }
  return result;
}

- (void)setSuppressesAudioOnlyVariants:(BOOL)a3
{
  OpaqueFigPlaybackItem *v5;
  NSObject *ivarAccessQueue;
  uint64_t v7;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v9[5];
  BOOL v10;
  _QWORD block[5];
  BOOL v12;

  v5 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AVPlayerItem_setSuppressesAudioOnlyVariants___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v12 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (v5)
  {
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __47__AVPlayerItem_setSuppressesAudioOnlyVariants___block_invoke_2;
    v9[3] = &__block_descriptor_41_e5_v8__0l;
    v9[4] = v5;
    v10 = a3;
    dispatch_sync(figPlaybackItemSetterQueue, v9);
    CFRelease(v5);
  }
}

uint64_t __47__AVPlayerItem_setSuppressesAudioOnlyVariants___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 777) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __47__AVPlayerItem_setSuppressesAudioOnlyVariants___block_invoke_2(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = *(unsigned __int8 *)(a1 + 40);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC5338], v5);
  }
  return result;
}

- (void)setPrefersOfflinePlayableVariants:(BOOL)a3
{
  OpaqueFigPlaybackItem *v5;
  NSObject *ivarAccessQueue;
  uint64_t v7;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v9[5];
  BOOL v10;
  _QWORD block[5];
  BOOL v12;

  v5 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AVPlayerItem_setPrefersOfflinePlayableVariants___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v12 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (v5)
  {
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __50__AVPlayerItem_setPrefersOfflinePlayableVariants___block_invoke_2;
    v9[3] = &__block_descriptor_41_e5_v8__0l;
    v9[4] = v5;
    v10 = a3;
    dispatch_sync(figPlaybackItemSetterQueue, v9);
    CFRelease(v5);
  }
}

uint64_t __50__AVPlayerItem_setPrefersOfflinePlayableVariants___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 778) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __50__AVPlayerItem_setPrefersOfflinePlayableVariants___block_invoke_2(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = *(unsigned __int8 *)(a1 + 40);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC5238], v5);
  }
  return result;
}

- (void)setVariantPreferences:(AVVariantPreferences)variantPreferences
{
  NSObject *ivarAccessQueue;
  _QWORD v5[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__AVPlayerItem_setVariantPreferences___block_invoke;
  v5[3] = &unk_1E302FE78;
  v5[4] = self;
  v5[5] = variantPreferences;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateVariantPreferencesOnFigPlaybackItem](self, "_updateVariantPreferencesOnFigPlaybackItem");
}

uint64_t __38__AVPlayerItem_setVariantPreferences___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 784) = *(_QWORD *)(result + 40);
  return result;
}

- (void)_updatePreferredMaximumAudioSampleRateOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __71__AVPlayerItem__updatePreferredMaximumAudioSampleRateOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __71__AVPlayerItem__updatePreferredMaximumAudioSampleRateOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v5)(uint64_t, _QWORD, uint64_t);

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "preferredMaximumAudioSampleRate");
  v2 = objc_msgSend(v1, "numberWithDouble:");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v5 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v5)
    return v5(FigBaseObject, *MEMORY[0x1E0CC5058], v2);
  return result;
}

- (void)setPreferredMaximumAudioSampleRate:(double)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__AVPlayerItem_setPreferredMaximumAudioSampleRate___block_invoke;
  v5[3] = &unk_1E302FE78;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updatePreferredMaximumAudioSampleRateOnFigPlaybackItem](self, "_updatePreferredMaximumAudioSampleRateOnFigPlaybackItem");
}

double __51__AVPlayerItem_setPreferredMaximumAudioSampleRate___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 792) = result;
  return result;
}

- (BOOL)autoSwitchAtmosStreamVariants
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
  v9 = 1;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AVPlayerItem_autoSwitchAtmosStreamVariants__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__AVPlayerItem_autoSwitchAtmosStreamVariants__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 779);
  return result;
}

- (void)_updateAutoSwitchAtmosStreamVariantsOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__AVPlayerItem__updateAutoSwitchAtmosStreamVariantsOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __69__AVPlayerItem__updateAutoSwitchAtmosStreamVariantsOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "autoSwitchAtmosStreamVariants");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC5068], v5);
  }
  return result;
}

- (void)setAutoSwitchAtmosStreamVariants:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayerItem_setAutoSwitchAtmosStreamVariants___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateAutoSwitchAtmosStreamVariantsOnFigPlaybackItem](self, "_updateAutoSwitchAtmosStreamVariantsOnFigPlaybackItem");
}

uint64_t __49__AVPlayerItem_setAutoSwitchAtmosStreamVariants___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 779) = *(_BYTE *)(result + 40);
  return result;
}

- (void)_updateVideoApertureModeOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__AVPlayerItem__updateVideoApertureModeOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __57__AVPlayerItem__updateVideoApertureModeOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);

  v1 = objc_msgSend(*(id *)(a1 + 32), "videoApertureMode");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
    return v4(FigBaseObject, *MEMORY[0x1E0CC5028], v1);
  return result;
}

- (void)setVideoApertureMode:(AVVideoApertureMode)videoApertureMode
{
  NSObject *ivarAccessQueue;
  _QWORD v5[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__AVPlayerItem_setVideoApertureMode___block_invoke;
  v5[3] = &unk_1E302FCE8;
  v5[4] = self;
  v5[5] = videoApertureMode;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateVideoApertureModeOnFigPlaybackItem](self, "_updateVideoApertureModeOnFigPlaybackItem");
}

uint64_t __37__AVPlayerItem_setVideoApertureMode___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t result;

  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 816);
  result = objc_msgSend(*(id *)(a1 + 40), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 816) = result;
  return result;
}

- (void)setRestrictions:(unint64_t)a3
{
  NSObject *ivarAccessQueue;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__AVPlayerItem_setRestrictions___block_invoke;
  block[3] = &unk_1E3031868;
  block[5] = &v6;
  block[6] = a3;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v7 + 24))
    -[AVPlayerItem _updateRestrictionsOnFigPlaybackItem](self, "_updateRestrictionsOnFigPlaybackItem");
  _Block_object_dispose(&v6, 8);
}

_QWORD *__32__AVPlayerItem_setRestrictions___block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result[6];
  v2 = *(_QWORD *)(result[4] + 8);
  if (v1 != *(_QWORD *)(v2 + 688))
  {
    *(_QWORD *)(v2 + 688) = v1;
    *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = 1;
  }
  return result;
}

- (void)setLoudnessInfo:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__AVPlayerItem_setLoudnessInfo___block_invoke;
  v5[3] = &unk_1E302FCE8;
  v5[4] = self;
  v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateLoudnessInfoOnFigPlaybackItem](self, "_updateLoudnessInfoOnFigPlaybackItem");
}

uint64_t __32__AVPlayerItem_setLoudnessInfo___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 656);
  if (v1 != *(void **)(result + 40))
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 40), "copy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 656) = result;
  }
  return result;
}

- (void)setAudioTapProcessor:(opaqueMTAudioProcessingTap *)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__AVPlayerItem_setAudioTapProcessor___block_invoke;
  v5[3] = &unk_1E302FE78;
  v5[4] = self;
  v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateAudioTapProcessorOnFigPlaybackItem](self, "_updateAudioTapProcessorOnFigPlaybackItem");
}

void __37__AVPlayerItem_setAudioTapProcessor___block_invoke(uint64_t a1)
{
  const void *v1;
  uint64_t v2;
  uint64_t v3;
  const void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(const void **)(a1 + 40);
  v3 = *(_QWORD *)(v2 + 8);
  v4 = *(const void **)(v3 + 664);
  if (v4 != v1)
  {
    *(_QWORD *)(v3 + 664) = v1;
    if (v1)
      CFRetain(v1);
    if (v4)
      CFRelease(v4);
  }
}

- (void)resetAudioBufferedAhead
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD block[5];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__AVPlayerItem_resetAudioBufferedAhead__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, block);
    CFRelease(v4);
  }
}

uint64_t __39__AVPlayerItem_resetAudioBufferedAhead__block_invoke()
{
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v2)(uint64_t, _QWORD, _QWORD);

  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v2 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(result + 8) + 56);
  if (v2)
    return v2(FigBaseObject, *MEMORY[0x1E0CC5288], *MEMORY[0x1E0C9AE50]);
  return result;
}

uint64_t __53__AVPlayerItem__addInterstitialEventCollectorLocked___block_invoke(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_copyInterstitialCoordinator");
}

- (void)_removeInterstitialEventCollector
{
  -[AVPlayerItem _removeInterstitialEventCollectorLocked:](self, "_removeInterstitialEventCollectorLocked:", 0);
}

- (void)_removeInterstitialEventCollectorLocked:(BOOL)a3
{
  _QWORD v3[6];
  _QWORD v4[6];

  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3052000000;
  v4[3] = __Block_byref_object_copy__7;
  v4[4] = __Block_byref_object_dispose__7;
  v4[5] = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__AVPlayerItem__removeInterstitialEventCollectorLocked___block_invoke;
  v3[3] = &unk_1E302FD60;
  v3[4] = self;
  v3[5] = v4;
  -[AVPlayerItem dispatchIVarWrite:locked:block:](self, "dispatchIVarWrite:locked:block:", 1, a3, v3);
  _Block_object_dispose(v4, 8);
}

void __56__AVPlayerItem__removeInterstitialEventCollectorLocked___block_invoke(uint64_t a1)
{
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_retain(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 608));

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 608) = 0;
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeMediaDataCollector:locked:", v2, 1);

  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)advanceTimeForOverlappedPlayback
{
  NSObject *ivarAccessQueue;
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
  v10 = &unk_1935931BF;
  v11 = *MEMORY[0x1E0CA2E18];
  v12 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AVPlayerItem_advanceTimeForOverlappedPlayback__block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __48__AVPlayerItem_advanceTimeForOverlappedPlayback__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = *(__n128 **)(*(_QWORD *)(a1 + 32) + 8);
  result = v2[24];
  v1[3].n128_u64[0] = v2[25].n128_u64[0];
  v1[2] = result;
  return result;
}

- (void)_updateAdvanceTimeForOverlappedPlaybackOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72__AVPlayerItem__updateAdvanceTimeForOverlappedPlaybackOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __72__AVPlayerItem__updateAdvanceTimeForOverlappedPlaybackOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  void *v1;
  CFDictionaryRef v2;
  uint64_t FigBaseObject;
  void (*v4)(uint64_t, _QWORD, CFDictionaryRef);
  CMTime time;

  v1 = *(void **)(a1 + 32);
  if (v1)
    objc_msgSend(v1, "advanceTimeForOverlappedPlayback");
  else
    memset(&time, 0, sizeof(time));
  v2 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v4 = *(void (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    v4(FigBaseObject, *MEMORY[0x1E0CC4FF8], v2);
  if (v2)
    CFRelease(v2);
}

- (void)setAdvanceTimeForOverlappedPlayback:(id *)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__AVPlayerItem_setAdvanceTimeForOverlappedPlayback___block_invoke;
  v5[3] = &unk_1E3031E68;
  v5[4] = self;
  v6 = *a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateAdvanceTimeForOverlappedPlaybackOnFigPlaybackItem](self, "_updateAdvanceTimeForOverlappedPlaybackOnFigPlaybackItem");
}

__n128 __52__AVPlayerItem_setAdvanceTimeForOverlappedPlayback___block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 408) = 1;
  v1 = *(__n128 **)(*(_QWORD *)(a1 + 32) + 8);
  result = *(__n128 *)(a1 + 40);
  v1[25].n128_u64[0] = *(_QWORD *)(a1 + 56);
  v1[24] = result;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumTimePlayedToDuringOverlappedPlayback
{
  if (self)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE currentTime](self, "currentTime");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumTimePlayedToSinceLastSeek
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v5;
  uint64_t FigBaseObject;
  unsigned int (*v7)(uint64_t, _QWORD, _QWORD, CFDictionaryRef *);
  CFDictionaryRef v8;
  CMTime v9;
  CFDictionaryRef dictionaryRepresentation;

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  result = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (result)
  {
    v5 = result;
    dictionaryRepresentation = 0;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v7 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFDictionaryRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 8)
                                                                                   + 48);
    if (v7 && !v7(FigBaseObject, *MEMORY[0x1E0CC51D8], *MEMORY[0x1E0C9AE00], &dictionaryRepresentation))
    {
      CMTimeMakeFromDictionary(&v9, dictionaryRepresentation);
      *(_OWORD *)&retstr->var0 = *(_OWORD *)&v9.value;
      v8 = dictionaryRepresentation;
      retstr->var3 = v9.epoch;
      if (v8)
        CFRelease(v8);
    }
    CFRelease(v5);
  }
  return result;
}

- (BOOL)isAudioSpatializationAllowed
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
  v9 = 1;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__AVPlayerItem_isAudioSpatializationAllowed__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__AVPlayerItem_isAudioSpatializationAllowed__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 1400);
  return result;
}

- (void)_updateAudioSpatializationAllowed
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__AVPlayerItem__updateAudioSpatializationAllowed__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __49__AVPlayerItem__updateAudioSpatializationAllowed__block_invoke(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(a1 + 32), "isAudioSpatializationAllowed");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC5060], v5);
  }
  return result;
}

- (void)setAudioSpatializationAllowed:(BOOL)audioSpatializationAllowed
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__AVPlayerItem_setAudioSpatializationAllowed___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = audioSpatializationAllowed;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _updateAudioSpatializationAllowed](self, "_updateAudioSpatializationAllowed");
}

uint64_t __46__AVPlayerItem_setAudioSpatializationAllowed___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 1401) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 1400) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __40__AVPlayerItem__setPlaybackCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_updateItemIdentifierForCoordinatedPlayback");
}

- (BOOL)isAuthorizationRequiredForPlayback
{
  OpaqueFigCPEProtector *v2;
  OpaqueFigCPEProtector *v3;

  v2 = -[AVPlayerItem _copyFigCPEProtector](self, "_copyFigCPEProtector");
  v3 = v2;
  if (v2)
    CFRelease(v2);
  return v3 != 0;
}

- (BOOL)isApplicationAuthorizedForPlayback
{
  OpaqueFigCPEProtector *v2;
  OpaqueFigCPEProtector *v3;
  _QWORD *v4;
  unsigned int (*v5)(OpaqueFigCPEProtector *, uint64_t, int *);
  BOOL v6;
  int v8;

  v2 = -[AVPlayerItem _copyFigCPEProtector](self, "_copyFigCPEProtector");
  if (!v2)
    return 1;
  v3 = v2;
  v8 = 0;
  v4 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
  v6 = *v4
    && (v5 = (unsigned int (*)(OpaqueFigCPEProtector *, uint64_t, int *))v4[4]) != 0
    && !v5(v3, 3, &v8)
    && (~v8 & 3) == 0;
  CFRelease(v3);
  return v6;
}

- (BOOL)isContentAuthorizedForPlayback
{
  OpaqueFigCPEProtector *v2;
  OpaqueFigCPEProtector *v3;
  _QWORD *v4;
  unsigned int (*v5)(OpaqueFigCPEProtector *, uint64_t, int *);
  BOOL v6;
  int v8;

  v2 = -[AVPlayerItem _copyFigCPEProtector](self, "_copyFigCPEProtector");
  if (!v2)
    return 1;
  v3 = v2;
  v8 = 0;
  v4 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
  v6 = *v4
    && (v5 = (unsigned int (*)(OpaqueFigCPEProtector *, uint64_t, int *))v4[6]) != 0
    && !v5(v3, 3, &v8)
    && (~v8 & 3) == 0;
  CFRelease(v3);
  return v6;
}

+ (id)_initializeProtectedContentPlaybackSupportSessionAsynchronouslyForProvider:(id)a3 withOptions:(id)a4
{
  uint64_t v6;
  _QWORD v8[5];
  id v9;

  v9 = 0;
  v6 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("AVProtectedContentProviderFairPlay")) & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("AVPlayerItem does not support the specified protected content provider"), 0));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __140__AVPlayerItem_AVPlayerItemProtectedContentPrivate___initializeProtectedContentPlaybackSupportSessionAsynchronouslyForProvider_withOptions___block_invoke;
  v8[3] = &unk_1E30320B0;
  v8[4] = v6;
  objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v8);
  FigCPERemoteInitializeWithOptions();
  return v9;
}

uint64_t __140__AVPlayerItem_AVPlayerItemProtectedContentPrivate___initializeProtectedContentPlaybackSupportSessionAsynchronouslyForProvider_withOptions___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  _QWORD *v8;
  uint64_t result;

  if ((objc_msgSend(a2, "isEqualToString:", CFSTR("AVInitializeProtectedContentPlaybackSupportStorageURLKey")) & 1) != 0)
  {
    v8 = (_QWORD *)MEMORY[0x1E0CC3EA0];
LABEL_7:
    result = objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", a3, *v8);
    goto LABEL_8;
  }
  if ((objc_msgSend(a2, "isEqualToString:", CFSTR("AVInitializeProtectedContentPlaybackSupportVideoKey")) & 1) != 0)
  {
    v8 = (_QWORD *)MEMORY[0x1E0CC3E98];
    goto LABEL_7;
  }
  result = objc_msgSend(a2, "isEqualToString:", CFSTR("AVInitializeProtectedContentPlaybackSupportExternalProtectionKey"));
  if ((_DWORD)result)
  {
    v8 = (_QWORD *)MEMORY[0x1E0CC3E90];
    goto LABEL_7;
  }
LABEL_8:
  *a4 = 0;
  return result;
}

+ (void)_uninitializeProtectedContentPlaybackSupportSession:(id)a3
{
  if (FigCPERemoteUninitialize())
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("AVPlayerItem could not uninitialize the specified protected content support session"), 0));
}

- (id)_isExternalProtectionRequiredForPlaybackInternal
{
  OpaqueFigCPEProtector *v3;
  OpaqueFigPlaybackItem *v4;
  OpaqueFigPlaybackItem *v5;
  void (*v6)(uint64_t, uint64_t, uint64_t, CFBooleanRef *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t FigBaseObject;
  void *v11;
  _BOOL8 v12;
  void *v13;
  CFBooleanRef BOOLean;

  BOOLean = 0;
  v3 = -[AVPlayerItem _copyFigCPEProtector](self, "_copyFigCPEProtector");
  v4 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  v5 = v4;
  if (v3)
  {
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48);
    if (!v6)
      goto LABEL_8;
    v7 = *MEMORY[0x1E0CC3EE8];
    v8 = *MEMORY[0x1E0C9AE00];
    v9 = (uint64_t)v3;
  }
  else
  {
    if (!v4)
      goto LABEL_8;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48);
    if (!v6)
      goto LABEL_8;
    v7 = *MEMORY[0x1E0CC5280];
    v8 = *MEMORY[0x1E0C9AE00];
    v9 = FigBaseObject;
  }
  v6(v9, v7, v8, &BOOLean);
LABEL_8:
  v11 = (void *)MEMORY[0x1E0CB37E8];
  if (BOOLean)
    v12 = CFBooleanGetValue(BOOLean) != 0;
  else
    v12 = 0;
  v13 = (void *)objc_msgSend(v11, "numberWithBool:", v12);
  if (BOOLean)
    CFRelease(BOOLean);
  if (v5)
    CFRelease(v5);
  if (v3)
    CFRelease(v3);
  return v13;
}

- (void)_setExternalProtectionRequiredForPlayback:(BOOL)a3
{
  uint64_t v4;
  NSObject *ivarAccessQueue;
  OpaqueFigPlaybackItem *v6;
  OpaqueFigPlaybackItem *v7;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v9[5];
  _QWORD block[5];

  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("AVPlayerItem._externalProtectionRequiredForPlayback can only be set to YES"), 0));
  v4 = MEMORY[0x1E0C809B0];
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__AVPlayerItem_AVPlayerItemProtectedContentPrivate___setExternalProtectionRequiredForPlayback___block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v6 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v6)
  {
    v7 = v6;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __95__AVPlayerItem_AVPlayerItemProtectedContentPrivate___setExternalProtectionRequiredForPlayback___block_invoke_2;
    v9[3] = &__block_descriptor_40_e5_v8__0l;
    v9[4] = v7;
    dispatch_sync(figPlaybackItemSetterQueue, v9);
    CFRelease(v7);
  }
}

uint64_t __95__AVPlayerItem_AVPlayerItemProtectedContentPrivate___setExternalProtectionRequiredForPlayback___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 969) = 1;
  return result;
}

uint64_t __95__AVPlayerItem_AVPlayerItemProtectedContentPrivate___setExternalProtectionRequiredForPlayback___block_invoke_2()
{
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v2)(uint64_t, _QWORD, _QWORD);

  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v2 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(result + 8) + 56);
  if (v2)
    return v2(FigBaseObject, *MEMORY[0x1E0CC5280], *MEMORY[0x1E0C9AE50]);
  return result;
}

- (BOOL)_isRental
{
  OpaqueFigCPEProtector *v2;
  OpaqueFigCPEProtector *v3;
  void (*v4)(OpaqueFigCPEProtector *, _QWORD, _QWORD, CFBooleanRef *);
  BOOL v5;
  CFBooleanRef BOOLean;

  BOOLean = 0;
  v2 = -[AVPlayerItem _copyFigCPEProtector](self, "_copyFigCPEProtector");
  if (!v2)
    return 0;
  v3 = v2;
  v4 = *(void (**)(OpaqueFigCPEProtector *, _QWORD, _QWORD, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 8)
                                                                                      + 48);
  if (v4 && (v4(v3, *MEMORY[0x1E0CC3EF0], *MEMORY[0x1E0C9AE00], &BOOLean), BOOLean))
  {
    v5 = CFBooleanGetValue(BOOLean) != 0;
    if (BOOLean)
      CFRelease(BOOLean);
  }
  else
  {
    v5 = 0;
  }
  CFRelease(v3);
  return v5;
}

- (NSDate)_rentalStartDate
{
  OpaqueFigCPEProtector *v2;
  OpaqueFigCPEProtector *v3;
  void (*v4)(OpaqueFigCPEProtector *, _QWORD, _QWORD, id *);
  id v6;

  v6 = 0;
  v2 = -[AVPlayerItem _copyFigCPEProtector](self, "_copyFigCPEProtector");
  if (!v2
    || (v3 = v2,
        (v4 = *(void (**)(OpaqueFigCPEProtector *, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 8)
                                                                                   + 48)) == 0)
    || (v4(v3, *MEMORY[0x1E0CC3F08], *MEMORY[0x1E0C9AE00], &v6), !v6))
  {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot get rental expiration date information from an AVPlayerItem that does not contain rental content"), 0));
  }
  CFRelease(v3);
  return (NSDate *)v6;
}

- (NSDate)_rentalExpirationDate
{
  OpaqueFigCPEProtector *v2;
  OpaqueFigCPEProtector *v3;
  void (*v4)(OpaqueFigCPEProtector *, _QWORD, _QWORD, id *);
  id v6;

  v6 = 0;
  v2 = -[AVPlayerItem _copyFigCPEProtector](self, "_copyFigCPEProtector");
  if (!v2
    || (v3 = v2,
        (v4 = *(void (**)(OpaqueFigCPEProtector *, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 8)
                                                                                   + 48)) == 0)
    || (v4(v3, *MEMORY[0x1E0CC3F00], *MEMORY[0x1E0C9AE00], &v6), !v6))
  {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot get rental expiration date information from an AVPlayerItem that does not contain rental content"), 0));
  }
  CFRelease(v3);
  return (NSDate *)v6;
}

- (BOOL)_isRentalPlaybackStarted
{
  OpaqueFigCPEProtector *v2;
  OpaqueFigCPEProtector *v3;
  void (*v4)(OpaqueFigCPEProtector *, _QWORD, _QWORD, CFBooleanRef *);
  BOOL v5;
  CFBooleanRef BOOLean;

  BOOLean = 0;
  v2 = -[AVPlayerItem _copyFigCPEProtector](self, "_copyFigCPEProtector");
  if (!v2)
    return 0;
  v3 = v2;
  v4 = *(void (**)(OpaqueFigCPEProtector *, _QWORD, _QWORD, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 8)
                                                                                      + 48);
  if (v4 && (v4(v3, *MEMORY[0x1E0CC3EF8], *MEMORY[0x1E0C9AE00], &BOOLean), BOOLean))
  {
    v5 = CFBooleanGetValue(BOOLean) != 0;
    if (BOOLean)
      CFRelease(BOOLean);
  }
  else
  {
    v5 = 0;
  }
  CFRelease(v3);
  return v5;
}

- (NSDate)_rentalPlaybackStartedDate
{
  OpaqueFigCPEProtector *v2;
  OpaqueFigCPEProtector *v3;
  void (*v4)(OpaqueFigCPEProtector *, _QWORD, _QWORD, id *);
  id v6;

  v6 = 0;
  v2 = -[AVPlayerItem _copyFigCPEProtector](self, "_copyFigCPEProtector");
  if (!v2
    || (v3 = v2,
        (v4 = *(void (**)(OpaqueFigCPEProtector *, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 8)
                                                                                   + 48)) == 0)
    || (v4(v3, *MEMORY[0x1E0CC3F18], *MEMORY[0x1E0C9AE00], &v6), !v6))
  {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot get rental playback date information from an AVPlayerItem that does not contain rental content or when rental playback has not started"), 0));
  }
  CFRelease(v3);
  return (NSDate *)v6;
}

- (NSDate)_rentalPlaybackExpirationDate
{
  OpaqueFigCPEProtector *v2;
  OpaqueFigCPEProtector *v3;
  void (*v4)(OpaqueFigCPEProtector *, _QWORD, _QWORD, id *);
  id v6;

  v6 = 0;
  v2 = -[AVPlayerItem _copyFigCPEProtector](self, "_copyFigCPEProtector");
  if (!v2
    || (v3 = v2,
        (v4 = *(void (**)(OpaqueFigCPEProtector *, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 8)
                                                                                   + 48)) == 0)
    || (v4(v3, *MEMORY[0x1E0CC3F10], *MEMORY[0x1E0C9AE00], &v6), !v6))
  {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot get rental playback date information from an AVPlayerItem that does not contain rental content or when rental playback has not started"), 0));
  }
  CFRelease(v3);
  return (NSDate *)v6;
}

- (AVPlayerItemAccessLog)accessLog
{
  OpaqueFigPlaybackItem *v2;
  OpaqueFigPlaybackItem *v3;
  uint64_t FigBaseObject;
  unsigned int (*v5)(uint64_t, _QWORD, _QWORD, id *);
  BOOL v6;
  id v7;
  id v8;
  void *v9;
  id v11;

  v11 = 0;
  v2 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v2)
  {
    v3 = v2;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v5 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (!v5
      || (!v5(FigBaseObject, *MEMORY[0x1E0CC4FE0], *MEMORY[0x1E0C9AE00], &v11) ? (v6 = v11 == 0) : (v6 = 1), v6))
    {
      v9 = 0;
    }
    else
    {
      v7 = v11;
      v8 = objc_allocWithZone((Class)AVPlayerItemAccessLog);
      v9 = (void *)objc_msgSend(v8, "initWithLogArray:", v11);
    }
    CFRelease(v3);
  }
  else
  {
    v9 = 0;
  }
  return (AVPlayerItemAccessLog *)v9;
}

- (AVPlayerItemErrorLog)errorLog
{
  OpaqueFigPlaybackItem *v2;
  OpaqueFigPlaybackItem *v3;
  uint64_t FigBaseObject;
  unsigned int (*v5)(uint64_t, _QWORD, _QWORD, id *);
  BOOL v6;
  id v7;
  id v8;
  void *v9;
  id v11;

  v11 = 0;
  v2 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v2)
  {
    v3 = v2;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v5 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (!v5
      || (!v5(FigBaseObject, *MEMORY[0x1E0CC5138], *MEMORY[0x1E0C9AE00], &v11) ? (v6 = v11 == 0) : (v6 = 1), v6))
    {
      v9 = 0;
    }
    else
    {
      v7 = v11;
      v8 = objc_allocWithZone((Class)AVPlayerItemErrorLog);
      v9 = (void *)objc_msgSend(v8, "initWithLogArray:", v11);
    }
    CFRelease(v3);
  }
  else
  {
    v9 = 0;
  }
  return (AVPlayerItemErrorLog *)v9;
}

- (void)_quietlySetEQPreset:(int)a3
{
  CFNumberRef v3;
  CFNumberRef v4;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, _QWORD, CFNumberRef);
  int valuePtr;

  valuePtr = a3;
  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
  if (v3)
  {
    v4 = v3;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v6 = *(void (**)(uint64_t, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v6)
      v6(FigBaseObject, *MEMORY[0x1E0CC5118], v4);
    CFRelease(v4);
  }
}

- (void)_setEQPreset:(int)a3
{
  AVPlayerItemInternal *playerItem;

  playerItem = self->_playerItem;
  if (HIDWORD(playerItem->interstitialEventID) != a3)
  {
    HIDWORD(playerItem->interstitialEventID) = a3;
    if (self->_playerItem->figPlaybackItem)
      -[AVPlayerItem _quietlySetEQPreset:](self, "_quietlySetEQPreset:");
  }
}

- (void)_setRampInOutInfo:(id)a3
{
  NSString *v4;

  if (self->_playerItem->coordinationIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");

    self->_playerItem->coordinationIdentifier = v4;
    if (self->_playerItem->figPlaybackItem)
      -[AVPlayerItem _updatePlaybackPropertiesOnFigPlaybackItem](self, "_updatePlaybackPropertiesOnFigPlaybackItem");
  }
}

- (void)_setAudibleDRMInfo:(id)a3
{
  uint64_t v4;

  if (*(id *)&self->_playerItem->participatesInCoordinatedPlayback != a3)
  {
    v4 = objc_msgSend(a3, "copy");

    *(_QWORD *)&self->_playerItem->participatesInCoordinatedPlayback = v4;
    if (self->_playerItem->figPlaybackItem)
      -[AVPlayerItem _updatePlaybackPropertiesOnFigPlaybackItem](self, "_updatePlaybackPropertiesOnFigPlaybackItem");
  }
}

- (int64_t)_fileSize
{
  int64_t result;
  const void *v3;
  uint64_t FigBaseObject;
  uint64_t (*v5)(uint64_t, _QWORD, _QWORD, CFNumberRef *);
  int v6;
  CFNumberRef v7;
  CFNumberRef number;
  int64_t valuePtr;

  valuePtr = 0;
  result = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (result)
  {
    v3 = (const void *)result;
    number = 0;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v5 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48);
    if (v5)
    {
      v6 = v5(FigBaseObject, *MEMORY[0x1E0CC5148], *MEMORY[0x1E0C9AE00], &number);
      v7 = number;
      if (!v6)
      {
        CFNumberGetValue(number, kCFNumberLongLongType, &valuePtr);
        v7 = number;
      }
      if (v7)
        CFRelease(v7);
    }
    CFRelease(v3);
    return valuePtr;
  }
  return result;
}

- (int64_t)_availableFileSize
{
  int64_t result;
  const void *v3;
  uint64_t FigBaseObject;
  uint64_t (*v5)(uint64_t, _QWORD, _QWORD, CFNumberRef *);
  int v6;
  CFNumberRef v7;
  CFNumberRef number;
  int64_t valuePtr;

  valuePtr = 0;
  result = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (result)
  {
    v3 = (const void *)result;
    number = 0;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v5 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48);
    if (v5)
    {
      v6 = v5(FigBaseObject, *MEMORY[0x1E0CC5088], *MEMORY[0x1E0C9AE00], &number);
      v7 = number;
      if (!v6)
      {
        CFNumberGetValue(number, kCFNumberLongLongType, &valuePtr);
        v7 = number;
      }
      if (v7)
        CFRelease(v7);
    }
    CFRelease(v3);
    return valuePtr;
  }
  return result;
}

- (id)_renderedLegibleOutputsForKeys
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__AVPlayerItem_AVPlayerItemOutputs___renderedLegibleOutputsForKeys__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __67__AVPlayerItem_AVPlayerItemOutputs___renderedLegibleOutputsForKeys__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 192), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_evaluateRenderedLegibleOutputs
{
  NSObject *figConfigurationQueue;
  _QWORD block[5];

  figConfigurationQueue = self->_playerItem->figConfigurationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__AVPlayerItem_AVPlayerItemOutputs___evaluateRenderedLegibleOutputs__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_async(figConfigurationQueue, block);
}

void __68__AVPlayerItem_AVPlayerItemOutputs___evaluateRenderedLegibleOutputs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t FigBaseObject;
  void (*v11)(uint64_t, _QWORD, void *);
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_copyFigPlaybackItem");
  if (v2)
  {
    v3 = (const void *)v2;
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "_renderedLegibleOutputsForKeys");
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v4);
          objc_msgSend(v5, "setObject:forKey:", objc_msgSend((id)objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9)), "_figRenderedLegibleOutputsDictionaryOptions"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v11 = *(void (**)(uint64_t, _QWORD, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v11)
      v11(FigBaseObject, *MEMORY[0x1E0CC5278], v5);
    CFRelease(v3);
  }
}

- (void)_configureVideoCompositionColorProperties
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    v9 = 0;
    v10 = 0;
    v7 = 0;
    v8 = 0;
    v5 = 0;
    v6 = 0;
    -[AVPlayerItem _getVideoComposition:customVideoCompositorSession:figVideoCompositor:](self, "_getVideoComposition:customVideoCompositorSession:figVideoCompositor:", &v6, &v5, 0);
    objc_msgSend(v6, "videoCompositionOutputColorPropertiesWithCustomCompositor:formatDescriptions:colorPrimaries:transferFunction:yCbCrMatrix:perFrameHDRDisplayMetadataPolicy:", v5, -[AVPlayerItem _enabledTrackFormatDescriptions](self, "_enabledTrackFormatDescriptions"), &v10, &v9, &v8, &v7);
    -[AVPlayerItem _setVideoCompositionColorPrimaries:](self, "_setVideoCompositionColorPrimaries:", v10);
    -[AVPlayerItem _setVideoCompositionColorYCbCrMatrix:](self, "_setVideoCompositionColorYCbCrMatrix:", v8);
    -[AVPlayerItem _setVideoCompositionColorTransferFunction:](self, "_setVideoCompositionColorTransferFunction:", v9);
    -[AVPlayerItem _setVideoCompositionHDRDisplayMetadataPolicy:](self, "_setVideoCompositionHDRDisplayMetadataPolicy:", v7);
    CFRelease(v4);
  }
}

- (void)_addVideoOutput:(id)a3
{
  NSObject *ivarAccessQueue;
  uint64_t v6;
  _QWORD v7[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__AVPlayerItem_AVPlayerItemOutputs___addVideoOutput___block_invoke;
  v7[3] = &unk_1E302FCE8;
  v7[4] = self;
  v7[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v7);
  objc_msgSend(a3, "_pixelBufferAttributes");
  VTPixelBufferAttributesMediatorSetRequestedPixelBufferAttributesForKey();
  v6 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVPlayerItemPreferredPixelBufferAttributesDidChangeNotification"), self, 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v6);
  -[AVPlayerItem _evaluateVideoOutputs](self, "_evaluateVideoOutputs");
}

uint64_t __53__AVPlayerItem_AVPlayerItemOutputs___addVideoOutput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 168), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)_addLegibleOutput:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__AVPlayerItem_AVPlayerItemOutputs___addLegibleOutput___block_invoke;
  v5[3] = &unk_1E302FCE8;
  v5[4] = self;
  v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _evaluateLegibleOutputs](self, "_evaluateLegibleOutputs");
}

uint64_t __55__AVPlayerItem_AVPlayerItemOutputs___addLegibleOutput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 176), "setObject:forKey:", *(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), FigAtomicIncrement32()));
}

- (void)_addMetadataOutput:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__AVPlayerItem_AVPlayerItemOutputs___addMetadataOutput___block_invoke;
  v5[3] = &unk_1E302FCE8;
  v5[4] = self;
  v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _evaluateMetadataOutputs](self, "_evaluateMetadataOutputs");
}

uint64_t __56__AVPlayerItem_AVPlayerItemOutputs___addMetadataOutput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 184), "setObject:forKey:", *(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), FigAtomicIncrement32()));
}

- (void)addOutput:(AVPlayerItemOutput *)output
{
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *ivarAccessQueue;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20[7];
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  AVTelemetryGenerateID();
  v6 = -[AVPlayerItemOutput _attachToPlayerItem:](output, "_attachToPlayerItem:", self);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot attach AVPlayerItemSampleBufferOutput to AVPlayerItem"), v7, v8, v9, v10, v11, v20[0]);
    goto LABEL_16;
  }
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = (uint64_t)__47__AVPlayerItem_AVPlayerItemOutputs__addOutput___block_invoke;
  v20[3] = (uint64_t)&unk_1E3031A90;
  v20[5] = (uint64_t)output;
  v20[6] = (uint64_t)&v22;
  v20[4] = (uint64_t)self;
  v21 = !v6;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v20);
  if (*((_BYTE *)v23 + 24))
    goto LABEL_13;
  if (!v6)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot attach an output that is already attached or nil output"), v13, v14, v15, v16, v17, v20[0]);
LABEL_16:
    objc_exception_throw((id)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v19, 0));
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AVPlayerItem _addVideoOutput:](self, "_addVideoOutput:", output);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AVPlayerItem _addLegibleOutput:](self, "_addLegibleOutput:", output);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[AVPlayerItem _addMetadataOutput:](self, "_addMetadataOutput:", output);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[AVPlayerItem _addRenderedLegibleOutput:](self, "_addRenderedLegibleOutput:", output);
      }
    }
  }
  -[AVPlayerItemOutput _setTimebase:](output, "_setTimebase:", self->_playerItem->proxyUnfoldedTimebase);
LABEL_13:
  _Block_object_dispose(&v22, 8);
}

void __47__AVPlayerItem_AVPlayerItemOutputs__addOutput___block_invoke(uint64_t a1)
{
  id v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 160), "containsObject:", *(_QWORD *)(a1 + 40));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) && !*(_BYTE *)(a1 + 56))
  {
    v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 160), "arrayByAddingObject:", *(_QWORD *)(a1 + 40));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 160) = v2;
  }
}

- (void)_addRenderedLegibleOutput:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__AVPlayerItem_AVPlayerItemOutputs___addRenderedLegibleOutput___block_invoke;
  v5[3] = &unk_1E302FCE8;
  v5[4] = self;
  v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _evaluateRenderedLegibleOutputs](self, "_evaluateRenderedLegibleOutputs");
}

uint64_t __63__AVPlayerItem_AVPlayerItemOutputs___addRenderedLegibleOutput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 192), "setObject:forKey:", *(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), FigAtomicIncrement32()));
}

- (void)_removeVideoOutput:(id)a3
{
  NSObject *ivarAccessQueue;
  uint64_t v5;
  _QWORD v6[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__AVPlayerItem_AVPlayerItemOutputs___removeVideoOutput___block_invoke;
  v6[3] = &unk_1E302FCE8;
  v6[4] = self;
  v6[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v6);
  VTPixelBufferAttributesMediatorRemoveRequestedPixelBufferAttributesForKey();
  v5 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVPlayerItemPreferredPixelBufferAttributesDidChangeNotification"), self, 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v5);
  -[AVPlayerItem _evaluateVideoOutputs](self, "_evaluateVideoOutputs");
}

uint64_t __56__AVPlayerItem_AVPlayerItemOutputs___removeVideoOutput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 168), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)_removeLegibleOutput:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__AVPlayerItem_AVPlayerItemOutputs___removeLegibleOutput___block_invoke;
  v5[3] = &unk_1E302FCE8;
  v5[4] = self;
  v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _evaluateLegibleOutputs](self, "_evaluateLegibleOutputs");
}

uint64_t __58__AVPlayerItem_AVPlayerItemOutputs___removeLegibleOutput___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 176), "allKeysForObject:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(v2, "count");
  if (result)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 176), "removeObjectForKey:", objc_msgSend(v2, "firstObject"));
  return result;
}

- (void)_removeMetadataOutput:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__AVPlayerItem_AVPlayerItemOutputs___removeMetadataOutput___block_invoke;
  v5[3] = &unk_1E302FCE8;
  v5[4] = self;
  v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _evaluateMetadataOutputs](self, "_evaluateMetadataOutputs");
}

uint64_t __59__AVPlayerItem_AVPlayerItemOutputs___removeMetadataOutput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 184), "removeObjectForKey:", objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 184), "allKeysForObject:", *(_QWORD *)(a1 + 40)), "objectAtIndex:", 0));
}

- (void)removeOutput:(AVPlayerItemOutput *)output
{
  NSObject *ivarAccessQueue;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  AVTelemetryGenerateID();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AVPlayerItem_AVPlayerItemOutputs__removeOutput___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = output;
  block[6] = &v7;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v8 + 24))
  {
    -[AVPlayerItemOutput _detachFromPlayerItem](output, "_detachFromPlayerItem");
    -[AVPlayerItemOutput _setTimebase:](output, "_setTimebase:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AVPlayerItem _removeVideoOutput:](self, "_removeVideoOutput:", output);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[AVPlayerItem _removeLegibleOutput:](self, "_removeLegibleOutput:", output);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[AVPlayerItem _removeMetadataOutput:](self, "_removeMetadataOutput:", output);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[AVPlayerItem _removeRenderedLegibleOutput:](self, "_removeRenderedLegibleOutput:", output);
        }
      }
    }
  }
  _Block_object_dispose(&v7, 8);
}

void __50__AVPlayerItem_AVPlayerItemOutputs__removeOutput___block_invoke(_QWORD *a1)
{
  void *v2;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 160), "containsObject:", a1[5]);
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 160), "mutableCopy");
    objc_msgSend(v2, "removeObject:", a1[5]);

    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 160) = v2;
  }
}

- (void)_removeRenderedLegibleOutput:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__AVPlayerItem_AVPlayerItemOutputs___removeRenderedLegibleOutput___block_invoke;
  v5[3] = &unk_1E302FCE8;
  v5[4] = self;
  v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVPlayerItem _evaluateRenderedLegibleOutputs](self, "_evaluateRenderedLegibleOutputs");
}

uint64_t __66__AVPlayerItem_AVPlayerItemOutputs___removeRenderedLegibleOutput___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 192), "allKeysForObject:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(v2, "count");
  if (result)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 192), "removeObjectForKey:", objc_msgSend(v2, "firstObject"));
  return result;
}

- (void)_addMetadataCollector:(id)a3
{
  -[AVPlayerItem _addMetadataCollector:locked:](self, "_addMetadataCollector:locked:", a3, 0);
}

- (void)_removeMetadataCollector:(id)a3
{
  -[AVPlayerItem _removeMetadataCollector:locked:](self, "_removeMetadataCollector:locked:", a3, 0);
}

- (void)_removeMetadataCollector:(id)a3 locked:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v9[6];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  OpaqueFigPlaybackItem *v14;

  v4 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v14 = -[AVPlayerItem _copyFigPlaybackItemLocked:](self, "_copyFigPlaybackItemLocked:", a4);
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__AVPlayerItem_AVPlayerItemMediaDataCollectors___removeMetadataCollector_locked___block_invoke;
  v10[3] = &unk_1E302FCE8;
  v10[4] = self;
  v10[5] = a3;
  -[AVPlayerItem dispatchIVarWrite:locked:block:](self, "dispatchIVarWrite:locked:block:", 1, v4, v10);
  if (v12[3])
  {
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __81__AVPlayerItem_AVPlayerItemMediaDataCollectors___removeMetadataCollector_locked___block_invoke_2;
    v9[3] = &unk_1E302FDB0;
    v9[4] = self;
    v9[5] = &v11;
    dispatch_async(figPlaybackItemSetterQueue, v9);
  }
  _Block_object_dispose(&v11, 8);
}

uint64_t __81__AVPlayerItem_AVPlayerItemMediaDataCollectors___removeMetadataCollector_locked___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 600), "removeObject:", *(_QWORD *)(a1 + 40));
}

void __81__AVPlayerItem_AVPlayerItemMediaDataCollectors___removeMetadataCollector_locked___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t FigBaseObject;
  void (*v4)(uint64_t, _QWORD, uint64_t);
  const void *v5;

  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_metadataCollectors"), "count"));
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v4 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    v4(FigBaseObject, *MEMORY[0x1E0CC50F8], v2);
  v5 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v5)
    CFRelease(v5);
}

- (void)addMediaDataCollector:(AVPlayerItemMediaDataCollector *)collector
{
  -[AVPlayerItem addMediaDataCollector:locked:](self, "addMediaDataCollector:locked:", collector, 0);
}

- (void)removeMediaDataCollector:(AVPlayerItemMediaDataCollector *)collector
{
  -[AVPlayerItem removeMediaDataCollector:locked:](self, "removeMediaDataCollector:locked:", collector, 0);
}

- (void)removeMediaDataCollector:(id)a3 locked:(BOOL)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__AVPlayerItem_AVPlayerItemMediaDataCollectors__removeMediaDataCollector_locked___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  -[AVPlayerItem dispatchIVarWrite:locked:block:](self, "dispatchIVarWrite:locked:block:", 1, a4, v4);
}

uint64_t __81__AVPlayerItem_AVPlayerItemMediaDataCollectors__removeMediaDataCollector_locked___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 592), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 592), "mutableCopy");
    objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 40));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 592) = v3;
    objc_msgSend(*(id *)(a1 + 40), "_detatchFromPlayerItem");
    result = needsTaggedRanges();
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 32), "_removeMetadataCollector:locked:", *(_QWORD *)(a1 + 40), 1);
  }
  return result;
}

- (void)setServiceIdentifier:(id)a3
{
  uint64_t v4;
  NSObject *ivarAccessQueue;
  OpaqueFigPlaybackItem *v6;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = objc_msgSend(a3, "copy");
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__AVPlayerItem_AVPlayerItemServiceIdentifier_Private__setServiceIdentifier___block_invoke;
  block[3] = &unk_1E302FE00;
  block[4] = v4;
  block[5] = self;
  block[6] = &v8;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v6 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v6)
  {
    if (*((_BYTE *)v9 + 24))
      -[AVPlayerItem _quietlySetServiceIdentifier](self, "_quietlySetServiceIdentifier");
    CFRelease(v6);
  }
  _Block_object_dispose(&v8, 8);
}

void __76__AVPlayerItem_AVPlayerItemServiceIdentifier_Private__setServiceIdentifier___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 1120)) & 1) == 0)
  {

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 1120) = *(_QWORD *)(a1 + 32);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (id)_legibleOutputForKey:(id)a3
{
  return (id)objc_msgSend(-[AVPlayerItem _legibleOutputsForKeys](self, "_legibleOutputsForKeys"), "objectForKey:", a3);
}

- (void)_figPlaybackItem:(OpaqueFigPlaybackItem *)a3 didOutputAttributedStrings:(id)a4 nativeSampleBuffers:(id)a5 atItemTime:(id *)a6 withLegibleOutputsDictionaryKey:(id)a7
{
  id v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;

  v10 = -[AVPlayerItem _legibleOutputForKey:](self, "_legibleOutputForKey:", a7);
  v11 = *a6;
  objc_msgSend(v10, "_pushAttributedStrings:andSampleBuffers:atItemTime:", a4, a5, &v11);
}

- (void)_figPlaybackItem:(OpaqueFigPlaybackItem *)a3 didFlushLegibleOutputWithDictionaryKey:(id)a4
{
  objc_msgSend(-[AVPlayerItem _legibleOutputForKey:](self, "_legibleOutputForKey:", a4), "_signalFlush");
}

- (id)_metadataOutputForKey:(id)a3
{
  return (id)objc_msgSend(-[AVPlayerItem _metadataOutputsForKeys](self, "_metadataOutputsForKeys"), "objectForKey:", a3);
}

- (void)_figPlaybackItem:(OpaqueFigPlaybackItem *)a3 didOutputSampleBuffers:(id)a4 fromTrackWithID:(int)a5 forMetadataOutputWithDictionaryKey:(id)a6
{
  uint64_t v7;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  AVTimedMetadataGroup *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v7 = *(_QWORD *)&a5;
  v22 = *MEMORY[0x1E0C80C00];
  if (-[AVAsset _isStreaming](self->_playerItem->asset, "_isStreaming", a3))
    v10 = 0;
  else
    v10 = -[AVPlayerItem _trackWithTrackID:](self, "_trackWithTrackID:", v7);
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(a4);
        v16 = -[AVTimedMetadataGroup initWithSampleBuffer:]([AVTimedMetadataGroup alloc], "initWithSampleBuffer:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15));
        objc_msgSend(v11, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }
  objc_msgSend(-[AVPlayerItem _metadataOutputForKey:](self, "_metadataOutputForKey:", a6), "_pushTimedMetadataGroups:fromPlayerItemTrack:", v11, v10);
}

- (void)_figPlaybackItem:(OpaqueFigPlaybackItem *)a3 didFlushMetadataOutputWithDictionaryKey:(id)a4
{
  objc_msgSend(-[AVPlayerItem _metadataOutputForKey:](self, "_metadataOutputForKey:", a4), "_signalFlush");
}

- (id)_renderedLegibleOutputForKey:(id)a3
{
  return (id)objc_msgSend(-[AVPlayerItem _renderedLegibleOutputsForKeys](self, "_renderedLegibleOutputsForKeys"), "objectForKey:", a3);
}

- (void)_figPlaybackItem:(OpaqueFigPlaybackItem *)a3 didOutputRenderedCaptionImages:(id)a4 atItemTime:(id *)a5 withRenderedLegibleOutputsDictionaryKey:(id)a6
{
  id v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;

  v8 = -[AVPlayerItem _renderedLegibleOutputForKey:](self, "_renderedLegibleOutputForKey:", a6);
  v9 = *a5;
  objc_msgSend(v8, "_pushRenderedCaptionImages:atItemTime:", a4, &v9);
}

- (void)_figPlaybackItem:(OpaqueFigPlaybackItem *)a3 didFlushRenderedLegibleOutputWithDictionaryKey:(id)a4
{
  objc_msgSend(-[AVPlayerItem _renderedLegibleOutputForKey:](self, "_renderedLegibleOutputForKey:", a4), "_signalFlush");
}

- (id)interstitialEventID
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__AVPlayerItem_AVPlayerItemAVKit__interstitialEventID__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __54__AVPlayerItem_AVPlayerItemAVKit__interstitialEventID__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1304);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setInterstitialEventID:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__AVPlayerItem_AVPlayerItemAVKit___setInterstitialEventID___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = a3;
  v4[5] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

void __59__AVPlayerItem_AVPlayerItemAVKit___setInterstitialEventID___block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 1304) = *(_QWORD *)(a1 + 32);
}

- (void)setPlayHapticTracks:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlaybackItem *v7;
  OpaqueFigPlaybackItem *v8;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v10[5];
  BOOL v11;
  _QWORD block[5];
  BOOL v13;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__AVPlayerItem_AVPlayerItemHaptics__setPlayHapticTracks___block_invoke;
  block[3] = &unk_1E302FD38;
  block[4] = self;
  v13 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v7)
  {
    v8 = v7;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __57__AVPlayerItem_AVPlayerItemHaptics__setPlayHapticTracks___block_invoke_2;
    v10[3] = &__block_descriptor_41_e5_v8__0l;
    v10[4] = v8;
    v11 = a3;
    dispatch_sync(figPlaybackItemSetterQueue, v10);
    CFRelease(v8);
  }
}

uint64_t __57__AVPlayerItem_AVPlayerItemHaptics__setPlayHapticTracks___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 872) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __57__AVPlayerItem_AVPlayerItemHaptics__setPlayHapticTracks___block_invoke_2(uint64_t a1)
{
  int v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  v1 = *(unsigned __int8 *)(a1 + 40);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
  {
    if (v1)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    return v4(FigBaseObject, *MEMORY[0x1E0CC5210], v5);
  }
  return result;
}

- (void)setHapticPlaybackLocality:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *ivarAccessQueue;
  uint64_t v12;
  NSObject *figPlaybackItemSetterQueue;
  void *v14;
  _QWORD v15[6];
  _QWORD block[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  if (a3
    && (objc_msgSend(a3, "isEqualToString:", CFSTR("Default")) & 1) == 0
    && (objc_msgSend(a3, "isEqualToString:", CFSTR("FullGamut")) & 1) == 0
    && (objc_msgSend(a3, "isEqualToString:", CFSTR("DefaultWithFullStrength")) & 1) == 0)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Haptic playback locality is not valid: %@"), v6, v7, v8, v9, v10, (uint64_t)a3), 0);
    objc_exception_throw(v14);
  }
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AVPlayerItem_AVPlayerItemHaptics__setHapticPlaybackLocality___block_invoke;
  block[3] = &unk_1E302FE00;
  block[4] = a3;
  block[5] = self;
  block[6] = &v17;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (v18[3])
  {
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __63__AVPlayerItem_AVPlayerItemHaptics__setHapticPlaybackLocality___block_invoke_2;
    v15[3] = &unk_1E302FD60;
    v15[4] = self;
    v15[5] = &v17;
    dispatch_sync(figPlaybackItemSetterQueue, v15);
  }
  _Block_object_dispose(&v17, 8);
}

uint64_t __63__AVPlayerItem_AVPlayerItemHaptics__setHapticPlaybackLocality___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 880));
  if ((result & 1) == 0)
  {

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 880) = objc_msgSend(*(id *)(a1 + 32), "copy");
    result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 120);
    if (result)
      result = (uint64_t)CFRetain((CFTypeRef)result);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  }
  return result;
}

void __63__AVPlayerItem_AVPlayerItemHaptics__setHapticPlaybackLocality___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t FigBaseObject;
  void (*v4)(uint64_t, _QWORD, uint64_t);

  v2 = objc_msgSend(*(id *)(a1 + 32), "hapticPlaybackLocality");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v4 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    v4(FigBaseObject, *MEMORY[0x1E0CC5158], v2);
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

- (void)_updateVideoEnhancementModeOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __90__AVPlayerItem_AVPlayerItemVideoEnhancement___updateVideoEnhancementModeOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __90__AVPlayerItem_AVPlayerItemVideoEnhancement___updateVideoEnhancementModeOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);

  v1 = objc_msgSend(*(id *)(a1 + 32), "videoEnhancementMode");
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
    return v4(FigBaseObject, *MEMORY[0x1E0CC5418], v1);
  return result;
}

- (void)setVideoEnhancementMode:(id)a3
{
  uint64_t v5;
  NSObject *ivarAccessQueue;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v5 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  while ((-[__CFString isEqualToString:](sValidVideoEnhancementModes[v5], "isEqualToString:", a3) & 1) == 0)
  {
    if (++v5 == 4)
      goto LABEL_7;
  }
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__AVPlayerItem_AVPlayerItemVideoEnhancement__setVideoEnhancementMode___block_invoke;
  block[3] = &unk_1E302FE00;
  block[4] = a3;
  block[5] = self;
  block[6] = &v8;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v9 + 24))
    -[AVPlayerItem _updateVideoEnhancementModeOnFigPlaybackItem](self, "_updateVideoEnhancementModeOnFigPlaybackItem");
LABEL_7:
  _Block_object_dispose(&v8, 8);
}

uint64_t __70__AVPlayerItem_AVPlayerItemVideoEnhancement__setVideoEnhancementMode___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 1080));
  if ((result & 1) == 0)
  {

    result = objc_msgSend(*(id *)(a1 + 32), "copy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 1080) = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)setAutomaticallyHandlesInterstitialEvents:(BOOL)automaticallyHandlesInterstitialEvents
{
  NSObject *ivarAccessQueue;
  _QWORD v4[5];
  BOOL v5;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __87__AVPlayerItem_AVPlayerInterstitialSupport__setAutomaticallyHandlesInterstitialEvents___block_invoke;
  v4[3] = &unk_1E302FD38;
  v4[4] = self;
  v5 = automaticallyHandlesInterstitialEvents;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __87__AVPlayerItem_AVPlayerInterstitialSupport__setAutomaticallyHandlesInterstitialEvents___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  int v3;
  void *v4;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 970) != v2)
  {
    *(_BYTE *)(v1 + 970) = v2;
    v3 = *(unsigned __int8 *)(result + 40);
    v4 = *(void **)(result + 32);
    if (v3)
      return objc_msgSend(v4, "_addInterstitialEventCollectorLocked:", 1);
    else
      return objc_msgSend(v4, "_removeInterstitialEventCollectorLocked:", 1);
  }
  return result;
}

- (AVPlayerItem)templatePlayerItem
{
  NSObject *ivarAccessQueue;
  AVPlayerItem *v3;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__AVPlayerItem_AVPlayerInterstitialSupport__templatePlayerItem__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (AVPlayerItem *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __63__AVPlayerItem_AVPlayerInterstitialSupport__templatePlayerItem__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1296);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setTemplatePlayerItem:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__AVPlayerItem_AVPlayerInterstitialSupport___setTemplatePlayerItem___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = a3;
  v4[5] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

void __68__AVPlayerItem_AVPlayerInterstitialSupport___setTemplatePlayerItem___block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 1296) = *(_QWORD *)(a1 + 32);
}

- (id)_coordinationIdentifier
{
  NSObject *ivarAccessQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__AVPlayerItem_AVPlayerInterstitialSupport___coordinationIdentifier__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __68__AVPlayerItem_AVPlayerInterstitialSupport___coordinationIdentifier__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1312);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setCoordinatorIdentifier:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[6];

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__AVPlayerItem_AVPlayerInterstitialSupport___setCoordinatorIdentifier___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = a3;
  v4[5] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

void __71__AVPlayerItem_AVPlayerInterstitialSupport___setCoordinatorIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 1312) = *(_QWORD *)(a1 + 32);
}

- (BOOL)participatesInCoordinatedPlayback
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
  v9 = 1;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__AVPlayerItem_AVPlayerInterstitialSupport__participatesInCoordinatedPlayback__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __78__AVPlayerItem_AVPlayerInterstitialSupport__participatesInCoordinatedPlayback__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 1320);
  return result;
}

- (void)_setParticipatesInCoordinatedPlayback:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[5];
  BOOL v5;

  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__AVPlayerItem_AVPlayerInterstitialSupport___setParticipatesInCoordinatedPlayback___block_invoke;
  v4[3] = &unk_1E302FD38;
  v4[4] = self;
  v5 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __83__AVPlayerItem_AVPlayerInterstitialSupport___setParticipatesInCoordinatedPlayback___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 1320) = *(_BYTE *)(result + 40);
  return result;
}

- (id)_integratedTimelineOffsets
{
  OpaqueFigPlaybackItem *v2;
  OpaqueFigPlaybackItem *v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, _QWORD, id *);
  id v7;

  v7 = 0;
  v2 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v2)
  {
    v3 = v2;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v5 = *(void (**)(uint64_t, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v5)
      v5(FigBaseObject, *MEMORY[0x1E0CC5190], *MEMORY[0x1E0C9AE00], &v7);
    CFRelease(v3);
    v2 = (OpaqueFigPlaybackItem *)v7;
  }
  return v2;
}

- (id)_interstitialEventItemTimeOffset
{
  OpaqueFigPlaybackItem *v2;
  OpaqueFigPlaybackItem *v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, _QWORD, id *);
  id v7;

  v7 = 0;
  v2 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v2)
  {
    v3 = v2;
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v5 = *(void (**)(uint64_t, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v5)
      v5(FigBaseObject, *MEMORY[0x1E0CC5198], *MEMORY[0x1E0C9AE00], &v7);
    CFRelease(v3);
    v2 = (OpaqueFigPlaybackItem *)v7;
  }
  return v2;
}

- (id)_copyIntegratedTimelineIfCreated
{
  NSObject *ivarAccessQueue;
  void *v3;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__AVPlayerItem_AVPlayerItemIntegratedTimelineSupport___copyIntegratedTimelineIfCreated__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __87__AVPlayerItem_AVPlayerItemIntegratedTimelineSupport___copyIntegratedTimelineIfCreated__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 976);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (AVPlayerItemIntegratedTimeline)integratedTimeline
{
  id v3;
  const void *v4;
  NSObject *ivarAccessQueue;
  AVPlayerItemIntegratedTimeline *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__7;
  v13 = __Block_byref_object_dispose__7;
  v14 = 0;
  if ((objc_msgSend(-[AVPlayerItem _player](self, "_player"), "_isInterstitialPlayer") & 1) == 0)
  {
    v3 = -[AVPlayerItem _copyIntegratedTimelineIfCreated](self, "_copyIntegratedTimelineIfCreated");
    v10[5] = (uint64_t)v3;
    if (!v3)
    {
      v4 = (const void *)objc_msgSend(-[AVPlayerItem _player](self, "_player"), "_copyInterstitialCoordinatorIfCreated");
      ivarAccessQueue = self->_playerItem->ivarAccessQueue;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __73__AVPlayerItem_AVPlayerItemIntegratedTimelineSupport__integratedTimeline__block_invoke;
      v8[3] = &unk_1E302FDB0;
      v8[4] = self;
      v8[5] = &v9;
      av_readwrite_dispatch_queue_write(ivarAccessQueue, v8);
      objc_msgSend((id)v10[5], "_attachToItem:", self);
      objc_msgSend((id)v10[5], "_attachCoordinator:", v4);
      objc_msgSend((id)v10[5], "_attachInterstitialPlayer:", objc_msgSend(-[AVPlayerItem _player](self, "_player"), "_interstitialPlayerIfCreated"));
      if (v4)
        CFRelease(v4);
    }
  }
  v6 = (AVPlayerItemIntegratedTimeline *)(id)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

id __73__AVPlayerItem_AVPlayerItemIntegratedTimelineSupport__integratedTimeline__block_invoke(uint64_t a1)
{
  void *v2;
  id result;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 976);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 976) = -[AVPlayerItemIntegratedTimeline _initInternal]([AVPlayerItemIntegratedTimeline alloc], "_initInternal");
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 976);
  }
  result = v2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)isDefunct
{
  OpaqueFigPlaybackItem *v3;
  _QWORD *v4;
  uint64_t (*v5)(OpaqueFigPlaybackItem *, BOOL *);
  int v6;
  BOOL result;
  BOOL v8;

  v8 = 0;
  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = *(_QWORD **)(CMBaseObjectGetVTable() + 8);
    if (*v4 < 5uLL)
      goto LABEL_8;
    v5 = (uint64_t (*)(OpaqueFigPlaybackItem *, BOOL *))v4[11];
    if (!v5)
      goto LABEL_8;
    v6 = v5(v3, &v8);
    if (v8)
    {
LABEL_9:
      CFRelease(v3);
      return v8;
    }
    if (v6)
    {
LABEL_8:
      v8 = 1;
      goto LABEL_9;
    }
  }
  result = -[AVAsset isDefunct](-[AVPlayerItem asset](self, "asset"), "isDefunct");
  v8 = result;
  if (v3)
    goto LABEL_9;
  return result;
}

- (NSArray)speedRamp
{
  NSObject *ivarAccessQueue;
  NSArray *v3;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__AVPlayerItem_AVPlayerItemSpeedRamp__speedRamp__block_invoke;
  v5[3] = &unk_1E302FDB0;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSArray *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__AVPlayerItem_AVPlayerItemSpeedRamp__speedRamp__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(_QWORD *)(v1 + 1472))
  {
    v2 = result;
    result = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *(_QWORD *)(v1 + 1480));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 40) = result;
    v3 = *(_QWORD *)(v2 + 32);
    v5 = *(_QWORD *)(v3 + 8);
    v4 = v3 + 8;
    if (*(_QWORD *)(v5 + 1480))
    {
      v6 = 0;
      v7 = 0;
      do
      {
        v16 = 0u;
        v17 = 0u;
        v14 = 0u;
        v15 = 0u;
        v12 = 0u;
        v13 = 0u;
        objc_msgSend(*(id *)(*(_QWORD *)v4 + 1472), "getBytes:range:", &v12, v6, 96);
        v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 40);
        v11[2] = v14;
        v11[3] = v15;
        v11[4] = v16;
        v11[5] = v17;
        v11[0] = v12;
        v11[1] = v13;
        result = objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTimeMapping:", v11));
        ++v7;
        v9 = *(_QWORD *)(v2 + 32);
        v10 = *(_QWORD *)(v9 + 8);
        v4 = v9 + 8;
        v6 += 96;
      }
      while (v7 < *(_QWORD *)(v10 + 1480));
    }
  }
  return result;
}

- (void)setSpeedRamp:(id)a3
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  CMTimeEpoch v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  CMTimeFlags v20;
  CMTimeEpoch v21;
  void *v22;
  CMTimeFlags v23;
  CMTimeEpoch v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  NSObject *ivarAccessQueue;
  void *v32;
  uint64_t v33;
  const __CFString *v34;
  objc_class *v35;
  const char *v36;
  void *v37;
  uint64_t v38;
  AVPlayerItem *v39;
  __int128 v40;
  unint64_t v41;
  _QWORD block[6];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  CMTimeRange v47;
  CMTimeRange v48;
  CMTime v49;
  CMTime v50;
  CMTime v51;
  CMTime v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _OWORD v57[2];
  CMTime v58;
  __int128 v59;
  _OWORD v60[5];
  CMTime v61;
  CMTimeRange time2[2];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  CMTime v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  CMTime time1;
  CMTime v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  CMTimeRange v81;
  CMTimeRange v82;
  CMTime v83;
  CMTimeRange v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  CMTimeRange range;
  CMTime v89;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  _BYTE v93[128];
  CMTimeValue v94;
  CMTimeScale v95;
  CMTimeValue v96;
  CMTimeScale v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  if (!a3 || (v41 = objc_msgSend(a3, "count")) == 0)
  {
    v7 = 0;
    goto LABEL_54;
  }
  v6 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  if (v6)
  {
    objc_msgSend(v6, "CMTimeMappingValue");
  }
  else
  {
    v87 = 0u;
    v86 = 0u;
    v85 = 0u;
    memset(&v84, 0, sizeof(v84));
  }
  range = v84;
  CMTimeRangeGetEnd(&v83, &range);
  if ((v83.flags & 0x1D) != 1)
    goto LABEL_60;
  v13 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  if (v13)
  {
    objc_msgSend(v13, "CMTimeMappingValue");
  }
  else
  {
    memset(&v81, 0, sizeof(v81));
    v79 = 0u;
    v80 = 0u;
    v78 = 0u;
  }
  v82 = v81;
  CMTimeRangeGetEnd(&v77, &v82);
  if ((v77.flags & 0x1D) != 1)
  {
LABEL_60:
    v32 = (void *)MEMORY[0x1E0C99DA0];
    v33 = *MEMORY[0x1E0C99778];
    v34 = CFSTR("All time mappings must have numeric start and duration times");
LABEL_63:
    v35 = (objc_class *)self;
    v36 = a2;
    goto LABEL_59;
  }
  v14 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  if (v14)
  {
    objc_msgSend(v14, "CMTimeMappingValue");
  }
  else
  {
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
  }
  *(_OWORD *)&time1.value = v70;
  time1.epoch = v71;
  v40 = *MEMORY[0x1E0CA2E68];
  *(_OWORD *)&time2[0].start.value = *MEMORY[0x1E0CA2E68];
  v15 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  time2[0].start.epoch = v15;
  if (CMTimeCompare(&time1, &time2[0].start))
  {
    v32 = (void *)MEMORY[0x1E0C99DA0];
    v33 = *MEMORY[0x1E0C99778];
    v34 = CFSTR("First time mapping must have zero source start time");
    goto LABEL_63;
  }
  v16 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  if (v16)
  {
    objc_msgSend(v16, "CMTimeMappingValue");
  }
  else
  {
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
  }
  *(_OWORD *)&v69.value = v66;
  v69.epoch = v67;
  *(_OWORD *)&time2[0].start.value = v40;
  time2[0].start.epoch = v15;
  if (CMTimeCompare(&v69, &time2[0].start))
  {
    v32 = (void *)MEMORY[0x1E0C99DA0];
    v33 = *MEMORY[0x1E0C99778];
    v34 = CFSTR("First time mapping must have zero target start time");
    goto LABEL_63;
  }
  v39 = self;
  memset(time2, 0, sizeof(time2));
  v17 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  if (v17)
    objc_msgSend(v17, "CMTimeMappingValue");
  else
    memset(time2, 0, sizeof(time2));
  if (v41 >= 2)
  {
    v18 = 1;
    while (1)
    {
      v19 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v18);
      if (v19)
      {
        objc_msgSend(v19, "CMTimeMappingValue");
        v20 = HIDWORD(v59);
        v21 = *(_QWORD *)&v60[0];
      }
      else
      {
        v21 = 0;
        v20 = 0;
        v59 = 0u;
        memset(v60, 0, sizeof(v60));
      }
      v96 = v59;
      v97 = DWORD2(v59);
      v61 = *(CMTime *)((char *)v60 + 8);
      v22 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v18);
      if (v22)
      {
        objc_msgSend(v22, "CMTimeMappingValue");
        v23 = HIDWORD(v56);
        v24 = *(_QWORD *)&v57[0];
      }
      else
      {
        v24 = 0;
        v23 = 0;
        memset(v57, 0, sizeof(v57));
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
      }
      v94 = v56;
      v95 = DWORD2(v56);
      v58 = *(CMTime *)((char *)v57 + 8);
      v47.start.value = v96;
      v47.start.timescale = v97;
      v47.start.flags = v20;
      v47.start.epoch = v21;
      v47.duration = v61;
      CMTimeRangeGetEnd(&v52, &v47);
      if ((v52.flags & 0x1D) != 1
        || (v47.start.value = v94,
            v47.start.timescale = v95,
            v47.start.flags = v23,
            v47.start.epoch = v24,
            v47.duration = v58,
            CMTimeRangeGetEnd(&v51, &v47),
            (v51.flags & 0x1D) != 1))
      {
        v32 = (void *)MEMORY[0x1E0C99DA0];
        v33 = *MEMORY[0x1E0C99778];
        v34 = CFSTR("All time mappings must have numeric start and duration times");
        goto LABEL_58;
      }
      v47 = time2[0];
      CMTimeRangeGetEnd(&v50, &v47);
      if ((v50.flags & 0x1F) != 3 && (v20 & 0x1F) != 3)
        goto LABEL_66;
      memset(&v47, 0, 24);
      lhs = v50;
      rhs.value = v96;
      rhs.timescale = v97;
      rhs.flags = v20;
      rhs.epoch = v21;
      CMTimeSubtract(&time, &lhs, &rhs);
      CMTimeAbsoluteValue(&v47.start, &time);
      CMTimeMake(&v89, 1, 1000000000);
      lhs = v47.start;
      if (CMTimeCompare(&lhs, &v89) > 0)
      {
LABEL_66:
        v47.start = v50;
        lhs.value = v96;
        lhs.timescale = v97;
        lhs.flags = v20;
        lhs.epoch = v21;
        if (CMTimeCompare(&v47.start, &lhs))
        {
          v32 = (void *)MEMORY[0x1E0C99DA0];
          v33 = *MEMORY[0x1E0C99778];
          v34 = CFSTR("Each time mapping's source start time must match the previous mapping's source end time");
          goto LABEL_58;
        }
      }
      v47 = time2[1];
      CMTimeRangeGetEnd(&v49, &v47);
      if ((v49.flags & 0x1F) != 3 && (v23 & 0x1F) != 3)
        goto LABEL_67;
      memset(&v47, 0, 24);
      lhs = v49;
      rhs.value = v94;
      rhs.timescale = v95;
      rhs.flags = v23;
      rhs.epoch = v24;
      CMTimeSubtract(&time, &lhs, &rhs);
      CMTimeAbsoluteValue(&v47.start, &time);
      CMTimeMake(&v89, 1, 1000000000);
      lhs = v47.start;
      if (CMTimeCompare(&lhs, &v89) > 0)
      {
LABEL_67:
        v47.start = v49;
        lhs.value = v94;
        lhs.timescale = v95;
        lhs.flags = v23;
        lhs.epoch = v24;
        if (CMTimeCompare(&v47.start, &lhs))
          break;
      }
      v25 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v18);
      if (v25)
      {
        objc_msgSend(v25, "CMTimeMappingValue");
      }
      else
      {
        memset(&v48, 0, sizeof(v48));
        memset(&v47, 0, sizeof(v47));
      }
      time2[0] = v47;
      time2[1] = v48;
      if (v41 == ++v18)
        goto LABEL_45;
    }
    v32 = (void *)MEMORY[0x1E0C99DA0];
    v33 = *MEMORY[0x1E0C99778];
    v34 = CFSTR("Each time mapping's target start time must match the previous mapping's target end time");
LABEL_58:
    v36 = a2;
    v35 = (objc_class *)v39;
LABEL_59:
    v37 = (void *)objc_msgSend(v32, "exceptionWithName:reason:userInfo:", v33, AVMethodExceptionReasonWithObjectAndSelector(v35, v36, (uint64_t)v34, v8, v9, v10, v11, v12, v38), 0);
    objc_exception_throw(v37);
  }
LABEL_45:
  self = v39;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 96 * (uint64_t)v39->_playerItem->eventTimeline);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v26 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v93, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v44 != v28)
          objc_enumerationMutation(a3);
        v30 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        memset(time2, 0, sizeof(time2));
        if (v30)
          objc_msgSend(v30, "CMTimeMappingValue");
        objc_msgSend(v7, "appendBytes:length:", time2, 96);
      }
      v27 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v93, 16);
    }
    while (v27);
  }
LABEL_54:
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AVPlayerItem_AVPlayerItemSpeedRamp__setSpeedRamp___block_invoke;
  block[3] = &unk_1E302FCE8;
  block[4] = self;
  block[5] = v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  -[AVPlayerItem _updateSpeedRampDataOnFigPlaybackItem](self, "_updateSpeedRampDataOnFigPlaybackItem");
}

unint64_t __52__AVPlayerItem_AVPlayerItemSpeedRamp__setSpeedRamp___block_invoke(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1472) = *(id *)(a1 + 40);
  result = objc_msgSend(*(id *)(a1 + 40), "length");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1480) = result / 0x60;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1488) = 1;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)speedRampAdjustabilityMargin
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, 2, 1);
}

- (BOOL)_speedRampDataWasSet
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
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__AVPlayerItem_AVPlayerItemSpeedRampInternal___speedRampDataWasSet__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __67__AVPlayerItem_AVPlayerItemSpeedRampInternal___speedRampDataWasSet__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 1488);
  return result;
}

- (void)_updateSpeedRampDataOnFigPlaybackItem
{
  OpaqueFigPlaybackItem *v3;
  OpaqueFigPlaybackItem *v4;
  NSObject *figPlaybackItemSetterQueue;
  _QWORD v6[6];

  v3 = -[AVPlayerItem _copyFigPlaybackItem](self, "_copyFigPlaybackItem");
  if (v3)
  {
    v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __84__AVPlayerItem_AVPlayerItemSpeedRampInternal___updateSpeedRampDataOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __84__AVPlayerItem_AVPlayerItemSpeedRampInternal___updateSpeedRampDataOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t FigBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1472);
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 56);
  if (v4)
    return v4(FigBaseObject, *MEMORY[0x1E0CC5300], v1);
  return result;
}

- (void)getEventTimelineWithCompletionHandler:(id)a3
{
  NSObject *ivarAccessQueue;
  uint64_t v6;
  _QWORD *v7;
  uint64_t FigBaseObject;
  uint64_t (*v9)(uint64_t, _QWORD, _QWORD, _QWORD *);
  signed int v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  _QWORD v15[6];
  _QWORD block[9];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__AVPlayerItem_AVMetricEventStreamPublisherInternal__getEventTimelineWithCompletionHandler___block_invoke;
  block[3] = &unk_1E3032138;
  block[6] = &v25;
  block[7] = &v21;
  block[8] = &v17;
  block[4] = self;
  block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (!v22[3] || (v7 = v26 + 3, v26[3]))
  {
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  FigBaseObject = FigPlaybackItemGetFigBaseObject();
  v9 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v9)
  {
    v10 = v9(FigBaseObject, *MEMORY[0x1E0CC51F8], *MEMORY[0x1E0C9AE00], v7);
    if (v10)
      goto LABEL_7;
    v11 = self->_playerItem->ivarAccessQueue;
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __92__AVPlayerItem_AVMetricEventStreamPublisherInternal__getEventTimelineWithCompletionHandler___block_invoke_2;
    v15[3] = &unk_1E302FDB0;
    v15[4] = self;
    v15[5] = &v25;
    av_readwrite_dispatch_queue_write(v11, v15);
    goto LABEL_6;
  }
  v10 = -12782;
LABEL_7:
  if (!*((_BYTE *)v18 + 24))
  {
    v12 = v26[3];
    if (v12)
    {
      (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, v12, 0);
    }
    else
    {
      if (v10)
        v13 = AVLocalizedErrorWithUnderlyingOSStatus(v10, 0);
      else
        v13 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11800, 0);
      (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, v13);
    }
  }
  v14 = (const void *)v26[3];
  if (v14)
    CFRelease(v14);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
}

void __92__AVPlayerItem_AVMetricEventStreamPublisherInternal__getEventTimelineWithCompletionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  CFTypeRef v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(_QWORD *)(a1[4] + 8);
  v3 = *(const void **)(v2 + 120);
  if (v3)
  {
    v4 = *(const void **)(v2 + 1464);
    if (v4)
    {
      v5 = CFRetain(v4);
      v6 = a1[6];
    }
    else
    {
      v5 = CFRetain(v3);
      v6 = a1[7];
    }
    *(_QWORD *)(*(_QWORD *)(v6 + 8) + 24) = v5;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;
    v7 = (void *)a1[5];
    if (v7)
    {
      v8 = (id)objc_msgSend(v7, "copy");
      objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 1456), "addObject:", v8);

    }
  }
}

void __92__AVPlayerItem_AVMetricEventStreamPublisherInternal__getEventTimelineWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  const void *v2;
  const void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(const void **)(v1 + 1464);
  v3 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  *(_QWORD *)(v1 + 1464) = v3;
  if (v3)
    CFRetain(v3);
  if (v2)
    CFRelease(v2);
}

@end
