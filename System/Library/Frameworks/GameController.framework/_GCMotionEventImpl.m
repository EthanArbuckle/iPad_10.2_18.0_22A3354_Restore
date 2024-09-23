@implementation _GCMotionEventImpl

- (_GCMotionEventImpl)initWithMotionEvent:(id)a3
{
  id v4;
  _GCMotionEventImpl *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_GCMotionEventImpl;
  v5 = -[_GCMotionEventImpl init](&v17, sel_init);
  if (v5)
  {
    v5->_timestamp = objc_msgSend(v4, "timestamp");
    v5->_hasGyro = objc_msgSend(v4, "hasGyro");
    objc_msgSend(v4, "gyroPitch");
    v5->_gyroPitch = v6;
    objc_msgSend(v4, "gyroYaw");
    v5->_gyroYaw = v7;
    objc_msgSend(v4, "gyroRoll");
    v5->_gyroRoll = v8;
    v5->_hasAccelerometer = objc_msgSend(v4, "hasAccelerometer");
    objc_msgSend(v4, "accelerometerX");
    v5->_accelerometerX = v9;
    objc_msgSend(v4, "accelerometerY");
    v5->_accelerometerY = v10;
    objc_msgSend(v4, "accelerometerZ");
    v5->_accelerometerZ = v11;
    v5->_hasAttitude = objc_msgSend(v4, "hasAttitude");
    objc_msgSend(v4, "attitudeW");
    v5->_attitudeW = v12;
    objc_msgSend(v4, "attitudeX");
    v5->_attitudeX = v13;
    objc_msgSend(v4, "attitudeY");
    v5->_attitudeY = v14;
    objc_msgSend(v4, "attitudeZ");
    v5->_attitudeZ = v15;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setTimestamp:", self->_timestamp);
  objc_msgSend(v4, "setHasGyro:", self->_hasGyro);
  objc_msgSend(v4, "setGyroPitch:", self->_gyroPitch);
  objc_msgSend(v4, "setGyroYaw:", self->_gyroYaw);
  objc_msgSend(v4, "setGyroRoll:", self->_gyroRoll);
  objc_msgSend(v4, "setHasAccelerometer:", self->_hasAccelerometer);
  objc_msgSend(v4, "setAccelerometerX:", self->_accelerometerX);
  objc_msgSend(v4, "setAccelerometerY:", self->_accelerometerY);
  objc_msgSend(v4, "setAccelerometerZ:", self->_accelerometerZ);
  objc_msgSend(v4, "setHasAttitude:", self->_hasAttitude);
  objc_msgSend(v4, "setAttitudeW:", self->_attitudeW);
  objc_msgSend(v4, "setAttitudeX:", self->_attitudeX);
  objc_msgSend(v4, "setAttitudeY:", self->_attitudeY);
  objc_msgSend(v4, "setAttitudeZ:", self->_attitudeZ);
  return v4;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (BOOL)hasGyro
{
  return self->_hasGyro;
}

- (void)setHasGyro:(BOOL)a3
{
  self->_hasGyro = a3;
}

- (double)gyroPitch
{
  return self->_gyroPitch;
}

- (void)setGyroPitch:(double)a3
{
  self->_gyroPitch = a3;
}

- (double)gyroYaw
{
  return self->_gyroYaw;
}

- (void)setGyroYaw:(double)a3
{
  self->_gyroYaw = a3;
}

- (double)gyroRoll
{
  return self->_gyroRoll;
}

- (void)setGyroRoll:(double)a3
{
  self->_gyroRoll = a3;
}

- (BOOL)hasAccelerometer
{
  return self->_hasAccelerometer;
}

- (void)setHasAccelerometer:(BOOL)a3
{
  self->_hasAccelerometer = a3;
}

- (double)accelerometerX
{
  return self->_accelerometerX;
}

- (void)setAccelerometerX:(double)a3
{
  self->_accelerometerX = a3;
}

- (double)accelerometerY
{
  return self->_accelerometerY;
}

- (void)setAccelerometerY:(double)a3
{
  self->_accelerometerY = a3;
}

- (double)accelerometerZ
{
  return self->_accelerometerZ;
}

- (void)setAccelerometerZ:(double)a3
{
  self->_accelerometerZ = a3;
}

- (BOOL)hasAttitude
{
  return self->_hasAttitude;
}

- (void)setHasAttitude:(BOOL)a3
{
  self->_hasAttitude = a3;
}

- (double)attitudeW
{
  return self->_attitudeW;
}

- (void)setAttitudeW:(double)a3
{
  self->_attitudeW = a3;
}

- (double)attitudeX
{
  return self->_attitudeX;
}

- (void)setAttitudeX:(double)a3
{
  self->_attitudeX = a3;
}

- (double)attitudeY
{
  return self->_attitudeY;
}

- (void)setAttitudeY:(double)a3
{
  self->_attitudeY = a3;
}

- (double)attitudeZ
{
  return self->_attitudeZ;
}

- (void)setAttitudeZ:(double)a3
{
  self->_attitudeZ = a3;
}

@end
