@implementation CEMNetworkVPNDeclaration_SecurityAssociationParameters

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("EncryptionAlgorithm");
  v6[1] = CFSTR("IntegrityAlgorithm");
  v6[2] = CFSTR("DiffieHellmanGroup");
  v6[3] = CFSTR("LifeTimeInMinutes");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithEncryptionAlgorithm:(id)a3 withIntegrityAlgorithm:(id)a4 withDiffieHellmanGroup:(id)a5 withLifeTimeInMinutes:(id)a6
{
  id v9;
  id v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;

  v9 = a6;
  v10 = a5;
  v11 = (__CFString *)a4;
  v12 = (__CFString *)a3;
  v13 = (void *)objc_opt_new();
  v14 = v13;
  if (v12)
    v15 = v12;
  else
    v15 = CFSTR("AES-256");
  objc_msgSend(v13, "setPayloadEncryptionAlgorithm:", v15);

  if (v11)
    v16 = v11;
  else
    v16 = CFSTR("SHA2-256");
  objc_msgSend(v14, "setPayloadIntegrityAlgorithm:", v16);

  if (v10)
    v17 = v10;
  else
    v17 = &unk_24C69CDA0;
  objc_msgSend(v14, "setPayloadDiffieHellmanGroup:", v17);

  if (v9)
    v18 = v9;
  else
    v18 = &unk_24C69CDB8;
  objc_msgSend(v14, "setPayloadLifeTimeInMinutes:", v18);

  return v14;
}

+ (id)buildRequiredOnly
{
  return (id)objc_opt_new();
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *unknownPayloadKeys;
  NSString *v13;
  id v14;
  NSString *payloadEncryptionAlgorithm;
  NSString *v16;
  NSString *payloadIntegrityAlgorithm;
  NSNumber *v18;
  NSNumber *payloadDiffieHellmanGroup;
  NSNumber *v20;
  NSNumber *payloadLifeTimeInMinutes;
  id v23;
  id v24;
  id v25;
  id v26;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMNetworkVPNDeclaration_SecurityAssociationParameters allowedPayloadKeys](CEMNetworkVPNDeclaration_SecurityAssociationParameters, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v26 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EncryptionAlgorithm"), 0, CFSTR("AES-256"), &v26);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v26;
  payloadEncryptionAlgorithm = self->_payloadEncryptionAlgorithm;
  self->_payloadEncryptionAlgorithm = v13;

  if (!v14)
  {
    v25 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IntegrityAlgorithm"), 0, CFSTR("SHA2-256"), &v25);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v25;
    payloadIntegrityAlgorithm = self->_payloadIntegrityAlgorithm;
    self->_payloadIntegrityAlgorithm = v16;

    if (!v14)
    {
      v24 = 0;
      -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DiffieHellmanGroup"), 0, &unk_24C69CDA0, &v24);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v24;
      payloadDiffieHellmanGroup = self->_payloadDiffieHellmanGroup;
      self->_payloadDiffieHellmanGroup = v18;

      if (!v14)
      {
        v23 = 0;
        -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("LifeTimeInMinutes"), 0, &unk_24C69CDB8, &v23);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v23;
        payloadLifeTimeInMinutes = self->_payloadLifeTimeInMinutes;
        self->_payloadLifeTimeInMinutes = v20;

      }
    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("EncryptionAlgorithm"), self->_payloadEncryptionAlgorithm, 0, CFSTR("AES-256"));
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("IntegrityAlgorithm"), self->_payloadIntegrityAlgorithm, 0, CFSTR("SHA2-256"));
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("DiffieHellmanGroup"), self->_payloadDiffieHellmanGroup, 0, &unk_24C69CDA0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("LifeTimeInMinutes"), self->_payloadLifeTimeInMinutes, 0, &unk_24C69CDB8);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CEMNetworkVPNDeclaration_SecurityAssociationParameters;
  v4 = -[CEMPayloadBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadEncryptionAlgorithm, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadIntegrityAlgorithm, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_payloadDiffieHellmanGroup, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSNumber copy](self->_payloadLifeTimeInMinutes, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)payloadEncryptionAlgorithm
{
  return self->_payloadEncryptionAlgorithm;
}

- (void)setPayloadEncryptionAlgorithm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadIntegrityAlgorithm
{
  return self->_payloadIntegrityAlgorithm;
}

- (void)setPayloadIntegrityAlgorithm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)payloadDiffieHellmanGroup
{
  return self->_payloadDiffieHellmanGroup;
}

- (void)setPayloadDiffieHellmanGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)payloadLifeTimeInMinutes
{
  return self->_payloadLifeTimeInMinutes;
}

- (void)setPayloadLifeTimeInMinutes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadLifeTimeInMinutes, 0);
  objc_storeStrong((id *)&self->_payloadDiffieHellmanGroup, 0);
  objc_storeStrong((id *)&self->_payloadIntegrityAlgorithm, 0);
  objc_storeStrong((id *)&self->_payloadEncryptionAlgorithm, 0);
}

@end
