@implementation AXSSMotionTrackingCameraManager

- (AXSSMotionTrackingCameraManager)init
{
  AXSSMotionTrackingCameraManager *v2;
  uint64_t v3;
  NSMutableArray *compatibleCaptureDevices;
  uint64_t v5;
  NSMutableArray *allCaptureDevices;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXSSMotionTrackingCameraManager;
  v2 = -[AXSSMotionTrackingCameraManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    compatibleCaptureDevices = v2->__compatibleCaptureDevices;
    v2->__compatibleCaptureDevices = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    allCaptureDevices = v2->__allCaptureDevices;
    v2->__allCaptureDevices = (NSMutableArray *)v5;

  }
  return v2;
}

- (void)dealloc
{
  NSMutableArray *allCaptureDevices;
  AVCaptureDeviceDiscoverySession *captureDeviceDiscoverySession;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[5];

  if (self->__monitoring)
  {
    allCaptureDevices = self->__allCaptureDevices;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __42__AXSSMotionTrackingCameraManager_dealloc__block_invoke;
    v12[3] = &unk_1E5F99638;
    v12[4] = self;
    -[NSMutableArray enumerateObjectsUsingBlock:](allCaptureDevices, "enumerateObjectsUsingBlock:", v12);
    captureDeviceDiscoverySession = self->__captureDeviceDiscoverySession;
    NSStringFromSelector(sel_devices);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVCaptureDeviceDiscoverySession removeObserver:forKeyPath:context:](captureDeviceDiscoverySession, "removeObserver:forKeyPath:context:", self, v5, kCaptureDeviceDiscoverySessionKVOContext);

    NSStringFromSelector(sel_allCaptureDevices);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSMotionTrackingCameraManager removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, v6, kAllCaptureDevicesKVOContext);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    getAVCaptureDeviceWasConnectedNotification();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, v8, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    getAVCaptureDeviceWasDisconnectedNotification();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:name:object:", self, v10, 0);

  }
  v11.receiver = self;
  v11.super_class = (Class)AXSSMotionTrackingCameraManager;
  -[AXSSMotionTrackingCameraManager dealloc](&v11, sel_dealloc);
}

uint64_t __42__AXSSMotionTrackingCameraManager_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("connected"), kCaptureDeviceConnectedKVOContext);
}

- (void)startMonitoring
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "_captureDeviceDiscoverySession");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_3(&dword_1AF5CC000, v2, v3, "AXSSMotionTrackingCameraManager: startMonitoring %@ %@ %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_3();
}

- (void)stopMonitoring
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "_captureDeviceDiscoverySession");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_3(&dword_1AF5CC000, v2, v3, "AXSSMotionTrackingCameraManager: stopMonitoring %@ %@ %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_3();
}

void __49__AXSSMotionTrackingCameraManager_stopMonitoring__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB37D0];
  v4 = a2;
  objc_msgSend(v3, "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), v4, 0);

}

- (NSArray)compatibleCaptureDevices
{
  void *v2;
  void *v3;

  -[AXSSMotionTrackingCameraManager _compatibleCaptureDevices](self, "_compatibleCaptureDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSArray)allCaptureDevices
{
  void *v2;
  void *v3;

  -[AXSSMotionTrackingCameraManager _allCaptureDevices](self, "_allCaptureDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (AVCaptureDevice)defaultCaptureDevice
{
  id AVCaptureDeviceClass;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  AVCaptureDeviceClass = getAVCaptureDeviceClass();
  getAVMediaTypeVideo();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(AVCaptureDeviceClass, "defaultDeviceWithMediaType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (-[AXSSMotionTrackingCameraManager _compatibleCaptureDevices](self, "_compatibleCaptureDevices"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "containsObject:", v5),
        v6,
        v7))
  {
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return (AVCaptureDevice *)v8;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  objc_super v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)kCaptureDeviceDiscoverySessionKVOContext == a6)
  {
    AXSSLogForCategory(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[AXSSMotionTrackingCameraManager observeValueForKeyPath:ofObject:change:context:].cold.1();
    goto LABEL_15;
  }
  if ((void *)kAllCaptureDevicesKVOContext != a6)
  {
    if ((void *)kCaptureDeviceSuspendedKVOContext == a6)
    {
      AXSSLogForCategory(2);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[AXSSMotionTrackingCameraManager observeValueForKeyPath:ofObject:change:context:].cold.3();
    }
    else
    {
      if ((void *)kCaptureDeviceConnectedKVOContext != a6)
      {
        v15.receiver = self;
        v15.super_class = (Class)AXSSMotionTrackingCameraManager;
        -[AXSSMotionTrackingCameraManager observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
        goto LABEL_16;
      }
      AXSSLogForCategory(2);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[AXSSMotionTrackingCameraManager observeValueForKeyPath:ofObject:change:context:].cold.4();
    }
LABEL_15:

    -[AXSSMotionTrackingCameraManager _captureDeviceUpdated](self, "_captureDeviceUpdated");
    goto LABEL_16;
  }
  AXSSLogForCategory(2);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[AXSSMotionTrackingCameraManager observeValueForKeyPath:ofObject:change:context:].cold.2();

  -[AXSSMotionTrackingCameraManager _allCaptureDevicesChanged:](self, "_allCaptureDevicesChanged:", v12);
LABEL_16:

}

+ (id)_sortedAndFilteredCaptureDevicesFromDevices:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id AVCaptureDeviceClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithBlock:", &__block_literal_global_12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v6, "count") > 1)
  {
    if (_sortedAndFilteredCaptureDevicesFromDevices__onceToken != -1)
      dispatch_once(&_sortedAndFilteredCaptureDevicesFromDevices__onceToken, &__block_literal_global_23);
    AVCaptureDeviceClass = getAVCaptureDeviceClass();
    getAVMediaTypeVideo();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(AVCaptureDeviceClass, "defaultDeviceWithMediaType:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(v6, "mutableCopy");
    v12 = (void *)objc_msgSend(v6, "copy");
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __79__AXSSMotionTrackingCameraManager__sortedAndFilteredCaptureDevicesFromDevices___block_invoke_27;
    v19 = &unk_1E5F99C68;
    v20 = v10;
    v21 = v12;
    v13 = v12;
    v14 = v10;
    objc_msgSend(v11, "sortUsingComparator:", &v16);
    v7 = (id)objc_msgSend(v11, "copy", v16, v17, v18, v19);

  }
  else
  {
    v7 = v6;
  }

  return v7;
}

uint64_t __79__AXSSMotionTrackingCameraManager__sortedAndFilteredCaptureDevicesFromDevices___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  _Unwind_Exception *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a2;
  v5 = a3;
  getAVMediaTypeVideo();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasMediaType:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v8 = (_QWORD *)getAVMediaTypeMetadataObjectSymbolLoc_ptr_0;
    v15 = getAVMediaTypeMetadataObjectSymbolLoc_ptr_0;
    if (!getAVMediaTypeMetadataObjectSymbolLoc_ptr_0)
    {
      v9 = (void *)AVFoundationLibrary_0();
      v8 = dlsym(v9, "AVMediaTypeMetadataObject");
      v13[3] = (uint64_t)v8;
      getAVMediaTypeMetadataObjectSymbolLoc_ptr_0 = (uint64_t)v8;
    }
    _Block_object_dispose(&v12, 8);
    if (!v8)
    {
      v11 = (_Unwind_Exception *)+[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:].cold.1();
      _Block_object_dispose(&v12, 8);
      _Unwind_Resume(v11);
    }
    v7 = objc_msgSend(v4, "hasMediaType:", *v8, v12);
  }

  return v7;
}

void __79__AXSSMotionTrackingCameraManager__sortedAndFilteredCaptureDevicesFromDevices___block_invoke_2()
{
  void *v0;
  void *v1;
  id *v2;
  void *v3;
  id v4;
  id *v5;
  void *v6;
  id v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  getAVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v0;
  getAVCaptureDeviceTypeBuiltInWideAngleMetadataCamera();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v2 = (id *)getAVCaptureDeviceTypeBuiltInDualCameraSymbolLoc_ptr;
  v19 = getAVCaptureDeviceTypeBuiltInDualCameraSymbolLoc_ptr;
  if (!getAVCaptureDeviceTypeBuiltInDualCameraSymbolLoc_ptr)
  {
    v3 = (void *)AVFoundationLibrary_0();
    v2 = (id *)dlsym(v3, "AVCaptureDeviceTypeBuiltInDualCamera");
    v17[3] = (uint64_t)v2;
    getAVCaptureDeviceTypeBuiltInDualCameraSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v16, 8);
  if (!v2)
    goto LABEL_11;
  v4 = *v2;
  v20[2] = v4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v5 = (id *)getAVCaptureDeviceTypeBuiltInTelephotoCameraSymbolLoc_ptr;
  v19 = getAVCaptureDeviceTypeBuiltInTelephotoCameraSymbolLoc_ptr;
  if (!getAVCaptureDeviceTypeBuiltInTelephotoCameraSymbolLoc_ptr)
  {
    v6 = (void *)AVFoundationLibrary_0();
    v5 = (id *)dlsym(v6, "AVCaptureDeviceTypeBuiltInTelephotoCamera");
    v17[3] = (uint64_t)v5;
    getAVCaptureDeviceTypeBuiltInTelephotoCameraSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v16, 8);
  if (!v5)
    goto LABEL_11;
  v7 = *v5;
  v20[3] = v7;
  getAVCaptureDeviceTypeBuiltInWideAngleCamera();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v8;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v9 = (id *)getAVCaptureDeviceTypeBuiltInUltraWideCameraSymbolLoc_ptr;
  v19 = getAVCaptureDeviceTypeBuiltInUltraWideCameraSymbolLoc_ptr;
  if (!getAVCaptureDeviceTypeBuiltInUltraWideCameraSymbolLoc_ptr)
  {
    v10 = (void *)AVFoundationLibrary_0();
    v9 = (id *)dlsym(v10, "AVCaptureDeviceTypeBuiltInUltraWideCamera");
    v17[3] = (uint64_t)v9;
    getAVCaptureDeviceTypeBuiltInUltraWideCameraSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v16, 8);
  if (!v9)
  {
LABEL_11:
    +[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:].cold.1();
    __break(1u);
  }
  v21 = *v9;
  v11 = (void *)MEMORY[0x1E0C99D20];
  v12 = v21;
  objc_msgSend(v11, "arrayWithObjects:count:", v20, 6);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)_sortedAndFilteredCaptureDevicesFromDevices__s_orderedDeviceTypes;
  _sortedAndFilteredCaptureDevicesFromDevices__s_orderedDeviceTypes = v13;

  v15 = (void *)_sortedAndFilteredCaptureDevicesFromDevices__s_orderedPositions;
  _sortedAndFilteredCaptureDevicesFromDevices__s_orderedPositions = (uint64_t)&unk_1E5FA8800;

}

uint64_t __79__AXSSMotionTrackingCameraManager__sortedAndFilteredCaptureDevicesFromDevices___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6 && (objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
    goto LABEL_34;
  if (*(_QWORD *)(a1 + 32))
  {
    if (objc_msgSend(v5, "isEqual:") && !objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32)))
    {
      v23 = -1;
      goto LABEL_35;
    }
    if (objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32))
      && !objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32)))
    {
      v23 = 1;
      goto LABEL_35;
    }
  }
  objc_msgSend(v5, "deviceType");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_20:
    v24 = objc_msgSend(v5, "position");
    if (v24 != objc_msgSend(v7, "position"))
    {
      v25 = (void *)_sortedAndFilteredCaptureDevicesFromDevices__s_orderedPositions;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "position"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v25, "containsObject:", v26) & 1) != 0)
      {
        v27 = (void *)_sortedAndFilteredCaptureDevicesFromDevices__s_orderedPositions;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "position"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v27) = objc_msgSend(v27, "containsObject:", v28);

        if ((_DWORD)v27)
        {
          v29 = (void *)_sortedAndFilteredCaptureDevicesFromDevices__s_orderedPositions;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "position"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v29, "indexOfObject:", v19);
          v21 = (void *)_sortedAndFilteredCaptureDevicesFromDevices__s_orderedPositions;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "position"));
          v22 = objc_claimAutoreleasedReturnValue();
          goto LABEL_24;
        }
      }
      else
      {

      }
    }
    if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v5)
      && objc_msgSend(*(id *)(a1 + 40), "containsObject:", v7))
    {
      v31 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", v7);
      if (v31 > objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", v5))
        v23 = -1;
      else
        v23 = 1;
      goto LABEL_35;
    }
LABEL_34:
    v23 = 0;
    goto LABEL_35;
  }
  v9 = (void *)v8;
  objc_msgSend(v7, "deviceType");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
LABEL_19:

    goto LABEL_20;
  }
  v11 = (void *)v10;
  objc_msgSend(v5, "deviceType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", v13) & 1) != 0)
  {
LABEL_18:

    goto LABEL_19;
  }
  v14 = (void *)_sortedAndFilteredCaptureDevicesFromDevices__s_orderedDeviceTypes;
  objc_msgSend(v5, "deviceType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "containsObject:", v15))
  {

    goto LABEL_18;
  }
  v16 = (void *)_sortedAndFilteredCaptureDevicesFromDevices__s_orderedDeviceTypes;
  objc_msgSend(v7, "deviceType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v16, "containsObject:", v17);

  if (!(_DWORD)v16)
    goto LABEL_20;
  v18 = (void *)_sortedAndFilteredCaptureDevicesFromDevices__s_orderedDeviceTypes;
  objc_msgSend(v7, "deviceType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "indexOfObject:", v19);
  v21 = (void *)_sortedAndFilteredCaptureDevicesFromDevices__s_orderedDeviceTypes;
  objc_msgSend(v5, "deviceType");
  v22 = objc_claimAutoreleasedReturnValue();
LABEL_24:
  v30 = (void *)v22;
  if (v20 > objc_msgSend(v21, "indexOfObject:", v22))
    v23 = -1;
  else
    v23 = 1;

LABEL_35:
  return v23;
}

- (void)_captureDeviceUpdated
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_compatibleCaptureDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_1AF5CC000, a2, OS_LOG_TYPE_DEBUG, "AXSSMotionTrackingCameraManager: captureDeviceUpdated _compatibleCaptureDevices %@", v4, 0xCu);

}

void __56__AXSSMotionTrackingCameraManager__captureDeviceUpdated__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  if ((unint64_t)(*(_QWORD *)(a1 + 48) - 1) > 1)
  {
    if ((objc_msgSend(v3, "isConnected") & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    }
    else
    {
      AXSSLogForCategory(2);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = 138412290;
        v8 = v3;
        _os_log_impl(&dword_1AF5CC000, v6, OS_LOG_TYPE_INFO, "AXSSMotionTrackingCameraManager: Skipping device %@ because it is not connected!", (uint8_t *)&v7, 0xCu);
      }

    }
  }
  else
  {
    AXSSLogForCategory(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 48);
      v7 = 138412546;
      v8 = v3;
      v9 = 2048;
      v10 = v5;
      _os_log_impl(&dword_1AF5CC000, v4, OS_LOG_TYPE_INFO, "AXSSMotionTrackingCameraManager: Skipping device %@ due to authorization status: %ld", (uint8_t *)&v7, 0x16u);
    }

  }
}

- (void)_allCaptureDevicesChanged:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v4 = *MEMORY[0x1E0CB2CC8];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__AXSSMotionTrackingCameraManager__allCaptureDevicesChanged___block_invoke;
  v10[3] = &unk_1E5F99638;
  v10[4] = self;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __61__AXSSMotionTrackingCameraManager__allCaptureDevicesChanged___block_invoke_2;
  v9[3] = &unk_1E5F99638;
  v9[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

uint64_t __61__AXSSMotionTrackingCameraManager__allCaptureDevicesChanged___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("connected"), kCaptureDeviceConnectedKVOContext);
}

uint64_t __61__AXSSMotionTrackingCameraManager__allCaptureDevicesChanged___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("connected"), 1, kCaptureDeviceConnectedKVOContext);
}

- (void)_startDiscoverySession
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "_captureDeviceDiscoverySession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  OUTLINED_FUNCTION_2_3(&dword_1AF5CC000, v1, v2, "%@ Created and observed session: %@ mainThread %d", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_3_3();
}

- (void)_stopDiscoverySession
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "_captureDeviceDiscoverySession");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_3(&dword_1AF5CC000, v2, v3, "%@ Clearing and removing observer for session: %@, mainThread %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_3();
}

- (void)_resetDiscoverySession
{
  void *v3;

  -[AXSSMotionTrackingCameraManager _captureDeviceDiscoverySession](self, "_captureDeviceDiscoverySession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AXSSMotionTrackingCameraManager _stopDiscoverySession](self, "_stopDiscoverySession");
    -[AXSSMotionTrackingCameraManager _startDiscoverySession](self, "_startDiscoverySession");
    -[AXSSMotionTrackingCameraManager _captureDeviceUpdated](self, "_captureDeviceUpdated");
  }
}

- (void)_captureDeviceConnected:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  AXSSLogForCategory(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AXSSMotionTrackingCameraManager _captureDeviceConnected:].cold.1();

  -[AXSSMotionTrackingCameraManager _resetDiscoverySession](self, "_resetDiscoverySession");
  -[AXSSMotionTrackingCameraManager _captureDeviceUpdated](self, "_captureDeviceUpdated");

}

- (void)_captureDeviceDisconnected:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  AXSSLogForCategory(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AXSSMotionTrackingCameraManager _captureDeviceDisconnected:].cold.1();

  -[AXSSMotionTrackingCameraManager _resetDiscoverySession](self, "_resetDiscoverySession");
  -[AXSSMotionTrackingCameraManager _captureDeviceUpdated](self, "_captureDeviceUpdated");

}

- (AXSSMotionTrackingCameraManagerDelegate)delegate
{
  return (AXSSMotionTrackingCameraManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)_monitoring
{
  return self->__monitoring;
}

- (void)set_monitoring:(BOOL)a3
{
  self->__monitoring = a3;
}

- (NSMutableArray)_compatibleCaptureDevices
{
  return self->__compatibleCaptureDevices;
}

- (void)set_compatibleCaptureDevices:(id)a3
{
  objc_storeStrong((id *)&self->__compatibleCaptureDevices, a3);
}

- (NSMutableArray)_allCaptureDevices
{
  return self->__allCaptureDevices;
}

- (void)set_allCaptureDevices:(id)a3
{
  objc_storeStrong((id *)&self->__allCaptureDevices, a3);
}

- (AVCaptureDeviceDiscoverySession)_captureDeviceDiscoverySession
{
  return self->__captureDeviceDiscoverySession;
}

- (void)set_captureDeviceDiscoverySession:(id)a3
{
  objc_storeStrong((id *)&self->__captureDeviceDiscoverySession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__captureDeviceDiscoverySession, 0);
  objc_storeStrong((id *)&self->__allCaptureDevices, 0);
  objc_storeStrong((id *)&self->__compatibleCaptureDevices, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0(&dword_1AF5CC000, v0, v1, "AXSSMotionTrackingCameraManager: KVO on discovery session: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0(&dword_1AF5CC000, v0, v1, "AXSSMotionTrackingCameraManager: KVO on all devices: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_2(&dword_1AF5CC000, v0, v1, "AXSSMotionTrackingCameraManager: KVO on suspended capture device %@: %@");
  OUTLINED_FUNCTION_1();
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_2(&dword_1AF5CC000, v0, v1, "AXSSMotionTrackingCameraManager: KVO on connected capture device %@: %@");
  OUTLINED_FUNCTION_1();
}

- (void)_captureDeviceConnected:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0(&dword_1AF5CC000, v0, v1, "AXSSMotionTrackingCameraManager: _captureDeviceConnected %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_captureDeviceDisconnected:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0(&dword_1AF5CC000, v0, v1, "AXSSMotionTrackingCameraManager: _captureDeviceDisconnected %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
