@implementation CVACalibration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_254A6EEB0 != -1)
    dispatch_once(&qword_254A6EEB0, &unk_24CA35F80);
  return (id)qword_254A6EEA8;
}

- (CVACalibration)initWithCoder:(id)a3
{
  id v4;
  CVACalibration *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CVACalibration;
  v5 = -[CVACalibration init](&v10, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x212BC8864]();
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("ccl"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACalibration setCameraCalibrations:](v5, "setCameraCalibrations:", v7);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("imui"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACalibration setImuCalibration:](v5, "setImuCalibration:", v8);

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x212BC8864]();
  -[CVACalibration cameraCalibrations](self, "cameraCalibrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("ccl"));

  -[CVACalibration imuCalibration](self, "imuCalibration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("imui"));

  objc_autoreleasePoolPop(v4);
}

- (NSArray)cameraCalibrations
{
  return self->_cameraCalibrations;
}

- (void)setCameraCalibrations:(id)a3
{
  objc_storeStrong((id *)&self->_cameraCalibrations, a3);
}

- (CVAIMUCalibration)imuCalibration
{
  return self->_imuCalibration;
}

- (void)setImuCalibration:(id)a3
{
  objc_storeStrong((id *)&self->_imuCalibration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imuCalibration, 0);
  objc_storeStrong((id *)&self->_cameraCalibrations, 0);
}

@end
