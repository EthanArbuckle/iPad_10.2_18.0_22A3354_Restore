@implementation ACCSettingsState

- (ACCSettingsState)initWithKey:(id)a3 applicationID:(id)a4 notification:(id)a5 defaultValue:(int64_t)a6 invalidValue:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  ACCSettingsState *v16;
  ACCSettingsState *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ACCSettingsState;
  v16 = -[ACCSettingsState init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_key, a3);
    objc_storeStrong((id *)&v17->_applicationID, a4);
    objc_storeStrong((id *)&v17->_notificationName, a5);
    v17->_defaultValue = a6;
    v17->_invalidValue = a7;
    -[ACCSettingsState _readLoggingPrefs](v17, "_readLoggingPrefs");
    -[ACCSettingsState _registerForLoggingPrefsNotification](v17, "_registerForLoggingPrefsNotification");
  }

  return v17;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)self->_notificationName, 0);
  v4.receiver = self;
  v4.super_class = (Class)ACCSettingsState;
  -[ACCSettingsState dealloc](&v4, sel_dealloc);
}

- (id)description
{
  const __CFString *v2;

  if (self->_BOOLValue)
    v2 = CFSTR("true");
  else
    v2 = CFSTR("false");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<ACCSettingsState>[%@:%@ = %ld (= %@), default = %ld, invalid = %ld]"), self->_applicationID, self->_key, self->_intValue, v2, self->_defaultValue, self->_invalidValue);
}

- (void)_readLoggingPrefs
{
  CFIndex AppIntegerValue;
  int64_t intValue;
  int v5;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue((CFStringRef)self->_key, (CFStringRef)self->_applicationID, &keyExistsAndHasValidFormat);
  intValue = self->_intValue;
  v5 = keyExistsAndHasValidFormat;
  if (!keyExistsAndHasValidFormat || AppIntegerValue == self->_invalidValue)
    AppIntegerValue = self->_defaultValue;
  self->_intValue = AppIntegerValue;
  self->_BOOLValue = AppIntegerValue != 0;
  self->_exists = v5 != 0;
  if (intValue != AppIntegerValue)
    NSLog(CFSTR("Read preferences, key=%@, %ld -> %ld"), self->_key, intValue, AppIntegerValue);
}

- (void)_registerForLoggingPrefsNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)__receivedNotification, (CFStringRef)self->_notificationName, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (int64_t)defaultValue
{
  return self->_defaultValue;
}

- (int64_t)invalidValue
{
  return self->_invalidValue;
}

- (int64_t)intValue
{
  return self->_intValue;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (BOOL)exists
{
  return self->_exists;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationName, 0);
  objc_storeStrong((id *)&self->_applicationID, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
