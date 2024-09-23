@implementation AVPlaybackItemInspectorLoader

- (Class)_classForTrackInspectors
{
  return (Class)objc_opt_class();
}

- (OpaqueFigPlaybackItem)_playbackItem
{
  return self->_playbackItem;
}

- (id)assetInspector
{
  id result;

  result = self->super._assetInspector;
  if (!result)
  {
    result = -[AVPlaybackItemInspector initWithPlaybackItem:trackIDs:]([AVPlaybackItemInspector alloc], "initWithPlaybackItem:trackIDs:", self->_playbackItem, self->_trackIDs);
    self->super._assetInspector = (AVAssetInspector *)result;
  }
  return result;
}

- (AVPlaybackItemInspectorLoader)initWithURL:(id)a3 playbackItem:(OpaqueFigPlaybackItem *)a4 trackIDs:(id)a5 dynamicBehavior:(BOOL)a6
{
  AVPlaybackItemInspectorLoader *v9;
  AVPlaybackItemInspectorLoader *v10;
  _OWORD *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVPlaybackItemInspectorLoader;
  v9 = -[AVAssetMakeReadyForInspectionLoader initWithURL:](&v13, sel_initWithURL_, a3);
  v10 = v9;
  if (v9)
  {
    if (a4)
    {
      v9->_playbackItem = (OpaqueFigPlaybackItem *)CFRetain(a4);
      v10->_trackIDs = (NSArray *)a5;
      v10->_shouldCacheDuration = !a6;
      v11 = (_OWORD *)MEMORY[0x1E0CA2E18];
      *(_QWORD *)&v10->_cachedDuration.flags = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      *(_OWORD *)(&v10->_shouldCacheDuration + 4) = *v11;
      -[AVPlaybackItemInspectorLoader _addFigObjectNotifications](v10, "_addFigObjectNotifications");
    }
    else
    {

      return 0;
    }
  }
  return v10;
}

- (unint64_t)hash
{
  OpaqueFigPlaybackItem *v3;
  objc_super v5;

  v3 = -[AVPlaybackItemInspectorLoader _playbackItem](self, "_playbackItem");
  if (v3)
    return CFHash(v3);
  v5.receiver = self;
  v5.super_class = (Class)AVPlaybackItemInspectorLoader;
  return -[AVPlaybackItemInspectorLoader hash](&v5, sel_hash);
}

- (void)dealloc
{
  OpaqueFigPlaybackItem *playbackItem;
  objc_super v4;

  -[AVPlaybackItemInspectorLoader _removeFigObjectNotifications](self, "_removeFigObjectNotifications");

  playbackItem = self->_playbackItem;
  if (playbackItem)
    CFRelease(playbackItem);
  v4.receiver = self;
  v4.super_class = (Class)AVPlaybackItemInspectorLoader;
  -[AVAssetMakeReadyForInspectionLoader dealloc](&v4, sel_dealloc);
}

- (void)_removeFigObjectNotifications
{
  id v3;
  AVWeakReference *v4;

  if (self->_playbackItem)
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v4 = -[AVAssetInspectorLoader _weakReference](self, "_weakReference");
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, handlePlaybackItemNotification, *MEMORY[0x1E0CC4DC8], self->_playbackItem);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, handlePlaybackItemNotification, *MEMORY[0x1E0CC4D18], self->_playbackItem);
    CFRelease(v4);
  }
}

- (void)_addFigObjectNotifications
{
  id v3;
  AVWeakReference *v4;

  v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  v4 = -[AVAssetInspectorLoader _weakReference](self, "_weakReference");
  CFRetain(v4);
  objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, handlePlaybackItemNotification, *MEMORY[0x1E0CC4DC8], self->_playbackItem, 0);
  objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, handlePlaybackItemNotification, *MEMORY[0x1E0CC4D18], self->_playbackItem, 0);
}

- (BOOL)isEqual:(id)a3
{
  OpaqueFigPlaybackItem *v5;
  uint64_t v6;
  const void *v7;
  BOOL result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[AVPlaybackItemInspectorLoader _playbackItem](self, "_playbackItem");
  v6 = objc_msgSend(a3, "_playbackItem");
  if (v5 == (OpaqueFigPlaybackItem *)v6)
    return 1;
  v7 = (const void *)v6;
  result = 0;
  if (v5)
  {
    if (v7)
      return CFEqual(v5, v7) != 0;
  }
  return result;
}

- (void)cancelLoading
{
  OpaqueFigPlaybackItem *playbackItem;
  objc_super v4;

  -[AVPlaybackItemInspectorLoader _removeFigObjectNotifications](self, "_removeFigObjectNotifications");
  playbackItem = self->_playbackItem;
  if (playbackItem)
  {
    CFRelease(playbackItem);
    self->_playbackItem = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlaybackItemInspectorLoader;
  -[AVAssetMakeReadyForInspectionLoader cancelLoading](&v4, sel_cancelLoading);
}

- (OpaqueFigFormatReader)_copyFormatReaderFromFigObjectWithFigErrorCode:(int *)a3
{
  OpaqueFigPlaybackItem *playbackItem;
  uint64_t (*v5)(OpaqueFigPlaybackItem *, OpaqueFigFormatReader **);
  int v6;
  OpaqueFigFormatReader *v8;

  v8 = 0;
  playbackItem = self->_playbackItem;
  if (playbackItem)
  {
    v5 = *(uint64_t (**)(OpaqueFigPlaybackItem *, OpaqueFigFormatReader **))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 16)
                                                                                     + 120);
    if (v5)
    {
      v6 = v5(playbackItem, &v8);
      if (!a3)
        return v8;
    }
    else
    {
      v6 = -12782;
      if (!a3)
        return v8;
    }
    goto LABEL_6;
  }
  v6 = 0;
  if (a3)
LABEL_6:
    *a3 = v6;
  return v8;
}

- (BOOL)_inspectionRequiresAFormatReader
{
  return 0;
}

- (id)_dictionaryOfSpecialGettersForKeyValueStatus
{
  if (getDictionaryOfSpecialPlaybackItemGettersForKeyValueStatus_onceToken != -1)
    dispatch_once(&getDictionaryOfSpecialPlaybackItemGettersForKeyValueStatus_onceToken, &__block_literal_global_284);
  return (id)getDictionaryOfSpecialPlaybackItemGettersForKeyValueStatus_sSpecialPlaybackItemGettersForKeyValueStatus;
}

- (id)_playbackItemPropertiesForKeys:(id)a3
{
  uint64_t v3;
  void *v4;
  id result;

  v3 = objc_msgSend(0, "objectsForKeys:notFoundMarker:", a3, objc_msgSend(MEMORY[0x1E0C99E38], "null"));
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v3);
  objc_msgSend(v4, "removeObject:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
  result = (id)objc_msgSend(v4, "count");
  if (result)
    return (id)objc_msgSend(v4, "allObjects");
  return result;
}

- (id)_loadValuesUsingDefaultLoadingMethodWhileMutexLockedForKeys:(id)a3
{
  id v5;
  OpaqueFigPlaybackItem *playbackItem;
  uint64_t (*v7)(OpaqueFigPlaybackItem *, id, char *);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;

  v5 = -[AVPlaybackItemInspectorLoader _playbackItemPropertiesForKeys:](self, "_playbackItemPropertiesForKeys:");
  v12 = 0;
  playbackItem = self->_playbackItem;
  v7 = *(uint64_t (**)(OpaqueFigPlaybackItem *, id, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
  if (v7)
  {
    v8 = v7(playbackItem, v5, &v12);
    v9 = 3;
    if (!(_DWORD)v8)
      v9 = 1;
    if (v12)
      v10 = 2;
    else
      v10 = v9;
  }
  else
  {
    v8 = 4294954514;
    v10 = 3;
  }
  -[AVAssetMakeReadyForInspectionLoader _updateStatusWhileMutexLocked:figErrorCode:](self, "_updateStatusWhileMutexLocked:figErrorCode:", v10, v8);
  if (v12)
    return a3;
  else
    return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v3;

  v3 = self;
  if (LOBYTE(self[3].var3) && (self[4].var1 & 1) != 0)
  {
    *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[3].var3 + 4);
    retstr->var3 = *(_QWORD *)&self[4].var2;
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
    self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE assetInspector](self, "assetInspector");
    if (self)
    {
      self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE duration](self, "duration");
    }
    else
    {
      retstr->var0 = 0;
      *(_QWORD *)&retstr->var1 = 0;
      retstr->var3 = 0;
    }
    if (LOBYTE(v3[3].var3))
    {
      *(_OWORD *)((char *)&v3[3].var3 + 4) = *(_OWORD *)&retstr->var0;
      *(_QWORD *)&v3[4].var2 = retstr->var3;
    }
  }
  return self;
}

@end
