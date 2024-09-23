@implementation PHLocationFinder

- (PHLocationFinder)initWithBundle:(id)a3
{
  id v4;
  PHLocationFinder *v5;
  CLLocationManager *v6;
  CLLocationManager *locationManager;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHLocationFinder;
  v5 = -[PHLocationFinder init](&v9, "init");
  if (v5)
  {
    v6 = (CLLocationManager *)objc_msgSend(objc_alloc((Class)CLLocationManager), "initWithEffectiveBundle:", v4);
    locationManager = v5->_locationManager;
    v5->_locationManager = v6;

    -[CLLocationManager setDelegate:](v5->_locationManager, "setDelegate:", v5);
    -[CLLocationManager setDesiredAccuracy:](v5->_locationManager, "setDesiredAccuracy:", kCLLocationAccuracyBest);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", 0);
  -[PCPersistentTimer invalidate](self->_timer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PHLocationFinder;
  -[PHLocationFinder dealloc](&v3, "dealloc");
}

- (void)setCompletionHandler:(id)a3
{
  id v4;
  id completionHandler;
  id v6;
  id v7;
  id v8;

  v4 = a3;
  completionHandler = self->_completionHandler;
  v8 = v4;
  if (completionHandler)
  {
    self->_completionHandler = 0;

    v4 = v8;
  }
  if (v4)
  {
    v6 = objc_msgSend(v8, "copy");
    v7 = self->_completionHandler;
    self->_completionHandler = v6;

    v4 = v8;
  }

}

- (void)start
{
  PCPersistentTimer *v3;
  PCPersistentTimer *timer;
  void *v5;
  PCPersistentTimer *v6;
  uint64_t v7;
  id v8;

  if ((-[CLLocationManager locationServicesAvailable](self->_locationManager, "locationServicesAvailable") & 1) != 0)
  {
    -[CLLocationManager startUpdatingLocationWithPrompt](self->_locationManager, "startUpdatingLocationWithPrompt");
    -[PCPersistentTimer invalidate](self->_timer, "invalidate");
    v3 = (PCPersistentTimer *)objc_msgSend(objc_alloc((Class)PCPersistentTimer), "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", CFSTR("com.apple.TelephonyUtilities.PHLocationFinder"), self, "_timerFired", 0, 10.0);
    timer = self->_timer;
    self->_timer = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    v6 = self->_timer;
    if (v5)
      v7 = objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    else
      v7 = objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    v8 = (id)v7;
    -[PCPersistentTimer scheduleInRunLoop:](v6, "scheduleInRunLoop:", v7);

  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)stop
{
  PCPersistentTimer *timer;

  -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
  -[PCPersistentTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

}

- (void)_timerFired
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CLLocationManager location](self->_locationManager, "location"));
  (*((void (**)(void))self->_completionHandler + 2))();
  -[PHLocationFinder stop](self, "stop");

}

+ (void)findLocationWithBundle:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  void ***v8;
  void **v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  PHLocationFinder *v20;

  v5 = a3;
  v6 = a4;
  if (qword_1002DC760 != -1)
    dispatch_once(&qword_1002DC760, &stru_100285670);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1000440C8;
  v19 = sub_1000440D8;
  v20 = -[PHLocationFinder initWithBundle:]([PHLocationFinder alloc], "initWithBundle:", v5);
  objc_msgSend((id)qword_1002DC768, "addObject:", v16[5]);
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_1000440E0;
  v12 = &unk_100285698;
  v7 = v6;
  v13 = v7;
  v14 = &v15;
  v8 = objc_retainBlock(&v9);
  objc_msgSend((id)v16[5], "setCompletionHandler:", v8, v9, v10, v11, v12);
  objc_msgSend((id)v16[5], "start");

  _Block_object_dispose(&v15, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
