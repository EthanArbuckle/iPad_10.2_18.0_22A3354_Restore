@implementation DeviceAngleController

- (void)start
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v3 = objc_alloc_init((Class)CMMotionManager);
  -[DeviceAngleController setMotionManager:](self, "setMotionManager:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceAngleController motionManager](self, "motionManager"));
  v5 = objc_msgSend(v4, "isDeviceMotionAvailable");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceAngleController motionManager](self, "motionManager"));
    objc_msgSend(v6, "setDeviceMotionUpdateInterval:", 0.100000001);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceAngleController motionManager](self, "motionManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100003800;
    v10[3] = &unk_100004098;
    v10[4] = self;
    objc_msgSend(v7, "startDeviceMotionUpdatesToQueue:withHandler:", v8, v10);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceAngleController result](self, "result"));
    objc_msgSend(v9, "setStatusCode:", &off_100004148);

    -[DeviceAngleController setFinished:](self, "setFinished:", 1);
  }
}

- (id)readDeviceAnglesFrom:(id)a3
{
  void *v4;
  double v5;
  float v6;
  double v7;
  float v8;
  double v9;
  float v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[3];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "attitude"));
  objc_msgSend(v4, "roll");
  v6 = v5 * 57.2957802;
  objc_msgSend(v4, "pitch");
  v8 = v7 * 57.2957802;
  objc_msgSend(v4, "yaw");
  v10 = v9 * 57.2957802;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), v8));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), v6));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), v10));
  v17[0] = CFSTR("pitch");
  v17[1] = CFSTR("roll");
  v18[0] = v11;
  v18[1] = v12;
  v17[2] = CFSTR("yaw");
  v18[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceAngleController motionManager](self, "motionManager"));
  objc_msgSend(v15, "stopDeviceMotionUpdates");

  return v14;
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
}

@end
