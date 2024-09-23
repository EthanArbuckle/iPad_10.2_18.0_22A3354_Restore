@implementation EMAccount

- (id)ef_publicDescription
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternal");

  if (v4)
  {
    -[EMObject debugDescription](self, "debugDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EMObject objectID](self, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringHash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_opt_class();
    objc_msgSend(v7, "ef_publicDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p>\n\tObjectID:%@"), v9, self, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  if ((objc_msgSend(v5, "isEqual:", objc_opt_class()) & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v4;
    -[EMObject objectID](self, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)hostname
{
  return self->_hostname;
}

- (BOOL)isPrimaryiCloudAccount
{
  return self->_primaryiCloudAccount;
}

+ (id)predicateForReceivingAccounts
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self isKindOfClass: %@"), objc_opt_class());
}

+ (id)predicateForDeliveryAccounts
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self isKindOfClass: %@"), objc_opt_class());
}

+ (id)sortDescriptorForNameAscending:(BOOL)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D1F078], "sortDescriptorWithKey:ascending:", CFSTR("name"), a3);
}

@end
