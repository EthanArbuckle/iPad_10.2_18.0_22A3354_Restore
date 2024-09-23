@implementation ASAuthorizationSecurityKeyPublicKeyCredentialRegistration

- (id)_initWithBaseCredential:(id)a3 rawAttestationObject:(id)a4 transports:(id)a5
{
  id v8;
  id v9;
  id v10;
  ASAuthorizationSecurityKeyPublicKeyCredentialRegistration *v11;
  uint64_t v12;
  ASPublicKeyCredentialBase *baseCredential;
  uint64_t v14;
  NSArray *transports;
  ASAuthorizationSecurityKeyPublicKeyCredentialRegistration *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ASAuthorizationSecurityKeyPublicKeyCredentialRegistration;
  v11 = -[ASAuthorizationSecurityKeyPublicKeyCredentialRegistration init](&v18, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    baseCredential = v11->_baseCredential;
    v11->_baseCredential = (ASPublicKeyCredentialBase *)v12;

    objc_storeStrong((id *)&v11->_rawAttestationObject, a4);
    v14 = objc_msgSend(v10, "copy");
    transports = v11->_transports;
    v11->_transports = (NSArray *)v14;

    v16 = v11;
  }

  return v11;
}

- (ASAuthorizationSecurityKeyPublicKeyCredentialRegistration)initWithCoreCredential:(id)a3
{
  id v4;
  ASPublicKeyCredentialBase *v5;
  void *v6;
  void *v7;
  void *v8;
  ASPublicKeyCredentialBase *v9;
  void *v10;
  void *v11;
  void *v12;
  ASAuthorizationSecurityKeyPublicKeyCredentialRegistration *v13;

  v4 = a3;
  v5 = [ASPublicKeyCredentialBase alloc];
  objc_msgSend(v4, "credentialID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rawClientDataJSON");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ASPublicKeyCredentialBase initWithCredentialID:rawClientDataJSON:attachment:](v5, "initWithCredentialID:rawClientDataJSON:attachment:", v6, v7, +[ASAuthorizationPublicKeyCredentialConstants publicAttachmentFromInternal:](ASAuthorizationPublicKeyCredentialConstants, "publicAttachmentFromInternal:", v8));

  objc_msgSend(v4, "transports");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "attestationObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[ASAuthorizationSecurityKeyPublicKeyCredentialRegistration _initWithBaseCredential:rawAttestationObject:transports:](self, "_initWithBaseCredential:rawAttestationObject:transports:", v9, v12, v11);
  return v13;
}

__CFString *__84__ASAuthorizationSecurityKeyPublicKeyCredentialRegistration_initWithCoreCredential___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  unint64_t v3;
  __CFString *v4;
  NSObject *v5;

  v2 = a2;
  v3 = objc_msgSend(v2, "integerValue");
  if (v3 >= 7)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __84__ASAuthorizationSecurityKeyPublicKeyCredentialRegistration_initWithCoreCredential___block_invoke_cold_1(v5, v2);
    v4 = 0;
  }
  else
  {
    v4 = off_24C950D18[v3];
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithBaseCredential:rawAttestationObject:transports:", self->_baseCredential, self->_rawAttestationObject, self->_transports);
}

- (ASAuthorizationSecurityKeyPublicKeyCredentialRegistration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  ASAuthorizationSecurityKeyPublicKeyCredentialRegistration *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseCredential"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawAttestationObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("transports"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ASAuthorizationSecurityKeyPublicKeyCredentialRegistration _initWithBaseCredential:rawAttestationObject:transports:](self, "_initWithBaseCredential:rawAttestationObject:transports:", v5, v6, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  ASPublicKeyCredentialBase *baseCredential;
  id v5;

  baseCredential = self->_baseCredential;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", baseCredential, CFSTR("baseCredential"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rawAttestationObject, CFSTR("rawAttestationObject"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transports, CFSTR("transports"));

}

- (NSData)rawClientDataJSON
{
  return -[ASPublicKeyCredentialBase rawClientDataJSON](self->_baseCredential, "rawClientDataJSON");
}

- (NSData)credentialID
{
  return -[ASPublicKeyCredentialBase credentialID](self->_baseCredential, "credentialID");
}

- (NSData)rawAttestationObject
{
  return self->_rawAttestationObject;
}

- (NSArray)transports
{
  return self->_transports;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transports, 0);
  objc_storeStrong((id *)&self->_rawAttestationObject, 0);
  objc_storeStrong((id *)&self->_baseCredential, 0);
}

void __84__ASAuthorizationSecurityKeyPublicKeyCredentialRegistration_initWithCoreCredential___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = 134349056;
  v5 = objc_msgSend(a2, "integerValue");
  _os_log_error_impl(&dword_20E4D9000, v3, OS_LOG_TYPE_ERROR, "Unknown transport: %{public}ld", (uint8_t *)&v4, 0xCu);

}

@end
