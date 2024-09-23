@implementation CEMApplicationEnterpriseDeclaration_AppPackage

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("DataURL");
  v6[1] = CFSTR("ContentType");
  v6[2] = CFSTR("Size");
  v6[3] = CFSTR("Hash-SHA-256");
  v6[4] = CFSTR("CertificatePinningIdentifiers");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithDataURL:(id)a3 withContentType:(id)a4 withSize:(id)a5 withHashSHA256:(id)a6 withCertificatePinningIdentifiers:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setPayloadDataURL:", v15);

  objc_msgSend(v16, "setPayloadContentType:", v14);
  objc_msgSend(v16, "setPayloadSize:", v13);

  objc_msgSend(v16, "setPayloadHashSHA256:", v12);
  objc_msgSend(v16, "setPayloadCertificatePinningIdentifiers:", v11);

  return v16;
}

+ (id)buildRequiredOnlyWithDataURL:(id)a3 withContentType:(id)a4 withSize:(id)a5 withHashSHA256:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setPayloadDataURL:", v12);

  objc_msgSend(v13, "setPayloadContentType:", v11);
  objc_msgSend(v13, "setPayloadSize:", v10);

  objc_msgSend(v13, "setPayloadHashSHA256:", v9);
  return v13;
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
  NSString *payloadDataURL;
  NSString *v16;
  NSString *payloadContentType;
  NSNumber *v18;
  NSNumber *payloadSize;
  NSString *v20;
  NSString *payloadHashSHA256;
  NSArray *v22;
  NSArray *payloadCertificatePinningIdentifiers;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMApplicationEnterpriseDeclaration_AppPackage allowedPayloadKeys](CEMApplicationEnterpriseDeclaration_AppPackage, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v29 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DataURL"), 1, 0, &v29);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v29;
  payloadDataURL = self->_payloadDataURL;
  self->_payloadDataURL = v13;

  if (!v14)
  {
    v28 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ContentType"), 1, 0, &v28);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v28;
    payloadContentType = self->_payloadContentType;
    self->_payloadContentType = v16;

    if (!v14)
    {
      v27 = 0;
      -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Size"), 1, 0, &v27);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v27;
      payloadSize = self->_payloadSize;
      self->_payloadSize = v18;

      if (!v14)
      {
        v26 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Hash-SHA-256"), 1, 0, &v26);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v26;
        payloadHashSHA256 = self->_payloadHashSHA256;
        self->_payloadHashSHA256 = v20;

        if (!v14)
        {
          v25 = 0;
          -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("CertificatePinningIdentifiers"), &__block_literal_global_2, 0, 0, &v25);
          v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v14 = v25;
          payloadCertificatePinningIdentifiers = self->_payloadCertificatePinningIdentifiers;
          self->_payloadCertificatePinningIdentifiers = v22;

        }
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
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("DataURL"), self->_payloadDataURL, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ContentType"), self->_payloadContentType, 1, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Size"), self->_payloadSize, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Hash-SHA-256"), self->_payloadHashSHA256, 1, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("CertificatePinningIdentifiers"), self->_payloadCertificatePinningIdentifiers, &__block_literal_global_149, 0, 0);
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
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CEMApplicationEnterpriseDeclaration_AppPackage;
  v4 = -[CEMPayloadBase copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadDataURL, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadContentType, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_payloadSize, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_payloadHashSHA256, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSArray copy](self->_payloadCertificatePinningIdentifiers, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSString)payloadDataURL
{
  return self->_payloadDataURL;
}

- (void)setPayloadDataURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadContentType
{
  return self->_payloadContentType;
}

- (void)setPayloadContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)payloadSize
{
  return self->_payloadSize;
}

- (void)setPayloadSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)payloadHashSHA256
{
  return self->_payloadHashSHA256;
}

- (void)setPayloadHashSHA256:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)payloadCertificatePinningIdentifiers
{
  return self->_payloadCertificatePinningIdentifiers;
}

- (void)setPayloadCertificatePinningIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadCertificatePinningIdentifiers, 0);
  objc_storeStrong((id *)&self->_payloadHashSHA256, 0);
  objc_storeStrong((id *)&self->_payloadSize, 0);
  objc_storeStrong((id *)&self->_payloadContentType, 0);
  objc_storeStrong((id *)&self->_payloadDataURL, 0);
}

@end
