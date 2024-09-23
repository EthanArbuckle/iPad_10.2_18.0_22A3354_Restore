@implementation CVAIMUCalibration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_254A6EEA0 != -1)
    dispatch_once(&qword_254A6EEA0, &unk_24CA35F60);
  return (id)qword_254A6EE98;
}

- (CVAIMUCalibration)initWithCoder:(id)a3
{
  id v4;
  CVAIMUCalibration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CVAIMUCalibration;
  v5 = -[CVAIMUCalibration init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x212BC8864]();
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("nc"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVAIMUCalibration setNoiseCharacteristics:](v5, "setNoiseCharacteristics:", v7);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("gr"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVAIMUCalibration setGravity:](v5, "setGravity:", v8);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("atc"));
    -[CVAIMUCalibration setAccelTimestampCorrection:](v5, "setAccelTimestampCorrection:");
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("ac"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVAIMUCalibration setAccelConversion:](v5, "setAccelConversion:", v9);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("gc"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVAIMUCalibration setGyroConversion:](v5, "setGyroConversion:", v10);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("r"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVAIMUCalibration setImuToIMURotation:](v5, "setImuToIMURotation:", v11);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("t"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVAIMUCalibration setImuToIMUTranslation:](v5, "setImuToIMUTranslation:", v12);

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)MEMORY[0x212BC8864]();
  -[CVAIMUCalibration noiseCharacteristics](self, "noiseCharacteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("nc"));

  -[CVAIMUCalibration gravity](self, "gravity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("gr"));

  -[CVAIMUCalibration accelTimestampCorrection](self, "accelTimestampCorrection");
  objc_msgSend(v11, "encodeDouble:forKey:", CFSTR("atc"));
  -[CVAIMUCalibration accelConversion](self, "accelConversion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("ac"));

  -[CVAIMUCalibration gyroConversion](self, "gyroConversion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("gc"));

  -[CVAIMUCalibration imuToIMURotation](self, "imuToIMURotation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("r"));

  -[CVAIMUCalibration imuToIMUTranslation](self, "imuToIMUTranslation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("t"));

  objc_autoreleasePoolPop(v4);
}

- (NSArray)noiseCharacteristics
{
  return self->_noiseCharacteristics;
}

- (void)setNoiseCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_noiseCharacteristics, a3);
}

- (NSArray)gravity
{
  return self->_gravity;
}

- (void)setGravity:(id)a3
{
  objc_storeStrong((id *)&self->_gravity, a3);
}

- (double)accelTimestampCorrection
{
  return self->_accelTimestampCorrection;
}

- (void)setAccelTimestampCorrection:(double)a3
{
  self->_accelTimestampCorrection = a3;
}

- (NSArray)accelConversion
{
  return self->_accelConversion;
}

- (void)setAccelConversion:(id)a3
{
  objc_storeStrong((id *)&self->_accelConversion, a3);
}

- (NSArray)gyroConversion
{
  return self->_gyroConversion;
}

- (void)setGyroConversion:(id)a3
{
  objc_storeStrong((id *)&self->_gyroConversion, a3);
}

- (NSArray)imuToIMURotation
{
  return self->_imuToIMURotation;
}

- (void)setImuToIMURotation:(id)a3
{
  objc_storeStrong((id *)&self->_imuToIMURotation, a3);
}

- (NSArray)imuToIMUTranslation
{
  return self->_imuToIMUTranslation;
}

- (void)setImuToIMUTranslation:(id)a3
{
  objc_storeStrong((id *)&self->_imuToIMUTranslation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imuToIMUTranslation, 0);
  objc_storeStrong((id *)&self->_imuToIMURotation, 0);
  objc_storeStrong((id *)&self->_gyroConversion, 0);
  objc_storeStrong((id *)&self->_accelConversion, 0);
  objc_storeStrong((id *)&self->_gravity, 0);
  objc_storeStrong((id *)&self->_noiseCharacteristics, 0);
}

@end
