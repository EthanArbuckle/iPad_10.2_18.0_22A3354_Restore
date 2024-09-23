@implementation NFHWMonitor

- (NFHWMonitor)init
{
  NFHWMonitor *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NFHWMonitor;
  v2 = -[NFHWMonitor init](&v4, sel_init);
  if (v2)
    v2->sem = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->sem);
  v3.receiver = self;
  v3.super_class = (Class)NFHWMonitor;
  -[NFHWMonitor dealloc](&v3, sel_dealloc);
}

- (void)hardwareStateDidChange
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  debuglog("-[NFHWMonitor hardwareStateDidChange]", CFSTR("hardwareStateDidChange"), v2, v3, v4, v5, v6, v7, v9);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->sem);
}

- (int64_t)waitForNotificationOrTimeout:(unsigned int)a3
{
  NSObject *sem;
  dispatch_time_t v4;

  sem = self->sem;
  v4 = dispatch_time(0, 1000000000 * a3);
  return dispatch_semaphore_wait(sem, v4);
}

@end
