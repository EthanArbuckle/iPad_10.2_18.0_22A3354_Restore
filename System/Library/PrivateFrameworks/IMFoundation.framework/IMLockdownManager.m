@implementation IMLockdownManager

- (IMLockdownManager)init
{
  IMLockdownManager *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMLockdownManager;
  v2 = -[IMLockdownManager init](&v5, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1906A0FB0, (CFStringRef)*MEMORY[0x1E0DE6C28], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (BOOL)isNonUIInstall
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend__calculateInstallType(self, a2, v2, v3);
  return self->_isNonUIInstall;
}

- (BOOL)isInternalInstall
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend__calculateInstallType(self, a2, v2, v3);
  return self->_isInternalInstall;
}

- (void)_calculateInstallType
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19066F278;
  block[3] = &unk_1E2C44580;
  block[4] = self;
  if (qword_1ECD90FF8 != -1)
    dispatch_once(&qword_1ECD90FF8, block);
}

+ (id)sharedInstance
{
  if (qword_1ECD91028 != -1)
    dispatch_once(&qword_1ECD91028, &unk_1E2C42E48);
  return (id)qword_1ECD90FD8;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)IMLockdownManager;
  -[IMLockdownManager dealloc](&v4, sel_dealloc);
}

- (void)_resetActivationState
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  id v5;

  self->_state = 0;
  self->_hasShownMismatchedSIM = 0;
  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2, v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend___mainThreadPostNotificationName_object_(v5, v4, (uint64_t)CFSTR("__kIMLockdownDeviceActivatedChangedNotification"), 0);

}

- (unint64_t)_state
{
  return self->_state;
}

- (void)_setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void)_checkMobileActivation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CFTypeID v22;
  unint64_t v23;
  char v24;
  id v25;

  if (qword_1EE1DD4C0 != -1)
    dispatch_once(&qword_1EE1DD4C0, &unk_1E2C45C10);
  if (off_1EE1DD4B8)
  {
    v25 = 0;
    off_1EE1DD4B8(&v25);
    v9 = (const void *)objc_claimAutoreleasedReturnValue();
    v10 = v25;
    objc_msgSend_registration(IMRGLog, v11, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (v15)
        sub_1906B70FC((uint64_t)v10, v14, v16, v17, v18, v19, v20, v21);
    }
    else if (v15)
    {
      sub_1906B7094((uint64_t)v9, v14, v16, v17, v18, v19, v20, v21);
    }

    if (v9)
    {
      v22 = CFGetTypeID(v9);
      if (v22 == CFStringGetTypeID())
      {
        if (CFEqual(v9, CFSTR("Unactivated")))
        {
          v23 = 1;
        }
        else if (CFEqual(v9, CFSTR("Expired")))
        {
          v23 = 2;
        }
        else if (CFEqual(v9, CFSTR("Activated"))
               || CFEqual(v9, CFSTR("WildcardActivated"))
               || CFEqual(v9, CFSTR("Unlocked"))
               || CFEqual(v9, CFSTR("SoftActivation")))
        {
          v23 = 3;
        }
        else if (CFEqual(v9, CFSTR("MismatchedIMEI")))
        {
          v23 = 4;
        }
        else if (CFEqual(v9, CFSTR("MismatchedICCID")))
        {
          v23 = 5;
        }
        else if (CFEqual(v9, CFSTR("MissingSIM")))
        {
          v23 = 6;
        }
        else
        {
          v23 = 7;
        }
        self->_state = v23;
      }
      CFRelease(v9);
    }

  }
  else
  {
    _IMWarn(CFSTR("Failed to weak link to MAEGetActivationStateWithError."), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v24);
    self->_state = 7;
    self->_settingUpActivationState = 0;
  }
}

- (void)_checkLockdown
{
  const void *v3;
  const void *v4;
  CFTypeID v5;
  unint64_t v6;

  v3 = (const void *)lockdown_copy_activationState();
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFStringGetTypeID())
    {
      if (CFEqual(v4, CFSTR("Unactivated")))
      {
        v6 = 1;
      }
      else if (CFEqual(v4, CFSTR("Expired")))
      {
        v6 = 2;
      }
      else if (CFEqual(v4, CFSTR("Activated"))
             || CFEqual(v4, CFSTR("WildcardActivated"))
             || CFEqual(v4, CFSTR("Unlocked"))
             || CFEqual(v4, CFSTR("SoftActivation")))
      {
        v6 = 3;
      }
      else if (CFEqual(v4, CFSTR("MismatchedIMEI")))
      {
        v6 = 4;
      }
      else if (CFEqual(v4, CFSTR("MismatchedICCID")))
      {
        v6 = 5;
      }
      else if (CFEqual(v4, CFSTR("MissingSIM")))
      {
        v6 = 6;
      }
      else
      {
        v6 = 7;
      }
      self->_state = v6;
    }
    CFRelease(v4);
  }
}

- (void)_setupActivationState
{
  uint64_t v2;
  uint64_t v3;

  if (!self->_settingUpActivationState)
  {
    self->_settingUpActivationState = 1;
    objc_msgSend__checkMobileActivation(self, a2, v2, v3);
    self->_settingUpActivationState = 0;
  }
}

- (BOOL)isVendorInstall
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend__calculateInstallType(self, a2, v2, v3);
  return self->_isVendorInstall;
}

- (int64_t)lockdownState
{
  uint64_t v2;
  uint64_t v3;
  int64_t result;

  result = self->_state;
  if (!result)
  {
    objc_msgSend__setupActivationState(self, a2, v2, v3);
    return self->_state;
  }
  return result;
}

- (BOOL)isCarrierInstall
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend__calculateInstallType(self, a2, v2, v3);
  return self->_isCarrierInstall;
}

- (BOOL)isActivated
{
  uint64_t v2;
  uint64_t v3;

  return (unint64_t)objc_msgSend_lockdownState(self, a2, v2, v3) > 2;
}

- (BOOL)isExpired
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_lockdownState(self, a2, v2, v3) == 2;
}

- (NSString)uniqueDeviceIdentifier
{
  return 0;
}

- (id)description
{
  uint64_t v2;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("[IMLockdown state: %lu]"), v2, self->_state);
}

- (BOOL)_settingUpActivationState
{
  return self->_settingUpActivationState;
}

- (void)set_settingUpActivationState:(BOOL)a3
{
  self->_settingUpActivationState = a3;
}

- (BOOL)_isInternalInstall
{
  return self->_isInternalInstall;
}

- (void)set_isInternalInstall:(BOOL)a3
{
  self->_isInternalInstall = a3;
}

- (BOOL)_isCarrierInstall
{
  return self->_isCarrierInstall;
}

- (void)set_isCarrierInstall:(BOOL)a3
{
  self->_isCarrierInstall = a3;
}

- (BOOL)_isNonUIInstall
{
  return self->_isNonUIInstall;
}

- (void)set_isNonUIInstall:(BOOL)a3
{
  self->_isNonUIInstall = a3;
}

- (BOOL)_isVendorInstall
{
  return self->_isVendorInstall;
}

- (void)set_isVendorInstall:(BOOL)a3
{
  self->_isVendorInstall = a3;
}

- (BOOL)_hasShownMismatchedSIM
{
  return self->_hasShownMismatchedSIM;
}

- (void)set_hasShownMismatchedSIM:(BOOL)a3
{
  self->_hasShownMismatchedSIM = a3;
}

- (BOOL)_hasShownWaitingAlertThisSession
{
  return self->_hasShownWaitingAlertThisSession;
}

- (void)set_hasShownWaitingAlertThisSession:(BOOL)a3
{
  self->_hasShownWaitingAlertThisSession = a3;
}

@end
