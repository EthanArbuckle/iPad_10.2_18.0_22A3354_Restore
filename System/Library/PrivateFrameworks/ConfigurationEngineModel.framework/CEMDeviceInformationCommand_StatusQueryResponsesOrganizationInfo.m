@implementation CEMDeviceInformationCommand_StatusQueryResponsesOrganizationInfo

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("OrganizationName");
  v6[1] = CFSTR("OrganizationAddress");
  v6[2] = CFSTR("OrganizationPhone");
  v6[3] = CFSTR("OrganizationEmail");
  v6[4] = CFSTR("OrganizationMagic");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithOrganizationName:(id)a3 withOrganizationAddress:(id)a4 withOrganizationPhone:(id)a5 withOrganizationEmail:(id)a6 withOrganizationMagic:(id)a7
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
  objc_msgSend(v16, "setStatusOrganizationName:", v15);

  objc_msgSend(v16, "setStatusOrganizationAddress:", v14);
  objc_msgSend(v16, "setStatusOrganizationPhone:", v13);

  objc_msgSend(v16, "setStatusOrganizationEmail:", v12);
  objc_msgSend(v16, "setStatusOrganizationMagic:", v11);

  return v16;
}

+ (id)buildRequiredOnlyWithOrganizationName:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setStatusOrganizationName:", v3);

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  NSString *v15;
  NSString *statusOrganizationName;
  NSString *v17;
  NSString *statusOrganizationAddress;
  NSString *v19;
  NSString *statusOrganizationPhone;
  NSString *v21;
  NSString *statusOrganizationEmail;
  NSString *v23;
  NSString *statusOrganizationMagic;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMDeviceInformationCommand_StatusQueryResponsesOrganizationInfo allowedStatusKeys](CEMDeviceInformationCommand_StatusQueryResponsesOrganizationInfo, "allowedStatusKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  if (objc_msgSend(v9, "count"))
  {
    if (!a4)
    {
      v14 = 0;
      goto LABEL_14;
    }
    v11 = (void *)MEMORY[0x24BDD1540];
    v31 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected payload keys: %@"), v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v32[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v14 = 0;
  }
  else
  {
    v30 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OrganizationName"), 1, 0, &v30);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    v12 = v30;
    statusOrganizationName = self->_statusOrganizationName;
    self->_statusOrganizationName = v15;

    if (!v12)
    {
      v29 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OrganizationAddress"), 0, 0, &v29);
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      v12 = v29;
      statusOrganizationAddress = self->_statusOrganizationAddress;
      self->_statusOrganizationAddress = v17;

      if (!v12)
      {
        v28 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OrganizationPhone"), 0, 0, &v28);
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        v12 = v28;
        statusOrganizationPhone = self->_statusOrganizationPhone;
        self->_statusOrganizationPhone = v19;

        if (!v12)
        {
          v27 = 0;
          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OrganizationEmail"), 0, 0, &v27);
          v21 = (NSString *)objc_claimAutoreleasedReturnValue();
          v12 = v27;
          statusOrganizationEmail = self->_statusOrganizationEmail;
          self->_statusOrganizationEmail = v21;

          if (!v12)
          {
            v26 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OrganizationMagic"), 0, 0, &v26);
            v23 = (NSString *)objc_claimAutoreleasedReturnValue();
            v12 = v26;
            statusOrganizationMagic = self->_statusOrganizationMagic;
            self->_statusOrganizationMagic = v23;

          }
        }
      }
    }
    v14 = v12 == 0;
    if (a4 && v12)
    {
      v12 = objc_retainAutorelease(v12);
      v14 = 0;
      *a4 = v12;
    }
  }

LABEL_14:
  return v14;
}

- (id)serializePayload
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("OrganizationName"), self->_statusOrganizationName, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("OrganizationAddress"), self->_statusOrganizationAddress, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("OrganizationPhone"), self->_statusOrganizationPhone, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("OrganizationEmail"), self->_statusOrganizationEmail, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("OrganizationMagic"), self->_statusOrganizationMagic, 0, 0);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
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
  v16.super_class = (Class)CEMDeviceInformationCommand_StatusQueryResponsesOrganizationInfo;
  v4 = -[CEMPayloadBase copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_statusOrganizationName, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_statusOrganizationAddress, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_statusOrganizationPhone, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_statusOrganizationEmail, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSString copy](self->_statusOrganizationMagic, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSString)statusOrganizationName
{
  return self->_statusOrganizationName;
}

- (void)setStatusOrganizationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)statusOrganizationAddress
{
  return self->_statusOrganizationAddress;
}

- (void)setStatusOrganizationAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)statusOrganizationPhone
{
  return self->_statusOrganizationPhone;
}

- (void)setStatusOrganizationPhone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)statusOrganizationEmail
{
  return self->_statusOrganizationEmail;
}

- (void)setStatusOrganizationEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)statusOrganizationMagic
{
  return self->_statusOrganizationMagic;
}

- (void)setStatusOrganizationMagic:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusOrganizationMagic, 0);
  objc_storeStrong((id *)&self->_statusOrganizationEmail, 0);
  objc_storeStrong((id *)&self->_statusOrganizationPhone, 0);
  objc_storeStrong((id *)&self->_statusOrganizationAddress, 0);
  objc_storeStrong((id *)&self->_statusOrganizationName, 0);
}

@end
