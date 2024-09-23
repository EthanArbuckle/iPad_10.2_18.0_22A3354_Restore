@implementation SOKerberosCredential

- (SOKerberosCredential)init
{
  SOKerberosCredential *v2;
  SOKerberosCredential *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SOKerberosCredential;
  v2 = -[SOKerberosCredential init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SOKerberosCredential setName:](v2, "setName:", &stru_24D3EC758);
    -[SOKerberosCredential setLifetime:](v3, "setLifetime:", 0);
    -[SOKerberosCredential setUuid:](v3, "setUuid:", &stru_24D3EC758);
  }
  return v3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unsigned)lifetime
{
  return self->_lifetime;
}

- (void)setLifetime:(unsigned int)a3
{
  self->_lifetime = a3;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
