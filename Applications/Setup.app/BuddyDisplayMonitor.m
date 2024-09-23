@implementation BuddyDisplayMonitor

- (BuddyDisplayMonitor)init
{
  id v2;
  BuddyDisplayMonitor *v3;
  objc_super v5;
  SEL v6;
  id location;

  v6 = a2;
  location = 0;
  v5.receiver = self;
  v5.super_class = (Class)BuddyDisplayMonitor;
  location = -[BuddyDisplayMonitor init](&v5, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = +[BLSBacklight sharedBacklight](BLSBacklight, "sharedBacklight");
    objc_msgSend(v2, "addObserver:", location);

  }
  v3 = (BuddyDisplayMonitor *)location;
  objc_storeStrong(&location, 0);
  return v3;
}

- (void)dealloc
{
  id v2;
  objc_super v3;
  SEL v4;
  BuddyDisplayMonitor *v5;

  v5 = self;
  v4 = a2;
  v2 = +[BLSBacklight sharedBacklight](BLSBacklight, "sharedBacklight");
  objc_msgSend(v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)BuddyDisplayMonitor;
  -[BuddyDisplayMonitor dealloc](&v3, "dealloc");
}

- (void)wakeDisplay:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  id v9;
  uint64_t v10;
  os_log_t v11;
  id v12;
  id v13;
  id v14;
  uint8_t buf[15];
  os_log_type_t v16;
  os_log_t oslog;
  id location[2];
  BuddyDisplayMonitor *v19;
  uint8_t v20[24];

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  v4 = +[BLSBacklight sharedBacklight](BLSBacklight, "sharedBacklight");
  v5 = objc_msgSend(v4, "backlightState");

  if (v5 == (id)2)
  {
    if (location[0])
      (*((void (**)(void))location[0] + 2))();
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v6);
    v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = oslog;
      v8 = v16;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Waking the screen...", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    -[BuddyDisplayMonitor setCompletionBlock:](v19, "setCompletionBlock:", location[0]);
    v14 = CFSTR("post-migration/restore wake for reboot");
    v13 = objc_msgSend(objc_alloc((Class)BLSBacklightChangeRequest), "initWithRequestedActivityState:explanation:timestamp:sourceEvent:sourceEventMetadata:", 1, v14, mach_continuous_time(), 10, 0);
    v9 = +[BLSBacklight sharedBacklight](BLSBacklight, "sharedBacklight");
    v12 = objc_msgSend(v9, "performChangeRequest:", v13);

    if (v12)
    {
      v11 = (os_log_t)(id)_BYLoggingFacility(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        sub_100039500((uint64_t)v20, (uint64_t)v12);
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to wake the screen: %{public}@", v20, 0xCu);
      }
      objc_storeStrong((id *)&v11, 0);
      if (location[0])
        (*((void (**)(void))location[0] + 2))();
    }
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  id v9;
  int64_t v10;
  id location[2];
  BuddyDisplayMonitor *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = a4;
  v9 = 0;
  objc_storeStrong(&v9, a5);
  v7 = -[BuddyDisplayMonitor completionBlock](v12, "completionBlock");
  LOBYTE(a5) = v7 == 0;

  if ((a5 & 1) == 0 && v10 == 2)
  {
    v8 = (void (**)(_QWORD))-[BuddyDisplayMonitor completionBlock](v12, "completionBlock");
    v8[2](v8);

    -[BuddyDisplayMonitor setCompletionBlock:](v12, "setCompletionBlock:", 0);
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
