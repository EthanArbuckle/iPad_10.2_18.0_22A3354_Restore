@implementation HKElectrocardiogramSessionConfiguration

+ (HKElectrocardiogramSessionConfiguration)sessionConfigurationWithUUID:(id)a3 mode:(int64_t)a4 maximumDuration:(double)a5 wornOnRightArm:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  HKElectrocardiogramSessionConfiguration *v10;

  v6 = a6;
  v9 = a3;
  v10 = objc_alloc_init(HKElectrocardiogramSessionConfiguration);
  -[HKElectrocardiogramSessionConfiguration setSessionUUID:](v10, "setSessionUUID:", v9);

  -[HKElectrocardiogramSessionConfiguration setMode:](v10, "setMode:", a4);
  -[HKElectrocardiogramSessionConfiguration setMaximumDuration:](v10, "setMaximumDuration:", a5);
  -[HKElectrocardiogramSessionConfiguration setWornOnRightArm:](v10, "setWornOnRightArm:", v6);
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setSessionUUID:", self->_sessionUUID);
  objc_msgSend(v4, "setMode:", self->_mode);
  objc_msgSend(v4, "setMaximumDuration:", self->_maximumDuration);
  objc_msgSend(v4, "setWornOnRightArm:", self->_wornOnRightArm);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKElectrocardiogramSessionConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKElectrocardiogramSessionConfiguration *v5;
  uint64_t v6;
  NSUUID *sessionUUID;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKElectrocardiogramSessionConfiguration;
  v5 = -[HKElectrocardiogramSessionConfiguration init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionUUID = v5->_sessionUUID;
    v5->_sessionUUID = (NSUUID *)v6;

    v5->_mode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mode"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maximumDuration"));
    v5->_maximumDuration = v8;
    v5->_wornOnRightArm = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wornOnRightArm"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *sessionUUID;
  id v5;

  sessionUUID = self->_sessionUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sessionUUID, CFSTR("sessionUUID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_mode, CFSTR("mode"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("maximumDuration"), self->_maximumDuration);
  objc_msgSend(v5, "encodeBool:forKey:", self->_wornOnRightArm, CFSTR("wornOnRightArm"));

}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (double)maximumDuration
{
  return self->_maximumDuration;
}

- (void)setMaximumDuration:(double)a3
{
  self->_maximumDuration = a3;
}

- (BOOL)wornOnRightArm
{
  return self->_wornOnRightArm;
}

- (void)setWornOnRightArm:(BOOL)a3
{
  self->_wornOnRightArm = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end
