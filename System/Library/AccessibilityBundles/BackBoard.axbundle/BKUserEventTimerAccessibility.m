@implementation BKUserEventTimerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BKUserEventTimer");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUserEventTimer"), CFSTR("resetTimer: mode:"), "v", "d", "i", 0);
}

- (void)_axSetDesiredTimeout:(double)a3
{
  _DesiredTimeout = *(_QWORD *)&a3;
}

- (double)_axDesiredTimeout
{
  return *(double *)&_DesiredTimeout;
}

- (void)_axSetDesiredMode:(int)a3
{
  _DesiredMode = a3;
}

- (int)_axDesiredMode
{
  return _DesiredMode;
}

- (BOOL)_axIsTimerDisabled
{
  return _IsTimerDisabled;
}

- (void)_axSetTimerDisabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void (**v6)(_QWORD);
  void *v7;
  NSObject *v8;
  double v9;
  NSObject *v10;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  if (-[BKUserEventTimerAccessibility _axIsTimerDisabled](self, "_axIsTimerDisabled") != a3)
  {
    AXLogBackboardServer();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v3;
      _os_log_impl(&dword_232455000, v5, OS_LOG_TYPE_DEFAULT, "setting idle timer disabled: %d", buf, 8u);
    }

    if (v3)
    {
      *(_QWORD *)buf = 0;
      v17 = buf;
      v18 = 0x2020000000;
      v19 = 0;
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __53__BKUserEventTimerAccessibility__axSetTimerDisabled___block_invoke;
      v11[3] = &unk_250188830;
      v11[4] = self;
      v11[5] = buf;
      v11[6] = &v12;
      v6 = (void (**)(_QWORD))MEMORY[0x23490859C](v11);
      -[BKUserEventTimerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_queue"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsProtocol();
      v8 = objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        dispatch_sync(v8, v6);
      }
      else
      {
        AXLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          -[BKUserEventTimerAccessibility _axSetTimerDisabled:].cold.1(v10);

        v6[2](v6);
      }
      -[BKUserEventTimerAccessibility _axSetDesiredTimeout:](self, "_axSetDesiredTimeout:", *((double *)v17 + 3));
      -[BKUserEventTimerAccessibility _axSetDesiredMode:](self, "_axSetDesiredMode:", *((unsigned int *)v13 + 6));
      -[BKUserEventTimerAccessibility resetTimer:mode:](self, "resetTimer:mode:", 0, -1.0);
      _IsTimerDisabled = v3;

      _Block_object_dispose(&v12, 8);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      _IsTimerDisabled = 0;
      -[BKUserEventTimerAccessibility _axDesiredTimeout](self, "_axDesiredTimeout");
      -[BKUserEventTimerAccessibility resetTimer:mode:](self, "resetTimer:mode:", -[BKUserEventTimerAccessibility _axDesiredMode](self, "_axDesiredMode"), v9);
    }
  }
}

void __53__BKUserEventTimerAccessibility__axSetTimerDisabled___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_currentTimeout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_currentMode"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "intValue");

}

- (void)resetTimer:(double)a3 mode:(int)a4
{
  uint64_t v4;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  double v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v4 = *(_QWORD *)&a4;
  v13 = *MEMORY[0x24BDAC8D0];
  if (-[BKUserEventTimerAccessibility _axIsTimerDisabled](self, "_axIsTimerDisabled"))
  {
    AXLogBackboardServer();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v10 = a3;
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_232455000, v7, OS_LOG_TYPE_DEFAULT, "Someone asked to reset idle timer but it is disabled by accessibility. timeout: %f mode: %d", buf, 0x12u);
    }

    -[BKUserEventTimerAccessibility _axSetDesiredTimeout:](self, "_axSetDesiredTimeout:", a3);
    -[BKUserEventTimerAccessibility _axSetDesiredMode:](self, "_axSetDesiredMode:", v4);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BKUserEventTimerAccessibility;
    -[BKUserEventTimerAccessibility resetTimer:mode:](&v8, sel_resetTimer_mode_, v4, a3);
  }
}

- (void)_axSetTimerDisabled:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_232455000, log, OS_LOG_TYPE_FAULT, "Couldn't get the internal queue for BKUserEventTimer. This can lead to us accidentally making the timer get stuck off.", v1, 2u);
}

@end
