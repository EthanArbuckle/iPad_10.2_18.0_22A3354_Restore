@implementation BuddyActivationRecord

+ (id)_currentActivationRecordDictionary
{
  id v2;
  id v3;
  id v4;
  id obj;
  id location;
  id v8[3];

  v8[2] = a1;
  v8[1] = (id)a2;
  v8[0] = 0;
  location = 0;
  obj = 0;
  v2 = (id)MAECopyActivationRecordWithError(&obj);
  objc_storeStrong(&location, obj);
  v3 = v8[0];
  v8[0] = v2;

  v4 = v8[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v8, 0);
  return v4;
}

- (BuddyActivationRecord)init
{
  id v3;
  BuddyActivationRecord *v4;
  id location;

  v3 = +[BuddyActivationRecord _currentActivationRecordDictionary](BuddyActivationRecord, "_currentActivationRecordDictionary", a2, self);
  location = -[BuddyActivationRecord initWithActivationRecordDictionary:](self, "initWithActivationRecordDictionary:", v3);
  v4 = (BuddyActivationRecord *)location;

  objc_storeStrong(&location, 0);
  return v4;
}

- (BuddyActivationRecord)initWithActivationRecordDictionary:(id)a3
{
  id v3;
  BuddyActivationRecord *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  BuddyActivationRecord *v10;
  os_log_t oslog;
  id v13;
  objc_super v14;
  id location[2];
  id v16;
  uint8_t buf[24];

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v16;
  v16 = 0;
  v14.receiver = v3;
  v14.super_class = (Class)BuddyActivationRecord;
  v4 = -[BuddyActivationRecord init](&v14, "init");
  v16 = v4;
  objc_storeStrong(&v16, v4);
  if (v4)
  {
    *((_QWORD *)v16 + 1) = 0;
    v13 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("DeviceConfigurationFlags"));
    oslog = (os_log_t)(id)_BYLoggingFacility(v13);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100038C28((uint64_t)buf, (uint64_t)v13);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Buddy Activate: Device Configuration Flags = %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v5 = v13;
    v6 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0
      || (v7 = v13, v8 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v7, v8) & 1) != 0))
    {
      v9 = objc_msgSend(v13, "integerValue");
      *((_QWORD *)v16 + 1) = v9;
    }
    objc_storeStrong(&v13, 0);
  }
  v10 = (BuddyActivationRecord *)v16;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v16, 0);
  return v10;
}

- (BOOL)impliesDemod
{
  NSObject *v2;
  os_log_type_t v3;
  _WORD v5[7];
  os_log_type_t v6;
  os_log_t oslog;
  int v8;
  BOOL v9;
  SEL v10;
  BuddyActivationRecord *v11;

  v11 = self;
  v10 = a2;
  v9 = 0;
  v8 = 6;
  if ((self->_configurationFlags & 6) != 0)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(self);
    v6 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v2 = oslog;
      v3 = v6;
      sub_100038C3C(v5);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Buddy Activate: Configuration flags specify demo mode", (uint8_t *)v5, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    return 1;
  }
  return v9;
}

- (BOOL)impliesEarlyExit
{
  if ((self->_configurationFlags & 4) != 0 && (self->_configurationFlags & 1) != 0)
    return 0;
  else
    return -[BuddyActivationRecord impliesDemod](self, "impliesDemod");
}

@end
