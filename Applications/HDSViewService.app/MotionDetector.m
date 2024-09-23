@implementation MotionDetector

- (MotionDetector)init
{
  MotionDetector *v2;
  double v3;
  MotionDetector *v4;
  double v5;
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MotionDetector;
  v2 = -[MotionDetector init](&v11, "init");
  v4 = v2;
  if (v2)
  {
    v2->_rotationMagnitude = 0.0;
    v2->_accelerationMagnitude = 0.0;
    LODWORD(v3) = 1120403456;
    -[MotionDetector setAccelerationThreshold:](v2, "setAccelerationThreshold:", v3);
    LODWORD(v5) = 1120403456;
    -[MotionDetector setRotationThreshold:](v4, "setRotationThreshold:", v5);
    v6 = objc_alloc_init(off_1000D5028());
    -[MotionDetector setMotion:](v4, "setMotion:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MotionDetector motion](v4, "motion"));
    v8 = objc_msgSend(v7, "isDeviceMotionAvailable");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MotionDetector motion](v4, "motion"));
      objc_msgSend(v9, "setDeviceMotionUpdateInterval:", 0.0333333333);

    }
  }
  return v4;
}

- (void)start
{
  void *v3;
  unsigned __int8 v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MotionDetector motion](self, "motion"));
  v4 = objc_msgSend(v3, "isDeviceMotionActive");

  if ((v4 & 1) == 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MotionDetector motion](self, "motion"));
    objc_msgSend(v5, "startDeviceMotionUpdates");

  }
}

- (void)stop
{
  void *v3;
  unsigned int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MotionDetector motion](self, "motion"));
  v4 = objc_msgSend(v3, "isDeviceMotionActive");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MotionDetector motion](self, "motion"));
    objc_msgSend(v5, "stopDeviceMotionUpdates");

  }
  self->_rotationMagnitude = 0.0;
  self->_accelerationMagnitude = 0.0;
}

- (BOOL)isMoving
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  float v32;
  double v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MotionDetector motion](self, "motion"));
  v4 = objc_msgSend(v3, "isDeviceMotionActive");

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MotionDetector motion](self, "motion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceMotion"));

  objc_msgSend(v6, "rotationRate");
  v8 = v7;
  objc_msgSend(v6, "rotationRate");
  v10 = v9;
  objc_msgSend(v6, "rotationRate");
  v12 = v11;
  objc_msgSend(v6, "rotationRate");
  v14 = v12 * v13 + v8 * v10;
  objc_msgSend(v6, "rotationRate");
  v16 = v15;
  objc_msgSend(v6, "rotationRate");
  v18 = sqrt(v14 + v16 * v17);
  self->_rotationMagnitude = v18;
  -[MotionDetector rotationThreshold](self, "rotationThreshold");
  if (v18 <= v19)
  {
    objc_msgSend(v6, "userAcceleration");
    v21 = v20;
    objc_msgSend(v6, "userAcceleration");
    v23 = v22;
    objc_msgSend(v6, "userAcceleration");
    v25 = v24;
    objc_msgSend(v6, "userAcceleration");
    v27 = v25 * v26 + v21 * v23;
    objc_msgSend(v6, "userAcceleration");
    v29 = v28;
    objc_msgSend(v6, "userAcceleration");
    v31 = sqrt(v27 + v29 * v30);
    self->_accelerationMagnitude = v31;
    -[MotionDetector accelerationThreshold](self, "accelerationThreshold");
    v33 = v32;

    return v31 > v33;
  }

  return 1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MotionDetector motion](self, "motion"));
  objc_msgSend(v3, "stopDeviceMotionUpdates");

  v4.receiver = self;
  v4.super_class = (Class)MotionDetector;
  -[MotionDetector dealloc](&v4, "dealloc");
}

- (float)rotationThreshold
{
  return self->_rotationThreshold;
}

- (void)setRotationThreshold:(float)a3
{
  self->_rotationThreshold = a3;
}

- (float)accelerationThreshold
{
  return self->_accelerationThreshold;
}

- (void)setAccelerationThreshold:(float)a3
{
  self->_accelerationThreshold = a3;
}

- (double)rotationMagnitude
{
  return self->_rotationMagnitude;
}

- (double)accelerationMagnitude
{
  return self->_accelerationMagnitude;
}

- (CMMotionManager)motion
{
  return self->_motion;
}

- (void)setMotion:(id)a3
{
  objc_storeStrong((id *)&self->_motion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motion, 0);
}

@end
