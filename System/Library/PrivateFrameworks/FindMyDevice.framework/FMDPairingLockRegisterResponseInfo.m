@implementation FMDPairingLockRegisterResponseInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FMDPairingLockRegisterResponseInfo serialNumber](self, "serialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("serialNumber"));

  -[FMDPairingLockRegisterResponseInfo pairingToken](self, "pairingToken");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("pairingToken"));

}

- (FMDPairingLockRegisterResponseInfo)initWithCoder:(id)a3
{
  id v4;
  FMDPairingLockRegisterResponseInfo *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDPairingLockRegisterResponseInfo;
  v5 = -[FMDPairingLockRegisterResponseInfo init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDPairingLockRegisterResponseInfo setSerialNumber:](v5, "setSerialNumber:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairingToken"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDPairingLockRegisterResponseInfo setPairingToken:](v5, "setPairingToken:", v7);

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

- (NSString)pairingToken
{
  return self->_pairingToken;
}

- (void)setPairingToken:(id)a3
{
  objc_storeStrong((id *)&self->_pairingToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingToken, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end
