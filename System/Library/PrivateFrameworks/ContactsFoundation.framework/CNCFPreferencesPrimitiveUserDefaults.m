@implementation CNCFPreferencesPrimitiveUserDefaults

- (id)primitiveObjectForKey:(id)a3
{
  __CFString *v4;
  void *v5;

  v4 = (__CFString *)a3;
  v5 = (void *)CFPreferencesCopyAppValue(v4, -[CNCFPreferencesPrimitiveUserDefaults CFApplicationID](self, "CFApplicationID"));

  return v5;
}

- (BOOL)primitiveBoolValueForKey:(id)a3 keyExists:(BOOL *)a4
{
  __CFString *v6;

  v6 = (__CFString *)a3;
  LODWORD(a4) = CFPreferencesGetAppBooleanValue(v6, -[CNCFPreferencesPrimitiveUserDefaults CFApplicationID](self, "CFApplicationID"), (Boolean *)a4);

  return (_DWORD)a4 != 0;
}

- (__CFString)CFApplicationID
{
  if (self->_applicationID)
    return (__CFString *)self->_applicationID;
  else
    return (__CFString *)*MEMORY[0x1E0C9B248];
}

- (int64_t)primitiveIntegerValueForKey:(id)a3 keyExists:(BOOL *)a4
{
  __CFString *v6;
  CFIndex AppIntegerValue;

  v6 = (__CFString *)a3;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(v6, -[CNCFPreferencesPrimitiveUserDefaults CFApplicationID](self, "CFApplicationID"), (Boolean *)a4);

  return AppIntegerValue;
}

- (CNCFPreferencesPrimitiveUserDefaults)initWithApplicationID:(id)a3
{
  id v4;
  CNCFPreferencesPrimitiveUserDefaults *v5;
  uint64_t v6;
  NSString *applicationID;
  CNCFPreferencesPrimitiveUserDefaults *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNCFPreferencesPrimitiveUserDefaults;
  v5 = -[CNCFPreferencesPrimitiveUserDefaults init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    applicationID = v5->_applicationID;
    v5->_applicationID = (NSString *)v6;

    v5->_autosyncTimerIsActive = 0;
    v8 = v5;
  }

  return v5;
}

- (void)setPrimitiveObject:(id)a3 forKey:(id)a4
{
  __CFString *v6;
  id value;

  v6 = (__CFString *)a4;
  value = a3;
  CFPreferencesSetAppValue(v6, value, -[CNCFPreferencesPrimitiveUserDefaults CFApplicationID](self, "CFApplicationID"));

}

- (void)primitiveRemoveObjectForKey:(id)a3
{
  __CFString *key;

  key = (__CFString *)a3;
  CFPreferencesSetAppValue(key, 0, -[CNCFPreferencesPrimitiveUserDefaults CFApplicationID](self, "CFApplicationID"));

}

- (BOOL)synchronize
{
  return CFPreferencesAppSynchronize(-[CNCFPreferencesPrimitiveUserDefaults CFApplicationID](self, "CFApplicationID")) != 0;
}

- (void)setupAutosync
{
  int64_t *p_autosyncTimerIsActive;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD block[5];

  p_autosyncTimerIsActive = &self->_autosyncTimerIsActive;
  while (!__ldaxr((unint64_t *)p_autosyncTimerIsActive))
  {
    if (!__stlxr(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)p_autosyncTimerIsActive))
    {
      v5 = dispatch_time(0, 15000000000);
      dispatch_get_global_queue(0, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__CNCFPreferencesPrimitiveUserDefaults_setupAutosync__block_invoke;
      block[3] = &unk_1E29B9358;
      block[4] = self;
      dispatch_after(v5, v6, block);

      return;
    }
  }
  __clrex();
}

uint64_t __53__CNCFPreferencesPrimitiveUserDefaults_setupAutosync__block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "synchronize");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationID, 0);
}

@end
