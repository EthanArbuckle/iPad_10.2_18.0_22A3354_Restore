@implementation BuddySystemTimeUpdateManager

- (void)updateSystemTime
{
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  void *v5;
  void **v6;
  int v7;
  int v8;
  void (*v9)(NSObject *, uint64_t);
  void *v10;
  BuddySystemTimeUpdateManager *v11;
  uint8_t buf[7];
  os_log_type_t v13;
  id location[2];
  BuddySystemTimeUpdateManager *v15;

  v15 = self;
  location[1] = (id)a2;
  if (!self->_status)
  {
    v15->_status = 1;
    location[0] = (id)_BYLoggingFacility(self);
    v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      v2 = location[0];
      v3 = v13;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "SetupAssistant Updating Time Now!", buf, 2u);
    }
    objc_storeStrong(location, 0);
    v4 = &_dispatch_main_q;
    v6 = _NSConcreteStackBlock;
    v7 = -1073741824;
    v8 = 0;
    v9 = sub_1001356C4;
    v10 = &unk_100283430;
    v11 = v15;
    TMSetupTime(v4, &v6, 60.0);

    v5 = &_dispatch_main_q;
    TMSetupTimeZone(v5, &stru_100283470, 60.0);

    objc_storeStrong((id *)&v11, 0);
  }
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

@end
