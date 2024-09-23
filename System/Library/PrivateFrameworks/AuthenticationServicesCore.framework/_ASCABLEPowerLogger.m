@implementation _ASCABLEPowerLogger

- (_ASCABLEPowerLogger)init
{
  _ASCABLEPowerLogger *v2;
  _ASCABLEPowerLogger *v3;
  _ASCABLEPowerLogger *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ASCABLEPowerLogger;
  v2 = -[_ASCABLEPowerLogger init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[_ASCABLEPowerLogger logAuthenticationFinishedEventIfNeeded](self, "logAuthenticationFinishedEventIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)_ASCABLEPowerLogger;
  -[_ASCABLEPowerLogger dealloc](&v3, sel_dealloc);
}

- (void)logAuthenticationStartedEventIfNeeded
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];
  _QWORD v6[5];
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock(&self->_lock);
  v3 = objc_alloc_init(MEMORY[0x24BE82DE0]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60___ASCABLEPowerLogger_logAuthenticationStartedEventIfNeeded__block_invoke;
  v6[3] = &unk_24C97E868;
  v6[4] = self;
  objc_msgSend(v3, "setHandler:", v6);
  if (!self->_didSendStartedEvent && PLShouldLogRegisteredEvent())
  {
    v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_20E648000, v4, OS_LOG_TYPE_INFO, "Sending caBLE authentication started PowerLog event", v5, 2u);
    }
    v7 = CFSTR("AuthenticationDidStart");
    v8[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    PLLogRegisteredEvent();
    self->_didSendStartedEvent = 1;
  }

}

- (void)logAuthenticationFinishedEventIfNeeded
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];
  _QWORD v6[5];
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock(&self->_lock);
  v3 = objc_alloc_init(MEMORY[0x24BE82DE0]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61___ASCABLEPowerLogger_logAuthenticationFinishedEventIfNeeded__block_invoke;
  v6[3] = &unk_24C97E868;
  v6[4] = self;
  objc_msgSend(v3, "setHandler:", v6);
  if (self->_didSendStartedEvent && !self->_didSendFinishedEvent && PLShouldLogRegisteredEvent())
  {
    v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_20E648000, v4, OS_LOG_TYPE_INFO, "Sending caBLE authentication finished PowerLog event", v5, 2u);
    }
    v7 = CFSTR("AuthenticationDidStart");
    v8[0] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    PLLogRegisteredEvent();
    self->_didSendFinishedEvent = 1;
  }

}

@end
