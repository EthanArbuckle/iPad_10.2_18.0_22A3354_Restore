@implementation WKDisplayLinkHandler

- (void)invalidate
{
  void *v3;

  v3 = (void *)-[CADisplayLink display](self->_displayLink, "display");
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("refreshRate"), displayRefreshRateObservationContext);
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  self->_displayLink = 0;
}

- (WKDisplayLinkHandler)initWithDrawingAreaProxy:(void *)a3
{
  WKDisplayLinkHandler *v4;
  WKDisplayLinkHandler *v5;
  CADisplayLink *v6;
  uint64_t v7;
  void *v8;
  const WTF::StringImpl *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  CADisplayLink *displayLink;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)WKDisplayLinkHandler;
  v4 = -[WKDisplayLinkHandler init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_drawingAreaProxy = a3;
    v6 = (CADisplayLink *)objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", v4, sel_displayLinkFired_);
    v5->_displayLink = v6;
    v7 = objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    -[CADisplayLink addToRunLoop:forMode:](v6, "addToRunLoop:forMode:", v7, *MEMORY[0x1E0C99860]);
    v8 = (void *)-[CADisplayLink display](v5->_displayLink, "display");
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v5, CFSTR("refreshRate"), 1, displayRefreshRateObservationContext);
    -[CADisplayLink setPaused:](v5->_displayLink, "setPaused:", 1);
    if (!a3)
      goto LABEL_9;
    v10 = *(_QWORD *)(*((_QWORD *)a3 + 5) + 8);
    if (v10)
      v11 = v10 - 16;
    else
      v11 = 0;
    v12 = *(_QWORD *)(v11 + 224);
    {
      WebKit::WebPreferencesKey::preferPageRenderingUpdatesNear60FPSEnabledKey(void)::$_0::operator() const(void)::impl += 2;
      WebKit::WebPreferencesKey::preferPageRenderingUpdatesNear60FPSEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::preferPageRenderingUpdatesNear60FPSEnabledKey(void)::$_0::operator() const(void)::impl;
    }
    if ((WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v12 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::preferPageRenderingUpdatesNear60FPSEnabledKey(void)::key, v9) & 1) == 0)
    {
      displayLink = v5->_displayLink;
      if (_MergedGlobals_81 == 1)
      {
        LODWORD(v13) = dword_1ECE72B6C;
        LODWORD(v14) = unk_1ECE72B70;
        LODWORD(v15) = dword_1ECE72B74;
      }
      else
      {
        *(CAFrameRateRange *)&v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
        dword_1ECE72B6C = LODWORD(v13);
        unk_1ECE72B70 = LODWORD(v14);
        dword_1ECE72B74 = LODWORD(v15);
        _MergedGlobals_81 = 1;
      }
      -[CADisplayLink setPreferredFrameRateRange:](displayLink, "setPreferredFrameRateRange:", v13, v14, v15);
      -[CADisplayLink setHighFrameRateReason:](v5->_displayLink, "setHighFrameRateReason:", 2883587);
    }
    else
    {
LABEL_9:
      -[CADisplayLink setPreferredFramesPerSecond:](v5->_displayLink, "setPreferredFramesPerSecond:", 60);
    }
  }
  return v5;
}

- (void)displayLinkFired:(id)a3
{
  (*(void (**)(void *))(*(_QWORD *)self->_drawingAreaProxy + 360))(self->_drawingAreaProxy);
}

- (void)schedule
{
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 0);
}

- (unsigned)nominalFramesPerSecond
{
  const WTF::StringImpl *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const WTF::StringImpl *v7;
  uint64_t v8;
  double v9;

  v4 = *(_QWORD *)(*((_QWORD *)self->_drawingAreaProxy + 5) + 8);
  if (v4)
    v5 = v4 - 16;
  else
    v5 = 0;
  v6 = *(_QWORD *)(v5 + 224);
  {
    WebKit::WebPreferencesKey::webAnimationsCustomFrameRateEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::webAnimationsCustomFrameRateEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::webAnimationsCustomFrameRateEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  if ((WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v6 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::webAnimationsCustomFrameRateEnabledKey(void)::key, v2) & 1) == 0)
  {
    v8 = *(_QWORD *)(v5 + 224);
    {
      WebKit::WebPreferencesKey::preferPageRenderingUpdatesNear60FPSEnabledKey(void)::$_0::operator() const(void)::impl += 2;
      WebKit::WebPreferencesKey::preferPageRenderingUpdatesNear60FPSEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::preferPageRenderingUpdatesNear60FPSEnabledKey(void)::$_0::operator() const(void)::impl;
    }
    if ((WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v8 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::preferPageRenderingUpdatesNear60FPSEnabledKey(void)::key, v7) & 1) != 0)return 60;
  }
  -[CADisplayLink maximumRefreshRate](self->_displayLink, "maximumRefreshRate");
  if (v9 > 0.0)
    return vcvtad_u64_f64(1.0 / v9);
  else
    return 60;
}

- (void)pause
{
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1);
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WKDisplayLinkHandler;
  -[WKDisplayLinkHandler dealloc](&v2, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)displayRefreshRateObservationContext == a6)
    -[WKDisplayLinkHandler didChangeNominalFramesPerSecond](self, "didChangeNominalFramesPerSecond", a3, a4, a5);
}

- (void)didChangeNominalFramesPerSecond
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*((_QWORD *)self->_drawingAreaProxy + 5) + 8);
  if (v2)
    v3 = v2 - 16;
  else
    v3 = 0;
  CFRetain(*(CFTypeRef *)(v3 + 8));
  v4 = *(_QWORD *)(v3 + 752);
  if ((v4 & 0xFF00000000) != 0)
    WebKit::WebPageProxy::windowScreenDidChange((WebKit::WebPageProxy *)v3, v4);
  CFRelease(*(CFTypeRef *)(v3 + 8));
}

@end
