@implementation DMFLockDeviceRequest

+ (id)permittedPlatforms
{
  return &unk_1E6EF4B50;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFLockDeviceRequest)initWithCoder:(id)a3
{
  id v4;
  DMFLockDeviceRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *message;
  void *v9;
  uint64_t v10;
  NSString *phoneNumber;
  void *v12;
  uint64_t v13;
  NSString *pin;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DMFLockDeviceRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("message"));
    v7 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("phoneNumber"));
    v10 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("pin"));
    v13 = objc_claimAutoreleasedReturnValue();
    pin = v5->_pin;
    v5->_pin = (NSString *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DMFLockDeviceRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[DMFLockDeviceRequest message](self, "message", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("message"));

  -[DMFLockDeviceRequest phoneNumber](self, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("phoneNumber"));

  -[DMFLockDeviceRequest pin](self, "pin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("pin"));

}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)pin
{
  return self->_pin;
}

- (void)setPin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pin, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
