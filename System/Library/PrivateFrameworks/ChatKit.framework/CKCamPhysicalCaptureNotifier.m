@implementation CKCamPhysicalCaptureNotifier

- (CKCamPhysicalCaptureNotifier)init
{
  CKCamPhysicalCaptureNotifier *v2;
  CKCamPhysicalCaptureNotifier *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKCamPhysicalCaptureNotifier;
  v2 = -[CKCamPhysicalCaptureNotifier init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CKCamPhysicalCaptureNotifier setEnabled:](v2, "setEnabled:", 1);
  return v3;
}

- (void)dealloc
{
  void *v3;
  id WeakRetained;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  WeakRetained = objc_loadWeakRetained(&_CurrentNotifier);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWantsVolumeButtonEvents:", 0);

  }
  -[BSInvalidatable invalidate](self->__cameraButtonRequest, "invalidate");
  v6.receiver = self;
  v6.super_class = (Class)CKCamPhysicalCaptureNotifier;
  -[CKCamPhysicalCaptureNotifier dealloc](&v6, sel_dealloc);
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[CKCamPhysicalCaptureNotifier _updateCaptureButtonNotifications](self, "_updateCaptureButtonNotifications");
    if (self->_enabled)
      objc_storeWeak(&_CurrentNotifier, self);
  }
}

- (void)_updateCaptureButtonNotifications
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKCamPhysicalCaptureNotifier isEnabled](self, "isEnabled"))
  {
    objc_msgSend(v4, "setWantsVolumeButtonEvents:", 1);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleVolumeUpButtonUpNotification_, *MEMORY[0x1E0CEBF10], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleVolumeUpButtonDownNotification_, *MEMORY[0x1E0CEBF08], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleVolumeDownButtonUpNotification_, *MEMORY[0x1E0CEBF00], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleVolumeDownButtonDownNotification_, *MEMORY[0x1E0CEBEF8], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleVolumeDownButtonUpNotification_, CFSTR("_UIApplicationCameraShutterButtonUpNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleVolumeDownButtonDownNotification_, CFSTR("_UIApplicationCameraShutterButtonDownNotification"), 0);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v5 = (void *)getBKSHIDEventDeferringTokenClass_softClass;
    v17 = getBKSHIDEventDeferringTokenClass_softClass;
    if (!getBKSHIDEventDeferringTokenClass_softClass)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __getBKSHIDEventDeferringTokenClass_block_invoke;
      v13[3] = &unk_1E274A178;
      v13[4] = &v14;
      __getBKSHIDEventDeferringTokenClass_block_invoke((uint64_t)v13);
      v5 = (void *)v15[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v14, 8);
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keyWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tokenForIdentifierOfCAContext:", objc_msgSend(v8, "_contextId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0DAAE70], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "deferHIDEventsForButtonKind:toToken:", 7, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKCamPhysicalCaptureNotifier set_cameraButtonRequest:](self, "set_cameraButtonRequest:", v11);

    }
  }
  else
  {
    objc_msgSend(v4, "setWantsVolumeButtonEvents:", 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEBF10], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEBF08], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEBF00], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEBEF8], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_UIApplicationCameraShutterButtonUpNotification"), 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_UIApplicationCameraShutterButtonDownNotification"), 0);
    -[CKCamPhysicalCaptureNotifier _cameraButtonRequest](self, "_cameraButtonRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidate");

    -[CKCamPhysicalCaptureNotifier set_cameraButtonRequest:](self, "set_cameraButtonRequest:", 0);
    -[CKCamPhysicalCaptureNotifier _setVolumeUpButtonState:](self, "_setVolumeUpButtonState:", 0);
    -[CKCamPhysicalCaptureNotifier _setVolumeDownButtonState:](self, "_setVolumeDownButtonState:", 0);
  }

}

- (void)_handleVolumeUpButtonUpNotification:(id)a3
{
  -[CKCamPhysicalCaptureNotifier _setVolumeUpButtonState:](self, "_setVolumeUpButtonState:", 0);
}

- (void)_handleVolumeUpButtonDownNotification:(id)a3
{
  -[CKCamPhysicalCaptureNotifier _setVolumeUpButtonState:](self, "_setVolumeUpButtonState:", 1);
}

- (void)_handleVolumeDownButtonUpNotification:(id)a3
{
  -[CKCamPhysicalCaptureNotifier _setVolumeDownButtonState:](self, "_setVolumeDownButtonState:", 0);
}

- (void)_handleVolumeDownButtonDownNotification:(id)a3
{
  -[CKCamPhysicalCaptureNotifier _setVolumeDownButtonState:](self, "_setVolumeDownButtonState:", 1);
}

- (void)_setVolumeUpButtonState:(int64_t)a3
{
  int64_t v5;

  if (self->__volumeUpButtonState != a3)
  {
    v5 = -[CKCamPhysicalCaptureNotifier _volumeDownButtonState](self, "_volumeDownButtonState");
    if (a3 != 1 || v5 != 1)
    {
      self->__volumeUpButtonState = a3;
      -[CKCamPhysicalCaptureNotifier _updateStateAndNotifyDelegateIfNeeded](self, "_updateStateAndNotifyDelegateIfNeeded");
    }
  }
}

- (void)_setVolumeDownButtonState:(int64_t)a3
{
  int64_t v5;

  if (self->__volumeDownButtonState != a3)
  {
    v5 = -[CKCamPhysicalCaptureNotifier _volumeUpButtonState](self, "_volumeUpButtonState");
    if (a3 != 1 || v5 != 1)
    {
      self->__volumeDownButtonState = a3;
      -[CKCamPhysicalCaptureNotifier _updateStateAndNotifyDelegateIfNeeded](self, "_updateStateAndNotifyDelegateIfNeeded");
    }
  }
}

- (void)_updateStateAndNotifyDelegateIfNeeded
{
  int64_t v3;
  int64_t v4;
  uint64_t v6;
  id v7;

  v3 = -[CKCamPhysicalCaptureNotifier _volumeUpButtonState](self, "_volumeUpButtonState");
  v4 = -[CKCamPhysicalCaptureNotifier _volumeDownButtonState](self, "_volumeDownButtonState");
  v6 = v3 == 1 || v4 == 1;
  if (-[CKCamPhysicalCaptureNotifier state](self, "state") != v6)
  {
    -[CKCamPhysicalCaptureNotifier _setState:](self, "_setState:", v6);
    -[CKCamPhysicalCaptureNotifier delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "physicalCaptureNotifierDidChangeState:", self);

  }
}

- (CKCamPhysicalCaptureNotifierDelegate)delegate
{
  return (CKCamPhysicalCaptureNotifierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
  objc_destroyWeak((id *)&self->_delegate);
}

@end
