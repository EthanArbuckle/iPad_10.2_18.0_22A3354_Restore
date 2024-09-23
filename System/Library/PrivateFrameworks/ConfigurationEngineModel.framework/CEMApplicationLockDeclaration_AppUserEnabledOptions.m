@implementation CEMApplicationLockDeclaration_AppUserEnabledOptions

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("VoiceOver");
  v6[1] = CFSTR("Zoom");
  v6[2] = CFSTR("InvertColors");
  v6[3] = CFSTR("AssistiveTouch");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithVoiceOver:(id)a3 withZoom:(id)a4 withInvertColors:(id)a5 withAssistiveTouch:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  v14 = v13;
  v15 = (void *)MEMORY[0x24BDBD1C0];
  if (v12)
    v16 = v12;
  else
    v16 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v13, "setPayloadVoiceOver:", v16);

  if (v11)
    v17 = v11;
  else
    v17 = v15;
  objc_msgSend(v14, "setPayloadZoom:", v17);

  if (v10)
    v18 = v10;
  else
    v18 = v15;
  objc_msgSend(v14, "setPayloadInvertColors:", v18);

  if (v9)
    v19 = v9;
  else
    v19 = v15;
  objc_msgSend(v14, "setPayloadAssistiveTouch:", v19);

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
  NSNumber *v13;
  id v14;
  NSNumber *payloadVoiceOver;
  NSNumber *v16;
  NSNumber *payloadZoom;
  NSNumber *v18;
  NSNumber *payloadInvertColors;
  NSNumber *v20;
  NSNumber *payloadAssistiveTouch;
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

  +[CEMApplicationLockDeclaration_AppUserEnabledOptions allowedPayloadKeys](CEMApplicationLockDeclaration_AppUserEnabledOptions, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v26 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("VoiceOver"), 0, MEMORY[0x24BDBD1C0], &v26);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v26;
  payloadVoiceOver = self->_payloadVoiceOver;
  self->_payloadVoiceOver = v13;

  if (!v14)
  {
    v25 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Zoom"), 0, MEMORY[0x24BDBD1C0], &v25);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v25;
    payloadZoom = self->_payloadZoom;
    self->_payloadZoom = v16;

    if (!v14)
    {
      v24 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("InvertColors"), 0, MEMORY[0x24BDBD1C0], &v24);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v24;
      payloadInvertColors = self->_payloadInvertColors;
      self->_payloadInvertColors = v18;

      if (!v14)
      {
        v23 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AssistiveTouch"), 0, MEMORY[0x24BDBD1C0], &v23);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v23;
        payloadAssistiveTouch = self->_payloadAssistiveTouch;
        self->_payloadAssistiveTouch = v20;

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
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("VoiceOver"), self->_payloadVoiceOver, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Zoom"), self->_payloadZoom, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("InvertColors"), self->_payloadInvertColors, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("AssistiveTouch"), self->_payloadAssistiveTouch, 0, v5);
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
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CEMApplicationLockDeclaration_AppUserEnabledOptions;
  v4 = -[CEMPayloadBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadVoiceOver, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSNumber copy](self->_payloadZoom, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_payloadInvertColors, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSNumber copy](self->_payloadAssistiveTouch, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSNumber)payloadVoiceOver
{
  return self->_payloadVoiceOver;
}

- (void)setPayloadVoiceOver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)payloadZoom
{
  return self->_payloadZoom;
}

- (void)setPayloadZoom:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)payloadInvertColors
{
  return self->_payloadInvertColors;
}

- (void)setPayloadInvertColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)payloadAssistiveTouch
{
  return self->_payloadAssistiveTouch;
}

- (void)setPayloadAssistiveTouch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAssistiveTouch, 0);
  objc_storeStrong((id *)&self->_payloadInvertColors, 0);
  objc_storeStrong((id *)&self->_payloadZoom, 0);
  objc_storeStrong((id *)&self->_payloadVoiceOver, 0);
}

@end
