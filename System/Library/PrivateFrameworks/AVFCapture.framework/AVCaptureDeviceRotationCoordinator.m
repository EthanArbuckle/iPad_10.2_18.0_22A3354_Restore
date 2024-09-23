@implementation AVCaptureDeviceRotationCoordinator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (AVCaptureDeviceRotationCoordinator)initWithDevice:(AVCaptureDevice *)device previewLayer:(CALayer *)previewLayer
{
  AVCaptureDeviceRotationCoordinator *v6;
  uint64_t v7;
  AVAuthorizationStatus v8;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  _BOOL4 v13;
  uint64_t v14;
  BOOL v15;
  BOOL v16;
  _BOOL4 v17;
  AVWeakReference *coordinatorWeakReference;
  _QWORD v20[5];
  _QWORD handler[5];
  _QWORD block[6];
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)AVCaptureDeviceRotationCoordinator;
  v6 = -[AVCaptureDeviceRotationCoordinator init](&v23, sel_init);
  if (v6)
  {
    v6->_coordinatorWeakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", v6);
    v6->_deviceWeakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", device);
    v6->_devicePosition = -[AVCaptureDevice position](device, "position");
    if (previewLayer)
      v6->_previewLayerWeakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", previewLayer);
    v6->_videoRotationAngleForHorizonLevelPreview = 0.0;
    v6->_videoRotationAngleForHorizonLevelCapture = 0.0;
    v7 = *MEMORY[0x1E0CF2B90];
    v8 = +[AVCaptureDevice authorizationStatusForMediaType:](AVCaptureDevice, "authorizationStatusForMediaType:", *MEMORY[0x1E0CF2B90]);
    v10 = v8 == AVAuthorizationStatusAuthorized || v8 == AVAuthorizationStatusNotDetermined;
    v6->_monitorSystemReferenceAngle = v10;
    v11 = -[AVCaptureDevice hasMediaType:](device, "hasMediaType:", v7);
    v12 = v6->_monitorSystemReferenceAngle && v11;
    if (!previewLayer)
      v12 = 0;
    v6->_monitorSystemReferenceAngle = v12;
    v13 = !-[AVCaptureDeviceRotationCoordinator _isExternalDeviceType:](v6, "_isExternalDeviceType:", -[AVCaptureDevice deviceType](device, "deviceType"));
    if (!v6->_monitorSystemReferenceAngle)
      v13 = 0;
    v6->_monitorSystemReferenceAngle = v13;
    v14 = MEMORY[0x1E0C809B0];
    if (v13)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v6, sel__handleSystemReferenceAngleDidChangeNotification_, getUISSystemReferenceAngleChangedNotification(), 0);
      block[0] = v14;
      block[1] = 3221225472;
      block[2] = __66__AVCaptureDeviceRotationCoordinator_initWithDevice_previewLayer___block_invoke;
      block[3] = &unk_1E4216408;
      block[4] = v6;
      block[5] = previewLayer;
      if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
        __66__AVCaptureDeviceRotationCoordinator_initWithDevice_previewLayer___block_invoke((uint64_t)block);
      else
        dispatch_async_and_wait(MEMORY[0x1E0C80D38], block);
    }
    v6->_monitorDeviceOrientation = v10;
    v15 = -[AVCaptureDevice hasMediaType:](device, "hasMediaType:", v7);
    v16 = v6->_monitorDeviceOrientation && v15;
    v6->_monitorDeviceOrientation = v16;
    v17 = !-[AVCaptureDeviceRotationCoordinator _isExternalDeviceType:](v6, "_isExternalDeviceType:", -[AVCaptureDevice deviceType](device, "deviceType"));
    if (!v6->_monitorDeviceOrientation)
      v17 = 0;
    v6->_monitorDeviceOrientation = v17;
    if (v17)
    {
      coordinatorWeakReference = v6->_coordinatorWeakReference;
      handler[0] = v14;
      handler[1] = 3221225472;
      handler[2] = __66__AVCaptureDeviceRotationCoordinator_initWithDevice_previewLayer___block_invoke_4;
      handler[3] = &unk_1E4216580;
      handler[4] = coordinatorWeakReference;
      notify_register_dispatch("com.apple.backboardd.rawOrientation", &v6->_deviceOrientationNotificationToken, MEMORY[0x1E0C80D38], handler);
      v20[0] = v14;
      v20[1] = 3221225472;
      v20[2] = __66__AVCaptureDeviceRotationCoordinator_initWithDevice_previewLayer___block_invoke_5;
      v20[3] = &unk_1E42165A8;
      v20[4] = v6;
      if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
        -[AVCaptureDeviceRotationCoordinator _updateVideoRotationAngleForHorizonLevelCapture](v6, "_updateVideoRotationAngleForHorizonLevelCapture");
      else
        dispatch_async_and_wait(MEMORY[0x1E0C80D38], v20);
    }
  }
  return v6;
}

uint64_t __66__AVCaptureDeviceRotationCoordinator_initWithDevice_previewLayer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = objc_alloc_init((Class)getFBSOrientationObserverClass());
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__AVCaptureDeviceRotationCoordinator_initWithDevice_previewLayer___block_invoke_2;
  v4[3] = &unk_1E4216558;
  v4[4] = v2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setHandler:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_updateVideoRotationAngleForHorizonLevelPreview");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_handleVideoPreviewLayerDidBecomeVisibleNotification_, 0x1E422B308, *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = -[AVCaptureRotationHelperLayer initWithDelegate:]([AVCaptureRotationHelperLayer alloc], "initWithDelegate:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "addSublayer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

void __66__AVCaptureDeviceRotationCoordinator_initWithDevice_previewLayer___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  _QWORD v5[6];

  v3 = objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  if (v3)
  {
    v4 = (void *)v3;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      objc_msgSend(v4, "_handleActiveInterfaceOrientationUpdate:", a2);
    }
    else
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __66__AVCaptureDeviceRotationCoordinator_initWithDevice_previewLayer___block_invoke_3;
      v5[3] = &unk_1E4216408;
      v5[4] = v4;
      v5[5] = a2;
      dispatch_async(MEMORY[0x1E0C80D38], v5);
    }
  }
}

uint64_t __66__AVCaptureDeviceRotationCoordinator_initWithDevice_previewLayer___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleActiveInterfaceOrientationUpdate:", *(_QWORD *)(a1 + 40));
}

void *__66__AVCaptureDeviceRotationCoordinator_initWithDevice_previewLayer___block_invoke_4(uint64_t a1)
{
  void *result;

  result = (void *)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  if (result)
    return (void *)objc_msgSend(result, "_updateVideoRotationAngleForHorizonLevelCapture");
  return result;
}

uint64_t __66__AVCaptureDeviceRotationCoordinator_initWithDevice_previewLayer___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVideoRotationAngleForHorizonLevelCapture");
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, 0x1E422B308, 0);
  -[AVCaptureRotationHelperLayer removeFromSuperlayer](self->_rotationHelperLayer, "removeFromSuperlayer");

  if (self->_monitorSystemReferenceAngle)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, getUISSystemReferenceAngleChangedNotification(), 0);
  -[FBSOrientationObserver invalidate](self->_activeInterfaceOrientationObserver, "invalidate");

  if (self->_monitorDeviceOrientation)
    notify_cancel(self->_deviceOrientationNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDeviceRotationCoordinator;
  -[AVCaptureDeviceRotationCoordinator dealloc](&v3, sel_dealloc);
}

- (NSString)debugDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@][%@]"), -[AVCaptureDevice localizedName](-[AVCaptureDeviceRotationCoordinator device](self, "device"), "localizedName"), -[AVCaptureDeviceRotationCoordinator previewLayer](self, "previewLayer"));
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVCaptureDeviceRotationCoordinator debugDescription](self, "debugDescription"));
}

- (AVCaptureDevice)device
{
  return (AVCaptureDevice *)-[AVWeakReference referencedObject](self->_deviceWeakReference, "referencedObject");
}

- (BOOL)_isExternalDeviceType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("AVCaptureDeviceTypeExternal")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a3, "isEqualToString:", CFSTR("AVCaptureDeviceTypeContinuityCamera"));
}

- (CALayer)previewLayer
{
  return (CALayer *)-[AVWeakReference referencedObject](self->_previewLayerWeakReference, "referencedObject");
}

- (void)handleVideoPreviewLayerDidBecomeVisibleNotification:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AVCaptureDeviceRotationCoordinator _updateVideoRotationAngleForHorizonLevelPreview](self, "_updateVideoRotationAngleForHorizonLevelPreview");
}

- (void)layer:(id)a3 didBecomeVisible:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v4)
    -[AVCaptureDeviceRotationCoordinator _updateVideoRotationAngleForHorizonLevelPreview](self, "_updateVideoRotationAngleForHorizonLevelPreview");
}

- (CGFloat)videoRotationAngleForHorizonLevelPreview
{
  return self->_videoRotationAngleForHorizonLevelPreview;
}

- (void)_updateVideoRotationAngleForHorizonLevelPreview
{
  uint64_t v0;
  void *v1;

  v1 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGFloat AVUISSystemReferenceAngleForContextID(uint32_t)");
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AVCaptureDeviceRotationCoordinator.m"), 48, CFSTR("%s"), OUTLINED_FUNCTION_0());
  __break(1u);
}

- (void)_calculateVideoRotationAngleForHorizonLevelPreviewWithSystemReferenceAngle:(double)a3
{
  uint64_t v5;
  int v6;
  int v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double videoRotationAngleForHorizonLevelPreview;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v14;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (!self->_monitorSystemReferenceAngle)
  {
    FigDebugAssert3();
    return;
  }
  v5 = -[AVWeakReference referencedObject](self->_previewLayerWeakReference, "referencedObject");
  v6 = FigCaptureCameraRequires180DegreesRotation();
  if (v5)
  {
    if (a3 == 0.0)
    {
      if (self->_devicePosition == 2)
        v7 = v6;
      else
        v7 = 1;
      v8 = v7 == 0;
      v9 = 270.0;
      v10 = 90.0;
    }
    else
    {
      v9 = 90.0;
      if (a3 == 90.0)
      {
        if (v6)
          v11 = 180.0;
        else
          v11 = 0.0;
LABEL_15:
        videoRotationAngleForHorizonLevelPreview = self->_videoRotationAngleForHorizonLevelPreview;
        if (v11 != videoRotationAngleForHorizonLevelPreview
          || !self->_isInitialVideoRotationAngleForHorizonLevelPreviewSet)
        {
          if (dword_1EE53AAE8)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          self->_isInitialVideoRotationAngleForHorizonLevelPreviewSet = 1;
          if (v11 != videoRotationAngleForHorizonLevelPreview)
          {
            -[AVCaptureDeviceRotationCoordinator willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoRotationAngleForHorizonLevelPreview"));
            self->_videoRotationAngleForHorizonLevelPreview = v11;
            -[AVCaptureDeviceRotationCoordinator didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("videoRotationAngleForHorizonLevelPreview"));
          }
        }
        return;
      }
      if (a3 == -90.0)
      {
        v8 = v6 == 0;
        v9 = 180.0;
        v10 = 0.0;
      }
      else
      {
        if (a3 != 180.0)
        {
          v11 = 0.0;
          goto LABEL_15;
        }
        if (self->_devicePosition == 2)
          v14 = v6;
        else
          v14 = 1;
        v8 = v14 == 0;
        v10 = 270.0;
      }
    }
    if (v8)
      v11 = v9;
    else
      v11 = v10;
    goto LABEL_15;
  }
}

- (void)_handleSystemReferenceAngleDidChangeNotification:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v5 = (void *)-[AVWeakReference referencedObject](self->_previewLayerWeakReference, "referencedObject");
  if (v5)
  {
    v6 = objc_msgSend((id)objc_msgSend(v5, "context"), "contextId");
    v7 = (void *)objc_msgSend(a3, "userInfo");
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v8 = (_QWORD *)getUISSystemReferenceAngleAffectedContextIDsKeySymbolLoc_ptr;
    v14 = getUISSystemReferenceAngleAffectedContextIDsKeySymbolLoc_ptr;
    if (!getUISSystemReferenceAngleAffectedContextIDsKeySymbolLoc_ptr)
    {
      v9 = (void *)UIKitServicesLibrary();
      v8 = dlsym(v9, "UISSystemReferenceAngleAffectedContextIDsKey");
      v12[3] = (uint64_t)v8;
      getUISSystemReferenceAngleAffectedContextIDsKeySymbolLoc_ptr = (uint64_t)v8;
    }
    _Block_object_dispose(&v11, 8);
    if (!v8)
      -[AVCaptureDeviceRotationCoordinator _handleSystemReferenceAngleDidChangeNotification:].cold.1();
    v10 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", *v8, v11);
    if (objc_msgSend(v10, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6)))-[AVCaptureDeviceRotationCoordinator _updateVideoRotationAngleForHorizonLevelPreview](self, "_updateVideoRotationAngleForHorizonLevelPreview");
  }
}

- (void)_handleActiveInterfaceOrientationUpdate:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AVCaptureDeviceRotationCoordinator _updateVideoRotationAngleForHorizonLevelPreview](self, "_updateVideoRotationAngleForHorizonLevelPreview");
}

- (double)_systemReferenceAngleForDeviceOrientation:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)(a3 - 2) <= 2)
    return dbl_19EEEA090[a3 - 2];
  return result;
}

- (CGFloat)videoRotationAngleForHorizonLevelCapture
{
  return self->_videoRotationAngleForHorizonLevelCapture;
}

- (void)_updateVideoRotationAngleForHorizonLevelCapture
{
  -[AVCaptureDeviceRotationCoordinator _calculateVideoRotationAngleForHorizonLevelCaptureWithDeviceOrientation:](self, "_calculateVideoRotationAngleForHorizonLevelCaptureWithDeviceOrientation:", -[AVCaptureDeviceRotationCoordinator _currentDeviceOrientation](self, "_currentDeviceOrientation"));
}

- (void)_calculateVideoRotationAngleForHorizonLevelCaptureWithDeviceOrientation:(int64_t)a3
{
  int v5;
  id v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v8;
  BOOL v9;
  double v10;
  double v11;
  double videoRotationAngleForHorizonLevelCapture;
  int v13;
  double v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_monitorDeviceOrientation)
  {
    v5 = FigCaptureCameraRequires180DegreesRotation();
    if (!self->_isInitialVideoRotationAngleForHorizonLevelCaptureSet
      && (unint64_t)(a3 - 5) <= 1
      && !self->_previewLayerWeakReference)
    {
      v6 = objc_alloc_init((Class)getFBSOrientationObserverClass());
      a3 = objc_msgSend(v6, "activeInterfaceOrientation");
      if (dword_1EE53AAE8)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(v6, "invalidate", v17, v18);

    }
    switch(a3)
    {
      case 1:
        if (self->_devicePosition == 2)
          v8 = v5;
        else
          v8 = 1;
        v9 = v8 == 0;
        v10 = 270.0;
        v11 = 90.0;
        goto LABEL_23;
      case 2:
        if (self->_devicePosition == 2)
          v13 = v5;
        else
          v13 = 1;
        v9 = v13 == 0;
        v10 = 90.0;
        v11 = 270.0;
        goto LABEL_23;
      case 3:
        if (v5)
          videoRotationAngleForHorizonLevelCapture = 180.0;
        else
          videoRotationAngleForHorizonLevelCapture = 0.0;
        break;
      case 4:
        v9 = v5 == 0;
        v10 = 180.0;
        v11 = 0.0;
LABEL_23:
        if (v9)
          videoRotationAngleForHorizonLevelCapture = v10;
        else
          videoRotationAngleForHorizonLevelCapture = v11;
        break;
      default:
        if (self->_isInitialVideoRotationAngleForHorizonLevelCaptureSet)
        {
          videoRotationAngleForHorizonLevelCapture = self->_videoRotationAngleForHorizonLevelCapture;
        }
        else if (self->_previewLayerWeakReference)
        {
          videoRotationAngleForHorizonLevelCapture = self->_videoRotationAngleForHorizonLevelPreview;
        }
        else
        {
          v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          videoRotationAngleForHorizonLevelCapture = 0.0;
        }
        break;
    }
    v14 = self->_videoRotationAngleForHorizonLevelCapture;
    if (videoRotationAngleForHorizonLevelCapture != v14 || !self->_isInitialVideoRotationAngleForHorizonLevelCaptureSet)
    {
      if (dword_1EE53AAE8)
      {
        v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      self->_isInitialVideoRotationAngleForHorizonLevelCaptureSet = 1;
      if (videoRotationAngleForHorizonLevelCapture != v14)
      {
        -[AVCaptureDeviceRotationCoordinator willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoRotationAngleForHorizonLevelCapture"));
        self->_videoRotationAngleForHorizonLevelCapture = videoRotationAngleForHorizonLevelCapture;
        -[AVCaptureDeviceRotationCoordinator didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("videoRotationAngleForHorizonLevelCapture"));
      }
    }
    if (self->_monitorSystemReferenceAngle && self->_previewLayerSystemReferenceAngleMode == 1)
      -[AVCaptureDeviceRotationCoordinator _updateVideoRotationAngleForHorizonLevelPreview](self, "_updateVideoRotationAngleForHorizonLevelPreview");
  }
  else
  {
    FigDebugAssert3();
  }
}

- (int64_t)_currentDeviceOrientation
{
  uint64_t state64;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  state64 = 0;
  notify_get_state(self->_deviceOrientationNotificationToken, &state64);
  return state64;
}

- (void)_handleSystemReferenceAngleDidChangeNotification:.cold.1()
{
  uint64_t v0;
  void *v1;

  v1 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getUISSystemReferenceAngleAffectedContextIDsKey(void)");
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AVCaptureDeviceRotationCoordinator.m"), 46, CFSTR("%s"), OUTLINED_FUNCTION_0());
  __break(1u);
}

@end
