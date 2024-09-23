@implementation AXSSMotionTrackingVirtualEyeTracker

- (AXSSMotionTrackingVirtualEyeTracker)initWithScreenBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  AXSSMotionTrackingVirtualEyeTracker *v7;
  AXSSMotionTrackingVirtualEyeTracker *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *hidUserDeviceQueue;
  void *v14;
  id v15;
  const char *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *reportingQueue;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)AXSSMotionTrackingVirtualEyeTracker;
  v7 = -[AXSSMotionTrackingVirtualEyeTracker init](&v21, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_screenBounds.origin.x = x;
    v7->_screenBounds.origin.y = y;
    v7->_screenBounds.size.width = width;
    v7->_screenBounds.size.height = height;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.accessibility.AXSSMotionTrackingVirtualEyeTracker.%p.hidQueue"), v7);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create(v10, v11);
    hidUserDeviceQueue = v8->__hidUserDeviceQueue;
    v8->__hidUserDeviceQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.accessibility.AXSSMotionTrackingVirtualEyeTracker.%p.reportingQueue"), v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_retainAutorelease(v14);
    v16 = (const char *)objc_msgSend(v15, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create(v16, v17);
    reportingQueue = v8->__reportingQueue;
    v8->__reportingQueue = (OS_dispatch_queue *)v18;

  }
  return v8;
}

- (void)dealloc
{
  HIDUserDevice *hidUserDevice;
  objc_super v4;

  hidUserDevice = self->__hidUserDevice;
  if (hidUserDevice)
    -[HIDUserDevice cancel](hidUserDevice, "cancel");
  v4.receiver = self;
  v4.super_class = (Class)AXSSMotionTrackingVirtualEyeTracker;
  -[AXSSMotionTrackingVirtualEyeTracker dealloc](&v4, sel_dealloc);
}

- (void)activate
{
  NSObject *v3;
  _QWORD block[5];

  -[AXSSMotionTrackingVirtualEyeTracker _reportingQueue](self, "_reportingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AXSSMotionTrackingVirtualEyeTracker_activate__block_invoke;
  block[3] = &unk_1E5F98868;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __47__AXSSMotionTrackingVirtualEyeTracker_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateOnReportingQueue");
}

- (void)deactivate
{
  NSObject *v3;
  _QWORD block[5];

  -[AXSSMotionTrackingVirtualEyeTracker _reportingQueue](self, "_reportingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AXSSMotionTrackingVirtualEyeTracker_deactivate__block_invoke;
  block[3] = &unk_1E5F98868;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __49__AXSSMotionTrackingVirtualEyeTracker_deactivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deactivateOnReportingQueue");
}

- (void)moveToPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD block[7];

  y = a3.y;
  x = a3.x;
  if (-[AXSSMotionTrackingVirtualEyeTracker _activated](self, "_activated"))
  {
    -[AXSSMotionTrackingVirtualEyeTracker _reportingQueue](self, "_reportingQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__AXSSMotionTrackingVirtualEyeTracker_moveToPoint___block_invoke;
    block[3] = &unk_1E5F98DC0;
    block[4] = self;
    *(CGFloat *)&block[5] = x;
    *(CGFloat *)&block[6] = y;
    dispatch_sync(v6, block);

  }
  else
  {
    AXSSLogForCategory(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AXSSMotionTrackingVirtualEyeTracker moveToPoint:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
}

uint64_t __51__AXSSMotionTrackingVirtualEyeTracker_moveToPoint___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_moveOnReportingQueueToPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)click
{
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, a1, a3, "%s: Can't click because device is not activated!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

uint64_t __44__AXSSMotionTrackingVirtualEyeTracker_click__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clickOnReportingQueueWithButtonDown:", 1);
}

uint64_t __44__AXSSMotionTrackingVirtualEyeTracker_click__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clickOnReportingQueueWithButtonDown:", 0);
}

- (void)changeStatusTo:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[6];

  if (-[AXSSMotionTrackingVirtualEyeTracker _activated](self, "_activated"))
  {
    -[AXSSMotionTrackingVirtualEyeTracker _reportingQueue](self, "_reportingQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__AXSSMotionTrackingVirtualEyeTracker_changeStatusTo___block_invoke;
    v14[3] = &unk_1E5F98DE8;
    v14[4] = self;
    v14[5] = a3;
    dispatch_sync(v5, v14);

  }
  else
  {
    AXSSLogForCategory(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AXSSMotionTrackingVirtualEyeTracker changeStatusTo:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
}

uint64_t __54__AXSSMotionTrackingVirtualEyeTracker_changeStatusTo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_changeStatusOnReportingQueueTo:", *(_QWORD *)(a1 + 40));
}

+ (NSDictionary)_eyeTrackerHIDDeviceProperties
{
  void *v2;
  void *v3;
  _QWORD v5[6];
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("ReportDescriptor");
  objc_msgSend(a1, "_eyeTrackerHIDReportDescriptorData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = CFSTR("Virtual Eye Tracker (Testing Use Only)");
  v5[1] = CFSTR("Product");
  v5[2] = CFSTR("VendorID");
  v6[2] = &unk_1E5FA8818;
  v6[3] = &unk_1E5FA8818;
  v5[3] = CFSTR("ProductID");
  v5[4] = CFSTR("ReportInterval");
  v5[5] = CFSTR("Authenticated");
  v6[4] = &unk_1E5FA8830;
  v6[5] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

+ (NSData)_eyeTrackerHIDReportDescriptorData
{
  if (_eyeTrackerHIDReportDescriptorData_onceToken != -1)
    dispatch_once(&_eyeTrackerHIDReportDescriptorData_onceToken, &__block_literal_global_2);
  return (NSData *)(id)_eyeTrackerHIDReportDescriptorData_s_eyeTrackerHIDReportDescriptorData;
}

void __73__AXSSMotionTrackingVirtualEyeTracker__eyeTrackerHIDReportDescriptorData__block_invoke()
{
  uint64_t v0;
  void *v1;
  _OWORD v2[9];
  _BYTE v3[21];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2[8] = xmmword_1AF610668;
  *(_OWORD *)v3 = unk_1AF610678;
  *(_QWORD *)&v3[13] = 0xC0C0068102950875;
  v2[4] = xmmword_1AF610628;
  v2[5] = unk_1AF610638;
  v2[6] = xmmword_1AF610648;
  v2[7] = unk_1AF610658;
  v2[0] = xmmword_1AF6105E8;
  v2[1] = unk_1AF6105F8;
  v2[2] = xmmword_1AF610608;
  v2[3] = unk_1AF610618;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v2, 165);
  v1 = (void *)_eyeTrackerHIDReportDescriptorData_s_eyeTrackerHIDReportDescriptorData;
  _eyeTrackerHIDReportDescriptorData_s_eyeTrackerHIDReportDescriptorData = v0;

}

- (void)_activateOnReportingQueue
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[AXSSMotionTrackingVirtualEyeTracker _activateOnReportingQueue]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1AF5CC000, a2, OS_LOG_TYPE_ERROR, "%s: Couldn't create HID user device with properties: %@! You probably need entitlements...", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_moveOnReportingQueueToPoint:(CGPoint)a3
{
  double y;
  double x;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;
  NSPoint v33;

  y = a3.y;
  x = a3.x;
  v32 = *MEMORY[0x1E0C80C00];
  -[AXSSMotionTrackingVirtualEyeTracker _reportingQueue](self, "_reportingQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[AXSSMotionTrackingVirtualEyeTracker _activated](self, "_activated"))
  {
    -[AXSSMotionTrackingVirtualEyeTracker _hidUserDevice](self, "_hidUserDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      AXSSLogForCategory(2);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v33.x = x;
        v33.y = y;
        NSStringFromPoint(v33);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v29 = "-[AXSSMotionTrackingVirtualEyeTracker _moveOnReportingQueueToPoint:]";
        v30 = 2112;
        v31 = v9;
        _os_log_impl(&dword_1AF5CC000, v8, OS_LOG_TYPE_INFO, "%s: %@", buf, 0x16u);

      }
      v10 = fmax(x, 0.0);
      -[AXSSMotionTrackingVirtualEyeTracker screenBounds](self, "screenBounds");
      if (v10 >= v11)
        v10 = v11;
      v12 = fmax(y, 0.0);
      -[AXSSMotionTrackingVirtualEyeTracker screenBounds](self, "screenBounds");
      if (v12 >= v13)
        v14 = v13;
      else
        v14 = v12;
      -[AXSSMotionTrackingVirtualEyeTracker screenBounds](self, "screenBounds");
      v16 = v10 / v15;
      -[AXSSMotionTrackingVirtualEyeTracker screenBounds](self, "screenBounds");
      v18 = v14 / v17;
      if (_moveOnReportingQueueToPoint__onceToken != -1)
        dispatch_once(&_moveOnReportingQueueToPoint__onceToken, &__block_literal_global_29);
      v19 = v16 / *(double *)&_moveOnReportingQueueToPoint__s_unitExponent;
      v20 = v18 / *(double *)&_moveOnReportingQueueToPoint__s_unitExponent;
      v21 = (void *)objc_opt_class();
      objc_msgSend(v21, "_hidReportWithPoint:reportID:timestamp:version:", 1, mach_absolute_time(), 0, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSSMotionTrackingVirtualEyeTracker _hidUserDevice](self, "_hidUserDevice");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v24 = objc_msgSend(v23, "handleReport:error:", v22, &v27);
      v25 = v27;

      if ((v24 & 1) == 0)
      {
        AXSSLogForCategory(2);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[AXSSMotionTrackingVirtualEyeTracker _moveOnReportingQueueToPoint:].cold.1();

      }
    }
  }
}

void __68__AXSSMotionTrackingVirtualEyeTracker__moveOnReportingQueueToPoint___block_invoke()
{
  _moveOnReportingQueueToPoint__s_unitExponent = 0x3EB0C6F7A0B5ED8DLL;
}

+ (id)_hidReportWithPoint:(CGPoint)a3 reportID:(unint64_t)a4 timestamp:(unint64_t)a5 version:(unint64_t)a6
{
  char v6;
  char v8;
  double y;
  double x;
  void *v11;
  void *v12;
  int v14;
  int v15;
  unint64_t v16;
  char v17;
  char v18;

  v6 = a6;
  v8 = a4;
  y = a3.y;
  x = a3.x;
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v8;
  v17 = v6;
  v16 = a5;
  v14 = (int)y;
  v15 = (int)x;
  objc_msgSend(v11, "appendBytes:length:", &v18, 1);
  objc_msgSend(v11, "appendBytes:length:", &v17, 1);
  objc_msgSend(v11, "appendBytes:length:", &v16, 8);
  objc_msgSend(v11, "appendBytes:length:", &v15, 4);
  objc_msgSend(v11, "appendBytes:length:", &v14, 4);
  v12 = (void *)objc_msgSend(v11, "copy");

  return v12;
}

- (void)_clickOnReportingQueueWithButtonDown:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  -[AXSSMotionTrackingVirtualEyeTracker _reportingQueue](self, "_reportingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[AXSSMotionTrackingVirtualEyeTracker _activated](self, "_activated"))
  {
    -[AXSSMotionTrackingVirtualEyeTracker _hidUserDevice](self, "_hidUserDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      AXSSLogForCategory(2);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = CFSTR("NO");
        if (v3)
          v8 = CFSTR("YES");
        *(_DWORD *)buf = 136315394;
        v15 = "-[AXSSMotionTrackingVirtualEyeTracker _clickOnReportingQueueWithButtonDown:]";
        v16 = 2112;
        v17 = v8;
        _os_log_impl(&dword_1AF5CC000, v7, OS_LOG_TYPE_INFO, "%s: %@", buf, 0x16u);
      }

      objc_msgSend((id)objc_opt_class(), "_hidReportWithButtonDown:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSSMotionTrackingVirtualEyeTracker _hidUserDevice](self, "_hidUserDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v11 = objc_msgSend(v10, "handleReport:error:", v9, &v13);
      v12 = v13;

      if ((v11 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[AXSSMotionTrackingVirtualEyeTracker _clickOnReportingQueueWithButtonDown:].cold.1();

    }
  }
}

+ (id)_hidReportWithButtonDown:(BOOL)a3
{
  id v4;
  void *v5;
  char v7;
  char v8;
  BOOL v9;
  char v10;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v10 = 3;
  objc_msgSend(v4, "appendBytes:length:", &v10, 1);
  v9 = a3;
  objc_msgSend(v4, "appendBytes:length:", &v9, 1);
  v8 = 0;
  objc_msgSend(v4, "appendBytes:length:", &v8, 1);
  v7 = 0;
  objc_msgSend(v4, "appendBytes:length:", &v7, 1);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (void)_changeStatusOnReportingQueueTo:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[AXSSMotionTrackingVirtualEyeTracker _reportingQueue](self, "_reportingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[AXSSMotionTrackingVirtualEyeTracker _activated](self, "_activated"))
  {
    -[AXSSMotionTrackingVirtualEyeTracker _hidUserDevice](self, "_hidUserDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      AXSSLogForCategory(2);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[AXSSMotionTrackingVirtualEyeTracker _changeStatusOnReportingQueueTo:]";
        v15 = 2048;
        v16 = a3;
        _os_log_impl(&dword_1AF5CC000, v7, OS_LOG_TYPE_INFO, "%s: %lu", buf, 0x16u);
      }

      objc_msgSend((id)objc_opt_class(), "_hidReportWithStatusChange:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSSMotionTrackingVirtualEyeTracker _hidUserDevice](self, "_hidUserDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      v10 = objc_msgSend(v9, "handleReport:error:", v8, &v12);
      v11 = v12;

      if ((v10 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[AXSSMotionTrackingVirtualEyeTracker _changeStatusOnReportingQueueTo:].cold.1();

    }
  }
}

+ (id)_hidReportWithStatusChange:(unint64_t)a3
{
  char v3;
  id v4;
  void *v5;
  char v7;
  char v8;
  char v9;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v9 = 2;
  objc_msgSend(v4, "appendBytes:length:", &v9, 1);
  v8 = 0;
  objc_msgSend(v4, "appendBytes:length:", &v8, 2);
  v7 = v3;
  objc_msgSend(v4, "appendBytes:length:", &v7, 1);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (void)_deactivateOnReportingQueue
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[AXSSMotionTrackingVirtualEyeTracker _reportingQueue](self, "_reportingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[AXSSMotionTrackingVirtualEyeTracker _activated](self, "_activated"))
  {
    -[AXSSMotionTrackingVirtualEyeTracker _hidUserDevice](self, "_hidUserDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[AXSSMotionTrackingVirtualEyeTracker _hidUserDevice](self, "_hidUserDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cancel");

      -[AXSSMotionTrackingVirtualEyeTracker set_hidUserDevice:](self, "set_hidUserDevice:", 0);
    }
    -[AXSSMotionTrackingVirtualEyeTracker set_activated:](self, "set_activated:", 0);
  }
}

- (CGRect)screenBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_screenBounds.origin.x;
  y = self->_screenBounds.origin.y;
  width = self->_screenBounds.size.width;
  height = self->_screenBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setScreenBounds:(CGRect)a3
{
  self->_screenBounds = a3;
}

- (BOOL)_activated
{
  return self->__activated;
}

- (void)set_activated:(BOOL)a3
{
  self->__activated = a3;
}

- (HIDUserDevice)_hidUserDevice
{
  return self->__hidUserDevice;
}

- (void)set_hidUserDevice:(id)a3
{
  objc_storeStrong((id *)&self->__hidUserDevice, a3);
}

- (OS_dispatch_queue)_hidUserDeviceQueue
{
  return self->__hidUserDeviceQueue;
}

- (void)set_hidUserDeviceQueue:(id)a3
{
  objc_storeStrong((id *)&self->__hidUserDeviceQueue, a3);
}

- (OS_dispatch_queue)_reportingQueue
{
  return self->__reportingQueue;
}

- (void)set_reportingQueue:(id)a3
{
  objc_storeStrong((id *)&self->__reportingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__reportingQueue, 0);
  objc_storeStrong((id *)&self->__hidUserDeviceQueue, 0);
  objc_storeStrong((id *)&self->__hidUserDevice, 0);
}

- (void)moveToPoint:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, a1, a3, "%s: Can't move to point because device is not activated!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)changeStatusTo:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, a1, a3, "%s: Can't change status because device is not activated!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_moveOnReportingQueueToPoint:.cold.1()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1AF5CC000, v0, (uint64_t)v0, "%s: Couldn't handle report %@: %@!", (uint8_t *)v1);
  OUTLINED_FUNCTION_4_0();
}

- (void)_clickOnReportingQueueWithButtonDown:.cold.1()
{
  uint64_t v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1AF5CC000, MEMORY[0x1E0C81028], v0, "%s: Couldn't handle button down report %@: %@!", (uint8_t *)v1);
  OUTLINED_FUNCTION_4_0();
}

- (void)_changeStatusOnReportingQueueTo:.cold.1()
{
  uint64_t v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1AF5CC000, MEMORY[0x1E0C81028], v0, "%s: Couldn't handle status change report %@: %@!", (uint8_t *)v1);
  OUTLINED_FUNCTION_4_0();
}

@end
