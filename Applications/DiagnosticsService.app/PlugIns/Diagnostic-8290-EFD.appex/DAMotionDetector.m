@implementation DAMotionDetector

- (DAMotionDetector)initWithThreshold:(id)a3
{
  id v5;
  DAMotionDetector *v6;
  DAMotionDetector *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DAMotionDetector;
  v6 = -[DAMotionDetector init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_threshold, a3);

  return v7;
}

- (void)start
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[12];
  _QWORD v10[4];
  _QWORD v11[4];
  _QWORD v12[4];
  _QWORD v13[4];
  _QWORD v14[4];
  _QWORD v15[4];
  _QWORD v16[3];
  char v17;

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0x7FEFFFFFFFFFFFFFLL;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0x7FEFFFFFFFFFFFFFLL;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0x7FEFFFFFFFFFFFFFLL;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0x10000000000000;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0x10000000000000;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0x10000000000000;
  v3 = objc_alloc_init((Class)CMMotionManager);
  -[DAMotionDetector setMotionManager:](self, "setMotionManager:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DAMotionDetector motionManager](self, "motionManager"));
  v5 = objc_msgSend(v4, "isAccelerometerAvailable");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DAMotionDetector motionManager](self, "motionManager"));
    objc_msgSend(v6, "setAccelerometerUpdateInterval:", 0.01);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DAMotionDetector motionManager](self, "motionManager"));
    v8 = objc_alloc_init((Class)NSOperationQueue);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100003EE4;
    v9[3] = &unk_10001C550;
    v9[6] = v15;
    v9[7] = v11;
    v9[8] = v14;
    v9[9] = v10;
    v9[4] = self;
    v9[5] = v12;
    v9[10] = v13;
    v9[11] = v16;
    objc_msgSend(v7, "startAccelerometerUpdatesToQueue:withHandler:", v8, v9);

  }
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v16, 8);
}

- (void)stop
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DAMotionDetector motionManager](self, "motionManager"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DAMotionDetector motionManager](self, "motionManager"));
    v5 = objc_msgSend(v4, "isAccelerometerActive");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[DAMotionDetector motionManager](self, "motionManager"));
      objc_msgSend(v6, "stopAccelerometerUpdates");

    }
    -[DAMotionDetector setMotionManager:](self, "setMotionManager:", 0);
  }
}

- (NSNumber)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_threshold, a3);
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
  objc_storeStrong((id *)&self->_threshold, 0);
}

@end
