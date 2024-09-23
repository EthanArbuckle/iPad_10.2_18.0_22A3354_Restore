@implementation AXEventProcessor

- (AXEventProcessor)initWithHIDTapIdentifier:(id)a3 HIDEventTapPriority:(int)a4 systemEventTapIdentifier:(id)a5 systemEventTapPriority:(int)a6
{
  uint64_t v6;
  uint64_t v8;
  id v10;
  id v11;
  AXEventProcessor *v12;
  AXEventProcessor *v13;
  void *v14;
  void *v15;
  char IsBackboard;
  id v17;
  uint64_t v18;
  NSThread *HIDEventReceiveThread;
  NSThread *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id location;
  objc_super v29;

  v6 = *(_QWORD *)&a6;
  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)AXEventProcessor;
  v12 = -[AXEventProcessor init](&v29, sel_init);
  v13 = v12;
  if (v12)
  {
    -[AXEventProcessor setHIDEventTapIdentifier:](v12, "setHIDEventTapIdentifier:", v10);
    -[AXEventProcessor setHIDEventTapPriority:](v13, "setHIDEventTapPriority:", v8);
    -[AXEventProcessor setHIDEventFilterMask:](v13, "setHIDEventFilterMask:", 1);
    -[AXEventProcessor setSystemEventTapIdentifier:](v13, "setSystemEventTapIdentifier:", v11);
    -[AXEventProcessor setSystemEventTapPriority:](v13, "setSystemEventTapPriority:", v6);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXEventProcessor setHidActualEventTapEnabledReasons:](v13, "setHidActualEventTapEnabledReasons:", v14);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXEventProcessor setSystemActualEventTapEnabledReasons:](v13, "setSystemActualEventTapEnabledReasons:", v15);

    IsBackboard = AXProcessIsBackboard();
    if (v11 && (IsBackboard & 1) == 0)
      _AXAssert();
    if (v10)
    {
      v13->_shouldRunHIDReceiveThreadRunloop = 1;
      objc_initWeak(&location, v13);
      v17 = objc_alloc(MEMORY[0x1E0CB3978]);
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __113__AXEventProcessor_initWithHIDTapIdentifier_HIDEventTapPriority_systemEventTapIdentifier_systemEventTapPriority___block_invoke;
      v26 = &unk_1E24C58C0;
      objc_copyWeak(&v27, &location);
      v18 = objc_msgSend(v17, "initWithBlock:", &v23);
      HIDEventReceiveThread = v13->_HIDEventReceiveThread;
      v13->_HIDEventReceiveThread = (NSThread *)v18;

      v20 = v13->_HIDEventReceiveThread;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-HIDEventReceive-%p"), v10, v13, v23, v24, v25, v26);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSThread setName:](v20, "setName:", v21);

      -[NSThread start](v13->_HIDEventReceiveThread, "start");
      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
  }

  return v13;
}

void __113__AXEventProcessor_initWithHIDTapIdentifier_HIDEventTapPriority_systemEventTapIdentifier_systemEventTapPriority___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_runHIDEventReceiveThread");

}

- (void)setSystemEventTapPriority:(int)a3
{
  self->_systemEventTapPriority = a3;
}

- (void)setSystemEventTapIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_systemEventTapIdentifier, a3);
}

- (void)setSystemActualEventTapEnabledReasons:(id)a3
{
  objc_storeStrong((id *)&self->_systemActualEventTapEnabledReasons, a3);
}

- (void)setHidActualEventTapEnabledReasons:(id)a3
{
  objc_storeStrong((id *)&self->_hidActualEventTapEnabledReasons, a3);
}

- (void)setHIDEventTapPriority:(int)a3
{
  self->_HIDEventTapPriority = a3;
}

- (void)setHIDEventTapIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_HIDEventTapIdentifier, a3);
}

- (void)setHIDEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setHIDEventFilterMask:(unint64_t)a3
{
  self->_HIDEventFilterMask = a3;
}

- (void)_runHIDEventReceiveThread
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = AXSetThreadPriority();
  v4 = (void *)MEMORY[0x18D7864C8](v3);
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DD0], "port");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C99748];
  objc_msgSend(v5, "addPort:forMode:", v6, *MEMORY[0x1E0C99748]);

  do
  {
    v8 = (void *)MEMORY[0x18D7864C8]();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "runMode:beforeDate:", v7, v9);

    objc_autoreleasePoolPop(v8);
  }
  while (self->_shouldRunHIDReceiveThreadRunloop
       && !-[NSThread isCancelled](self->_HIDEventReceiveThread, "isCancelled"));

  objc_autoreleasePoolPop(v4);
}

- (AXEventProcessor)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NotSupported"), CFSTR("Use initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:"));
  return -[AXEventProcessor initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:](self, "initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:", 0, 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_shouldRunHIDReceiveThreadRunloop)
    _AXAssert();
  v3.receiver = self;
  v3.super_class = (Class)AXEventProcessor;
  -[AXEventProcessor dealloc](&v3, sel_dealloc);
}

- (void)cleanup
{
  NSThread *HIDEventReceiveThread;

  if (self->_HIDEventReceiveThread)
  {
    if (self->_shouldRunHIDReceiveThreadRunloop)
    {
      -[AXEventProcessor performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel__uninstallHIDEventFilter);
      self->_shouldRunHIDReceiveThreadRunloop = 0;
      -[NSThread cancel](self->_HIDEventReceiveThread, "cancel");
      HIDEventReceiveThread = self->_HIDEventReceiveThread;
      self->_HIDEventReceiveThread = 0;

    }
  }
}

- (void)beginHandlingHIDEventsForReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AXEventProcessor HIDEventTapIdentifier](self, "HIDEventTapIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AXEventProcessor hidActualEventTapEnabledReasons](self, "hidActualEventTapEnabledReasons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

    if (v7)
    {
      AXLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138412290;
        v10 = v4;
        _os_log_impl(&dword_18C62B000, v8, OS_LOG_TYPE_DEFAULT, "EventProcessor: This reason already exists among reasons for tapping HID events. Unbalanced. %@", (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      -[AXEventProcessor hidActualEventTapEnabledReasons](self, "hidActualEventTapEnabledReasons");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v8, "addObject:", v4);
    }

    if (!-[AXEventProcessor isHandlingHIDEvents](self, "isHandlingHIDEvents"))
    {
      -[AXEventProcessor setHandlingHIDEvents:](self, "setHandlingHIDEvents:", 1);
      -[AXEventProcessor performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel__installHIDEventFilter, self->_HIDEventReceiveThread, 0, 0);
    }
  }
  else
  {
    _AXAssert();
  }

}

- (void)endHandlingHIDEventsForReason:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  _BOOL4 v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AXEventProcessor hidActualEventTapEnabledReasons](self, "hidActualEventTapEnabledReasons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    -[AXEventProcessor hidActualEventTapEnabledReasons](self, "hidActualEventTapEnabledReasons");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObject:](v7, "removeObject:", v4);
  }
  else
  {
    AXLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_18C62B000, v7, OS_LOG_TYPE_DEFAULT, "EventProcessor: This reason does not exist among reasons for tapping HID events. Unbalanced. %@", (uint8_t *)&v10, 0xCu);
    }
  }

  -[AXEventProcessor hidActualEventTapEnabledReasons](self, "hidActualEventTapEnabledReasons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {

  }
  else
  {
    v9 = -[AXEventProcessor isHandlingHIDEvents](self, "isHandlingHIDEvents");

    if (v9)
    {
      -[AXEventProcessor setHandlingHIDEvents:](self, "setHandlingHIDEvents:", 0);
      -[AXEventProcessor performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel__uninstallHIDEventFilter, self->_HIDEventReceiveThread, 0, 0);
    }
  }

}

- (void)raiseHIDEventTapPriorityToMaximum
{
  void *v3;
  _QWORD block[5];

  -[AXEventProcessor HIDEventTapIdentifier](self, "HIDEventTapIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__AXEventProcessor_raiseHIDEventTapPriorityToMaximum__block_invoke;
    block[3] = &unk_1E24C4C38;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __53__AXEventProcessor_raiseHIDEventTapPriorityToMaximum__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[AXEventTapManager sharedManager](AXEventTapManager, "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "HIDEventTapIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEventTapPriority:priority:", v2, 90);

}

- (void)restoreHIDEventTapPriorityToDefault
{
  void *v3;
  _QWORD block[5];

  -[AXEventProcessor HIDEventTapIdentifier](self, "HIDEventTapIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__AXEventProcessor_restoreHIDEventTapPriorityToDefault__block_invoke;
    block[3] = &unk_1E24C4C38;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __55__AXEventProcessor_restoreHIDEventTapPriorityToDefault__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[AXEventTapManager sharedManager](AXEventTapManager, "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "HIDEventTapIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEventTapPriority:priority:", v2, objc_msgSend(*(id *)(a1 + 32), "HIDEventTapPriority"));

}

- (void)beginHandlingSystemEventsForReason:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[AXEventProcessor systemEventTapIdentifier](self, "systemEventTapIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__AXEventProcessor_beginHandlingSystemEventsForReason___block_invoke;
    v6[3] = &unk_1E24C5200;
    v6[4] = self;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
  else
  {
    _AXAssert();
  }

}

uint64_t __55__AXEventProcessor_beginHandlingSystemEventsForReason___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t result;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "systemActualEventTapEnabledReasons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    v7 = CFSTR("This reason already exists among reasons for tapping system events. Unbalanced. Could be trouble, but might be ok. %@");
    v8 = *(_QWORD *)(a1 + 40);
    LOBYTE(v6) = 1;
    _AXLogWithFacility();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "systemActualEventTapEnabledReasons");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));

  }
  result = objc_msgSend(*(id *)(a1 + 32), "isHandlingSystemEvents", v6, v7, v8);
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setHandlingSystemEvents:", 1);
    return objc_msgSend(*(id *)(a1 + 32), "_installSystemEventFilter");
  }
  return result;
}

- (void)endHandlingSystemEventsForReason:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__AXEventProcessor_endHandlingSystemEventsForReason___block_invoke;
  v6[3] = &unk_1E24C5200;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __53__AXEventProcessor_endHandlingSystemEventsForReason___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "systemActualEventTapEnabledReasons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "systemActualEventTapEnabledReasons");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v7 = CFSTR("This reason does not exist among reasons for tapping system events. Unbalanced. %@");
    v8 = *(_QWORD *)(a1 + 40);
    LOBYTE(v6) = 1;
    _AXLogWithFacility();
  }
  objc_msgSend(*(id *)(a1 + 32), "systemActualEventTapEnabledReasons", v6, v7, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {

  }
  else
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "isHandlingSystemEvents");

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "setHandlingSystemEvents:", 0);
      objc_msgSend(*(id *)(a1 + 32), "_uninstallSystemEventFilter");
    }
  }
}

- (void)raiseSystemEventTapPriorityToMaximum
{
  void *v3;
  _QWORD block[5];

  -[AXEventProcessor systemEventTapIdentifier](self, "systemEventTapIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__AXEventProcessor_raiseSystemEventTapPriorityToMaximum__block_invoke;
    block[3] = &unk_1E24C4C38;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __56__AXEventProcessor_raiseSystemEventTapPriorityToMaximum__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[AXEventTapManager sharedManager](AXEventTapManager, "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "systemEventTapIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEventTapPriority:priority:", v2, 90);

}

- (void)restoreSystemEventTapPriorityToDefault
{
  void *v3;
  _QWORD block[5];

  -[AXEventProcessor systemEventTapIdentifier](self, "systemEventTapIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__AXEventProcessor_restoreSystemEventTapPriorityToDefault__block_invoke;
    block[3] = &unk_1E24C4C38;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __58__AXEventProcessor_restoreSystemEventTapPriorityToDefault__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[AXEventTapManager sharedManager](AXEventTapManager, "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "systemEventTapIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEventTapPriority:priority:", v2, objc_msgSend(*(id *)(a1 + 32), "systemEventTapPriority"));

}

- (void)setIgnoreEventsForContinuitySession:(BOOL)a3
{
  uint64_t v3;
  _QWORD block[4];
  BOOL v5;

  v3 = MEMORY[0x1E0C809B0];
  self->_ignoreEventsForContinuitySession = a3;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __56__AXEventProcessor_setIgnoreEventsForContinuitySession___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v5 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __56__AXEventProcessor_setIgnoreEventsForContinuitySession___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 32);
  +[AXEventTapManager sharedManager](AXEventTapManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIgnoreEventsForContinuitySession:", v1);

}

- (void)_installHIDEventFilter
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  _QWORD v21[4];
  id v22;
  id location;

  v3 = -[AXEventProcessor HIDEventFilterMask](self, "HIDEventFilterMask") & 1;
  v4 = (-[AXEventProcessor HIDEventFilterMask](self, "HIDEventFilterMask") >> 1) & 1;
  v5 = (-[AXEventProcessor HIDEventFilterMask](self, "HIDEventFilterMask") >> 2) & 1;
  v6 = (-[AXEventProcessor HIDEventFilterMask](self, "HIDEventFilterMask") >> 3) & 1;
  v20 = -[AXEventProcessor HIDEventFilterMask](self, "HIDEventFilterMask");
  v7 = (-[AXEventProcessor HIDEventFilterMask](self, "HIDEventFilterMask") >> 4) & 1;
  v8 = (-[AXEventProcessor HIDEventFilterMask](self, "HIDEventFilterMask") >> 5) & 1;
  v9 = (-[AXEventProcessor HIDEventFilterMask](self, "HIDEventFilterMask") >> 6) & 1;
  v10 = (-[AXEventProcessor HIDEventFilterMask](self, "HIDEventFilterMask") >> 7) & 1;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setWantsDigitizerEvents:", v3);
  objc_msgSend(v11, "setWantsKeyboardEvents:", v4);
  objc_msgSend(v11, "setWantsATVRemoteEvents:", v5);
  objc_msgSend(v11, "setWantsLisaEvents:", v6);
  objc_msgSend(v11, "setWantsMouseEvents:", v7);
  objc_msgSend(v11, "setWantsAccessibilityEvents:", v8);
  objc_msgSend(v11, "setWantsStylusEvents:", v9);
  objc_msgSend(v11, "setWantsVolumeButtonEvents:", v10);
  objc_initWeak(&location, self);
  +[AXEventTapManager sharedManager](AXEventTapManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __42__AXEventProcessor__installHIDEventFilter__block_invoke;
  v21[3] = &unk_1E24C8F48;
  objc_copyWeak(&v22, &location);
  -[AXEventProcessor HIDEventTapIdentifier](self, "HIDEventTapIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v12, "installEventTap:identifier:type:skipDeviceMatching:filterEvents:matchingServiceHandler:", v21, v13, 1, (v20 >> 8) & 1, v11, 0);

  +[AXEventTapManager sharedManager](AXEventTapManager, "sharedManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXEventProcessor HIDEventTapIdentifier](self, "HIDEventTapIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEventTapPriority:priority:", v16, -[AXEventProcessor HIDEventTapPriority](self, "HIDEventTapPriority"));

  +[AXEventTapManager sharedManager](AXEventTapManager, "sharedManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXEventProcessor HIDEventTapIdentifier](self, "HIDEventTapIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXEventProcessor failedToHandleEventInTime](self, "failedToHandleEventInTime");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFailedToProcessInTimeCallback:callback:", v18, v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void *__42__AXEventProcessor__installHIDEventFilter__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t (**v10)(_QWORD, _QWORD);

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (AXEventTypeIsTouch(objc_msgSend(v3, "type"))
    && (objc_msgSend(v3, "handInfo"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "paths"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", &__block_literal_global_40),
        v6,
        v5,
        v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v9 = 0;
  }
  else
  {
    if (objc_msgSend(WeakRetained, "shouldNotifyUserEventOccurred")
      && objc_msgSend(v3, "type") == 3001
      && CFAbsoluteTimeGetCurrent() - *(double *)&_block_invoke_LastEvent > 3.0)
    {
      objc_msgSend(MEMORY[0x1E0CF3940], "backgroundAccessQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "performAsynchronousReadingBlock:", &__block_literal_global_35_1);

      _block_invoke_LastEvent = CFAbsoluteTimeGetCurrent();
    }
    objc_msgSend(WeakRetained, "HIDEventHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(WeakRetained, "HIDEventHandler");
      v10 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v9 = (void *)((uint64_t (**)(_QWORD, id))v10)[2](v10, v3);

    }
  }

  return v9;
}

BOOL __42__AXEventProcessor__installHIDEventFilter__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pathIndex") > 0x12;
}

void __42__AXEventProcessor__installHIDEventFilter__block_invoke_3()
{
  id v0;

  +[AXUserEventTimer sharedInstance](AXUserEventTimer, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "userEventOccurred");

}

- (void)_uninstallHIDEventFilter
{
  void *v3;
  id v4;

  +[AXEventTapManager sharedManager](AXEventTapManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXEventProcessor HIDEventTapIdentifier](self, "HIDEventTapIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeEventTap:", v3);

}

- (void)_installSystemEventFilter
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  +[AXEventTapManager sharedManager](AXEventTapManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v9, &location);
  -[AXEventProcessor systemEventTapIdentifier](self, "systemEventTapIdentifier", v8, 3221225472, __45__AXEventProcessor__installSystemEventFilter__block_invoke, &unk_1E24C8F48);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "installEventTap:identifier:type:", &v8, v4, 0);

  +[AXEventTapManager sharedManager](AXEventTapManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXEventProcessor systemEventTapIdentifier](self, "systemEventTapIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEventTapPriority:priority:", v7, -[AXEventProcessor systemEventTapPriority](self, "systemEventTapPriority"));

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void *__45__AXEventProcessor__installSystemEventFilter__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t (**v7)(_QWORD, _QWORD);

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "shouldNotifyUserEventOccurred")
    && objc_msgSend(v3, "type") == 3001
    && (objc_msgSend(v3, "isCancel") & 1) == 0
    && CFAbsoluteTimeGetCurrent() - *(double *)&_block_invoke_2_LastEvent > 3.0)
  {
    objc_msgSend(MEMORY[0x1E0CF3940], "backgroundAccessQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performAsynchronousReadingBlock:", &__block_literal_global_38_2);

    _block_invoke_2_LastEvent = CFAbsoluteTimeGetCurrent();
  }
  objc_msgSend(WeakRetained, "systemEventHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(WeakRetained, "systemEventHandler");
    v7 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6 = (void *)((uint64_t (**)(_QWORD, id))v7)[2](v7, v3);

  }
  return v6;
}

void __45__AXEventProcessor__installSystemEventFilter__block_invoke_2()
{
  id v0;

  +[AXUserEventTimer sharedInstance](AXUserEventTimer, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "userEventOccurred");

}

- (void)_uninstallSystemEventFilter
{
  void *v3;
  id v4;

  +[AXEventTapManager sharedManager](AXEventTapManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXEventProcessor systemEventTapIdentifier](self, "systemEventTapIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeEventTap:", v3);

}

- (BOOL)shouldNotifyUserEventOccurred
{
  return self->_shouldNotifyUserEventOccurred;
}

- (void)setShouldNotifyUserEventOccurred:(BOOL)a3
{
  self->_shouldNotifyUserEventOccurred = a3;
}

- (NSString)HIDEventTapIdentifier
{
  return self->_HIDEventTapIdentifier;
}

- (int)HIDEventTapPriority
{
  return self->_HIDEventTapPriority;
}

- (NSThread)HIDEventReceiveThread
{
  return self->_HIDEventReceiveThread;
}

- (void)setHIDEventReceiveThread:(id)a3
{
  objc_storeStrong((id *)&self->_HIDEventReceiveThread, a3);
}

- (BOOL)isHandlingHIDEvents
{
  return self->_handlingHIDEvents;
}

- (void)setHandlingHIDEvents:(BOOL)a3
{
  self->_handlingHIDEvents = a3;
}

- (id)HIDEventHandler
{
  return self->_HIDEventHandler;
}

- (unint64_t)HIDEventFilterMask
{
  return self->_HIDEventFilterMask;
}

- (id)failedToHandleEventInTime
{
  return self->_failedToHandleEventInTime;
}

- (void)setFailedToHandleEventInTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)systemEventTapIdentifier
{
  return self->_systemEventTapIdentifier;
}

- (int)systemEventTapPriority
{
  return self->_systemEventTapPriority;
}

- (id)systemEventHandler
{
  return self->_systemEventHandler;
}

- (void)setSystemEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)ignoreAllSystemEvents
{
  return self->_ignoreAllSystemEvents;
}

- (void)setIgnoreAllSystemEvents:(BOOL)a3
{
  self->_ignoreAllSystemEvents = a3;
}

- (BOOL)ignoreEventsForContinuitySession
{
  return self->_ignoreEventsForContinuitySession;
}

- (NSMutableArray)hidActualEventTapEnabledReasons
{
  return self->_hidActualEventTapEnabledReasons;
}

- (BOOL)isHandlingSystemEvents
{
  return self->_handlingSystemEvents;
}

- (void)setHandlingSystemEvents:(BOOL)a3
{
  self->_handlingSystemEvents = a3;
}

- (NSMutableArray)systemActualEventTapEnabledReasons
{
  return self->_systemActualEventTapEnabledReasons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemActualEventTapEnabledReasons, 0);
  objc_storeStrong((id *)&self->_hidActualEventTapEnabledReasons, 0);
  objc_storeStrong(&self->_systemEventHandler, 0);
  objc_storeStrong((id *)&self->_systemEventTapIdentifier, 0);
  objc_storeStrong(&self->_failedToHandleEventInTime, 0);
  objc_storeStrong(&self->_HIDEventHandler, 0);
  objc_storeStrong((id *)&self->_HIDEventReceiveThread, 0);
  objc_storeStrong((id *)&self->_HIDEventTapIdentifier, 0);
}

@end
