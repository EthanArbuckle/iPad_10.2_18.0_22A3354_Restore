@implementation WKStylusDeviceObserver

+ (id)sharedInstance
{
  id result;

  if (byte_1ECE72C5B == 1)
    return (id)qword_1ECE72C68;
  result = objc_alloc_init(WKStylusDeviceObserver);
  qword_1ECE72C68 = (uint64_t)result;
  byte_1ECE72C5B = 1;
  return result;
}

- (void)start
{
  unint64_t v2;

  v2 = self->_startCount + 1;
  self->_startCount = v2;
  if (v2 <= 1)
  {
    if (WTF::linkedOnOrAfterSDKWithBehavior())
      objc_msgSend((id)objc_opt_class(), "addObserver:forKeyPath:options:context:", self, CFSTR("isPencilInputExpected"), 4, 0);
  }
}

- (BOOL)hasStylusDevice
{
  return self->_hasStylusDevice;
}

- (WKStylusDeviceObserver)init
{
  WKStylusDeviceObserver *v2;
  void *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKStylusDeviceObserver;
  v2 = -[WKStylusDeviceObserver init](&v6, sel_init);
  if (v2)
  {
    v2->_hasStylusDevice = objc_msgSend(MEMORY[0x1E0CEA960], "isPencilInputExpected");
    v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("WKStylusDeviceObserverChangeTimeInterval"));
    if (v3)
    {
      objc_msgSend(v3, "doubleValue");
      changeTimeInterval = v4;
      WTFLogAlways();
    }
  }
  return v2;
}

- (void)startChangeTimer:(double)a3
{
  void *v5;
  void *v6;
  void *m_ptr;

  objc_msgSend(self->_changeTimer.m_ptr, "invalidate");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_changeTimerFired_, 0, 0, a3);
  v6 = v5;
  if (v5)
    CFRetain(v5);
  m_ptr = self->_changeTimer.m_ptr;
  self->_changeTimer.m_ptr = v6;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(MEMORY[0x1E0CEA960], "isPencilInputExpected", a3, a4, a5, a6))
    -[WKStylusDeviceObserver setHasStylusDevice:](self, "setHasStylusDevice:", 1);
  else
    -[WKStylusDeviceObserver startChangeTimer:](self, "startChangeTimer:", *(double *)&changeTimeInterval);
}

- (void)stop
{
  unint64_t startCount;
  unint64_t v4;

  startCount = self->_startCount;
  if (startCount)
  {
    v4 = startCount - 1;
    self->_startCount = v4;
    if (!v4)
    {
      if (WTF::linkedOnOrAfterSDKWithBehavior())
        objc_msgSend((id)objc_opt_class(), "removeObserver:forKeyPath:", self, CFSTR("isPencilInputExpected"));
    }
  }
}

- (void)setHasStylusDevice:(BOOL)a3
{
  void *m_ptr;

  if (self->_hasStylusDevice != a3)
  {
    self->_hasStylusDevice = a3;
    WebKit::WebProcessProxy::notifyHasStylusDeviceChanged((WebKit::WebProcessProxy *)a3);
  }
  objc_msgSend(self->_changeTimer.m_ptr, "invalidate");
  m_ptr = self->_changeTimer.m_ptr;
  self->_changeTimer.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (void)changeTimerFired:(id)a3
{
  -[WKStylusDeviceObserver setHasStylusDevice:](self, "setHasStylusDevice:", 0);
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_changeTimer.m_ptr;
  self->_changeTimer.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

@end
