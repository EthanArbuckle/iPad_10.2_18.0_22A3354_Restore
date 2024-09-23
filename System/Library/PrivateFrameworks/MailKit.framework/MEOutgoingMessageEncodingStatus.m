@implementation MEOutgoingMessageEncodingStatus

- (MEOutgoingMessageEncodingStatus)initWithCanSign:(BOOL)canSign canEncrypt:(BOOL)canEncrypt securityError:(NSError *)securityError addressesFailingEncryption:(NSArray *)addressesFailingEncryption
{
  NSError *v11;
  NSArray *v12;
  MEOutgoingMessageEncodingStatus *v13;
  MEOutgoingMessageEncodingStatus *v14;
  objc_super v16;

  v11 = securityError;
  v12 = addressesFailingEncryption;
  v16.receiver = self;
  v16.super_class = (Class)MEOutgoingMessageEncodingStatus;
  v13 = -[MEOutgoingMessageEncodingStatus init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_canSign = canSign;
    v13->_canEncrypt = canEncrypt;
    objc_storeStrong((id *)&v13->_securityError, securityError);
    objc_storeStrong((id *)&v14->_addressesFailingEncryption, addressesFailingEncryption);
  }

  return v14;
}

- (MEOutgoingMessageEncodingStatus)initWithCanSign:(BOOL)a3 canEncrypt:(BOOL)a4 shouldSign:(BOOL)a5 shouldEncrypt:(BOOL)a6 securityError:(id)a7 addressesFailingEncryption:(id)a8
{
  id v15;
  id v16;
  MEOutgoingMessageEncodingStatus *v17;
  MEOutgoingMessageEncodingStatus *v18;
  objc_super v20;

  v15 = a7;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)MEOutgoingMessageEncodingStatus;
  v17 = -[MEOutgoingMessageEncodingStatus init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_canSign = a3;
    v17->_canEncrypt = a4;
    v17->_shouldSign = a5;
    v17->_shouldEncrypt = a6;
    objc_storeStrong((id *)&v17->_securityError, a7);
    objc_storeStrong((id *)&v18->_addressesFailingEncryption, a8);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEOutgoingMessageEncodingStatus)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  MEOutgoingMessageEncodingStatus *v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_canSign"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_canEncrypt"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_shouldSign"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_shouldEncrypt"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_securityError"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("EFPropertyKey_addressesFailingEncryption"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[MEOutgoingMessageEncodingStatus initWithCanSign:canEncrypt:shouldSign:shouldEncrypt:securityError:addressesFailingEncryption:](self, "initWithCanSign:canEncrypt:shouldSign:shouldEncrypt:securityError:addressesFailingEncryption:", v5, v6, v7, v8, v9, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeBool:forKey:", -[MEOutgoingMessageEncodingStatus canSign](self, "canSign"), CFSTR("EFPropertyKey_canSign"));
  objc_msgSend(v6, "encodeBool:forKey:", -[MEOutgoingMessageEncodingStatus canEncrypt](self, "canEncrypt"), CFSTR("EFPropertyKey_canEncrypt"));
  objc_msgSend(v6, "encodeBool:forKey:", -[MEOutgoingMessageEncodingStatus shouldSign](self, "shouldSign"), CFSTR("EFPropertyKey_shouldSign"));
  objc_msgSend(v6, "encodeBool:forKey:", -[MEOutgoingMessageEncodingStatus shouldEncrypt](self, "shouldEncrypt"), CFSTR("EFPropertyKey_shouldEncrypt"));
  -[MEOutgoingMessageEncodingStatus securityError](self, "securityError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_securityError"));

  -[MEOutgoingMessageEncodingStatus addressesFailingEncryption](self, "addressesFailingEncryption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_addressesFailingEncryption"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = -[MEOutgoingMessageEncodingStatus canSign](self, "canSign");
  v6 = -[MEOutgoingMessageEncodingStatus canEncrypt](self, "canEncrypt");
  -[MEOutgoingMessageEncodingStatus securityError](self, "securityError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ef_publicDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MEOutgoingMessageEncodingStatus addressesFailingEncryption](self, "addressesFailingEncryption");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: canSign: %d, canEncrypt: %d, securityError: %@, addressesFailingEncryption: %lu"), v4, v5, v6, v8, objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)canSign
{
  return self->_canSign;
}

- (BOOL)canEncrypt
{
  return self->_canEncrypt;
}

- (NSError)securityError
{
  return self->_securityError;
}

- (NSArray)addressesFailingEncryption
{
  return self->_addressesFailingEncryption;
}

- (BOOL)shouldSign
{
  return self->_shouldSign;
}

- (BOOL)shouldEncrypt
{
  return self->_shouldEncrypt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressesFailingEncryption, 0);
  objc_storeStrong((id *)&self->_securityError, 0);
}

@end
