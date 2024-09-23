@implementation MPUTransportButtonEventHandler

- (MPUTransportButtonEventHandler)init
{
  MPUTransportButtonEventHandler *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPUTransportButtonEventHandler;
  result = -[MPUTransportButtonEventHandler init](&v3, sel_init);
  if (result)
    result->_minimumLongPressDuration = 0.75;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[MPUTransportButtonEventHandler _clearLongPressTimer](self, "_clearLongPressTimer");
  v3.receiver = self;
  v3.super_class = (Class)MPUTransportButtonEventHandler;
  -[MPUTransportButtonEventHandler dealloc](&v3, sel_dealloc);
}

- (void)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id WeakRetained;
  void *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *longPressTimer;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_button);
  v6 = WeakRetained;
  if (!self->_longPressTimer
    && objc_msgSend(WeakRetained, "isEnabled")
    && (objc_msgSend(v6, "allControlEvents") & 0x3000000) != 0)
  {
    objc_initWeak(&location, self);
    v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    longPressTimer = self->_longPressTimer;
    self->_longPressTimer = v7;

    v9 = self->_longPressTimer;
    v10 = dispatch_time(0, (uint64_t)(self->_minimumLongPressDuration * 1000000000.0));
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    v11 = self->_longPressTimer;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __67__MPUTransportButtonEventHandler_beginTrackingWithTouch_withEvent___block_invoke;
    v12[3] = &unk_24DD6DF78;
    objc_copyWeak(&v13, &location);
    dispatch_source_set_event_handler(v11, v12);
    dispatch_resume((dispatch_object_t)self->_longPressTimer);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __67__MPUTransportButtonEventHandler_beginTrackingWithTouch_withEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_longPressTimerAction");
    WeakRetained = v2;
  }

}

- (void)cancelTrackingWithEvent:(id)a3
{
  id WeakRetained;

  if (self->_longPress)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_button);
    objc_msgSend(WeakRetained, "sendActionsForControlEvents:", 0x2000000);

    self->_longPress = 0;
  }
  -[MPUTransportButtonEventHandler _clearLongPressTimer](self, "_clearLongPressTimer", a3);
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  _BOOL4 longPress;
  UIControl **p_button;
  id WeakRetained;
  void *v8;
  int v9;
  id v10;

  -[MPUTransportButtonEventHandler _clearLongPressTimer](self, "_clearLongPressTimer", a3, a4);
  longPress = self->_longPress;
  p_button = &self->_button;
  WeakRetained = objc_loadWeakRetained((id *)&self->_button);
  v8 = WeakRetained;
  if (longPress)
  {
    objc_msgSend(WeakRetained, "sendActionsForControlEvents:", 0x2000000);

    self->_longPress = 0;
  }
  else
  {
    v9 = objc_msgSend(WeakRetained, "isTouchInside");

    if (v9)
    {
      v10 = objc_loadWeakRetained((id *)p_button);
      objc_msgSend(v10, "sendActionsForControlEvents:", 0x800000);

    }
  }
}

- (id)performHitTestingBlock:(id)a3
{
  int v4;
  id result;

  if (self->_shouldFakeEnabled || !self->_supportsTapWhenDisabled)
  {
    v4 = 0;
  }
  else
  {
    v4 = 1;
    self->_shouldFakeEnabled = 1;
  }
  result = (id)(*((uint64_t (**)(id, SEL))a3 + 2))(a3, a2);
  if (v4)
    self->_shouldFakeEnabled = 0;
  return result;
}

- (BOOL)shouldFakeEnabled
{
  return self->_shouldFakeEnabled;
}

- (BOOL)shouldForceTrackingEnabled
{
  return self->_supportsTapWhenDisabled;
}

- (void)_longPressTimerAction
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_button);
  if (objc_msgSend(WeakRetained, "isTracking"))
  {
    self->_longPress = 1;
    objc_msgSend(WeakRetained, "sendActionsForControlEvents:", 0x1000000);
  }

}

- (void)_clearLongPressTimer
{
  NSObject *longPressTimer;
  OS_dispatch_source *v4;

  longPressTimer = self->_longPressTimer;
  if (longPressTimer)
  {
    dispatch_source_cancel(longPressTimer);
    v4 = self->_longPressTimer;
    self->_longPressTimer = 0;

  }
}

- (UIControl)button
{
  return (UIControl *)objc_loadWeakRetained((id *)&self->_button);
}

- (void)setButton:(id)a3
{
  objc_storeWeak((id *)&self->_button, a3);
}

- (double)minimumLongPressDuration
{
  return self->_minimumLongPressDuration;
}

- (void)setMinimumLongPressDuration:(double)a3
{
  self->_minimumLongPressDuration = a3;
}

- (BOOL)supportsTapWhenDisabled
{
  return self->_supportsTapWhenDisabled;
}

- (void)setSupportsTapWhenDisabled:(BOOL)a3
{
  self->_supportsTapWhenDisabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_button);
  objc_storeStrong((id *)&self->_longPressTimer, 0);
}

@end
