@implementation FMDPairingLockRegisterRequestInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[FMDPairingLockRegisterRequestInfo accessoryType](self, "accessoryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accessoryType"));

  -[FMDPairingLockRegisterRequestInfo serialNumber](self, "serialNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("serialNumber"));

  -[FMDPairingLockRegisterRequestInfo lostModePublicKey](self, "lostModePublicKey");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("lostModePublicKey"));

}

- (FMDPairingLockRegisterRequestInfo)initWithCoder:(id)a3
{
  id v4;
  FMDPairingLockRegisterRequestInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDPairingLockRegisterRequestInfo;
  v5 = -[FMDPairingLockRegisterRequestInfo init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDPairingLockRegisterRequestInfo setAccessoryType:](v5, "setAccessoryType:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDPairingLockRegisterRequestInfo setSerialNumber:](v5, "setSerialNumber:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lostModePublicKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDPairingLockRegisterRequestInfo setLostModePublicKey:](v5, "setLostModePublicKey:", v8);

  }
  return v5;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSString)accessoryType
{
  return self->_accessoryType;
}

- (void)setAccessoryType:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryType, a3);
}

- (NSString)lostModePublicKey
{
  return self->_lostModePublicKey;
}

- (void)setLostModePublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_lostModePublicKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lostModePublicKey, 0);
  objc_storeStrong((id *)&self->_accessoryType, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end
