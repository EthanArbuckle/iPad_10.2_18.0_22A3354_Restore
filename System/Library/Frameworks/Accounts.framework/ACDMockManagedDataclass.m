@implementation ACDMockManagedDataclass

- (id)name
{
  return self->name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->name, a3);
}

- (id)provisionedAccounts
{
  return self->provisionedAccounts;
}

- (void)setProvisionedAccounts:(id)a3
{
  objc_storeStrong((id *)&self->provisionedAccounts, a3);
}

- (id)syncableTypes
{
  return self->syncableTypes;
}

- (void)setSyncableTypes:(id)a3
{
  objc_storeStrong((id *)&self->syncableTypes, a3);
}

- (id)supportedTypes
{
  return self->supportedTypes;
}

- (void)setSupportedTypes:(id)a3
{
  objc_storeStrong((id *)&self->supportedTypes, a3);
}

- (id)enabledAccounts
{
  return self->enabledAccounts;
}

- (void)setEnabledAccounts:(id)a3
{
  objc_storeStrong((id *)&self->enabledAccounts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->enabledAccounts, 0);
  objc_storeStrong((id *)&self->supportedTypes, 0);
  objc_storeStrong((id *)&self->syncableTypes, 0);
  objc_storeStrong((id *)&self->provisionedAccounts, 0);
  objc_storeStrong((id *)&self->name, 0);
}

@end
