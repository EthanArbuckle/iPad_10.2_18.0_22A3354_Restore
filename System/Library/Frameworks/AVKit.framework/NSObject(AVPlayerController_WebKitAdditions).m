@implementation NSObject(AVPlayerController_WebKitAdditions)

- (void)avkit_setWebKitDelegate:()AVPlayerController_WebKitAdditions
{
  void *v4;
  id v5;

  v5 = a3;
  if ((objc_msgSend(a1, "avkit_isAVPlayerControllerOrSubclass") & 1) == 0)
  {
    objc_msgSend(a1, "_avkit_playerControllerWebKitData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", v5);

  }
}

- (uint64_t)avkit_isAVPlayerControllerOrSubclass
{
  return 0;
}

- (uint64_t)avkit_webkitIsScrubbing
{
  void *v3;
  uint64_t v4;

  if ((objc_msgSend(a1, "avkit_isAVPlayerControllerOrSubclass") & 1) != 0)
    return 0;
  objc_msgSend(a1, "_avkit_playerControllerWebKitData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScrubbing");

  return v4;
}

- (void)avkit_setWebKitIsScrubbing:()AVPlayerController_WebKitAdditions
{
  id v5;

  if ((objc_msgSend(a1, "avkit_isAVPlayerControllerOrSubclass") & 1) == 0)
  {
    objc_msgSend(a1, "_avkit_playerControllerWebKitData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setScrubbing:", a3);

  }
}

- (void)avkit_webkitSeekToTime
{
  void *v2;

  if ((objc_msgSend(a1, "avkit_isAVPlayerControllerOrSubclass") & 1) == 0)
  {
    objc_msgSend(a1, "_avkit_playerControllerWebKitData");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "seekToTime");

  }
}

- (void)avkit_setWebKitSeekToTime:()AVPlayerController_WebKitAdditions
{
  id v4;

  if ((objc_msgSend(a1, "avkit_isAVPlayerControllerOrSubclass") & 1) == 0)
  {
    objc_msgSend(a1, "_avkit_playerControllerWebKitData");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSeekToTime:", a2);

  }
}

- (id)avkit_webkitDelegate
{
  void *v2;
  void *v3;

  if ((objc_msgSend(a1, "avkit_isAVPlayerControllerOrSubclass") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(a1, "_avkit_playerControllerWebKitData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (AVPlayerControllerWebKitData)_avkit_playerControllerWebKitData
{
  NSObject *v2;
  AVPlayerControllerWebKitData *v3;
  uint8_t v5[16];

  if (objc_msgSend(a1, "avkit_isAVPlayerControllerOrSubclass"))
  {
    _AVLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v2, OS_LOG_TYPE_ERROR, "WebKit AVPlayerController data is not available for AVPlayerController subclasses.", v5, 2u);
    }

  }
  objc_getAssociatedObject(a1, (const void *)AVPlayerControllerWebKitDataPropertyKey);
  v3 = (AVPlayerControllerWebKitData *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = -[AVPlayerControllerWebKitData initWithPlayerController:]([AVPlayerControllerWebKitData alloc], "initWithPlayerController:", a1);
    objc_setAssociatedObject(a1, (const void *)AVPlayerControllerWebKitDataPropertyKey, v3, (void *)1);
  }
  return v3;
}

@end
