@implementation FMDRepairDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDRepairDevice)initWithClientIdentifier:(id)a3 isThisDevice:(BOOL)a4
{
  id v7;
  FMDRepairDevice *v8;
  FMDRepairDevice *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FMDRepairDevice;
  v8 = -[FMDRepairDevice init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_isThisDevice = a4;
  }

  return v9;
}

- (FMDRepairDevice)initWithCoder:(id)a3
{
  id v4;
  FMDRepairDevice *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDRepairDevice;
  v5 = -[FMDRepairDevice init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_isThisDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isThisDevice"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isThisDevice, CFSTR("isThisDevice"));

}

- (BOOL)isThisDevice
{
  return self->_isThisDevice;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
