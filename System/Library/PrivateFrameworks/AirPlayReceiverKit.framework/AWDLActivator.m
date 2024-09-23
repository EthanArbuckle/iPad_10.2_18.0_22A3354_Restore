@implementation AWDLActivator

- (AWDLActivator)init
{
  id v2;
  dispatch_queue_t v3;
  void *v4;
  dispatch_source_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AWDLActivator;
  v2 = -[AWDLActivator init](&v12, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.aprk.awdlactivator", 0);
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

    v5 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *((dispatch_queue_t *)v2 + 2));
    v6 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v5;

    objc_initWeak(&location, v2);
    v7 = *((_QWORD *)v2 + 3);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __21__AWDLActivator_init__block_invoke;
    v9[3] = &unk_24FA1C328;
    objc_copyWeak(&v10, &location);
    dispatch_source_set_event_handler(v7, v9);
    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 3), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    dispatch_resume(*((dispatch_object_t *)v2 + 3));
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return (AWDLActivator *)v2;
}

void __21__AWDLActivator_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stopInternal");

}

- (void)_stopInternal
{
  if (self->_browser)
  {
    BonjourBrowser_Stop();
    if (self->_browser)
    {
      BonjourBrowser_Stop();
      CFRelease(self->_browser);
      self->_browser = 0;
    }
  }
  dispatch_source_set_timer((dispatch_source_t)self->_timer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
}

- (void)stop
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __21__AWDLActivator_stop__block_invoke;
  block[3] = &unk_24FA1BC70;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __21__AWDLActivator_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopInternal");
}

- (void)startWithMaxDuration:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__AWDLActivator_startWithMaxDuration___block_invoke;
  v4[3] = &unk_24FA1C040;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

void __38__AWDLActivator_startWithMaxDuration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  dispatch_time_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 8))
    goto LABEL_9;
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!BonjourBrowser_Create() && !BonjourBrowser_Start())
  {
    usleep(0x186A0u);
    v2 = *(_QWORD *)(a1 + 32);
LABEL_9:
    v3 = *(NSObject **)(v2 + 24);
    v4 = dispatch_time(0, 1000000000 * *(_QWORD *)(a1 + 40));
    dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    return;
  }
  APSLogErrorAt();
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    BonjourBrowser_Stop();
    CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 8));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  }
  if (gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
