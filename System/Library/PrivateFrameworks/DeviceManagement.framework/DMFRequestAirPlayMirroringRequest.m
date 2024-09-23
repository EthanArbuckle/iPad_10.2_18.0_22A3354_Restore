@implementation DMFRequestAirPlayMirroringRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1E6EF4D00;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFRequestAirPlayMirroringRequest)initWithCoder:(id)a3
{
  id v4;
  DMFRequestAirPlayMirroringRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *destinationName;
  void *v9;
  uint64_t v10;
  NSString *destinationDeviceID;
  void *v12;
  uint64_t v13;
  NSString *password;
  void *v15;
  void *v16;
  double v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DMFRequestAirPlayMirroringRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("destinationName"));
    v7 = objc_claimAutoreleasedReturnValue();
    destinationName = v5->_destinationName;
    v5->_destinationName = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("destinationDeviceID"));
    v10 = objc_claimAutoreleasedReturnValue();
    destinationDeviceID = v5->_destinationDeviceID;
    v5->_destinationDeviceID = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("password"));
    v13 = objc_claimAutoreleasedReturnValue();
    password = v5->_password;
    v5->_password = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("force"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_force = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scanWaitInterval"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v5->_scanWaitInterval = v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DMFRequestAirPlayMirroringRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  -[DMFRequestAirPlayMirroringRequest destinationName](self, "destinationName", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("destinationName"));

  -[DMFRequestAirPlayMirroringRequest destinationDeviceID](self, "destinationDeviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("destinationDeviceID"));

  -[DMFRequestAirPlayMirroringRequest password](self, "password");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("password"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFRequestAirPlayMirroringRequest force](self, "force"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("force"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[DMFRequestAirPlayMirroringRequest scanWaitInterval](self, "scanWaitInterval");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("scanWaitInterval"));

}

- (NSString)destinationName
{
  return self->_destinationName;
}

- (void)setDestinationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)destinationDeviceID
{
  return self->_destinationDeviceID;
}

- (void)setDestinationDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)force
{
  return self->_force;
}

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

- (double)scanWaitInterval
{
  return self->_scanWaitInterval;
}

- (void)setScanWaitInterval:(double)a3
{
  self->_scanWaitInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_destinationDeviceID, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);
}

@end
