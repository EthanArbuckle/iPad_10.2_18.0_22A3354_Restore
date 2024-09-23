@implementation MSPSharedTripSharingIdentity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSPSharedTripSharingIdentity)initWithCoder:(id)a3
{
  id v4;
  MSPSharedTripSharingIdentity *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *handle;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *aliases;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MSPSharedTripSharingIdentity;
  v5 = -[MSPSharedTripSharingIdentity init](&v16, sel_init);
  if (v5)
  {
    v5->_validAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_validAccount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_handle"));
    v8 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_aliases"));
    v13 = objc_claimAutoreleasedReturnValue();
    aliases = v5->_aliases;
    v5->_aliases = (NSArray *)v13;

  }
  return v5;
}

- (BOOL)hasValidAccount
{
  return self->_validAccount;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)MSPSharedTripSharingIdentity;
  -[MSPSharedTripSharingIdentity description](&v9, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_validAccount)
    v6 = "YES";
  else
    v6 = "NO";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (valid:%s, name:%@, handle:%@, aliases:%@)"), v4, v6, self->_name, self->_handle, self->_aliases);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MSPSharedTripSharingIdentity)initWithValidAccount:(BOOL)a3 name:(id)a4 handle:(id)a5 aliases:(id)a6
{
  id v11;
  id v12;
  id v13;
  MSPSharedTripSharingIdentity *v14;
  MSPSharedTripSharingIdentity *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MSPSharedTripSharingIdentity;
  v14 = -[MSPSharedTripSharingIdentity init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_validAccount = a3;
    objc_storeStrong((id *)&v14->_name, a4);
    objc_storeStrong((id *)&v15->_handle, a5);
    objc_storeStrong((id *)&v15->_aliases, a6);
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 validAccount;
  id v5;

  validAccount = self->_validAccount;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", validAccount, CFSTR("_validAccount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("_name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_handle, CFSTR("_handle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_aliases, CFSTR("_aliases"));

}

- (NSString)name
{
  return self->_name;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSArray)aliases
{
  return self->_aliases;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aliases, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
