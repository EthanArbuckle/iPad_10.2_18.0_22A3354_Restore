@implementation FMDPairingLockUpdateRequestInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[FMDPairingLockUpdateRequestInfo pairingCheckToken](self, "pairingCheckToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("pairingCheckToken"));

  -[FMDPairingLockUpdateRequestInfo lostModePubKey](self, "lostModePubKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("lostModePubKey"));

  -[FMDPairingLockUpdateRequestInfo userPrivateKey](self, "userPrivateKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("userPrivateKey"));

  -[FMDPairingLockUpdateRequestInfo serialNumber](self, "serialNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("serialNumber"));

  -[FMDPairingLockUpdateRequestInfo timeStamp](self, "timeStamp");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("timeStamp"));

}

- (FMDPairingLockUpdateRequestInfo)initWithCoder:(id)a3
{
  id v4;
  FMDPairingLockUpdateRequestInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FMDPairingLockUpdateRequestInfo;
  v5 = -[FMDPairingLockUpdateRequestInfo init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairingCheckToken"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDPairingLockUpdateRequestInfo setPairingCheckToken:](v5, "setPairingCheckToken:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lostModePubKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDPairingLockUpdateRequestInfo setLostModePubKey:](v5, "setLostModePubKey:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userPrivateKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDPairingLockUpdateRequestInfo setUserPrivateKey:](v5, "setUserPrivateKey:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDPairingLockUpdateRequestInfo setSerialNumber:](v5, "setSerialNumber:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeStamp"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDPairingLockUpdateRequestInfo setTimeStamp:](v5, "setTimeStamp:", v10);

  }
  return v5;
}

- (NSString)pairingCheckToken
{
  return self->_pairingCheckToken;
}

- (void)setPairingCheckToken:(id)a3
{
  objc_storeStrong((id *)&self->_pairingCheckToken, a3);
}

- (NSString)lostModePubKey
{
  return self->_lostModePubKey;
}

- (void)setLostModePubKey:(id)a3
{
  objc_storeStrong((id *)&self->_lostModePubKey, a3);
}

- (NSString)userPrivateKey
{
  return self->_userPrivateKey;
}

- (void)setUserPrivateKey:(id)a3
{
  objc_storeStrong((id *)&self->_userPrivateKey, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSString)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
  objc_storeStrong((id *)&self->_timeStamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_userPrivateKey, 0);
  objc_storeStrong((id *)&self->_lostModePubKey, 0);
  objc_storeStrong((id *)&self->_pairingCheckToken, 0);
}

@end
