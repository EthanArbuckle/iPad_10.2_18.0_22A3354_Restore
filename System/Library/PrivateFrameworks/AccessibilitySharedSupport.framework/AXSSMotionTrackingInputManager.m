@implementation AXSSMotionTrackingInputManager

- (AXSSMotionTrackingInputManager)initWithConfiguration:(id)a3
{
  id v4;
  AXSSMotionTrackingInputManager *v5;
  uint64_t v6;
  AXSSMotionTrackingInputConfiguration *configuration;
  AXSSMotionTrackingCameraManager *v8;
  AXSSMotionTrackingCameraManager *cameraManager;
  uint64_t v10;
  NSMutableArray *compatibleCameraInputs;
  uint64_t v12;
  NSMutableArray *allCameraInputs;
  AXSSMotionTrackingHIDManager *v14;
  AXSSMotionTrackingHIDManager *hidManager;
  uint64_t v16;
  NSMutableArray *hidInputs;
  AXSSMotionTrackingVideoFileInputManager *v18;
  AXSSMotionTrackingVideoFileInputManager *videoFileInputManager;
  uint64_t v20;
  NSMutableArray *videoFileInputs;
  uint64_t v22;
  NSMutableArray *allInputs;
  uint64_t v24;
  NSMutableArray *compatibleInputs;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AXSSMotionTrackingInputManager;
  v5 = -[AXSSMotionTrackingInputManager init](&v27, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (AXSSMotionTrackingInputConfiguration *)v6;

    v8 = objc_alloc_init(AXSSMotionTrackingCameraManager);
    cameraManager = v5->__cameraManager;
    v5->__cameraManager = v8;

    -[AXSSMotionTrackingCameraManager setDelegate:](v5->__cameraManager, "setDelegate:", v5);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    compatibleCameraInputs = v5->__compatibleCameraInputs;
    v5->__compatibleCameraInputs = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    allCameraInputs = v5->__allCameraInputs;
    v5->__allCameraInputs = (NSMutableArray *)v12;

    v14 = objc_alloc_init(AXSSMotionTrackingHIDManager);
    hidManager = v5->__hidManager;
    v5->__hidManager = v14;

    -[AXSSMotionTrackingHIDManager setDelegate:](v5->__hidManager, "setDelegate:", v5);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    hidInputs = v5->__hidInputs;
    v5->__hidInputs = (NSMutableArray *)v16;

    if (+[AXSSMotionTrackingVideoFileInputManager allowVideoFileInput](AXSSMotionTrackingVideoFileInputManager, "allowVideoFileInput"))
    {
      v18 = objc_alloc_init(AXSSMotionTrackingVideoFileInputManager);
      videoFileInputManager = v5->__videoFileInputManager;
      v5->__videoFileInputManager = v18;

      -[AXSSMotionTrackingVideoFileInputManager setDelegate:](v5->__videoFileInputManager, "setDelegate:", v5);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v20 = objc_claimAutoreleasedReturnValue();
      videoFileInputs = v5->__videoFileInputs;
      v5->__videoFileInputs = (NSMutableArray *)v20;

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = objc_claimAutoreleasedReturnValue();
    allInputs = v5->__allInputs;
    v5->__allInputs = (NSMutableArray *)v22;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = objc_claimAutoreleasedReturnValue();
    compatibleInputs = v5->__compatibleInputs;
    v5->__compatibleInputs = (NSMutableArray *)v24;

  }
  return v5;
}

- (void)startMonitoring
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2(&dword_1AF5CC000, v0, v1, "AXSSMotionTrackingInputManager: startMonitoring %@ %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)stopMonitoring
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2(&dword_1AF5CC000, v0, v1, "AXSSMotionTrackingInputManager: stopMonitoring %@ %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_updateMonitoring
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (-[AXSSMotionTrackingInputManager _monitoring](self, "_monitoring")
    && -[AXSSMotionTrackingInputManager _supportsCameraInputs](self, "_supportsCameraInputs"))
  {
    -[AXSSMotionTrackingInputManager _cameraManager](self, "_cameraManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startMonitoring");
  }
  else
  {
    -[AXSSMotionTrackingInputManager _allCameraInputs](self, "_allCameraInputs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllObjects");

    -[AXSSMotionTrackingInputManager _compatibleCameraInputs](self, "_compatibleCameraInputs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

    -[AXSSMotionTrackingInputManager _cameraManager](self, "_cameraManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopMonitoring");
  }

  if (-[AXSSMotionTrackingInputManager _monitoring](self, "_monitoring")
    && -[AXSSMotionTrackingInputManager _supportsCameraInputs](self, "_supportsCameraInputs"))
  {
    -[AXSSMotionTrackingInputManager _videoFileInputManager](self, "_videoFileInputManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startMonitoring");
  }
  else
  {
    -[AXSSMotionTrackingInputManager _videoFileInputs](self, "_videoFileInputs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAllObjects");

    -[AXSSMotionTrackingInputManager _videoFileInputManager](self, "_videoFileInputManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopMonitoring");
  }

  if (-[AXSSMotionTrackingInputManager _monitoring](self, "_monitoring")
    && -[AXSSMotionTrackingInputManager _supportsHIDInputs](self, "_supportsHIDInputs"))
  {
    -[AXSSMotionTrackingInputManager _hidManager](self, "_hidManager");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startMonitoring");
  }
  else
  {
    -[AXSSMotionTrackingInputManager _hidInputs](self, "_hidInputs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAllObjects");

    -[AXSSMotionTrackingInputManager _hidManager](self, "_hidManager");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopMonitoring");
  }

}

- (NSArray)compatibleInputs
{
  void *v2;
  void *v3;

  -[AXSSMotionTrackingInputManager _compatibleInputs](self, "_compatibleInputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSArray)allInputs
{
  void *v2;
  void *v3;

  -[AXSSMotionTrackingInputManager _allInputs](self, "_allInputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (AXSSMotionTrackingInputConfiguration)configuration
{
  return (AXSSMotionTrackingInputConfiguration *)(id)-[AXSSMotionTrackingInputConfiguration copy](self->_configuration, "copy");
}

- (void)setConfiguration:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  uint64_t v8;
  AXSSMotionTrackingInputConfiguration *v9;
  AXSSMotionTrackingInputConfiguration *configuration;

  v4 = a3;
  -[AXSSMotionTrackingInputManager configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    AXSSLogForCategory(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[AXSSMotionTrackingInputManager setConfiguration:].cold.1((uint64_t)v4, v7, v8);

    v9 = (AXSSMotionTrackingInputConfiguration *)objc_msgSend(v4, "copy");
    configuration = self->_configuration;
    self->_configuration = v9;

    if (-[AXSSMotionTrackingInputManager _monitoring](self, "_monitoring"))
    {
      -[AXSSMotionTrackingInputManager _updateMonitoring](self, "_updateMonitoring");
      -[AXSSMotionTrackingInputManager _inputUpdated](self, "_inputUpdated");
    }
  }

}

- (BOOL)_supportsMotionTrackingType:(unint64_t)a3
{
  unint64_t v3;
  void *v5;
  void *v6;

  v3 = a3;
  if (a3)
  {
    -[AXSSMotionTrackingInputManager configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[AXSSMotionTrackingInputManager configuration](self, "configuration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v3) = objc_msgSend(v6, "supportsTrackingType:", v3);

    }
    else
    {
      LOBYTE(v3) = 1;
    }

  }
  return v3;
}

- (BOOL)_supportsCameraInputs
{
  return -[AXSSMotionTrackingInputManager _supportsMotionTrackingType:](self, "_supportsMotionTrackingType:", 1)
      || -[AXSSMotionTrackingInputManager _supportsMotionTrackingType:](self, "_supportsMotionTrackingType:", 3);
}

- (BOOL)_supportsHIDInputs
{
  return -[AXSSMotionTrackingInputManager _supportsMotionTrackingType:](self, "_supportsMotionTrackingType:", 2);
}

- (void)motionTrackingCameraManager:(id)a3 updatedCompatibleCaptureDevices:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[AXSSMotionTrackingInputManager _compatibleCameraInputs](self, "_compatibleCameraInputs", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[AXSSMotionTrackingInputManager _allCameraInputs](self, "_allCameraInputs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[AXSSMotionTrackingInputManager _cameraManager](self, "_cameraManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allCaptureDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __94__AXSSMotionTrackingInputManager_motionTrackingCameraManager_updatedCompatibleCaptureDevices___block_invoke;
  v9[3] = &unk_1E5F99638;
  v9[4] = self;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

  -[AXSSMotionTrackingInputManager _inputUpdated](self, "_inputUpdated");
}

void __94__AXSSMotionTrackingInputManager_motionTrackingCameraManager_updatedCompatibleCaptureDevices___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_cameraManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "compatibleCaptureDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  +[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:](AXSSMotionTrackingCameraInput, "motionTrackingCameraInputWithAVCaptureDevice:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v7
    && objc_msgSend(*(id *)(a1 + 32), "_supportsMotionTrackingType:", objc_msgSend(v10, "trackingType")))
  {
    objc_msgSend(*(id *)(a1 + 32), "_compatibleCameraInputs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);

  }
  objc_msgSend(*(id *)(a1 + 32), "_allCameraInputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

}

- (void)motionTrackingHIDManager:(id)a3 updatedDevices:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[AXSSMotionTrackingInputManager _hidInputs](self, "_hidInputs", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[AXSSMotionTrackingInputManager _hidManager](self, "_hidManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "devices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__AXSSMotionTrackingInputManager_motionTrackingHIDManager_updatedDevices___block_invoke;
  v8[3] = &unk_1E5F99660;
  v8[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

  -[AXSSMotionTrackingInputManager _inputUpdated](self, "_inputUpdated");
}

void __74__AXSSMotionTrackingInputManager_motionTrackingHIDManager_updatedDevices___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  +[AXSSMotionTrackingHIDInput motionTrackingHIDInputWithDevice:](AXSSMotionTrackingHIDInput, "motionTrackingHIDInputWithDevice:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_hidInputs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (void)motionTrackingVideoFileInputManager:(id)a3 updatedVideoFileInputNames:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  if (+[AXSSMotionTrackingVideoFileInputManager allowVideoFileInput](AXSSMotionTrackingVideoFileInputManager, "allowVideoFileInput", a3, a4))
  {
    -[AXSSMotionTrackingInputManager _videoFileInputs](self, "_videoFileInputs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

    -[AXSSMotionTrackingInputManager _videoFileInputManager](self, "_videoFileInputManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoFileInputNames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __97__AXSSMotionTrackingInputManager_motionTrackingVideoFileInputManager_updatedVideoFileInputNames___block_invoke;
    v8[3] = &unk_1E5F99688;
    v8[4] = self;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

    -[AXSSMotionTrackingInputManager _inputUpdated](self, "_inputUpdated");
  }
}

void __97__AXSSMotionTrackingInputManager_motionTrackingVideoFileInputManager_updatedVideoFileInputNames___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "length"))
  {
    +[AXSSMotionTrackingVideoFileInput videoFileInputWithName:](AXSSMotionTrackingVideoFileInput, "videoFileInputWithName:", v6);
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      objc_msgSend(*(id *)(a1 + 32), "_videoFileInputs");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v4);

    }
  }

}

- (id)_compatibleCameraInputMatchingCaptureDeviceUniqueID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__5;
    v15 = __Block_byref_object_dispose__5;
    v16 = 0;
    -[AXSSMotionTrackingInputManager _compatibleInputs](self, "_compatibleInputs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __86__AXSSMotionTrackingInputManager__compatibleCameraInputMatchingCaptureDeviceUniqueID___block_invoke;
    v8[3] = &unk_1E5F996B0;
    v9 = v4;
    v10 = &v11;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

    v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __86__AXSSMotionTrackingInputManager__compatibleCameraInputMatchingCaptureDeviceUniqueID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    v9 = v11;
    objc_msgSend(v9, "captureDeviceUniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length") && objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }

    v8 = v11;
  }

}

- (void)_inputUpdated
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_compatibleInputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_3_2(&dword_1AF5CC000, a2, v4, "AXSSMotionTrackingInputManager: inputUpdated _compatibleInputs %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_5();
}

void __47__AXSSMotionTrackingInputManager__inputUpdated__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  __int128 v11;
  uint64_t v12;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_compatibleInputs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__AXSSMotionTrackingInputManager__inputUpdated__block_invoke_2;
  v9[3] = &unk_1E5F996D8;
  v10 = v6;
  v11 = *(_OWORD *)(a1 + 32);
  v12 = a4;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

void __47__AXSSMotionTrackingInputManager__inputUpdated__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32))
    && objc_msgSend(*(id *)(a1 + 40), "_supportsMotionTrackingType:", objc_msgSend(v7, "trackingType")))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
    **(_BYTE **)(a1 + 56) = 1;
  }

}

void __47__AXSSMotionTrackingInputManager__inputUpdated__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_supportsMotionTrackingType:", objc_msgSend(v7, "trackingType")))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (AXSSMotionTrackingInput)inputToUse
{
  return self->_inputToUse;
}

- (void)setInputToUse:(id)a3
{
  objc_storeStrong((id *)&self->_inputToUse, a3);
}

- (AXSSMotionTrackingInputManagerDelegate)delegate
{
  return (AXSSMotionTrackingInputManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (AXSSMotionTrackingCameraManager)_cameraManager
{
  return self->__cameraManager;
}

- (void)set_cameraManager:(id)a3
{
  objc_storeStrong((id *)&self->__cameraManager, a3);
}

- (NSMutableArray)_compatibleCameraInputs
{
  return self->__compatibleCameraInputs;
}

- (void)set_compatibleCameraInputs:(id)a3
{
  objc_storeStrong((id *)&self->__compatibleCameraInputs, a3);
}

- (NSMutableArray)_allCameraInputs
{
  return self->__allCameraInputs;
}

- (void)set_allCameraInputs:(id)a3
{
  objc_storeStrong((id *)&self->__allCameraInputs, a3);
}

- (AXSSMotionTrackingHIDManager)_hidManager
{
  return self->__hidManager;
}

- (void)set_hidManager:(id)a3
{
  objc_storeStrong((id *)&self->__hidManager, a3);
}

- (NSMutableArray)_hidInputs
{
  return self->__hidInputs;
}

- (void)set_hidInputs:(id)a3
{
  objc_storeStrong((id *)&self->__hidInputs, a3);
}

- (AXSSMotionTrackingVideoFileInputManager)_videoFileInputManager
{
  return self->__videoFileInputManager;
}

- (void)set_videoFileInputManager:(id)a3
{
  objc_storeStrong((id *)&self->__videoFileInputManager, a3);
}

- (NSMutableArray)_videoFileInputs
{
  return self->__videoFileInputs;
}

- (void)set_videoFileInputs:(id)a3
{
  objc_storeStrong((id *)&self->__videoFileInputs, a3);
}

- (NSMutableArray)_compatibleInputs
{
  return self->__compatibleInputs;
}

- (void)set_compatibleInputs:(id)a3
{
  objc_storeStrong((id *)&self->__compatibleInputs, a3);
}

- (NSMutableArray)_allInputs
{
  return self->__allInputs;
}

- (void)set_allInputs:(id)a3
{
  objc_storeStrong((id *)&self->__allInputs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__allInputs, 0);
  objc_storeStrong((id *)&self->__compatibleInputs, 0);
  objc_storeStrong((id *)&self->__videoFileInputs, 0);
  objc_storeStrong((id *)&self->__videoFileInputManager, 0);
  objc_storeStrong((id *)&self->__hidInputs, 0);
  objc_storeStrong((id *)&self->__hidManager, 0);
  objc_storeStrong((id *)&self->__allCameraInputs, 0);
  objc_storeStrong((id *)&self->__compatibleCameraInputs, 0);
  objc_storeStrong((id *)&self->__cameraManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inputToUse, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)setConfiguration:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_3_2(&dword_1AF5CC000, a2, a3, "AXSSMotionTrackingInputManager: setConfinguration %@", (uint8_t *)&v3);
}

@end
