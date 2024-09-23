@implementation CAMPhysicalCaptureNotifier

- (CAMPhysicalCaptureNotifier)initWithView:(id)a3 includeVolumeButtons:(BOOL)a4
{
  id v7;
  CAMPhysicalCaptureNotifier *v8;
  CAMPhysicalCaptureNotifier *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAMPhysicalCaptureNotifier;
  v8 = -[CAMPhysicalCaptureNotifier init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->__view, a3);
    v9->_includesVolumeButtons = a4;
    -[CAMPhysicalCaptureNotifier setEnabled:](v9, "setEnabled:", 1);
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[BSInvalidatable invalidate](self->__cameraButtonRequest, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)CAMPhysicalCaptureNotifier;
  -[CAMPhysicalCaptureNotifier dealloc](&v4, sel_dealloc);
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[CAMPhysicalCaptureNotifier _updateCaptureButtonNotifications](self, "_updateCaptureButtonNotifications");
  }
}

- (void)_updateCaptureButtonNotifications
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Unable to generate a valid BKSHIDEventDeferringToken from a view's window (%{public}@), not deferring camera case events for SBSHardwareButtonService", (uint8_t *)&v5, 0xCu);

}

- (void)_handleVolumeUpButtonUpNotification:(id)a3
{
  -[CAMPhysicalCaptureNotifier _setVolumeUpButtonState:](self, "_setVolumeUpButtonState:", 0);
}

- (void)_handleVolumeUpButtonDownNotification:(id)a3
{
  -[CAMPhysicalCaptureNotifier _setVolumeUpButtonState:](self, "_setVolumeUpButtonState:", 1);
}

- (void)_handleVolumeDownButtonUpNotification:(id)a3
{
  -[CAMPhysicalCaptureNotifier _setVolumeDownButtonState:](self, "_setVolumeDownButtonState:", 0);
}

- (void)_handleVolumeDownButtonDownNotification:(id)a3
{
  -[CAMPhysicalCaptureNotifier _setVolumeDownButtonState:](self, "_setVolumeDownButtonState:", 1);
}

- (void)_handleCameraCaseButtonUpNotification:(id)a3
{
  -[CAMPhysicalCaptureNotifier _setCameraCaseShutterState:](self, "_setCameraCaseShutterState:", 0);
}

- (void)_handleCameraCaseButtonDownNotification:(id)a3
{
  -[CAMPhysicalCaptureNotifier _setCameraCaseShutterState:](self, "_setCameraCaseShutterState:", 1);
}

- (void)_setVolumeUpButtonState:(int64_t)a3
{
  if (self->_volumeUpButtonState != a3)
  {
    self->_volumeUpButtonState = a3;
    -[CAMPhysicalCaptureNotifier _updateStateAndNotifyDelegateIfNeededForButton:](self, "_updateStateAndNotifyDelegateIfNeededForButton:", 1);
  }
}

- (void)_setVolumeDownButtonState:(int64_t)a3
{
  if (self->_volumeDownButtonState != a3)
  {
    self->_volumeDownButtonState = a3;
    -[CAMPhysicalCaptureNotifier _updateStateAndNotifyDelegateIfNeededForButton:](self, "_updateStateAndNotifyDelegateIfNeededForButton:", 2);
  }
}

- (void)_setCameraCaseShutterState:(int64_t)a3
{
  if (self->_cameraCaseButtonState != a3)
  {
    self->_cameraCaseButtonState = a3;
    -[CAMPhysicalCaptureNotifier _updateStateAndNotifyDelegateIfNeededForButton:](self, "_updateStateAndNotifyDelegateIfNeededForButton:", 4);
  }
}

- (void)_updateStateAndNotifyDelegateIfNeededForButton:(int64_t)a3
{
  id v5;

  -[CAMPhysicalCaptureNotifier delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "physicalCaptureNotifierDidChangeState:forButton:", self, a3);

}

- (CAMPhysicalCaptureNotifierDelegate)delegate
{
  return (CAMPhysicalCaptureNotifierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)volumeUpButtonState
{
  return self->_volumeUpButtonState;
}

- (int64_t)volumeDownButtonState
{
  return self->_volumeDownButtonState;
}

- (int64_t)cameraCaseButtonState
{
  return self->_cameraCaseButtonState;
}

- (void)_setCameraCaseButtonState:(int64_t)a3
{
  self->_cameraCaseButtonState = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)includesVolumeButtons
{
  return self->_includesVolumeButtons;
}

- (int64_t)state
{
  return self->_state;
}

- (void)_setState:(int64_t)a3
{
  self->_state = a3;
}

- (UIView)_view
{
  return self->__view;
}

- (BSInvalidatable)_cameraButtonRequest
{
  return self->__cameraButtonRequest;
}

- (void)set_cameraButtonRequest:(id)a3
{
  objc_storeStrong((id *)&self->__cameraButtonRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cameraButtonRequest, 0);
  objc_storeStrong((id *)&self->__view, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
