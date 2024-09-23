@implementation _DDUIRapportDevice

- (_DDUIRapportDevice)initWithRPCompanionLinkDevice:(id)a3
{
  id v4;
  _DDUIRapportDevice *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *model;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *identifier;
  uint64_t v14;
  NSString *accountIdentifier;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_DDUIRapportDevice;
  v5 = -[_DDUIRapportDevice init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "model");
    v8 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v8;

    objc_msgSend(v4, "idsDeviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(v4, "identifier");
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    identifier = v5->_identifier;
    v5->_identifier = v12;

    objc_msgSend(v4, "accountID");
    v14 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v14;

    v5->_deviceType = DDUIDeviceTypeForModelString(v5->_model);
    v5->_isMine = (objc_msgSend(v4, "statusFlags") & 0x80000) != 0;
  }

  return v5;
}

- (_DDUIRapportDevice)initWithIncomingMessageOptions:(id)a3
{
  id v4;
  _DDUIRapportDevice *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSString *model;
  uint64_t v12;
  NSString *accountIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_DDUIRapportDevice;
  v5 = -[_DDUIRapportDevice init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("senderDeviceName"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D839C8]);
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D839D0]);
    v10 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v10;

    v5->_isMine = (CFDictionaryGetInt64() & 0x80000) != 0;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("senderAccountID"));
    v12 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v12;

    v5->_deviceType = DDUIDeviceTypeForModelString(v5->_model);
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = CFSTR("YES");
  if (!self->_isMine)
    v5 = CFSTR("NO");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; name = \"%@\"; model = \"%@\"; identifier = \"%@\"; accountIdentifier = \"%@\"; deviceType = %u; isMine = %@>"),
                       v4,
                       self,
                       *(_OWORD *)&self->_name,
                       self->_identifier,
                       self->_accountIdentifier,
                       self->_deviceType,
                       v5);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentifier, a3);
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unsigned int)a3
{
  self->_deviceType = a3;
}

- (BOOL)isMine
{
  return self->_isMine;
}

- (void)setIsMine:(BOOL)a3
{
  self->_isMine = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
