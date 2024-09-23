@implementation WKMouseDeviceObserver

+ (id)sharedInstance
{
  id result;

  if (_MergedGlobals_24 == 1)
    return (id)qword_1ECE72C60;
  result = objc_alloc_init(WKMouseDeviceObserver);
  qword_1ECE72C60 = (uint64_t)result;
  _MergedGlobals_24 = 1;
  return result;
}

- (void)start
{
  -[WKMouseDeviceObserver startWithCompletionHandler:](self, "startWithCompletionHandler:", &__block_literal_global_29);
}

- (void)startWithCompletionHandler:(id)a3
{
  unint64_t v3;
  NSObject *m_ptr;
  void *v7;
  CFTypeRef v8;
  _QWORD v9[4];
  CFTypeRef cf;
  void *aBlock;

  v3 = self->_startCount + 1;
  self->_startCount = v3;
  if (v3 <= 1)
  {
    m_ptr = self->_deviceObserverTokenQueue.m_ptr;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3321888768;
    v9[2] = __52__WKMouseDeviceObserver_startWithCompletionHandler___block_invoke;
    v9[3] = &__block_descriptor_48_e8_32c65_ZTSKZ52__WKMouseDeviceObserver_startWithCompletionHandler__E3__0_e5_v8__0l;
    CFRetain(self);
    v7 = _Block_copy(a3);
    cf = self;
    CFRetain(self);
    aBlock = _Block_copy(v7);
    dispatch_async(m_ptr, v9);
    _Block_release(v7);
    CFRelease(self);
    _Block_release(aBlock);
    v8 = cf;
    cf = 0;
    if (v8)
      CFRelease(v8);
  }
}

- (BOOL)hasMouseDevice
{
  return self->_hasMouseDevice;
}

- (WKMouseDeviceObserver)init
{
  WKMouseDeviceObserver *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *m_ptr;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKMouseDeviceObserver;
  v2 = -[WKMouseDeviceObserver init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("WKMouseDeviceObserver _deviceObserverTokenQueue", 0);
    m_ptr = v2->_deviceObserverTokenQueue.m_ptr;
    v2->_deviceObserverTokenQueue.m_ptr = (OS_dispatch_queue *)v3;
    if (m_ptr)

  }
  return v2;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

- (void)mousePointerDevicesDidChange:(id)a3
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend(a3, "count") != 0;
  if (self->_hasMouseDevice != v4)
  {
    self->_hasMouseDevice = v4;
    v5 = WTF::fastMalloc((WTF *)0x10);
    *(_QWORD *)v5 = off_1E34CE138;
    *(_BYTE *)(v5 + 8) = v4;
    v6 = v5;
    WTF::ensureOnMainRunLoop();
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  }
}

uint64_t __52__WKMouseDeviceObserver_startWithCompletionHandler___block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;
  uint64_t v4;
  const void *v5;

  v2 = (const void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D00D78], "sharedInstance"), "addPointerDeviceObserver:", *(_QWORD *)(a1 + 32));
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v2)
    CFRetain(v2);
  v5 = *(const void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v3;
  if (v5)
    CFRelease(v5);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)stop
{
  -[WKMouseDeviceObserver stopWithCompletionHandler:](self, "stopWithCompletionHandler:", &__block_literal_global_84_0);
}

- (void)stopWithCompletionHandler:(id)a3
{
  unint64_t startCount;
  unint64_t v5;
  NSObject *m_ptr;
  void *v8;
  CFTypeRef v9;
  _QWORD v10[4];
  CFTypeRef cf;
  void *aBlock;

  startCount = self->_startCount;
  if (startCount)
  {
    v5 = startCount - 1;
    self->_startCount = v5;
    if (!v5)
    {
      m_ptr = self->_deviceObserverTokenQueue.m_ptr;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3321888768;
      v10[2] = __51__WKMouseDeviceObserver_stopWithCompletionHandler___block_invoke;
      v10[3] = &__block_descriptor_48_e8_32c64_ZTSKZ51__WKMouseDeviceObserver_stopWithCompletionHandler__E3__1_e5_v8__0l;
      CFRetain(self);
      v8 = _Block_copy(a3);
      cf = self;
      CFRetain(self);
      aBlock = _Block_copy(v8);
      dispatch_async(m_ptr, v10);
      _Block_release(v8);
      CFRelease(self);
      _Block_release(aBlock);
      v9 = cf;
      cf = 0;
      if (v9)
        CFRelease(v9);
    }
  }
}

uint64_t __51__WKMouseDeviceObserver_stopWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;
  if (v3)
    CFRelease(v3);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_setHasMouseDeviceForTesting:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;

  self->_hasMouseDevice = a3;
  v4 = WTF::fastMalloc((WTF *)0x10);
  *(_QWORD *)v4 = off_1E34CE160;
  *(_BYTE *)(v4 + 8) = a3;
  v5 = v4;
  WTF::ensureOnMainRunLoop();
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
}

- (void).cxx_destruct
{
  OS_dispatch_queue *m_ptr;
  void *v4;

  m_ptr = self->_deviceObserverTokenQueue.m_ptr;
  if (m_ptr)

  v4 = self->_token.m_ptr;
  self->_token.m_ptr = 0;
  if (v4)
    CFRelease(v4);
}

- (uint64_t)mousePointerDevicesDidChange:(uint64_t)a1
{
  return WebKit::WebProcessProxy::notifyHasMouseDeviceChanged((WebKit::WebProcessProxy *)*(unsigned __int8 *)(a1 + 8));
}

- (uint64_t)_setHasMouseDeviceForTesting:(uint64_t)a1
{
  return WebKit::WebProcessProxy::notifyHasMouseDeviceChanged((WebKit::WebProcessProxy *)*(unsigned __int8 *)(a1 + 8));
}

@end
