@implementation CVACMMotionTypeDeviceMotionData

- (CVACMMotionTypeDeviceMotionData)init
{
  CVACMMotionTypeDeviceMotionData *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CVACMMotionTypeDeviceMotionData;
  v2 = -[CVACMMotionTypeDeviceMotionData init](&v9, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[CVACMMotionTypeDeviceMotionData setQuaternion:](v2, "setQuaternion:", v3);

    v4 = (void *)objc_opt_new();
    -[CVACMMotionTypeDeviceMotionData setUserAcceleration:](v2, "setUserAcceleration:", v4);

    v5 = (void *)objc_opt_new();
    -[CVACMMotionTypeDeviceMotionData setGravity:](v2, "setGravity:", v5);

    v6 = (void *)objc_opt_new();
    -[CVACMMotionTypeDeviceMotionData setRotationRate:](v2, "setRotationRate:", v6);

    v7 = (void *)objc_opt_new();
    -[CVACMMotionTypeDeviceMotionData setMagneticField:](v2, "setMagneticField:", v7);

  }
  return v2;
}

- (CVACMMotionTypeDeviceMotionData)initWithFastPathData:(id)a3
{
  id v4;
  CVACMMotionTypeDeviceMotionData *v5;
  double *v6;
  double *v7;
  CVACLMotionTypeDoubleVector4 *v8;
  CVACLMotionTypeVector3 *v9;
  CVACLMotionTypeVector3 *v10;
  CVACLMotionTypeVector3 *v11;
  CVACLMotionTypeVector3 *v12;
  CVACMMotionTypeDeviceMotionData *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CVACMMotionTypeDeviceMotionData;
  v5 = -[CVACMMotionTypeDeviceMotionData init](&v15, sel_init);
  if (v5)
  {
    v6 = (double *)objc_msgSend(objc_retainAutorelease(v4), "bytes");
    if (*(_WORD *)v6 != 3)
    {
      v13 = 0;
      goto LABEL_6;
    }
    v7 = v6;
    v8 = -[CVACLMotionTypeDoubleVector4 initWithFastPathXYZWDataV3:]([CVACLMotionTypeDoubleVector4 alloc], "initWithFastPathXYZWDataV3:", v7[15], v7[16], v7[17], v7[18]);
    -[CVACMMotionTypeDeviceMotionData setQuaternion:](v5, "setQuaternion:", v8);

    v9 = -[CVACLMotionTypeVector3 initWithFastPathXYZDataV3:]([CVACLMotionTypeVector3 alloc], "initWithFastPathXYZDataV3:", v7[25], v7[26], v7[27]);
    -[CVACMMotionTypeDeviceMotionData setUserAcceleration:](v5, "setUserAcceleration:", v9);

    v10 = -[CVACLMotionTypeVector3 initWithFastPathXYZDataV3:]([CVACLMotionTypeVector3 alloc], "initWithFastPathXYZDataV3:", v7[22], v7[23], v7[24]);
    -[CVACMMotionTypeDeviceMotionData setGravity:](v5, "setGravity:", v10);

    v11 = -[CVACLMotionTypeVector3 initWithFastPathXYZDataV3:]([CVACLMotionTypeVector3 alloc], "initWithFastPathXYZDataV3:", v7[19], v7[20], v7[21]);
    -[CVACMMotionTypeDeviceMotionData setRotationRate:](v5, "setRotationRate:", v11);

    v12 = -[CVACLMotionTypeVector3 initWithFastPathXYZDataV3:]([CVACLMotionTypeVector3 alloc], "initWithFastPathXYZDataV3:", v7[28], v7[29], v7[30]);
    -[CVACMMotionTypeDeviceMotionData setMagneticField:](v5, "setMagneticField:", v12);

    -[CVACMMotionTypeDeviceMotionData setMagneticFieldCalibrationLevel:](v5, "setMagneticFieldCalibrationLevel:", *((unsigned int *)v7 + 69));
    -[CVACMMotionTypeDeviceMotionData setDoingYawCorrection:](v5, "setDoingYawCorrection:", (*((_DWORD *)v7 + 68) >> 1) & 1);
    -[CVACMMotionTypeDeviceMotionData setDoingBiasEstimation:](v5, "setDoingBiasEstimation:", (*((_DWORD *)v7 + 68) >> 2) & 1);
    -[CVACMMotionTypeDeviceMotionData setFusedWithVision:](v5, "setFusedWithVision:", (*((_DWORD *)v7 + 68) >> 3) & 1);
  }
  v13 = v5;
LABEL_6:

  return v13;
}

- (CVACLMotionTypeDoubleVector4)quaternion
{
  return self->_quaternion;
}

- (void)setQuaternion:(id)a3
{
  objc_storeStrong((id *)&self->_quaternion, a3);
}

- (CVACLMotionTypeVector3)userAcceleration
{
  return self->_userAcceleration;
}

- (void)setUserAcceleration:(id)a3
{
  objc_storeStrong((id *)&self->_userAcceleration, a3);
}

- (CVACLMotionTypeVector3)gravity
{
  return self->_gravity;
}

- (void)setGravity:(id)a3
{
  objc_storeStrong((id *)&self->_gravity, a3);
}

- (CVACLMotionTypeVector3)rotationRate
{
  return self->_rotationRate;
}

- (void)setRotationRate:(id)a3
{
  objc_storeStrong((id *)&self->_rotationRate, a3);
}

- (CVACLMotionTypeVector3)magneticField
{
  return self->_magneticField;
}

- (void)setMagneticField:(id)a3
{
  objc_storeStrong((id *)&self->_magneticField, a3);
}

- (int)magneticFieldCalibrationLevel
{
  return self->_magneticFieldCalibrationLevel;
}

- (void)setMagneticFieldCalibrationLevel:(int)a3
{
  self->_magneticFieldCalibrationLevel = a3;
}

- (BOOL)doingYawCorrection
{
  return self->_doingYawCorrection;
}

- (void)setDoingYawCorrection:(BOOL)a3
{
  self->_doingYawCorrection = a3;
}

- (BOOL)doingBiasEstimation
{
  return self->_doingBiasEstimation;
}

- (void)setDoingBiasEstimation:(BOOL)a3
{
  self->_doingBiasEstimation = a3;
}

- (BOOL)fusedWithVision
{
  return self->_fusedWithVision;
}

- (void)setFusedWithVision:(BOOL)a3
{
  self->_fusedWithVision = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_magneticField, 0);
  objc_storeStrong((id *)&self->_rotationRate, 0);
  objc_storeStrong((id *)&self->_gravity, 0);
  objc_storeStrong((id *)&self->_userAcceleration, 0);
  objc_storeStrong((id *)&self->_quaternion, 0);
}

@end
