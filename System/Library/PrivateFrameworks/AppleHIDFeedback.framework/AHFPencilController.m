@implementation AHFPencilController

- (AHFPencilController)init
{
  AHFPencilController *v2;
  uint64_t v3;
  AHFPencilPatternLibrary *patternsLibrary;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  AHFPencilController *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AHFPencilController;
  v2 = -[AHFPencilController init](&v9, sel_init);
  if (!v2)
    goto LABEL_8;
  v3 = objc_opt_new();
  patternsLibrary = v2->_patternsLibrary;
  v2->_patternsLibrary = (AHFPencilPatternLibrary *)v3;

  if (!v2->_patternsLibrary)
    goto LABEL_8;
  v5 = dispatch_queue_create("com.apple.hid.AppleHIDFeedback.Pencil", 0);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v5;

  if (!v2->_queue)
    goto LABEL_8;
  v2->_prevTimestampUs = 0;
  v7 = 0;
  if (-[AHFPencilController initializeDigitizerStylusSystem](v2, "initializeDigitizerStylusSystem"))
  {
    if (-[AHFPencilController initializeOpaqueTouchSystem](v2, "initializeOpaqueTouchSystem")
      && -[AHFPencilController initializePencilHapticsSystem](v2, "initializePencilHapticsSystem"))
    {
      v7 = v2;
      goto LABEL_9;
    }
LABEL_8:
    v7 = 0;
  }
LABEL_9:

  return v7;
}

- (void)dealloc
{
  HIDEventSystemClient *pencilHapticsClient;
  HIDEventSystemClient *opaqueTouchClient;
  HIDEventSystemClient *digitizerStylusClient;
  io_object_t availablePencilHaptics;
  objc_super v7;

  pencilHapticsClient = self->_pencilHapticsClient;
  if (pencilHapticsClient)
    -[HIDEventSystemClient cancel](pencilHapticsClient, "cancel");
  opaqueTouchClient = self->_opaqueTouchClient;
  if (opaqueTouchClient)
    -[HIDEventSystemClient cancel](opaqueTouchClient, "cancel");
  digitizerStylusClient = self->_digitizerStylusClient;
  if (digitizerStylusClient)
    -[HIDEventSystemClient cancel](digitizerStylusClient, "cancel");
  availablePencilHaptics = self->_availablePencilHaptics;
  if (availablePencilHaptics)
    IOObjectRelease(availablePencilHaptics);
  v7.receiver = self;
  v7.super_class = (Class)AHFPencilController;
  -[AHFPencilController dealloc](&v7, sel_dealloc);
}

- (BOOL)initializeDigitizerStylusSystem
{
  NSMutableIndexSet *v3;
  NSMutableIndexSet *availableDigitizerStylus;
  HIDEventSystemClient *v5;
  HIDEventSystemClient *digitizerStylusClient;
  HIDEventSystemClient *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  id location;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = (NSMutableIndexSet *)objc_opt_new();
  availableDigitizerStylus = self->_availableDigitizerStylus;
  self->_availableDigitizerStylus = v3;

  if (self->_availableDigitizerStylus)
  {
    v5 = (HIDEventSystemClient *)objc_msgSend(objc_alloc(MEMORY[0x24BE3E800]), "initWithType:", 2);
    digitizerStylusClient = self->_digitizerStylusClient;
    self->_digitizerStylusClient = v5;

    v7 = self->_digitizerStylusClient;
    if (v7)
    {
      -[HIDEventSystemClient setMatching:](v7, "setMatching:", &unk_2507CBC28);
      objc_initWeak(&location, self);
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __54__AHFPencilController_initializeDigitizerStylusSystem__block_invoke;
      v18[3] = &unk_2507CAAF8;
      objc_copyWeak(&v19, &location);
      v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7F3730](v18);
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      -[HIDEventSystemClient services](self->_digitizerStylusClient, "services", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v15;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v15 != v11)
              objc_enumerationMutation(v9);
            v8[2](v8, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++));
          }
          while (v10 != v12);
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
        }
        while (v10);
      }

      -[HIDEventSystemClient setServiceNotificationHandler:](self->_digitizerStylusClient, "setServiceNotificationHandler:", v8);
      -[HIDEventSystemClient setDispatchQueue:](self->_digitizerStylusClient, "setDispatchQueue:", self->_queue);
      -[HIDEventSystemClient activate](self->_digitizerStylusClient, "activate");

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return (char)v7;
}

void __54__AHFPencilController_initializeDigitizerStylusSystem__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10[2];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *label;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = (void *)objc_msgSend(v3, "serviceID");
    LoggingFramework();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v12 = "-[AHFPencilController initializeDigitizerStylusSystem]_block_invoke";
      v13 = 2048;
      v14 = v6;
      v15 = 2080;
      label = dispatch_queue_get_label(0);
      _os_log_impl(&dword_236442000, v7, OS_LOG_TYPE_DEFAULT, "%s Digitizer Stylus with senderID 0x%llx added in %s queue", buf, 0x20u);
    }

    objc_msgSend(WeakRetained, "availableDigitizerStylus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addIndex:", v6);

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __54__AHFPencilController_initializeDigitizerStylusSystem__block_invoke_11;
    v9[3] = &unk_2507CAAD0;
    objc_copyWeak(v10, v4);
    v10[1] = v6;
    objc_msgSend(v3, "setRemovalHandler:", v9);
    objc_destroyWeak(v10);
  }

}

void __54__AHFPencilController_initializeDigitizerStylusSystem__block_invoke_11(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  const char *label;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    LoggingFramework();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v6 = 136315650;
      v7 = "-[AHFPencilController initializeDigitizerStylusSystem]_block_invoke";
      v8 = 2048;
      v9 = v4;
      v10 = 2080;
      label = dispatch_queue_get_label(0);
      _os_log_impl(&dword_236442000, v3, OS_LOG_TYPE_DEFAULT, "%s Digitizer Stylus with senderID 0x%llx removed in %s queue", (uint8_t *)&v6, 0x20u);
    }

    objc_msgSend(WeakRetained, "availableDigitizerStylus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeIndex:", *(_QWORD *)(a1 + 40));

  }
}

- (BOOL)initializeOpaqueTouchSystem
{
  NSMutableIndexSet *v3;
  NSMutableIndexSet *availableOpaqueTouch;
  HIDEventSystemClient *v5;
  HIDEventSystemClient *opaqueTouchClient;
  HIDEventSystemClient *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  id location;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = (NSMutableIndexSet *)objc_opt_new();
  availableOpaqueTouch = self->_availableOpaqueTouch;
  self->_availableOpaqueTouch = v3;

  if (self->_availableOpaqueTouch)
  {
    v5 = (HIDEventSystemClient *)objc_msgSend(objc_alloc(MEMORY[0x24BE3E800]), "initWithType:", 2);
    opaqueTouchClient = self->_opaqueTouchClient;
    self->_opaqueTouchClient = v5;

    v7 = self->_opaqueTouchClient;
    if (v7)
    {
      -[HIDEventSystemClient setMatching:](v7, "setMatching:", &unk_2507CBC50);
      objc_initWeak(&location, self);
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __50__AHFPencilController_initializeOpaqueTouchSystem__block_invoke;
      v18[3] = &unk_2507CAAF8;
      objc_copyWeak(&v19, &location);
      v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7F3730](v18);
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      -[HIDEventSystemClient services](self->_opaqueTouchClient, "services", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v15;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v15 != v11)
              objc_enumerationMutation(v9);
            v8[2](v8, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++));
          }
          while (v10 != v12);
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
        }
        while (v10);
      }

      -[HIDEventSystemClient setServiceNotificationHandler:](self->_opaqueTouchClient, "setServiceNotificationHandler:", v8);
      -[HIDEventSystemClient setDispatchQueue:](self->_opaqueTouchClient, "setDispatchQueue:", self->_queue);
      -[HIDEventSystemClient activate](self->_opaqueTouchClient, "activate");

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return (char)v7;
}

void __50__AHFPencilController_initializeOpaqueTouchSystem__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10[2];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *label;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = (void *)objc_msgSend(v3, "serviceID");
    LoggingFramework();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v12 = "-[AHFPencilController initializeOpaqueTouchSystem]_block_invoke";
      v13 = 2048;
      v14 = v6;
      v15 = 2080;
      label = dispatch_queue_get_label(0);
      _os_log_impl(&dword_236442000, v7, OS_LOG_TYPE_DEFAULT, "%s OpaqueTouch with senderID 0x%llx added in %s queue", buf, 0x20u);
    }

    objc_msgSend(WeakRetained, "availableOpaqueTouch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addIndex:", v6);

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __50__AHFPencilController_initializeOpaqueTouchSystem__block_invoke_19;
    v9[3] = &unk_2507CAAD0;
    objc_copyWeak(v10, v4);
    v10[1] = v6;
    objc_msgSend(v3, "setRemovalHandler:", v9);
    objc_destroyWeak(v10);
  }

}

void __50__AHFPencilController_initializeOpaqueTouchSystem__block_invoke_19(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  const char *label;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    LoggingFramework();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v6 = 136315650;
      v7 = "-[AHFPencilController initializeOpaqueTouchSystem]_block_invoke";
      v8 = 2048;
      v9 = v4;
      v10 = 2080;
      label = dispatch_queue_get_label(0);
      _os_log_impl(&dword_236442000, v3, OS_LOG_TYPE_DEFAULT, "%s OpaqueTouch with senderID 0x%llx removed in %s queue", (uint8_t *)&v6, 0x20u);
    }

    objc_msgSend(WeakRetained, "availableOpaqueTouch");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeIndex:", *(_QWORD *)(a1 + 40));

  }
}

- (BOOL)initializePencilHapticsSystem
{
  HIDEventSystemClient *v3;
  HIDEventSystemClient *pencilHapticsClient;
  HIDEventSystemClient *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  id location;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  self->_availablePencilHaptics = 0;
  v3 = (HIDEventSystemClient *)objc_msgSend(objc_alloc(MEMORY[0x24BE3E800]), "initWithType:", 2);
  pencilHapticsClient = self->_pencilHapticsClient;
  self->_pencilHapticsClient = v3;

  v5 = self->_pencilHapticsClient;
  if (v5)
  {
    -[HIDEventSystemClient setMatching:](self->_pencilHapticsClient, "setMatching:", &unk_2507CBC78);
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __52__AHFPencilController_initializePencilHapticsSystem__block_invoke;
    v16[3] = &unk_2507CAAF8;
    objc_copyWeak(&v17, &location);
    v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7F3730](v16);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[HIDEventSystemClient services](self->_pencilHapticsClient, "services", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v7);
          v6[2](v6, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
      }
      while (v8);
    }

    -[HIDEventSystemClient setServiceNotificationHandler:](self->_pencilHapticsClient, "setServiceNotificationHandler:", v6);
    -[HIDEventSystemClient setDispatchQueue:](self->_pencilHapticsClient, "setDispatchQueue:", self->_queue);
    -[HIDEventSystemClient activate](self->_pencilHapticsClient, "activate");

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v5 != 0;
}

void __52__AHFPencilController_initializePencilHapticsSystem__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  const __CFDictionary *v8;
  _QWORD v9[4];
  id v10[2];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *label;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = (void *)objc_msgSend(v3, "serviceID");
    LoggingFramework();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v12 = "-[AHFPencilController initializePencilHapticsSystem]_block_invoke";
      v13 = 2048;
      v14 = v6;
      v15 = 2080;
      label = dispatch_queue_get_label(0);
      _os_log_impl(&dword_236442000, v7, OS_LOG_TYPE_DEFAULT, "%s Pencil Haptics with senderID 0x%llx added in %s queue", buf, 0x20u);
    }

    IOObjectRelease(objc_msgSend(WeakRetained, "availablePencilHaptics"));
    v8 = IORegistryEntryIDMatching((uint64_t)v6);
    objc_msgSend(WeakRetained, "setAvailablePencilHaptics:", IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v8));
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __52__AHFPencilController_initializePencilHapticsSystem__block_invoke_27;
    v9[3] = &unk_2507CAAD0;
    objc_copyWeak(v10, v4);
    v10[1] = v6;
    objc_msgSend(v3, "setRemovalHandler:", v9);
    objc_destroyWeak(v10);
  }

}

void __52__AHFPencilController_initializePencilHapticsSystem__block_invoke_27(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  const char *label;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    LoggingFramework();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 136315650;
      v6 = "-[AHFPencilController initializePencilHapticsSystem]_block_invoke";
      v7 = 2048;
      v8 = v4;
      v9 = 2080;
      label = dispatch_queue_get_label(0);
      _os_log_impl(&dword_236442000, v3, OS_LOG_TYPE_DEFAULT, "%s Pencil Haptics with senderID 0x%llx removed in %s queue", (uint8_t *)&v5, 0x20u);
    }

    IOObjectRelease(objc_msgSend(WeakRetained, "availablePencilHaptics"));
    objc_msgSend(WeakRetained, "setAvailablePencilHaptics:", 0);
  }

}

- (int)playFeedbackGated:(id)a3 haptics:(unsigned int)a4 timestamp:(unint64_t)a5 error:(id *)a6
{
  int v10;
  id v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  NSObject *v16;
  float v17;
  NSObject *v18;
  mach_error_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = -536870212;
  v11 = a3;
  v12 = machTimeToMicrosec(a5);
  -[AHFPencilPatternLibrary getReportForPattern:timestampUs:prevTimestampUs:error:](self->_patternsLibrary, "getReportForPattern:timestampUs:prevTimestampUs:error:", v11, v12, self->_prevTimestampUs, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = mach_absolute_time();
    v15 = machTimeToMicrosec(v14);
    LoggingFramework();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (float)(v12 - self->_prevTimestampUs);
      *(_DWORD *)buf = 136315906;
      v28 = "-[AHFPencilController playFeedbackGated:haptics:timestamp:error:]";
      v29 = 2112;
      v30 = v11;
      v31 = 2048;
      v32 = v15 - v12;
      v33 = 2048;
      v34 = (float)(v17 / 1000.0);
      _os_log_impl(&dword_236442000, v16, OS_LOG_TYPE_DEFAULT, "%s Playing pattern %@ requested %lldus ago, previous was %.2fms ago", buf, 0x2Au);
    }

    LoggingFramework();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      *(_DWORD *)buf = 134349056;
      v28 = (const char *)a5;
      _os_signpost_emit_with_name_impl(&dword_236442000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PlayPencilFeedback", "%{public, signpost.description:begin_time}llu", buf, 0xCu);
    }

    v19 = IORegistryEntrySetCFProperty(a4, CFSTR("HapticsMessage"), v13);
    if (v19)
    {
      v20 = mach_error_string(v19);
      failure(a6, -536870212, (uint64_t)"Error requesting playback to kernel: %s", v21, v22, v23, v24, v25, (uint64_t)v20);
    }
    else
    {
      v10 = 0;
    }
    self->_prevTimestampUs = v12;
  }
  else
  {
    v10 = -536870206;
  }

  return v10;
}

- (int)playFeedback:(id)a3 senderID:(unint64_t)a4 timestamp:(unint64_t)a5 error:(id *)a6
{
  id v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  int v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  id v20[3];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = -536870212;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  LoggingFramework();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v32 = "-[AHFPencilController playFeedback:senderID:timestamp:error:]";
    v33 = 2112;
    v34 = v10;
    v35 = 2048;
    v36 = a4;
    _os_log_impl(&dword_236442000, v11, OS_LOG_TYPE_DEFAULT, "%s Trying to play pattern %@ on pencil HID sender ID 0x%llX", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __61__AHFPencilController_playFeedback_senderID_timestamp_error___block_invoke;
  v16[3] = &unk_2507CAB20;
  objc_copyWeak(v20, (id *)buf);
  v20[1] = (id)a4;
  v18 = &v27;
  v19 = &v21;
  v13 = v10;
  v17 = v13;
  v20[2] = (id)a5;
  dispatch_sync(queue, v16);
  v14 = *((_DWORD *)v28 + 6);
  if (a6 && v14)
  {
    *a6 = objc_retainAutorelease((id)v22[5]);
    v14 = *((_DWORD *)v28 + 6);
  }

  objc_destroyWeak(v20);
  objc_destroyWeak((id *)buf);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v14;
}

void __61__AHFPencilController_playFeedback_senderID_timestamp_error___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  id obj;
  void *v31;
  void *v32;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "availableDigitizerStylus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsIndex:", *(_QWORD *)(a1 + 64)))
  {

  }
  else
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "availableOpaqueTouch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsIndex:", *(_QWORD *)(a1 + 64));

    if ((v7 & 1) == 0)
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -536870208;
      v28 = *(_QWORD *)(a1 + 40);
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v32 = *(void **)(v26 + 40);
      failure(&v32, *(_DWORD *)(*(_QWORD *)(v28 + 8) + 24), (uint64_t)"SenderID 0x%llX not found", v8, v9, v10, v11, v12, *(_QWORD *)(a1 + 64));
      v27 = v32;
      goto LABEL_8;
    }
  }
  v13 = objc_loadWeakRetained(v2);
  v14 = objc_msgSend(v13, "availablePencilHaptics");

  if (!v14)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -536870184;
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v31 = *(void **)(v26 + 40);
    failure(&v31, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), (uint64_t)"No Pencil Haptics device to play pattern %@ to", v15, v16, v17, v18, v19, *(_QWORD *)(a1 + 32));
    v27 = v31;
LABEL_8:
    v29 = v27;
    v22 = *(id *)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v29;
    goto LABEL_9;
  }
  v20 = objc_loadWeakRetained(v2);
  v21 = *(_QWORD *)(a1 + 32);
  v22 = v20;
  v23 = objc_msgSend(v22, "availablePencilHaptics");
  v24 = *(_QWORD *)(a1 + 72);
  v25 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  obj = 0;
  LODWORD(v21) = objc_msgSend(v22, "playFeedbackGated:haptics:timestamp:error:", v21, v23, v24, &obj);

  objc_storeStrong(v25, obj);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v21;
LABEL_9:

}

- (int)playFeedback:(id)a3 accessoryID:(id)a4 timestamp:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  NSObject *queue;
  id v14;
  id v15;
  int v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  id v23[2];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = -536870212;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  LoggingFramework();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v35 = "-[AHFPencilController playFeedback:accessoryID:timestamp:error:]";
    v36 = 2112;
    v37 = v10;
    v38 = 2112;
    v39 = v11;
    _os_log_impl(&dword_236442000, v12, OS_LOG_TYPE_DEFAULT, "%s Trying to play pattern %@ on pencil power source accessory ID %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __64__AHFPencilController_playFeedback_accessoryID_timestamp_error___block_invoke;
  v18[3] = &unk_2507CAB48;
  objc_copyWeak(v23, (id *)buf);
  v21 = &v30;
  v22 = &v24;
  v14 = v10;
  v19 = v14;
  v15 = v11;
  v20 = v15;
  v23[1] = (id)a5;
  dispatch_sync(queue, v18);
  v16 = *((_DWORD *)v31 + 6);
  if (a6 && v16)
  {
    *a6 = objc_retainAutorelease((id)v25[5]);
    v16 = *((_DWORD *)v31 + 6);
  }

  objc_destroyWeak(v23);
  objc_destroyWeak((id *)buf);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v16;
}

void __64__AHFPencilController_playFeedback_accessoryID_timestamp_error___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  io_registry_entry_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  id obj;
  id v30;
  id v31;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = objc_msgSend(WeakRetained, "availablePencilHaptics");

  if (v4)
  {
    v10 = objc_loadWeakRetained(v2);
    v11 = objc_msgSend(v10, "availablePencilHaptics");
    v12 = (void *)IORegistryEntrySearchCFProperty(v11, "IOService", CFSTR("PhysicalDeviceUniqueID"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);

    if ((objc_msgSend(v12, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) != 0)
    {
      v18 = objc_loadWeakRetained(v2);
      v19 = *(_QWORD *)(a1 + 32);
      v20 = v18;
      v21 = objc_msgSend(v20, "availablePencilHaptics");
      v22 = *(_QWORD *)(a1 + 72);
      v23 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      obj = 0;
      LODWORD(v19) = objc_msgSend(v20, "playFeedbackGated:haptics:timestamp:error:", v19, v21, v22, &obj);

      objc_storeStrong(v23, obj);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v19;
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -536870208;
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v30 = *(id *)(v27 + 40);
      failure(&v30, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), (uint64_t)"Accessory ID %@ not found", v13, v14, v15, v16, v17, *(_QWORD *)(a1 + 40));
      v28 = v30;
      v20 = *(id *)(v27 + 40);
      *(_QWORD *)(v27 + 40) = v28;
    }

  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -536870184;
    v24 = *(_QWORD *)(a1 + 48);
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v31 = *(id *)(v25 + 40);
    failure(&v31, *(_DWORD *)(*(_QWORD *)(v24 + 8) + 24), (uint64_t)"No Pencil Haptics device to play pattern %@ to", v5, v6, v7, v8, v9, *(_QWORD *)(a1 + 32));
    v26 = v31;
    v12 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v26;
  }

}

- (AHFPencilPatternLibrary)patternsLibrary
{
  return self->_patternsLibrary;
}

- (void)setPatternsLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_patternsLibrary, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)prevTimestampUs
{
  return self->_prevTimestampUs;
}

- (void)setPrevTimestampUs:(unint64_t)a3
{
  self->_prevTimestampUs = a3;
}

- (HIDEventSystemClient)digitizerStylusClient
{
  return self->_digitizerStylusClient;
}

- (void)setDigitizerStylusClient:(id)a3
{
  objc_storeStrong((id *)&self->_digitizerStylusClient, a3);
}

- (NSMutableIndexSet)availableDigitizerStylus
{
  return self->_availableDigitizerStylus;
}

- (void)setAvailableDigitizerStylus:(id)a3
{
  objc_storeStrong((id *)&self->_availableDigitizerStylus, a3);
}

- (HIDEventSystemClient)opaqueTouchClient
{
  return self->_opaqueTouchClient;
}

- (void)setOpaqueTouchClient:(id)a3
{
  objc_storeStrong((id *)&self->_opaqueTouchClient, a3);
}

- (NSMutableIndexSet)availableOpaqueTouch
{
  return self->_availableOpaqueTouch;
}

- (void)setAvailableOpaqueTouch:(id)a3
{
  objc_storeStrong((id *)&self->_availableOpaqueTouch, a3);
}

- (HIDEventSystemClient)pencilHapticsClient
{
  return self->_pencilHapticsClient;
}

- (void)setPencilHapticsClient:(id)a3
{
  objc_storeStrong((id *)&self->_pencilHapticsClient, a3);
}

- (unsigned)availablePencilHaptics
{
  return self->_availablePencilHaptics;
}

- (void)setAvailablePencilHaptics:(unsigned int)a3
{
  self->_availablePencilHaptics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pencilHapticsClient, 0);
  objc_storeStrong((id *)&self->_availableOpaqueTouch, 0);
  objc_storeStrong((id *)&self->_opaqueTouchClient, 0);
  objc_storeStrong((id *)&self->_availableDigitizerStylus, 0);
  objc_storeStrong((id *)&self->_digitizerStylusClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_patternsLibrary, 0);
}

@end
