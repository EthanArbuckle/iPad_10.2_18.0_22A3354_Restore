@implementation MKLocationManagerSingleUpdater

- (MKLocationManagerSingleUpdater)initWithLocationManager:(id)a3 desiredAccuracy:(double)a4 handler:(id)a5 timeout:(double)a6 maxLocationAge:(double)a7
{
  id v12;
  id v13;
  MKLocationManagerSingleUpdater *v14;
  MKLocationManagerSingleUpdater *v15;
  MKLocationManagerSingleUpdater *v16;
  objc_super v18;

  v12 = a3;
  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MKLocationManagerSingleUpdater;
  v14 = -[MKLocationManagerSingleUpdater init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    -[MKLocationManagerSingleUpdater setHandler:](v14, "setHandler:", v13);
    v15->_desiredAccuracy = a4;
    if (!v12)
    {
      +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v15->_locationManager, v12);
    v15->_timeout = a6;
    v15->_maxLocationAge = a7;
    v16 = v15;
  }

  return v15;
}

- (MKLocationManagerSingleUpdater)initWithLocationManager:(id)a3 desiredAccuracy:(double)a4 handler:(id)a5 timeout:(double)a6
{
  return -[MKLocationManagerSingleUpdater initWithLocationManager:desiredAccuracy:handler:timeout:maxLocationAge:](self, "initWithLocationManager:desiredAccuracy:handler:timeout:maxLocationAge:", a3, a5, a4, a6, -1.0);
}

- (MKLocationManagerSingleUpdater)initWithLocationManager:(id)a3 desiredAccuracy:(double)a4 handler:(id)a5
{
  id v8;
  id v9;
  double v10;
  MKLocationManagerSingleUpdater *v11;

  v8 = a5;
  v9 = a3;
  GEOConfigGetDouble();
  v11 = -[MKLocationManagerSingleUpdater initWithLocationManager:desiredAccuracy:handler:timeout:](self, "initWithLocationManager:desiredAccuracy:handler:timeout:", v9, v8, a4, v10);

  return v11;
}

- (MKLocationManagerSingleUpdater)initWithLocationManager:(id)a3 handler:(id)a4
{
  return -[MKLocationManagerSingleUpdater initWithLocationManager:desiredAccuracy:handler:](self, "initWithLocationManager:desiredAccuracy:handler:", a3, a4, *MEMORY[0x1E0C9E490]);
}

- (void)dealloc
{
  objc_super v3;

  -[MKLocationManagerSingleUpdater cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MKLocationManagerSingleUpdater;
  -[MKLocationManagerSingleUpdater dealloc](&v3, sel_dealloc);
}

- (void)start
{
  double v3;
  void *v4;
  NSTimer *v5;
  NSTimer *timeoutTimer;

  if (!self->_active)
  {
    objc_storeStrong((id *)&self->_selfReference, self);
    self->_active = 1;
    -[MKLocationManagerSingleUpdater timeout](self, "timeout");
    if (v3 > 0.0)
    {
      v4 = (void *)MEMORY[0x1E0C99E88];
      -[MKLocationManagerSingleUpdater timeout](self, "timeout");
      objc_msgSend(v4, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_handleTimeout_, 0, 0);
      v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      timeoutTimer = self->_timeoutTimer;
      self->_timeoutTimer = v5;

    }
    -[MKLocationManager _startLocationUpdateWithObserver:desiredAccuracy:](self->_locationManager, "_startLocationUpdateWithObserver:desiredAccuracy:", self, self->_desiredAccuracy);
  }
}

- (void)cancel
{
  NSTimer *timeoutTimer;
  MKLocationManagerSingleUpdater *selfReference;

  if (self->_active)
  {
    self->_active = 0;
    -[MKLocationManager stopLocationUpdateWithObserver:](self->_locationManager, "stopLocationUpdateWithObserver:", self);
    -[MKLocationManagerSingleUpdater setHandler:](self, "setHandler:", 0);
    -[NSTimer invalidate](self->_timeoutTimer, "invalidate");
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = 0;

    selfReference = self->_selfReference;
    self->_selfReference = 0;

  }
}

- (void)handleTimeout:(id)a3
{
  void *v4;

  if (self->_handler)
  {
    +[MKLocationManager timeoutError](MKLocationManager, "timeoutError", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))self->_handler + 2))();

  }
  -[MKLocationManagerSingleUpdater cancel](self, "cancel", a3);
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void (**handler)(id, void *, _QWORD);
  void *v11;

  objc_msgSend(a3, "lastLocation");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v11 = (void *)v4;
    if (self->_maxLocationAge <= 0.0)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    v9 = v8;

    v5 = v11;
    if (v9 <= self->_maxLocationAge)
    {
LABEL_4:
      handler = (void (**)(id, void *, _QWORD))self->_handler;
      if (handler)
      {
        handler[2](handler, v11, 0);
        -[MKLocationManagerSingleUpdater cancel](self, "cancel");
        v5 = v11;
      }
    }
  }

}

- (void)locationManagerFailedToUpdateLocation:(id)a3 withError:(id)a4
{
  void (**handler)(id, _QWORD, id);
  id v6;

  v6 = a4;
  if ((objc_msgSend(v6, "_mapkit_isCLLocationUnknown") & 1) == 0)
  {
    handler = (void (**)(id, _QWORD, id))self->_handler;
    if (handler)
    {
      handler[2](handler, 0, v6);
      -[MKLocationManagerSingleUpdater cancel](self, "cancel");
    }
  }

}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_selfReference, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
