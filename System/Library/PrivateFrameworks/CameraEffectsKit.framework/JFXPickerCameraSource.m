@implementation JFXPickerCameraSource

+ (JFXPickerCameraSource)sharedInstance
{
  if (sharedInstance_onceToken_10 != -1)
    dispatch_once(&sharedInstance_onceToken_10, &__block_literal_global_50);
  return (JFXPickerCameraSource *)(id)sharedInstance_s_sharedInstance_2;
}

void __39__JFXPickerCameraSource_sharedInstance__block_invoke()
{
  JFXPickerCameraSource *v0;
  void *v1;

  v0 = objc_alloc_init(JFXPickerCameraSource);
  v1 = (void *)sharedInstance_s_sharedInstance_2;
  sharedInstance_s_sharedInstance_2 = (uint64_t)v0;

}

- (JFXPickerCameraSource)init
{
  JFXPickerCameraSource *v2;
  uint64_t v3;
  NSMutableSet *registeredPickers;
  uint64_t v5;
  OS_dispatch_queue *registeredPickersQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)JFXPickerCameraSource;
  v2 = -[JFXPickerCameraSource init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    registeredPickers = v2->_registeredPickers;
    v2->_registeredPickers = (NSMutableSet *)v3;

    JFXCreateDispatchQueue(v2, CFSTR("registeredPickersQ"), MEMORY[0x24BDAC9C0]);
    v5 = objc_claimAutoreleasedReturnValue();
    registeredPickersQueue = v2->_registeredPickersQueue;
    v2->_registeredPickersQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)registerPickerAsPreviewingWithObject:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[JFXPickerCameraSource registeredPickersQueue](self, "registeredPickersQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__JFXPickerCameraSource_registerPickerAsPreviewingWithObject___block_invoke;
  v7[3] = &unk_24EE57AA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, v7);

}

void __62__JFXPickerCameraSource_registerPickerAsPreviewingWithObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "registeredPickers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "registeredPickersSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BE79090]);
    objc_msgSend(*(id *)(a1 + 32), "setRegisteredPickersSource:", v4);

    JFXLog_DebugPickerPreviewing();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __62__JFXPickerCameraSource_registerPickerAsPreviewingWithObject___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
}

- (void)unregisterPickerAsPreviewingWithObject:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[JFXPickerCameraSource registeredPickersQueue](self, "registeredPickersQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__JFXPickerCameraSource_unregisterPickerAsPreviewingWithObject___block_invoke;
  v7[3] = &unk_24EE57AA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, v7);

}

void __64__JFXPickerCameraSource_unregisterPickerAsPreviewingWithObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "registeredPickers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "registeredPickers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRegisteredPickersSource:", 0);
    JFXLog_DebugPickerPreviewing();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __64__JFXPickerCameraSource_unregisterPickerAsPreviewingWithObject___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
}

- (BOOL)isPickerPreviewing
{
  JFXPickerCameraSource *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[JFXPickerCameraSource registeredPickersQueue](self, "registeredPickersQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__JFXPickerCameraSource_isPickerPreviewing__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __43__JFXPickerCameraSource_isPickerPreviewing__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "registeredPickers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count") != 0;

}

- (PVLivePlayerCameraSource)pickerSource
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__21;
  v11 = __Block_byref_object_dispose__21;
  v12 = 0;
  -[JFXPickerCameraSource registeredPickersQueue](self, "registeredPickersQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__JFXPickerCameraSource_pickerSource__block_invoke;
  v6[3] = &unk_24EE57A80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PVLivePlayerCameraSource *)v4;
}

void __37__JFXPickerCameraSource_pickerSource__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "registeredPickersSource");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSMutableSet)registeredPickers
{
  return self->_registeredPickers;
}

- (void)setRegisteredPickers:(id)a3
{
  objc_storeStrong((id *)&self->_registeredPickers, a3);
}

- (OS_dispatch_queue)registeredPickersQueue
{
  return self->_registeredPickersQueue;
}

- (void)setRegisteredPickersQueue:(id)a3
{
  objc_storeStrong((id *)&self->_registeredPickersQueue, a3);
}

- (PVLivePlayerCameraSource)registeredPickersSource
{
  return self->_registeredPickersSource;
}

- (void)setRegisteredPickersSource:(id)a3
{
  objc_storeStrong((id *)&self->_registeredPickersSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredPickersSource, 0);
  objc_storeStrong((id *)&self->_registeredPickersQueue, 0);
  objc_storeStrong((id *)&self->_registeredPickers, 0);
}

void __62__JFXPickerCameraSource_registerPickerAsPreviewingWithObject___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, a1, a3, "create picker camera source", a5, a6, a7, a8, 0);
}

void __64__JFXPickerCameraSource_unregisterPickerAsPreviewingWithObject___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, a1, a3, "release picker camera source", a5, a6, a7, a8, 0);
}

@end
