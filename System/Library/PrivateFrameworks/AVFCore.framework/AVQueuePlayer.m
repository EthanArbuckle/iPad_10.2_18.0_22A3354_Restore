@implementation AVQueuePlayer

+ (void)initialize
{
  objc_opt_class();
}

- (AVQueuePlayer)init
{
  AVQueuePlayer *v2;
  AVQueuePlayerInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVQueuePlayer;
  v2 = -[AVPlayer init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVQueuePlayerInternal);
    v2->_queuePlayer = v3;
    if (v3)
    {
      -[AVQueuePlayer setActionAtItemEnd:](v2, "setActionAtItemEnd:", 0);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)setActionAtItemEnd:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVQueuePlayer;
  -[AVPlayer _setActionAtItemEnd:allowingAdvance:](&v3, sel__setActionAtItemEnd_allowingAdvance_, a3, 1);
}

- (void)insertItem:(AVPlayerItem *)item afterItem:(AVPlayerItem *)afterItem
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
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Item must be a non-nil instance of AVPlayerItem."), v8, v9, v10, v11, v12, v14), 0);
    objc_exception_throw(v13);
  }
  -[AVPlayer _insertItem:afterItem:](self, "_insertItem:afterItem:", item, afterItem);
}

- (AVQueuePlayer)initWithItems:(NSArray *)items
{
  AVQueuePlayer *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = -[AVQueuePlayer init](self, "init");
  if (v4)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](items, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
            objc_enumerationMutation(items);
          -[AVQueuePlayer insertItem:afterItem:](v4, "insertItem:afterItem:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++), 0);
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](items, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }
  }
  return v4;
}

- (void)dealloc
{
  AVQueuePlayerInternal *queuePlayer;
  objc_super v4;

  queuePlayer = self->_queuePlayer;
  if (queuePlayer)

  v4.receiver = self;
  v4.super_class = (Class)AVQueuePlayer;
  -[AVPlayer dealloc](&v4, sel_dealloc);
}

+ (AVQueuePlayer)queuePlayerWithItems:(NSArray *)items
{
  return (AVQueuePlayer *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithItems:", items);
}

- (int64_t)_defaultActionAtItemEnd
{
  return 0;
}

- (BOOL)canInsertItem:(AVPlayerItem *)item afterItem:(AVPlayerItem *)afterItem
{
  id v6;
  char v7;
  char v8;

  v6 = -[AVPlayer _items](self, "_items");
  v7 = objc_msgSend(v6, "containsObject:", item);
  if (afterItem)
    v8 = objc_msgSend(v6, "containsObject:", afterItem);
  else
    v8 = 1;
  return v8 & ~v7;
}

- (BOOL)canOverlapPlaybackFromPlayerItem:(id)a3 toPlayerItem:(id)a4
{
  NSString *v7;
  int v8;
  void *v9;
  void *v10;

  if (-[AVPlayer actionAtItemEnd](self, "actionAtItemEnd")
    || (v7 = -[AVPlayer multichannelAudioStrategy](self, "multichannelAudioStrategy"),
        -[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("PreferExclusivePassthrough")))
    || -[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("PreferAC3ViaExclusivePassthrough"))
    || -[AVPlayer isExternalPlaybackActive](self, "isExternalPlaybackActive")
    && -[AVPlayer externalPlaybackType](self, "externalPlaybackType") == 1
    || -[AVPlayer _isBufferedAirPlayActive](self, "_isBufferedAirPlayActive")
    || (v9 = (void *)objc_msgSend(a3, "asset"),
        v10 = (void *)objc_msgSend(a4, "asset"),
        !-[AVPlayer _supportsAdvanceTimeForOverlappedPlayback](self, "_supportsAdvanceTimeForOverlappedPlayback"))
    && (_os_feature_enabled_impl() & 1) == 0
    && ((objc_msgSend(v9, "_isStreaming") & 1) != 0 || (objc_msgSend(v10, "_isStreaming") & 1) != 0)
    || (objc_msgSend(v9, "_isStreaming") & 1) == 0 && objc_msgSend((id)objc_msgSend(v9, "tracks"), "count") != 1
    || (objc_msgSend(v10, "_isStreaming") & 1) == 0 && objc_msgSend((id)objc_msgSend(v10, "tracks"), "count") != 1)
  {
    LOBYTE(v8) = 0;
  }
  else if ((objc_msgSend(v9, "_isStreaming") & 1) != 0
         || (v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "tracks"), "firstObject"), "mediaType"), "isEqual:", CFSTR("soun"))) != 0)
  {
    if ((objc_msgSend(v10, "_isStreaming") & 1) != 0)
      LOBYTE(v8) = 1;
    else
      LOBYTE(v8) = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "tracks"), "firstObject"), "mediaType"), "isEqual:", CFSTR("soun"));
  }
  return v8;
}

- (void)_canOverlapPlaybackConditionsChanged
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVQueuePlayerCanOverlapPlaybackConditionsDidChangeNotification"), self);
}

@end
