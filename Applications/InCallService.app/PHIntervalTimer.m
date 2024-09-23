@implementation PHIntervalTimer

+ (id)oneSecondTimer
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F75AC;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DCC90 != -1)
    dispatch_once(&qword_1002DCC90, block);
  return (id)qword_1002DCC88;
}

- (PHIntervalTimer)initWithInterval:(double)a3
{
  PHIntervalTimer *v4;
  PHIntervalTimer *v5;
  void *v6;
  dispatch_queue_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PHIntervalTimer;
  v4 = -[PHIntervalTimer init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    -[PHIntervalTimer setInterval:](v4, "setInterval:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[PHIntervalTimer setObservers:](v5, "setObservers:", v6);

    v7 = dispatch_queue_create("com.apple.mobilephone.PHIntervalTimer", 0);
    -[PHIntervalTimer setQueue:](v5, "setQueue:", v7);

  }
  return v5;
}

- (PHIntervalTimer)init
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PHIntervalTimer init]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Don't call %@, call designated initializer instead."), v3));
  NSLog(CFSTR("** TUAssertion failure: %@"), v4);

  _TUAssertShouldCrashApplication();
  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHIntervalTimer timer](self, "timer"));
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)PHIntervalTimer;
  -[PHIntervalTimer dealloc](&v4, "dealloc");
}

- (void)addObserver:(id)a3 selector:(SEL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[PHIntervalTimer queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F7800;
  block[3] = &unk_100285900;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(v7, block);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PHIntervalTimer queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F7900;
  block[3] = &unk_100285158;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)fire
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[PHIntervalTimer queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F79D0;
  block[3] = &unk_100284898;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)pause
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[PHIntervalTimer queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F7A6C;
  block[3] = &unk_100284898;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)resume
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[PHIntervalTimer queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F7B58;
  block[3] = &unk_100284898;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)_createTimerIfNecessary
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(-[PHIntervalTimer queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[PHIntervalTimer observers](self, "observers"));
  if (!objc_msgSend(v11, "count"))
  {

    return;
  }
  v4 = objc_claimAutoreleasedReturnValue(-[PHIntervalTimer timer](self, "timer"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHIntervalTimer timer](self, "timer"));
    v7 = objc_msgSend(v6, "isValid");

    if ((v7 & 1) != 0)
      return;
  }
  else
  {

  }
  v8 = sub_1000C5588();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Creating interval timer", buf, 2u);
  }

  -[PHIntervalTimer interval](self, "interval");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_postNotification", 0, 1));
  -[PHIntervalTimer setTimer:](self, "setTimer:", v10);

}

- (void)_invalidateTimerIfNecessary
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_claimAutoreleasedReturnValue(-[PHIntervalTimer queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[PHIntervalTimer observers](self, "observers"));
  if (objc_msgSend(v6, "count"))
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHIntervalTimer timer](self, "timer"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHIntervalTimer timer](self, "timer"));
      objc_msgSend(v5, "invalidate");

      -[PHIntervalTimer setTimer:](self, "setTimer:", 0);
    }
  }
}

- (void)_postNotification
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("PHIntervalTimerNotification"), self);

}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
