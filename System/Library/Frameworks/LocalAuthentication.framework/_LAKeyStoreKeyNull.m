@implementation _LAKeyStoreKeyNull

- (_LAKeyStoreKeyNull)init
{
  _LAKeyStoreKeyNull *v2;
  void *v3;
  uint64_t v4;
  NSString *identifier;
  uint64_t v6;
  NSData *acl;
  NSString *publicKeyHash;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_LAKeyStoreKeyNull;
  v2 = -[_LAKeyStoreKeyNull init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

    +[LASecAccessControl serializeACL:](LASecAccessControl, "serializeACL:", +[LASecAccessControl denyAllACL](LASecAccessControl, "denyAllACL"));
    v6 = objc_claimAutoreleasedReturnValue();
    acl = v2->_acl;
    v2->_acl = (NSData *)v6;

    publicKeyHash = v2->_publicKeyHash;
    v2->_publicKeyHash = (NSString *)&stru_1E707B3F8;

  }
  return v2;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)acl
{
  return self->_acl;
}

- (NSData)publicKeyHash
{
  return (NSData *)objc_alloc_init(MEMORY[0x1E0C99D50]);
}

- (void)exportBytesWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[LAAuthorizationError resourceNotFound](LAAuthorizationError, "resourceNotFound");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v4, 0, v5);

}

- (void)signData:(id)a3 secKeyAlgorithm:(__CFString *)a4 context:(id)a5 completion:(id)a6
{
  id v7;
  id v8;

  v7 = a6;
  +[LAAuthorizationError resourceNotFound](LAAuthorizationError, "resourceNotFound");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a6 + 2))(v7, 0, v8);

}

- (BOOL)canSignUsingSecKeyAlgorithm:(__CFString *)a3
{
  return 0;
}

- (void)decryptData:(id)a3 secKeyAlgorithm:(__CFString *)a4 context:(id)a5 completion:(id)a6
{
  id v7;
  id v8;

  v7 = a6;
  +[LAAuthorizationError resourceNotFound](LAAuthorizationError, "resourceNotFound");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a6 + 2))(v7, 0, v8);

}

- (BOOL)canDecryptUsingSecKeyAlgorithm:(__CFString *)a3
{
  return 0;
}

- (void)exchangeKeysWithPublicKey:(id)a3 secKeyAlgorithm:(__CFString *)a4 secKeyParameters:(id)a5 context:(id)a6 completion:(id)a7
{
  id v8;
  id v9;

  v8 = a7;
  +[LAAuthorizationError resourceNotFound](LAAuthorizationError, "resourceNotFound");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a7 + 2))(v8, 0, v9);

}

- (BOOL)canExchangeKeysUsingSecKeyAlgorithm:(__CFString *)a3
{
  return 0;
}

- (void)encryptData:(id)a3 secKeyAlgorithm:(__CFString *)a4 completion:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  +[LAAuthorizationError resourceNotFound](LAAuthorizationError, "resourceNotFound");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a5 + 2))(v6, 0, v7);

}

- (BOOL)canEncryptUsingSecKeyAlgorithm:(__CFString *)a3
{
  return 0;
}

- (void)verifyData:(id)a3 signature:(id)a4 secKeyAlgorithm:(__CFString *)a5 completion:(id)a6
{
  id v7;
  id v8;

  v7 = a6;
  +[LAAuthorizationError resourceNotFound](LAAuthorizationError, "resourceNotFound");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a6 + 2))(v7, v8);

}

- (BOOL)canVerifyUsingSecKeyAlgorithm:(__CFString *)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_acl, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
