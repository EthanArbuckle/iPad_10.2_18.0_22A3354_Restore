@implementation AXSSMotionTrackingHIDManager

- (AXSSMotionTrackingHIDManager)init
{
  AXSSMotionTrackingHIDManager *v2;
  uint64_t v3;
  NSMutableArray *devices;
  dispatch_queue_t v5;
  OS_dispatch_queue *hidManagerDispatchQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXSSMotionTrackingHIDManager;
  v2 = -[AXSSMotionTrackingHIDManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    devices = v2->__devices;
    v2->__devices = (NSMutableArray *)v3;

    v5 = dispatch_queue_create("com.apple.MotionTrackingHIDManager.hidManagerDispatchQueue", 0);
    hidManagerDispatchQueue = v2->__hidManagerDispatchQueue;
    v2->__hidManagerDispatchQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)dealloc
{
  HIDManager *hidManager;
  objc_super v4;

  if (self->__monitoring)
  {
    -[HIDManager cancel](self->__hidManager, "cancel");
    hidManager = self->__hidManager;
    self->__hidManager = 0;

  }
  v4.receiver = self;
  v4.super_class = (Class)AXSSMotionTrackingHIDManager;
  -[AXSSMotionTrackingHIDManager dealloc](&v4, sel_dealloc);
}

- (void)startMonitoring
{
  OUTLINED_FUNCTION_3_0(&dword_1AF5CC000, a2, a3, "AXSSMotionTrackingHIDManager: startMonitoring %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __47__AXSSMotionTrackingHIDManager_startMonitoring__block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AXSSMotionTrackingHIDManager_startMonitoring__block_invoke_2;
  block[3] = &unk_1E5F99DA0;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v8 = v5;
  v10 = a3;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __47__AXSSMotionTrackingHIDManager_startMonitoring__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_deviceNotification:added:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

- (void)stopMonitoring
{
  OUTLINED_FUNCTION_3_0(&dword_1AF5CC000, a2, a3, "AXSSMotionTrackingHIDManager: stopMonitoring %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (NSArray)devices
{
  void *v2;
  void *v3;

  -[AXSSMotionTrackingHIDManager _devices](self, "_devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)_deviceNotification:(id)a3 added:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;

  v4 = a4;
  v6 = a3;
  AXSSLogForCategory(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[AXSSMotionTrackingHIDManager _deviceNotification:added:].cold.4((uint64_t)v6, v4, v7);

  if (v4)
  {
    if (!+[AXSSMotionTrackingUtilities axss_HIDDeviceIsMFiAuthenticated:](AXSSMotionTrackingUtilities, "axss_HIDDeviceIsMFiAuthenticated:", v6))
    {
      AXSSLogForCategory(2);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[AXSSMotionTrackingHIDManager _deviceNotification:added:].cold.3();
      goto LABEL_20;
    }
    +[AXSSMotionTrackingUtilities axss_xPositionElementMatchingDict](AXSSMotionTrackingUtilities, "axss_xPositionElementMatchingDict");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "elementsMatching:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();

    +[AXSSMotionTrackingUtilities axss_yPositionElementMatchingDict](AXSSMotionTrackingUtilities, "axss_yPositionElementMatchingDict");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "elementsMatching:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10 || !v13)
    {
      AXSSLogForCategory(2);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[AXSSMotionTrackingHIDManager _deviceNotification:added:].cold.1();

      goto LABEL_19;
    }
    -[AXSSMotionTrackingHIDManager _devices](self, "_devices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v6);

  }
  else
  {
    -[AXSSMotionTrackingHIDManager _devices](self, "_devices");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", v6);

    if (!v16)
      goto LABEL_21;
    -[AXSSMotionTrackingHIDManager _devices](self, "_devices");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObject:](v10, "removeObject:", v6);
  }

  -[AXSSMotionTrackingHIDManager delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    AXSSLogForCategory(2);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[AXSSMotionTrackingHIDManager _deviceNotification:added:].cold.2(self, v19);

    -[AXSSMotionTrackingHIDManager delegate](self, "delegate");
    v10 = objc_claimAutoreleasedReturnValue();
    -[AXSSMotionTrackingHIDManager _devices](self, "_devices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v13, "copy");
    -[NSObject motionTrackingHIDManager:updatedDevices:](v10, "motionTrackingHIDManager:updatedDevices:", self, v20);

LABEL_19:
LABEL_20:

  }
LABEL_21:

}

- (AXSSMotionTrackingHIDManagerDelegate)delegate
{
  return (AXSSMotionTrackingHIDManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (OS_dispatch_queue)_hidManagerDispatchQueue
{
  return self->__hidManagerDispatchQueue;
}

- (void)set_hidManagerDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->__hidManagerDispatchQueue, a3);
}

- (HIDManager)_hidManager
{
  return self->__hidManager;
}

- (void)set_hidManager:(id)a3
{
  objc_storeStrong((id *)&self->__hidManager, a3);
}

- (NSMutableArray)_devices
{
  return self->__devices;
}

- (void)set_devices:(id)a3
{
  objc_storeStrong((id *)&self->__devices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__devices, 0);
  objc_storeStrong((id *)&self->__hidManager, 0);
  objc_storeStrong((id *)&self->__hidManagerDispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_deviceNotification:added:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_4(&dword_1AF5CC000, v0, v1, "%s: device does not support X or Y position usages: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_deviceNotification:(void *)a1 added:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_5();
  _os_log_debug_impl(&dword_1AF5CC000, a2, OS_LOG_TYPE_DEBUG, "%s: notifying delegate of updated devices: %@", (uint8_t *)v4, 0x16u);

}

- (void)_deviceNotification:added:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_4(&dword_1AF5CC000, v0, v1, "%s: device is not MFi authenticated!: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_deviceNotification:(os_log_t)log added:.cold.4(uint64_t a1, char a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("NO");
  v5 = "-[AXSSMotionTrackingHIDManager _deviceNotification:added:]";
  v4 = 136315650;
  v6 = 2112;
  v7 = a1;
  if ((a2 & 1) != 0)
    v3 = CFSTR("YES");
  v8 = 2112;
  v9 = v3;
  _os_log_debug_impl(&dword_1AF5CC000, log, OS_LOG_TYPE_DEBUG, "%s: device: %@, added: %@", (uint8_t *)&v4, 0x20u);
}

@end
