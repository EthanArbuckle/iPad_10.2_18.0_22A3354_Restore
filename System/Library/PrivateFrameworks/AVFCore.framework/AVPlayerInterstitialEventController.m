@implementation AVPlayerInterstitialEventController

- (AVPlayerInterstitialEventController)initWithPrimaryPlayer:(AVPlayer *)primaryPlayer
{
  OpaqueFigPlayerInterstitialCoordinator *v5;
  AVPlayerInterstitialEventController *v6;
  NSObject *v7;
  objc_super v9;

  v5 = -[AVPlayer _copyInterstitialCoordinator](primaryPlayer, "_copyInterstitialCoordinator");
  if (v5)
  {
    CFRelease(v5);
    v9.receiver = self;
    v9.super_class = (Class)AVPlayerInterstitialEventController;
    v6 = -[AVPlayerInterstitialEventMonitor initWithPrimaryPlayer:](&v9, sel_initWithPrimaryPlayer_, primaryPlayer);
    if (v6)
    {
      v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v6->_ivarQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplayerinterstitialeventcontroller", v7);
    }
  }
  else
  {

    return 0;
  }
  return v6;
}

+ (AVPlayerInterstitialEventController)interstitialEventControllerWithPrimaryPlayer:(AVPlayer *)primaryPlayer
{
  return (AVPlayerInterstitialEventController *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithPrimaryPlayer:", primaryPlayer);
}

- (void)dealloc
{
  NSObject *ivarQueue;
  objc_super v4;

  ivarQueue = self->_ivarQueue;
  if (ivarQueue)
    dispatch_release(ivarQueue);
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerInterstitialEventController;
  -[AVPlayerInterstitialEventMonitor dealloc](&v4, sel_dealloc);
}

- (void)setEvents:(NSArray *)events
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  OpaqueFigPlayerInterstitialCoordinator *v10;
  id v11;
  void (*v12)(OpaqueFigPlayerInterstitialCoordinator *, id);
  unsigned int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](events, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(events);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v13 = 0;
        if ((objc_msgSend(v9, "validate:", &v13) & 1) == 0)
          objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid event %@ (%d)"), v9, v13), 0));
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](events, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  v10 = -[AVPlayer _copyInterstitialCoordinator](-[AVPlayerInterstitialEventMonitor primaryPlayer](self, "primaryPlayer"), "_copyInterstitialCoordinator");
  v11 = -[AVPlayerInterstitialEventMonitor makeCopyOf:immutable:](self, "makeCopyOf:immutable:", events, 0);
  v12 = *(void (**)(OpaqueFigPlayerInterstitialCoordinator *, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                            + 24);
  if (v12)
    v12(v10, v11);
  if (v10)
    CFRelease(v10);
}

- (void)cancelCurrentEventWithResumptionOffset:(CMTime *)resumptionOffset
{
  OpaqueFigPlayerInterstitialCoordinator *v5;
  id v6;
  void *v7;
  void (*v8)(OpaqueFigPlayerInterstitialCoordinator *, __int128 *);
  __int128 v9;
  CMTimeEpoch epoch;
  __int128 v11;
  CMTimeEpoch v12;

  v5 = -[AVPlayer _copyInterstitialCoordinator](-[AVPlayerInterstitialEventMonitor primaryPlayer](self, "primaryPlayer"), "_copyInterstitialCoordinator");
  v6 = -[AVPlayer _playbackCoordinatorWithoutTriggeringFullSetup](-[AVPlayerInterstitialEventMonitor primaryPlayer](self, "primaryPlayer"), "_playbackCoordinatorWithoutTriggeringFullSetup");
  if (v6)
  {
    v7 = v6;
    if (-[AVPlayerInterstitialEvent _participatesInCoordinatedPlayback](-[AVPlayerInterstitialEventMonitor currentEvent](self, "currentEvent"), "_participatesInCoordinatedPlayback"))
    {
      objc_msgSend(v7, "_resetGroupTimelineExpectations");
    }
  }
  v9 = *(_OWORD *)&resumptionOffset->value;
  epoch = resumptionOffset->epoch;
  v8 = *(void (**)(OpaqueFigPlayerInterstitialCoordinator *, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 16)
                                                                                   + 40);
  if (v8)
  {
    v11 = v9;
    v12 = epoch;
    v8(v5, &v11);
  }
  if (v5)
    CFRelease(v5);
}

@end
