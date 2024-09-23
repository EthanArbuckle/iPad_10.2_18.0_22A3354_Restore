@implementation DAOrientationDetector

- (DAOrientationDetector)initWithxThreshold:(id)a3 zThreshold:(id)a4
{
  id v6;
  id v7;
  DAOrientationDetector *v8;
  double v9;
  NSNumber *v10;
  NSNumber *xThreshold;
  double v12;
  NSNumber *v13;
  NSNumber *zThreshold;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DAOrientationDetector;
  v8 = -[DAOrientationDetector init](&v16, "init");
  if (v8)
  {
    objc_msgSend(v6, "doubleValue");
    if (v9 == 0.0)
      v10 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.4));
    else
      v10 = (NSNumber *)v6;
    xThreshold = v8->_xThreshold;
    v8->_xThreshold = v10;

    objc_msgSend(v7, "doubleValue");
    if (v12 == 0.0)
      v13 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.4));
    else
      v13 = (NSNumber *)v7;
    zThreshold = v8->_zThreshold;
    v8->_zThreshold = v13;

  }
  return v8;
}

- (void)start
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v3 = objc_alloc_init((Class)CMMotionManager);
  -[DAOrientationDetector setMotionManager:](self, "setMotionManager:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DAOrientationDetector motionManager](self, "motionManager"));
  v5 = objc_msgSend(v4, "isAccelerometerAvailable");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DAOrientationDetector motionManager](self, "motionManager"));
    objc_msgSend(v6, "setAccelerometerUpdateInterval:", 0.01);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DAOrientationDetector motionManager](self, "motionManager"));
    v8 = objc_alloc_init((Class)NSOperationQueue);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000037A0;
    v9[3] = &unk_10001C520;
    v9[4] = self;
    objc_msgSend(v7, "startAccelerometerUpdatesToQueue:withHandler:", v8, v9);

  }
}

- (void)stop
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DAOrientationDetector motionManager](self, "motionManager"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DAOrientationDetector motionManager](self, "motionManager"));
    v5 = objc_msgSend(v4, "isAccelerometerActive");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[DAOrientationDetector motionManager](self, "motionManager"));
      objc_msgSend(v6, "stopAccelerometerUpdates");

    }
    -[DAOrientationDetector setMotionManager:](self, "setMotionManager:", 0);
  }
}

- (NSNumber)xThreshold
{
  return self->_xThreshold;
}

- (void)setXThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_xThreshold, a3);
}

- (NSNumber)yThreshold
{
  return self->_yThreshold;
}

- (void)setYThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_yThreshold, a3);
}

- (NSNumber)zThreshold
{
  return self->_zThreshold;
}

- (void)setZThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_zThreshold, a3);
}

- (CMMotionManager)motionManager
{
  return self->_motionManager;
}

- (void)setMotionManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_zThreshold, 0);
  objc_storeStrong((id *)&self->_yThreshold, 0);
  objc_storeStrong((id *)&self->_xThreshold, 0);
}

@end
