@implementation FMDPairingCheckCommandResponseInfo

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
  void *v9;
  id v10;

  v4 = a3;
  -[FMDPairingCheckCommandResponseInfo signature](self, "signature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("signature"));

  -[FMDPairingCheckCommandResponseInfo serverNonce](self, "serverNonce");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("serverNonce"));

  -[FMDPairingCheckCommandResponseInfo phoneNumber](self, "phoneNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("phoneNumber"));

  -[FMDPairingCheckCommandResponseInfo statusCode](self, "statusCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("statusCode"));

  -[FMDPairingCheckCommandResponseInfo lostModeInfo](self, "lostModeInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("lostModeInfo"));

  -[FMDPairingCheckCommandResponseInfo useEraseKeyType](self, "useEraseKeyType");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("useEraseKeyType"));

}

- (FMDPairingCheckCommandResponseInfo)initWithCoder:(id)a3
{
  id v4;
  FMDPairingCheckCommandResponseInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FMDPairingCheckCommandResponseInfo;
  v5 = -[FMDPairingCheckCommandResponseInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDPairingCheckCommandResponseInfo setSignature:](v5, "setSignature:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverNonce"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDPairingCheckCommandResponseInfo setServerNonce:](v5, "setServerNonce:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDPairingCheckCommandResponseInfo setPhoneNumber:](v5, "setPhoneNumber:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statusCode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDPairingCheckCommandResponseInfo setStatusCode:](v5, "setStatusCode:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lostModeInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDPairingCheckCommandResponseInfo setLostModeInfo:](v5, "setLostModeInfo:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("useEraseKeyType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDPairingCheckCommandResponseInfo setUseEraseKeyType:](v5, "setUseEraseKeyType:", v11);

  }
  return v5;
}

- (NSString)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (NSString)serverNonce
{
  return self->_serverNonce;
}

- (void)setServerNonce:(id)a3
{
  objc_storeStrong((id *)&self->_serverNonce, a3);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (NSString)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(id)a3
{
  objc_storeStrong((id *)&self->_statusCode, a3);
}

- (NSString)lostModeInfo
{
  return self->_lostModeInfo;
}

- (void)setLostModeInfo:(id)a3
{
  objc_storeStrong((id *)&self->_lostModeInfo, a3);
}

- (NSString)useEraseKeyType
{
  return self->_useEraseKeyType;
}

- (void)setUseEraseKeyType:(id)a3
{
  objc_storeStrong((id *)&self->_useEraseKeyType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useEraseKeyType, 0);
  objc_storeStrong((id *)&self->_lostModeInfo, 0);
  objc_storeStrong((id *)&self->_statusCode, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_serverNonce, 0);
  objc_storeStrong((id *)&self->_signature, 0);
}

@end
