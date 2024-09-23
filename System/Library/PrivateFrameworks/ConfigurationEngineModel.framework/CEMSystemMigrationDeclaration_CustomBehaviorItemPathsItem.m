@implementation CEMSystemMigrationDeclaration_CustomBehaviorItemPathsItem

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("SourcePath");
  v6[1] = CFSTR("SourcePathInUserHome");
  v6[2] = CFSTR("TargetPath");
  v6[3] = CFSTR("TargetPathInUserHome");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithSourcePath:(id)a3 withSourcePathInUserHome:(id)a4 withTargetPath:(id)a5 withTargetPathInUserHome:(id)a6
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
  objc_msgSend(v13, "setPayloadSourcePath:", v12);

  objc_msgSend(v13, "setPayloadSourcePathInUserHome:", v11);
  objc_msgSend(v13, "setPayloadTargetPath:", v10);

  objc_msgSend(v13, "setPayloadTargetPathInUserHome:", v9);
  return v13;
}

+ (id)buildRequiredOnlyWithSourcePath:(id)a3 withSourcePathInUserHome:(id)a4 withTargetPath:(id)a5 withTargetPathInUserHome:(id)a6
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
  objc_msgSend(v13, "setPayloadSourcePath:", v12);

  objc_msgSend(v13, "setPayloadSourcePathInUserHome:", v11);
  objc_msgSend(v13, "setPayloadTargetPath:", v10);

  objc_msgSend(v13, "setPayloadTargetPathInUserHome:", v9);
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
  NSString *payloadSourcePath;
  NSNumber *v16;
  NSNumber *payloadSourcePathInUserHome;
  NSString *v18;
  NSString *payloadTargetPath;
  NSNumber *v20;
  NSNumber *payloadTargetPathInUserHome;
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

  +[CEMSystemMigrationDeclaration_CustomBehaviorItemPathsItem allowedPayloadKeys](CEMSystemMigrationDeclaration_CustomBehaviorItemPathsItem, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v26 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SourcePath"), 1, 0, &v26);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v26;
  payloadSourcePath = self->_payloadSourcePath;
  self->_payloadSourcePath = v13;

  if (!v14)
  {
    v25 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SourcePathInUserHome"), 1, 0, &v25);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v25;
    payloadSourcePathInUserHome = self->_payloadSourcePathInUserHome;
    self->_payloadSourcePathInUserHome = v16;

    if (!v14)
    {
      v24 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("TargetPath"), 1, 0, &v24);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v24;
      payloadTargetPath = self->_payloadTargetPath;
      self->_payloadTargetPath = v18;

      if (!v14)
      {
        v23 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("TargetPathInUserHome"), 1, 0, &v23);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v23;
        payloadTargetPathInUserHome = self->_payloadTargetPathInUserHome;
        self->_payloadTargetPathInUserHome = v20;

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
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("SourcePath"), self->_payloadSourcePath, 1, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("SourcePathInUserHome"), self->_payloadSourcePathInUserHome, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("TargetPath"), self->_payloadTargetPath, 1, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("TargetPathInUserHome"), self->_payloadTargetPathInUserHome, 1, 0);
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
  v14.super_class = (Class)CEMSystemMigrationDeclaration_CustomBehaviorItemPathsItem;
  v4 = -[CEMPayloadBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadSourcePath, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSNumber copy](self->_payloadSourcePathInUserHome, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_payloadTargetPath, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSNumber copy](self->_payloadTargetPathInUserHome, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)payloadSourcePath
{
  return self->_payloadSourcePath;
}

- (void)setPayloadSourcePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)payloadSourcePathInUserHome
{
  return self->_payloadSourcePathInUserHome;
}

- (void)setPayloadSourcePathInUserHome:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)payloadTargetPath
{
  return self->_payloadTargetPath;
}

- (void)setPayloadTargetPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)payloadTargetPathInUserHome
{
  return self->_payloadTargetPathInUserHome;
}

- (void)setPayloadTargetPathInUserHome:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadTargetPathInUserHome, 0);
  objc_storeStrong((id *)&self->_payloadTargetPath, 0);
  objc_storeStrong((id *)&self->_payloadSourcePathInUserHome, 0);
  objc_storeStrong((id *)&self->_payloadSourcePath, 0);
}

@end
