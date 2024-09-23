@implementation _DDUIArtificialPerson

- (id)initGuestPairPerson
{
  _DDUIArtificialPerson *v2;
  _DDUIArtificialPerson *v3;
  NSString *accountIdentifier;
  NSString *accountAltDSID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_DDUIArtificialPerson;
  v2 = -[_DDUIArtificialPerson init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    accountIdentifier = v2->_accountIdentifier;
    v2->_accountIdentifier = (NSString *)CFSTR("ddui@other.account.identifier");

    accountAltDSID = v3->_accountAltDSID;
    v3->_accountAltDSID = (NSString *)CFSTR("ddui@other.account.identifier");

  }
  return v3;
}

- (id)initSessionPairedPersonWithDevice:(id)a3
{
  id v4;
  _DDUIArtificialPerson *v5;
  _DDUIArtificialPerson *v6;
  NSString *accountIdentifier;
  NSString *accountAltDSID;
  void *v9;
  uint64_t v10;
  NSString *deviceModel;
  void *v12;
  uint64_t v13;
  NSString *identifier;
  void *v15;
  uint64_t v16;
  NSString *name;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_DDUIArtificialPerson;
  v5 = -[_DDUIArtificialPerson init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)CFSTR("ddui@session.paired.identifier");

    accountAltDSID = v6->_accountAltDSID;
    v6->_accountAltDSID = (NSString *)CFSTR("ddui@session.paired.identifier");

    objc_msgSend(v4, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    deviceModel = v6->_deviceModel;
    v6->_deviceModel = (NSString *)v10;

    objc_msgSend(v4, "idsDeviceIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v13;

    objc_msgSend(v4, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    name = v6->_name;
    v6->_name = (NSString *)v16;

  }
  return v6;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; name = \"%@\"; deviceModel = \"%@\"; identifier = \"%@\"; accountIdentifier = \"%@\">"),
                       objc_opt_class(),
                       self,
                       self->_name,
                       self->_deviceModel,
                       self->_identifier,
                       self->_accountIdentifier);
}

- (RPRemoteDisplayPerson)rapportPerson
{
  return self->rapportPerson;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)accountAltDSID
{
  return self->_accountAltDSID;
}

- (void)setAccountAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_accountAltDSID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->rapportPerson, 0);
}

@end
