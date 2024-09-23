@implementation CEMDeclarationBase

+ (NSString)declarationClass
{
  return 0;
}

+ (id)declarationForPayload:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("Type"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("(nil)");
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  if (+[CEMRegisteredTypeResolver registeredClassWithIdentifier:](CEMRegisteredTypeResolver, "registeredClassWithIdentifier:", v9))
  {
    v10 = (id)objc_opt_new();
    v17 = 0;
    objc_msgSend(v10, "loadDeclarationFromDictionary:error:", v5, &v17);
    v11 = v17;
    v12 = v11;
    if (!v11)
    {
      v10 = v10;
      v15 = v10;
      goto LABEL_12;
    }
    if (!a4)
    {
      v15 = 0;
      goto LABEL_12;
    }
    v13 = objc_retainAutorelease(v11);
    v12 = v13;
  }
  else
  {
    if (!a4)
    {
      v15 = 0;
      goto LABEL_13;
    }
    v14 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not match declaration type: %@"), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v10);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = 0;
  *a4 = v13;
LABEL_12:

LABEL_13:
  return v15;
}

+ (id)declarationForData:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    +[CEMDeclarationBase declarationForPayload:error:](CEMDeclarationBase, "declarationForPayload:error:", v5, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)loadDeclarationFromDictionary:(id)a3 error:(id *)a4
{
  id v6;
  NSString *v7;
  id v8;
  NSString *declarationType;
  NSString *v10;
  NSString *declarationIdentifier;
  NSString *v12;
  NSString *declarationDescription;
  NSString *v14;
  NSString *declarationServerHash;
  NSNumber *v16;
  NSNumber *declarationRequiresNetworkTether;
  NSString *v18;
  NSString *declarationActivationScope;
  BOOL v20;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v6 = a3;
  v33 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Type"), 1, 0, &v33);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = v33;
  declarationType = self->_declarationType;
  self->_declarationType = v7;

  if (v8)
    goto LABEL_7;
  v32 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Identifier"), 1, 0, &v32);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = v32;
  declarationIdentifier = self->_declarationIdentifier;
  self->_declarationIdentifier = v10;

  if (v8)
    goto LABEL_7;
  v31 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Description"), 0, 0, &v31);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = v31;
  declarationDescription = self->_declarationDescription;
  self->_declarationDescription = v12;

  if (v8)
    goto LABEL_7;
  v30 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ServerHash"), 1, 0, &v30);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = v30;
  declarationServerHash = self->_declarationServerHash;
  self->_declarationServerHash = v14;

  if (v8)
    goto LABEL_7;
  v29 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("RequiresNetworkTether"), 0, MEMORY[0x24BDBD1C0], &v29);
  v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v8 = v29;
  declarationRequiresNetworkTether = self->_declarationRequiresNetworkTether;
  self->_declarationRequiresNetworkTether = v16;

  if (v8
    || (v28 = 0,
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ActivationScope"), 0, 0, &v28), v18 = (NSString *)objc_claimAutoreleasedReturnValue(), v8 = v28, declarationActivationScope = self->_declarationActivationScope, self->_declarationActivationScope = v18, declarationActivationScope, v8))
  {
LABEL_7:
    v20 = 0;
    if (a4)
    {
LABEL_8:
      v8 = objc_retainAutorelease(v8);
      *a4 = v8;
    }
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Payload"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    v24 = (void *)MEMORY[0x24BDBD1B8];
    if (v22)
      v24 = (void *)v22;
    v25 = v24;

    v27 = 0;
    -[CEMPayloadBase loadPayload:error:](self, "loadPayload:error:", v25, &v27);

    v26 = v27;
    v8 = v26;
    v20 = v26 == 0;
    if (a4 && v26)
      goto LABEL_8;
  }

  return v20;
}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("Type"), self->_declarationType, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("Identifier"), self->_declarationIdentifier, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("Description"), self->_declarationDescription, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("ServerHash"), self->_declarationServerHash, 1, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("RequiresNetworkTether"), self->_declarationRequiresNetworkTether, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("ActivationScope"), self->_declarationActivationScope, 0, 0);
  -[CEMPayloadBase serializePayloadWithAssetProviders:](self, "serializePayloadWithAssetProviders:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Payload"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

- (id)serializeAsDataWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDD1770];
  -[CEMDeclarationBase serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v5, 200, 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateServerHash
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDD1770];
  -[CEMPayloadBase serializePayload](self, "serializePayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithPropertyList:format:options:error:", v4, 100, 0, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "CEMSHA1HexString");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_24C63AAC0;
  }
  objc_storeStrong((id *)&self->_declarationServerHash, v5);
  v6 = v7;
  if (v7)
  {

    v6 = v7;
  }

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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CEMDeclarationBase;
  v4 = -[CEMPayloadBase copyWithZone:](&v20, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_declarationType, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_declarationIdentifier, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_declarationDescription, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_declarationServerHash, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSNumber copy](self->_declarationRequiresNetworkTether, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSString copy](self->_declarationActivationScope, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[CEMAnyPayload copy](self->_declarationPayload, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  return v4;
}

- (NSString)declarationType
{
  return self->_declarationType;
}

- (void)setDeclarationType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)declarationIdentifier
{
  return self->_declarationIdentifier;
}

- (void)setDeclarationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)declarationDescription
{
  return self->_declarationDescription;
}

- (void)setDeclarationDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)declarationServerHash
{
  return self->_declarationServerHash;
}

- (void)setDeclarationServerHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)declarationRequiresNetworkTether
{
  return self->_declarationRequiresNetworkTether;
}

- (void)setDeclarationRequiresNetworkTether:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)declarationActivationScope
{
  return self->_declarationActivationScope;
}

- (void)setDeclarationActivationScope:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (CEMAnyPayload)declarationPayload
{
  return self->_declarationPayload;
}

- (void)setDeclarationPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declarationPayload, 0);
  objc_storeStrong((id *)&self->_declarationActivationScope, 0);
  objc_storeStrong((id *)&self->_declarationRequiresNetworkTether, 0);
  objc_storeStrong((id *)&self->_declarationServerHash, 0);
  objc_storeStrong((id *)&self->_declarationDescription, 0);
  objc_storeStrong((id *)&self->_declarationIdentifier, 0);
  objc_storeStrong((id *)&self->_declarationType, 0);
}

@end
