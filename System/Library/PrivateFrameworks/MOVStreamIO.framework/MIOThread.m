@implementation MIOThread

- (MIOThread)init
{
  MIOThread *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *waitSema;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MIOThread;
  v2 = -[MIOThread init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_semaphore_create(0);
    waitSema = v2->_waitSema;
    v2->_waitSema = (OS_dispatch_semaphore *)v3;

  }
  return v2;
}

- (MIOThread)initWithName:(id)a3 block:(id)a4
{
  id v6;
  MIOThread *v7;
  MIOThread *v8;
  id v9;
  os_log_t v10;
  OS_os_log *perfLogHandle;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MIOThread;
  v7 = -[MIOThread initWithBlock:](&v13, sel_initWithBlock_, a4);
  v8 = v7;
  if (v7)
  {
    -[MIOThread setName:](v7, "setName:", v6);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.mio.thread.%@"), v6);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = os_log_create((const char *)objc_msgSend(v9, "UTF8String"), "PointsOfInterest");
    perfLogHandle = v8->_perfLogHandle;
    v8->_perfLogHandle = (OS_os_log *)v10;

  }
  return v8;
}

- (void)waitWithTimeout:(double)a3
{
  NSObject *waitSema;
  dispatch_time_t v4;

  waitSema = self->_waitSema;
  v4 = dispatch_time(0, (uint64_t)(a3 * 1000000.0));
  dispatch_semaphore_wait(waitSema, v4);
}

- (void)proceed
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_waitSema);
}

- (OS_os_log)perfLogHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPerfLogHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perfLogHandle, 0);
  objc_storeStrong((id *)&self->_waitSema, 0);
}

@end
