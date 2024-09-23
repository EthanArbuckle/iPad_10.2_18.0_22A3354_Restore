@implementation ACHSyncIdentity

- (ACHSyncIdentity)initWithHardwareIdentifier:(id)a3 databaseIdentifier:(id)a4 instanceDiscriminator:(id)a5
{
  id v9;
  id v10;
  id v11;
  ACHSyncIdentity *v12;
  ACHSyncIdentity *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ACHSyncIdentity;
  v12 = -[ACHSyncIdentity init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_hardwareIdentifier, a3);
    objc_storeStrong((id *)&v13->_databaseIdentifier, a4);
    objc_storeStrong((id *)&v13->_instanceDiscriminator, a5);
  }

  return v13;
}

- (NSData)hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

- (void)setHardwareIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareIdentifier, a3);
}

- (NSData)databaseIdentifier
{
  return self->_databaseIdentifier;
}

- (void)setDatabaseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_databaseIdentifier, a3);
}

- (NSString)instanceDiscriminator
{
  return self->_instanceDiscriminator;
}

- (void)setInstanceDiscriminator:(id)a3
{
  objc_storeStrong((id *)&self->_instanceDiscriminator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceDiscriminator, 0);
  objc_storeStrong((id *)&self->_databaseIdentifier, 0);
  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
}

@end
