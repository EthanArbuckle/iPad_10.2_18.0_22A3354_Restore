@implementation UARPTLVMeasuredPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPTLVMeasuredPayload)initWithCoder:(id)a3
{
  id v4;
  UARPTLVMeasuredPayload *v5;
  uint64_t v6;
  NSString *payload4cc;
  uint64_t v8;
  NSString *payloadLongname;
  uint64_t v10;
  NSNumber *effectiveSecurityMode;
  uint64_t v12;
  NSNumber *effectiveProductionMode;
  uint64_t v14;
  NSNumber *isTrusted;
  uint64_t v16;
  NSNumber *digestListSize;
  uint64_t v18;
  NSData *payloadDigest;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UARPTLVMeasuredPayload;
  v5 = -[UARPTLVMeasuredPayload init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload4cc"));
    v6 = objc_claimAutoreleasedReturnValue();
    payload4cc = v5->_payload4cc;
    v5->_payload4cc = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payloadLongname"));
    v8 = objc_claimAutoreleasedReturnValue();
    payloadLongname = v5->_payloadLongname;
    v5->_payloadLongname = (NSString *)v8;

    v5->_hashAlgorithm = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hashAlgorithm"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("effectiveSecurityMode"));
    v10 = objc_claimAutoreleasedReturnValue();
    effectiveSecurityMode = v5->_effectiveSecurityMode;
    v5->_effectiveSecurityMode = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("effectiveProductionMode"));
    v12 = objc_claimAutoreleasedReturnValue();
    effectiveProductionMode = v5->_effectiveProductionMode;
    v5->_effectiveProductionMode = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isTrusted"));
    v14 = objc_claimAutoreleasedReturnValue();
    isTrusted = v5->_isTrusted;
    v5->_isTrusted = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("digestListSize"));
    v16 = objc_claimAutoreleasedReturnValue();
    digestListSize = v5->_digestListSize;
    v5->_digestListSize = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payloadDigest"));
    v18 = objc_claimAutoreleasedReturnValue();
    payloadDigest = v5->_payloadDigest;
    v5->_payloadDigest = (NSData *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *payload4cc;
  id v5;

  payload4cc = self->_payload4cc;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", payload4cc, CFSTR("payload4cc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payloadLongname, CFSTR("payloadLongname"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_hashAlgorithm, CFSTR("hashAlgorithm"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_effectiveSecurityMode, CFSTR("effectiveSecurityMode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_effectiveProductionMode, CFSTR("effectiveProductionMode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isTrusted, CFSTR("isTrusted"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_digestListSize, CFSTR("digestListSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payloadDigest, CFSTR("payloadDigest"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  UARPTLVMeasuredPayload *v4;
  uint64_t v5;
  NSString *payload4cc;
  uint64_t v7;
  NSString *payloadLongname;

  v4 = objc_alloc_init(UARPTLVMeasuredPayload);
  v5 = -[NSString copy](self->_payload4cc, "copy");
  payload4cc = v4->_payload4cc;
  v4->_payload4cc = (NSString *)v5;

  v7 = -[NSString copy](self->_payloadLongname, "copy");
  payloadLongname = v4->_payloadLongname;
  v4->_payloadLongname = (NSString *)v7;

  v4->_hashAlgorithm = self->_hashAlgorithm;
  objc_storeStrong((id *)&v4->_effectiveSecurityMode, self->_effectiveSecurityMode);
  objc_storeStrong((id *)&v4->_effectiveProductionMode, self->_effectiveProductionMode);
  objc_storeStrong((id *)&v4->_isTrusted, self->_isTrusted);
  objc_storeStrong((id *)&v4->_digestListSize, self->_digestListSize);
  objc_storeStrong((id *)&v4->_payloadDigest, self->_payloadDigest);
  return v4;
}

- (NSString)payload4cc
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPayload4cc:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)payloadLongname
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPayloadLongname:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (int64_t)hashAlgorithm
{
  return self->_hashAlgorithm;
}

- (void)setHashAlgorithm:(int64_t)a3
{
  self->_hashAlgorithm = a3;
}

- (NSNumber)effectiveSecurityMode
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEffectiveSecurityMode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSNumber)effectiveProductionMode
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEffectiveProductionMode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSNumber)isTrusted
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIsTrusted:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSNumber)digestListSize
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDigestListSize:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSData)payloadDigest
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPayloadDigest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDigest, 0);
  objc_storeStrong((id *)&self->_digestListSize, 0);
  objc_storeStrong((id *)&self->_isTrusted, 0);
  objc_storeStrong((id *)&self->_effectiveProductionMode, 0);
  objc_storeStrong((id *)&self->_effectiveSecurityMode, 0);
  objc_storeStrong((id *)&self->_payloadLongname, 0);
  objc_storeStrong((id *)&self->_payload4cc, 0);
}

@end
