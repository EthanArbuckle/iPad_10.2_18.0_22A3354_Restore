@implementation AVNetworkPlaybackPerfHUDLayer

- (void)setBounds:(CGRect)a3
{
  CGFloat v4;
  CGFloat v5;
  objc_super v6;

  if (!self->_spatialDiagnostics)
  {
    v4 = a3.size.width - (double)self->_hudXoffset;
    v5 = a3.size.height - (double)self->_hudYoffset;
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[AVNetworkPlaybackPerfHUDLayer setPosition:](self, "setPosition:", (double)self->_hudXoffset, (double)self->_hudYoffset);
    v6.receiver = self;
    v6.super_class = (Class)AVNetworkPlaybackPerfHUDLayer;
    -[AVNetworkPlaybackPerfHUDLayer setBounds:](&v6, sel_setBounds_, 0.0, 0.0, v4, v5);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

- (void)currentItemChanged
{
  if (self->_showHud)
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)&self->_player), "currentItem"), "asset"), "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E3093CA0, 0);
    self->_prevVariantIdx = -1;
    self->_totalStallCount = 0;
  }
}

- (void)setPlayer:(id)a3
{
  objc_storeWeak((id *)&self->_player, a3);
}

- (void)readHudSettingsAndCallCompletionHandler:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__AVNetworkPlaybackPerfHUDLayer_readHudSettingsAndCallCompletionHandler___block_invoke;
  v3[3] = &unk_1E3031550;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

- (AVNetworkPlaybackPerfHUDLayer)init
{
  AVNetworkPlaybackPerfHUDLayer *v2;
  float v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVNetworkPlaybackPerfHUDLayer;
  v2 = -[AVNetworkPlaybackPerfHUDLayer init](&v5, sel_init);
  if (registerOnce != -1)
    dispatch_once(&registerOnce, &__block_literal_global_328_0);
  v3 = *(double *)&sMaxDisplayScale;
  -[AVNetworkPlaybackPerfHUDLayer setContentsScale:](v2, "setContentsScale:", v3);
  -[AVNetworkPlaybackPerfHUDLayer setAnchorPoint:](v2, "setAnchorPoint:", 0.0, 0.0);
  -[AVNetworkPlaybackPerfHUDLayer setFont:](v2, "setFont:", CFSTR("Helvetica-Bold"));
  -[AVNetworkPlaybackPerfHUDLayer setTruncationMode:](v2, "setTruncationMode:", *MEMORY[0x1E0CD31A0]);
  -[AVNetworkPlaybackPerfHUDLayer setWrapped:](v2, "setWrapped:", 1);
  v2->_updateUISettings = 1;
  -[AVNetworkPlaybackPerfHUDLayer setAlignmentMode:](v2, "setAlignmentMode:", *MEMORY[0x1E0CD2900]);
  return v2;
}

- (void)currentItemTracksChanged
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_showHud)
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v2 = (void *)objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)&self->_player), "currentItem", 0), "tracks");
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "assetTrack"), "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E3093CB8, 0);
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }
  }
}

- (BOOL)hudEnabled
{
  return self->_showHud;
}

uint64_t __73__AVNetworkPlaybackPerfHUDLayer_readHudSettingsAndCallCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "getHudSetting");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)getHudSetting
{
  CFIndex AppIntegerValue;
  const __CFNumber *v4;
  const __CFNumber *v5;
  int v6;
  void *v7;
  double v8;
  int v9;
  int v10;
  int v11;
  float valuePtr;

  self->_showHud = CFPreferencesGetAppBooleanValue(CFSTR("enable"), CFSTR("com.apple.avfoundation.videoperformancehud"), 0) != 0;
  self->_spatialDiagnostics = CFPreferencesGetAppBooleanValue(CFSTR("spatial"), CFSTR("com.apple.avfoundation.videoperformancehud"), 0) != 0;
  self->_hudUpdateInterval = 1;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("interval"), CFSTR("com.apple.avfoundation.videoperformancehud"), 0);
  if (AppIntegerValue >= 1)
    self->_hudUpdateInterval = AppIntegerValue;
  self->_colorId = CFPreferencesGetAppIntegerValue(CFSTR("color"), CFSTR("com.apple.avfoundation.videoperformancehud"), 0);
  self->_opacity = 0.7;
  v4 = (const __CFNumber *)CFPreferencesCopyAppValue(CFSTR("opacity"), CFSTR("com.apple.avfoundation.videoperformancehud"));
  if (v4)
  {
    v5 = v4;
    if (CFNumberIsFloatType(v4))
    {
      valuePtr = 0.0;
      if (CFNumberGetValue(v5, kCFNumberFloat32Type, &valuePtr))
        self->_opacity = valuePtr;
    }
    CFRelease(v5);
  }
  self->_fontSizeInt = 30;
  v6 = CFPreferencesGetAppIntegerValue(CFSTR("fontsize"), CFSTR("com.apple.avfoundation.videoperformancehud"), 0);
  if (v6 <= 7)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
    if (!v7)
      goto LABEL_15;
    objc_msgSend(v7, "bounds");
    v9 = (int)(v8 * 30.0 / 1280.0);
    self->_fontSizeInt = v9;
    if (v9 >= 8)
    {
      if (v9 < 0x29)
        goto LABEL_15;
      v6 = 40;
    }
    else
    {
      v6 = 8;
    }
  }
  self->_fontSizeInt = v6;
LABEL_15:
  self->_showCompleteURI = CFPreferencesGetAppBooleanValue(CFSTR("show_complete_uri"), CFSTR("com.apple.avfoundation.videoperformancehud"), 0) != 0;
  self->_hudXoffset = 0;
  self->_hudYoffset = 0;
  v10 = CFPreferencesGetAppIntegerValue(CFSTR("xoffset"), CFSTR("com.apple.avfoundation.videoperformancehud"), 0);
  if (v10 >= 1)
    self->_hudXoffset = v10;
  v11 = CFPreferencesGetAppIntegerValue(CFSTR("yoffset"), CFSTR("com.apple.avfoundation.videoperformancehud"), 0);
  if (v11 >= 1)
    self->_hudYoffset = v11;
}

- (void)dealloc
{
  NSObject *hudTimer;
  objc_super v4;

  hudTimer = self->_hudTimer;
  if (hudTimer)
  {
    dispatch_source_cancel(hudTimer);
    dispatch_release((dispatch_object_t)self->_hudTimer);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVNetworkPlaybackPerfHUDLayer;
  -[AVNetworkPlaybackPerfHUDLayer dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_playerLayer);
  objc_destroyWeak((id *)&self->_player);
}

- (void)setColor:(int)a3
{
  CGColorSpace *DeviceRGB;
  CGColorSpace *v6;
  uint64_t v13;
  CGColor *v14;
  int64x2_t v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3 <= 5)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v6 = DeviceRGB;
    v15 = (int64x2_t)xmmword_19357D3A8;
    v16 = unk_19357D3B8;
    switch(a3)
    {
      case 1:
        v15.i64[1] = 0x3FF0000000000000;
        break;
      case 2:
        v15.i64[0] = 0x3FF0000000000000;
        break;
      case 3:
        goto LABEL_7;
      case 4:
        __asm { FMOV            V0.2D, #1.0; jumptable 000000019352254C case 4 }
        v15 = _Q0;
LABEL_7:
        v13 = 0x3FF0000000000000;
        goto LABEL_9;
      case 5:
        v13 = 0x3FE547AE20000000;
        v15 = vdupq_n_s64(0x3FE547AE20000000uLL);
LABEL_9:
        *(_QWORD *)&v16 = v13;
        break;
      default:
        __asm { FMOV            V0.2D, #1.0; jumptable 000000019352254C default case, case 0 }
        v15 = _Q0;
        break;
    }
    v14 = CGColorCreate(DeviceRGB, (const CGFloat *)v15.i64);
    CGColorSpaceRelease(v6);
    -[AVNetworkPlaybackPerfHUDLayer setForegroundColor:](self, "setForegroundColor:", v14, *(_OWORD *)&v15, v16);
    CGColorRelease(v14);
  }
}

- (void)startDispatchTimer
{
  AVWeakReference *v3;
  unint64_t hudUpdateInterval;
  dispatch_source_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD handler[5];

  v3 = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", self);
  hudUpdateInterval = self->_hudUpdateInterval;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __51__AVNetworkPlaybackPerfHUDLayer_startDispatchTimer__block_invoke;
  handler[3] = &unk_1E302FA10;
  handler[4] = v3;
  v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  if (v5)
  {
    v6 = v5;
    v7 = dispatch_time(0, 0);
    dispatch_source_set_timer(v6, v7, 1000000000 * hudUpdateInterval, 0x3B9ACA00uLL);
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v6);
    self->_hudTimer = (OS_dispatch_source *)v6;
  }

}

void *__51__AVNetworkPlaybackPerfHUDLayer_startDispatchTimer__block_invoke(uint64_t a1)
{
  void *result;

  result = (void *)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  if (result)
    return (void *)objc_msgSend(result, "_hudUpdateTrigger");
  return result;
}

- (float)getScaleFactorForDisplaySize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  float v7;
  float v8;
  BOOL v9;
  float result;

  height = a3.height;
  width = a3.width;
  -[AVNetworkPlaybackPerfHUDLayer bounds](self, "bounds");
  v7 = fmax(v5, v6);
  v8 = fmax(width, height);
  v9 = v7 == 0.0 || v8 == 0.0;
  result = v8 / v7;
  if (v9)
    return 1.0;
  return result;
}

- (BOOL)valueLoadedForKey:(id)a3 onObject:(id)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;

  v7 = (id)-[NSMutableDictionary objectForKey:](self->_loadingStatusCache, "objectForKey:");
  v8 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", a4);
  if (!v7
    || (v9 = (void *)objc_msgSend(v7, "objectForKey:", v8)) == 0
    || (v10 = objc_msgSend(v9, "unsignedLongValue")) == 0)
  {
    v10 = objc_msgSend(a4, "statusOfValueForKey:error:", a3, 0);
    if (v10 >= 2)
    {
      v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v10);
      if (!v7)
      {
        v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        -[NSMutableDictionary setObject:forKey:](self->_loadingStatusCache, "setObject:forKey:", v7, a3);
      }
      objc_msgSend(v7, "setObject:forKey:", v11, v8);
    }
  }
  return v10 == 2;
}

- (void)updateHudWithDisplayString:(id)a3
{
  double opacity;
  CGColorSpace *DeviceRGB;
  CGColorRef v7;
  NSNumber *audioSpatializationMode;
  unint64_t v9;
  int fontSizeInt;
  NSNumber *displayResolutionWidth;
  float v12;
  double v13;
  float v14;
  float v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _OWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_updateUISettings)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[AVNetworkPlaybackPerfHUDLayer setColor:](self, "setColor:", self->_colorId);
    opacity = self->_opacity;
    *(float *)&opacity = opacity;
    -[AVNetworkPlaybackPerfHUDLayer setOpacity:](self, "setOpacity:", opacity);
    -[AVNetworkPlaybackPerfHUDLayer setFontSize:](self, "setFontSize:", (double)self->_fontSizeInt);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    self->_updateUISettings = 0;
  }
  if (!self->_spatialDiagnostics)
    goto LABEL_9;
  if (runningAnInternalBuild_onceToken != -1)
    dispatch_once(&runningAnInternalBuild_onceToken, &__block_literal_global_41);
  if (runningAnInternalBuild_internalBuild)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v20[0] = xmmword_19357D3A8;
    v20[1] = unk_19357D3B8;
    v7 = CGColorCreate(DeviceRGB, (const CGFloat *)v20);
    audioSpatializationMode = self->_audioSpatializationMode;
    if (audioSpatializationMode)
      v9 = -[NSNumber integerValue](audioSpatializationMode, "integerValue");
    else
      v9 = -1;
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    LODWORD(v16) = 1.0;
    -[AVNetworkPlaybackPerfHUDLayer setOpacity:](self, "setOpacity:", v16);
    -[AVNetworkPlaybackPerfHUDLayer setBackgroundColor:](self, "setBackgroundColor:", v7);
    -[AVNetworkPlaybackPerfHUDLayer setWrapped:](self, "setWrapped:", 0);
    if (v9 <= 3)
      -[AVNetworkPlaybackPerfHUDLayer setColor:](self, "setColor:", dword_19357D3D0[v9]);
    -[AVNetworkPlaybackPerfHUDLayer setString:](self, "setString:", a3);
    -[AVNetworkPlaybackPerfHUDLayer preferredFrameSize](self, "preferredFrameSize");
    if (v17 > 0.0)
    {
      -[AVNetworkPlaybackPerfHUDLayer frame](self, "frame");
      v19 = v18;
      -[AVNetworkPlaybackPerfHUDLayer frame](self, "frame");
      -[AVNetworkPlaybackPerfHUDLayer setFrame:](self, "setFrame:", v19);
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    if (v7)
      CFRelease(v7);
    if (DeviceRGB)
      CFRelease(DeviceRGB);
  }
  else
  {
LABEL_9:
    fontSizeInt = self->_fontSizeInt;
    if (self->_displayResolutionHeight)
    {
      displayResolutionWidth = self->_displayResolutionWidth;
      if (displayResolutionWidth)
      {
        -[NSNumber floatValue](displayResolutionWidth, "floatValue");
        v13 = v12;
        -[NSNumber floatValue](self->_displayResolutionHeight, "floatValue");
        -[AVNetworkPlaybackPerfHUDLayer getScaleFactorForDisplaySize:](self, "getScaleFactorForDisplaySize:", v13, v14);
        fontSizeInt = (int)(float)((float)fontSizeInt / v15);
      }
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[AVNetworkPlaybackPerfHUDLayer setFontSize:](self, "setFontSize:", (double)fontSizeInt);
    -[AVNetworkPlaybackPerfHUDLayer setString:](self, "setString:", a3);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

- (id)displayStringGenerator
{
  AVHUDStringGenerator *v3;

  v3 = objc_alloc_init(AVHUDStringGenerator);
  -[AVHUDStringGenerator setCaptureCompleteURI:](v3, "setCaptureCompleteURI:", self->_showCompleteURI);
  -[AVHUDStringGenerator setSpatialDiagnostics:](v3, "setSpatialDiagnostics:", self->_spatialDiagnostics);
  -[AVHUDStringGenerator setPrevStallCount:](v3, "setPrevStallCount:", self->_prevStallCount);
  -[AVHUDStringGenerator setTotalStallCount:](v3, "setTotalStallCount:", self->_totalStallCount);
  -[AVHUDStringGenerator setPlayer:](v3, "setPlayer:", objc_loadWeak((id *)&self->_player));
  return v3;
}

- (void)copyPropertiesFromStringGenerator:(id)a3
{
  self->_prevStallCount = objc_msgSend(a3, "prevStallCount");
  self->_totalStallCount = objc_msgSend(a3, "totalStallCount");
  self->_prevVariantIdx = objc_msgSend(a3, "prevVariantIdx");
  self->_displayResolutionHeight = (NSNumber *)objc_msgSend((id)objc_msgSend(a3, "displayResolutionHeight"), "copy");
  self->_displayResolutionWidth = (NSNumber *)objc_msgSend((id)objc_msgSend(a3, "displayResolutionWidth"), "copy");
  self->_audioSpatializationMode = (NSNumber *)objc_msgSend((id)objc_msgSend(a3, "audioSpatializationMode"), "copy");
}

- (void)_hudUpdateTrigger
{
  NSObject *global_queue;
  _QWORD block[5];

  if (-[AVNetworkPlaybackPerfHUDLayer hudEnabled](self, "hudEnabled"))
  {
    if (objc_loadWeak((id *)&self->_player)
      && objc_loadWeak((id *)&self->_playerLayer)
      && objc_msgSend(objc_loadWeak((id *)&self->_player), "status") == 1)
    {
      if (-[AVNetworkPlaybackPerfHUDLayer isHidden](self, "isHidden"))
        -[AVNetworkPlaybackPerfHUDLayer setHidden:](self, "setHidden:", 0);
      if (!-[AVNetworkPlaybackPerfHUDLayer superlayer](self, "superlayer"))
        objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)&self->_playerLayer), "_maskLayer"), "addSublayer:", self);
      if (objc_msgSend(objc_loadWeak((id *)&self->_player), "currentItem"))
      {
        if (!self->_requestInFlight)
        {
          self->_requestInFlight = 1;
          global_queue = dispatch_get_global_queue(-32768, 0);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __50__AVNetworkPlaybackPerfHUDLayer__hudUpdateTrigger__block_invoke;
          block[3] = &unk_1E302FA10;
          block[4] = self;
          dispatch_async(global_queue, block);
        }
      }
    }
  }
  else if ((-[AVNetworkPlaybackPerfHUDLayer isHidden](self, "isHidden") & 1) == 0)
  {
    -[AVNetworkPlaybackPerfHUDLayer setHidden:](self, "setHidden:", 1);
  }
}

void __50__AVNetworkPlaybackPerfHUDLayer__hudUpdateTrigger__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[6];

  v2 = (void *)MEMORY[0x1940343FC]();
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "displayStringGenerator");
  objc_msgSend(v3, "update");
  v4 = objc_msgSend(v3, "formattedDisplayString");
  objc_msgSend(*(id *)(a1 + 32), "copyPropertiesFromStringGenerator:", v3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__AVNetworkPlaybackPerfHUDLayer__hudUpdateTrigger__block_invoke_2;
  v5[3] = &unk_1E302FCE8;
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v5);
  objc_autoreleasePoolPop(v2);
}

uint64_t __50__AVNetworkPlaybackPerfHUDLayer__hudUpdateTrigger__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "updateHudWithDisplayString:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 160) = 0;
  return result;
}

- (AVPlayer)player
{
  return (AVPlayer *)objc_loadWeak((id *)&self->_player);
}

- (AVPlayerLayer)playerLayer
{
  return (AVPlayerLayer *)objc_loadWeak((id *)&self->_playerLayer);
}

- (void)setPlayerLayer:(id)a3
{
  objc_storeWeak((id *)&self->_playerLayer, a3);
}

@end
