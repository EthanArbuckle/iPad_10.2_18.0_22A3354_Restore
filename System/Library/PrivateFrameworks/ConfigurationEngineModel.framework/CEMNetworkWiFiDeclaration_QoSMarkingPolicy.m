@implementation CEMNetworkWiFiDeclaration_QoSMarkingPolicy

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("QoSMarkingWhitelistedAppIdentifiers");
  v6[1] = CFSTR("QoSMarkingAppleAudioVideoCalls");
  v6[2] = CFSTR("QoSMarkingEnabled");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithQoSMarkingWhitelistedAppIdentifiers:(id)a3 withQoSMarkingAppleAudioVideoCalls:(id)a4 withQoSMarkingEnabled:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setPayloadQoSMarkingWhitelistedAppIdentifiers:", v9);

  v11 = (void *)MEMORY[0x24BDBD1C8];
  if (v8)
    v12 = v8;
  else
    v12 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v10, "setPayloadQoSMarkingAppleAudioVideoCalls:", v12);

  if (v7)
    v13 = v7;
  else
    v13 = v11;
  objc_msgSend(v10, "setPayloadQoSMarkingEnabled:", v13);

  return v10;
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
  NSArray *v13;
  id v14;
  NSArray *payloadQoSMarkingWhitelistedAppIdentifiers;
  NSNumber *v16;
  NSNumber *payloadQoSMarkingAppleAudioVideoCalls;
  NSNumber *v18;
  NSNumber *payloadQoSMarkingEnabled;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMNetworkWiFiDeclaration_QoSMarkingPolicy allowedPayloadKeys](CEMNetworkWiFiDeclaration_QoSMarkingPolicy, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v23 = 0;
  -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("QoSMarkingWhitelistedAppIdentifiers"), &__block_literal_global_499, 0, 0, &v23);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  payloadQoSMarkingWhitelistedAppIdentifiers = self->_payloadQoSMarkingWhitelistedAppIdentifiers;
  self->_payloadQoSMarkingWhitelistedAppIdentifiers = v13;

  if (!v14)
  {
    v22 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("QoSMarkingAppleAudioVideoCalls"), 0, MEMORY[0x24BDBD1C8], &v22);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v22;
    payloadQoSMarkingAppleAudioVideoCalls = self->_payloadQoSMarkingAppleAudioVideoCalls;
    self->_payloadQoSMarkingAppleAudioVideoCalls = v16;

    if (!v14)
    {
      v21 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("QoSMarkingEnabled"), 0, MEMORY[0x24BDBD1C8], &v21);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v21;
      payloadQoSMarkingEnabled = self->_payloadQoSMarkingEnabled;
      self->_payloadQoSMarkingEnabled = v18;

    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("QoSMarkingWhitelistedAppIdentifiers"), self->_payloadQoSMarkingWhitelistedAppIdentifiers, &__block_literal_global_500, 0, 0);
  v5 = MEMORY[0x24BDBD1C8];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("QoSMarkingAppleAudioVideoCalls"), self->_payloadQoSMarkingAppleAudioVideoCalls, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("QoSMarkingEnabled"), self->_payloadQoSMarkingEnabled, 0, v5);
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CEMNetworkWiFiDeclaration_QoSMarkingPolicy;
  v4 = -[CEMPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_payloadQoSMarkingWhitelistedAppIdentifiers, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSNumber copy](self->_payloadQoSMarkingAppleAudioVideoCalls, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_payloadQoSMarkingEnabled, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSArray)payloadQoSMarkingWhitelistedAppIdentifiers
{
  return self->_payloadQoSMarkingWhitelistedAppIdentifiers;
}

- (void)setPayloadQoSMarkingWhitelistedAppIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)payloadQoSMarkingAppleAudioVideoCalls
{
  return self->_payloadQoSMarkingAppleAudioVideoCalls;
}

- (void)setPayloadQoSMarkingAppleAudioVideoCalls:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)payloadQoSMarkingEnabled
{
  return self->_payloadQoSMarkingEnabled;
}

- (void)setPayloadQoSMarkingEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadQoSMarkingEnabled, 0);
  objc_storeStrong((id *)&self->_payloadQoSMarkingAppleAudioVideoCalls, 0);
  objc_storeStrong((id *)&self->_payloadQoSMarkingWhitelistedAppIdentifiers, 0);
}

@end
