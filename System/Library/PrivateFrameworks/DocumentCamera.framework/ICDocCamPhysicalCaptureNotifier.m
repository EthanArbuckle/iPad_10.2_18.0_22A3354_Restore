@implementation ICDocCamPhysicalCaptureNotifier

- (ICDocCamPhysicalCaptureNotifier)init
{
  ICDocCamPhysicalCaptureNotifier *v2;
  ICDocCamPhysicalCaptureNotifier *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICDocCamPhysicalCaptureNotifier;
  v2 = -[ICDocCamPhysicalCaptureNotifier init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ICDocCamPhysicalCaptureNotifier setEnabled:](v2, "setEnabled:", 1);
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICDocCamPhysicalCaptureNotifier;
  -[ICDocCamPhysicalCaptureNotifier dealloc](&v4, sel_dealloc);
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[ICDocCamPhysicalCaptureNotifier _updateCaptureButtonNotifications](self, "_updateCaptureButtonNotifications");
  }
}

- (void)_updateCaptureButtonNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICDocCamPhysicalCaptureNotifier isEnabled](self, "isEnabled"))
  {
    objc_msgSend(v3, "setWantsVolumeButtonEvents:", 1);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleVolumeUpButtonUpNotification_, *MEMORY[0x24BDF80C8], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleVolumeUpButtonDownNotification_, *MEMORY[0x24BDF80C0], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleVolumeDownButtonUpNotification_, *MEMORY[0x24BDF80B8], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleVolumeDownButtonDownNotification_, *MEMORY[0x24BDF80B0], 0);
  }
  else
  {
    objc_msgSend(v3, "setWantsVolumeButtonEvents:", 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDF80C8], 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDF80C0], 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDF80B8], 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDF80B0], 0);
    -[ICDocCamPhysicalCaptureNotifier _setVolumeUpButtonState:](self, "_setVolumeUpButtonState:", 0);
    -[ICDocCamPhysicalCaptureNotifier _setVolumeDownButtonState:](self, "_setVolumeDownButtonState:", 0);
  }

}

- (void)_handleVolumeUpButtonUpNotification:(id)a3
{
  -[ICDocCamPhysicalCaptureNotifier _setVolumeUpButtonState:](self, "_setVolumeUpButtonState:", 0);
}

- (void)_handleVolumeUpButtonDownNotification:(id)a3
{
  -[ICDocCamPhysicalCaptureNotifier _setVolumeUpButtonState:](self, "_setVolumeUpButtonState:", 1);
}

- (void)_handleVolumeDownButtonUpNotification:(id)a3
{
  -[ICDocCamPhysicalCaptureNotifier _setVolumeDownButtonState:](self, "_setVolumeDownButtonState:", 0);
}

- (void)_handleVolumeDownButtonDownNotification:(id)a3
{
  -[ICDocCamPhysicalCaptureNotifier _setVolumeDownButtonState:](self, "_setVolumeDownButtonState:", 1);
}

- (void)_setVolumeUpButtonState:(int64_t)a3
{
  int64_t v5;

  if (self->__volumeUpButtonState != a3)
  {
    v5 = -[ICDocCamPhysicalCaptureNotifier _volumeDownButtonState](self, "_volumeDownButtonState");
    if (a3 != 1 || v5 != 1)
    {
      self->__volumeUpButtonState = a3;
      -[ICDocCamPhysicalCaptureNotifier _updateStateAndNotifyDelegateIfNeeded](self, "_updateStateAndNotifyDelegateIfNeeded");
    }
  }
}

- (void)_setVolumeDownButtonState:(int64_t)a3
{
  int64_t v5;

  if (self->__volumeDownButtonState != a3)
  {
    v5 = -[ICDocCamPhysicalCaptureNotifier _volumeUpButtonState](self, "_volumeUpButtonState");
    if (a3 != 1 || v5 != 1)
    {
      self->__volumeDownButtonState = a3;
      -[ICDocCamPhysicalCaptureNotifier _updateStateAndNotifyDelegateIfNeeded](self, "_updateStateAndNotifyDelegateIfNeeded");
    }
  }
}

- (void)_updateStateAndNotifyDelegateIfNeeded
{
  int64_t v3;
  int64_t v4;
  uint64_t v6;
  id v7;

  v3 = -[ICDocCamPhysicalCaptureNotifier _volumeUpButtonState](self, "_volumeUpButtonState");
  v4 = -[ICDocCamPhysicalCaptureNotifier _volumeDownButtonState](self, "_volumeDownButtonState");
  v6 = v3 == 1 || v4 == 1;
  if (-[ICDocCamPhysicalCaptureNotifier state](self, "state") != v6)
  {
    -[ICDocCamPhysicalCaptureNotifier _setState:](self, "_setState:", v6);
    -[ICDocCamPhysicalCaptureNotifier delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "physicalCaptureNotifierDidChangeState:", self);

  }
}

- (ICDocCamPhysicalCaptureNotifierDelegate)delegate
{
  return (ICDocCamPhysicalCaptureNotifierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)_setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (int64_t)_volumeUpButtonState
{
  return self->__volumeUpButtonState;
}

- (int64_t)_volumeDownButtonState
{
  return self->__volumeDownButtonState;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
