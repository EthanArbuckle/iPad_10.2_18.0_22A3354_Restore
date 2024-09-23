@implementation IDSCertifiedDeliveryReplayKey

- (IDSCertifiedDeliveryReplayKey)initWithPayload:(id)a3 legacyIdentity:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  IDSCertifiedDeliveryReplayKey *v9;
  double v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  double v19;
  NSData *payloadHash;
  const char *v21;
  uint64_t v22;
  double v23;
  IDSCertifiedDeliveryReplayKey *v24;
  NSObject *v25;
  id v27;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)IDSCertifiedDeliveryReplayKey;
  v9 = -[IDSCertifiedDeliveryReplayKey init](&v28, sel_init);
  if (!v9)
    goto LABEL_7;
  if (v7)
  {
    v27 = 0;
    objc_msgSend_protectedHashOfMessageData_error_(v7, v8, (uint64_t)v6, v10, &v27);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v27;
    v16 = objc_msgSend_copy(v11, v13, v14, v15);
  }
  else
  {
    objc_msgSend_computeHashForMessage_(IDSNGMMessageHasher, v8, (uint64_t)v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_copy(v11, v17, v18, v19);
    v12 = 0;
  }
  payloadHash = v9->_payloadHash;
  v9->_payloadHash = (NSData *)v16;

  if (v9->_payloadHash)
  {

LABEL_7:
    v24 = v9;
    goto LABEL_11;
  }
  objc_msgSend_delivery(IDSFoundationLog, v21, v22, v23);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    sub_19BAF60DC(v7 == 0, (uint64_t)v12, v25);

  v24 = 0;
LABEL_11:

  return v24;
}

- (IDSCertifiedDeliveryReplayKey)initWithHash:(id)a3
{
  id v5;
  IDSCertifiedDeliveryReplayKey *v6;
  IDSCertifiedDeliveryReplayKey *v7;
  IDSCertifiedDeliveryReplayKey *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IDSCertifiedDeliveryReplayKey;
  v6 = -[IDSCertifiedDeliveryReplayKey init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    if (!v5)
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v6->_payloadHash, a3);
  }
  v8 = v7;
LABEL_6:

  return v8;
}

- (BOOL)isEqualToReplayKey:(id)a3
{
  double v3;
  void *v5;
  const char *v6;
  double v7;

  objc_msgSend_payloadHash(a3, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend_isEqual_(v5, v6, (uint64_t)self->_payloadHash, v7);

  return (char)self;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  char isEqualToReplayKey;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    isEqualToReplayKey = objc_msgSend_isEqualToReplayKey_(self, v5, (uint64_t)v4, v6);
  else
    isEqualToReplayKey = 0;

  return isEqualToReplayKey;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;

  return objc_msgSend_hash(self->_payloadHash, a2, v2, v3);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  double v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<%@: %p { hash: %@ }>"), v6, v4, self, self->_payloadHash);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSCertifiedDeliveryReplayKey)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  IDSCertifiedDeliveryReplayKey *v11;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("hash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (IDSCertifiedDeliveryReplayKey *)objc_msgSend_initWithHash_(self, v9, (uint64_t)v8, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  double v3;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_payloadHash, v3, CFSTR("hash"));
}

- (NSData)payloadHash
{
  return self->_payloadHash;
}

- (void)setPayloadHash:(id)a3
{
  objc_storeStrong((id *)&self->_payloadHash, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadHash, 0);
}

@end
