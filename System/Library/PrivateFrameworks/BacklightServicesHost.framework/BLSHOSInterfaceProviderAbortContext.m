@implementation BLSHOSInterfaceProviderAbortContext

- (BLSHOSInterfaceProviderAbortContext)initWithWatchdogType:(unint64_t)a3 cbDisplayMode:(int64_t)a4 cbFlipbookState:(int64_t)a5 caDisplayState:(int64_t)a6 completedCADisplayState:(int64_t)a7 suppressionServiceActive:(BOOL)a8 flipbookTransparent:(BOOL)a9 deviceSupportsAlwaysOn:(BOOL)a10 deviceSupportsAlwaysOnFlipbook:(BOOL)a11 kernelSpecialMode:(BOOL)a12 displayStateClientSupported:(BOOL)a13 backlightDimmedFactor:(float)a14
{
  BLSHOSInterfaceProviderAbortContext *result;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)BLSHOSInterfaceProviderAbortContext;
  result = -[BLSHOSInterfaceProviderAbortContext init](&v22, sel_init);
  if (result)
  {
    result->_watchdogType = a3;
    result->_cbDisplayMode = a4;
    result->_cbFlipbookState = a5;
    result->_caDisplayState = a6;
    result->_completedCADisplayState = a7;
    result->_suppressionServiceActive = a8;
    result->_flipbookTransparent = a9;
    result->_deviceSupportsAlwaysOn = a10;
    result->_deviceSupportsAlwaysOnFlipbook = a11;
    result->_kernelSpecialMode = a12;
    result->_displayStateClientSupported = a13;
    result->_backlightDimmedFactor = a14;
    if (a3 <= 2)
      result->_abortReason = qword_21462C198[a3];
  }
  return result;
}

- (NSString)abortReasonString
{
  unint64_t v2;

  v2 = self->_abortReason - 11;
  if (v2 > 0xA)
    return (NSString *)CFSTR("OSIP_UNKNOWN");
  else
    return &off_24D1BBEE0[v2]->isa;
}

- (BOOL)wantsPanic
{
  unint64_t abortReason;
  void *v4;
  int v5;
  NSObject *v6;
  unint64_t v7;
  void *v8;
  const char *v9;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  const __CFString *v18;
  uint64_t v19;
  uint8_t buf[4];
  unint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  abortReason = self->_abortReason;
  if (abortReason > 0x15)
    goto LABEL_16;
  if (((1 << abortReason) & 0x205000) != 0)
  {
    bls_diagnostics_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_abortReason;
      -[BLSHOSInterfaceProviderAbortContext abortReasonString](self, "abortReasonString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v21 = v10;
      v22 = 2114;
      v23 = v8;
      v9 = "_abortReason=%llu (%{public}@) wantsPanic:YES";
      goto LABEL_9;
    }
LABEL_10:
    LOBYTE(v5) = 1;
LABEL_19:

    return v5;
  }
  if (((1 << abortReason) & 0x2800) == 0)
  {
    if (abortReason == 20)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.BacklightServices"));
      v18 = CFSTR("panicOnCoreAnimationWatchdog");
      v19 = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject registerDefaults:](v6, "registerDefaults:", v11);

      if (-[NSObject BOOLForKey:](v6, "BOOLForKey:", CFSTR("panicOnCoreAnimationWatchdog")))
      {
        bls_diagnostics_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = self->_abortReason;
          -[BLSHOSInterfaceProviderAbortContext abortReasonString](self, "abortReasonString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v21 = v13;
          v22 = 2114;
          v23 = v14;
          _os_log_impl(&dword_2145AC000, v12, OS_LOG_TYPE_DEFAULT, "_abortReason=%llu (%{public}@) com.apple.BacklightServices panicOnCoreAnimationWatchdog:YES wantsPanic:YES", buf, 0x16u);

        }
        goto LABEL_10;
      }
LABEL_18:
      LOBYTE(v5) = 0;
      goto LABEL_19;
    }
LABEL_16:
    bls_diagnostics_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v15 = self->_abortReason;
      -[BLSHOSInterfaceProviderAbortContext abortReasonString](self, "abortReasonString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v21 = v15;
      v22 = 2114;
      v23 = v16;
      _os_log_impl(&dword_2145AC000, v6, OS_LOG_TYPE_DEFAULT, "_abortReason=%llu (%{public}@) wantsPanic:NO", buf, 0x16u);

    }
    goto LABEL_18;
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.BacklightServices"));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("panicOnCoreBrightnessWatchdog"));

  if (v5)
  {
    bls_diagnostics_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = self->_abortReason;
      -[BLSHOSInterfaceProviderAbortContext abortReasonString](self, "abortReasonString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v21 = v7;
      v22 = 2114;
      v23 = v8;
      v9 = "_abortReason=%llu (%{public}@) com.apple.BacklightServices panicOnCoreBrightnessWatchdog:YES wantsPanic:YES";
LABEL_9:
      _os_log_impl(&dword_2145AC000, v6, OS_LOG_TYPE_DEFAULT, v9, buf, 0x16u);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  return v5;
}

- (BOOL)wantsWaitPastFireForCompletionAndTailspin
{
  return ((self->_abortReason - 11) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (void)setSleepImminentAbortReason
{
  unint64_t abortReason;
  unint64_t v3;

  abortReason = self->_abortReason;
  switch(abortReason)
  {
    case 0xBuLL:
      v3 = 12;
      break;
    case 0x14uLL:
      v3 = 21;
      break;
    case 0xDuLL:
      v3 = 14;
      break;
    default:
      return;
  }
  self->_abortReason = v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  unint64_t watchdogType;
  const __CFString *v6;
  void *v7;
  void *v8;
  int64_t caDisplayState;
  int64_t completedCADisplayState;
  void *v11;
  const __CFString *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  watchdogType = self->_watchdogType;
  if (watchdogType > 2)
    v6 = CFSTR("unknown");
  else
    v6 = off_24D1BBF38[watchdogType];
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("watchdogType"));
  NSStringFromCBDisplayMode_bls(self->_cbDisplayMode);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v7, CFSTR("cbDisplayMode"));

  NSStringFromCBFlipbookState_bls(self->_cbFlipbookState);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v8, CFSTR("cbFlipbookState"));

  caDisplayState = self->_caDisplayState;
  completedCADisplayState = self->_completedCADisplayState;
  NSStringFromCADisplayState();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (caDisplayState == completedCADisplayState)
  {
    v12 = CFSTR("caDisplayState");
  }
  else
  {
    objc_msgSend(v4, "appendString:withName:", v11, CFSTR("pendingCADisplayState"));

    NSStringFromCADisplayState();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("completedCADisplayState");
  }
  objc_msgSend(v4, "appendString:withName:", v11, v12);

  v13 = (id)objc_msgSend(v4, "appendBool:withName:", self->_suppressionServiceActive, CFSTR("suppressionServiceActive"));
  v14 = (id)objc_msgSend(v4, "appendBool:withName:", self->_flipbookTransparent, CFSTR("flipbookTransparent"));
  v15 = (id)objc_msgSend(v4, "appendBool:withName:", self->_deviceSupportsAlwaysOn, CFSTR("supportsAlwaysOn"));
  v16 = (id)objc_msgSend(v4, "appendBool:withName:", self->_deviceSupportsAlwaysOnFlipbook, CFSTR("supportsFlipbook"));
  v17 = (id)objc_msgSend(v4, "appendBool:withName:", self->_kernelSpecialMode, CFSTR("kernelSpecialMode"));
  v18 = (id)objc_msgSend(v4, "appendBool:withName:", self->_displayStateClientSupported, CFSTR("displayStateClientSupported"));
  v19 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("backlightDimmedFactor"), self->_backlightDimmedFactor);
  objc_msgSend(v4, "build");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v20;
}

- (unint64_t)abortReason
{
  return self->_abortReason;
}

@end
