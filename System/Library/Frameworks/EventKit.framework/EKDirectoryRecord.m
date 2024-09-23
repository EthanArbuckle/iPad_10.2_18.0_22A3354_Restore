@implementation EKDirectoryRecord

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = objc_alloc(MEMORY[0x1E0D0C2D0]);
  v11.receiver = self;
  v11.super_class = (Class)EKDirectoryRecord;
  -[EKDirectoryRecord description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSuperclassDescription:", v4);

  -[EKDirectoryRecord displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withString:", CFSTR("displayName"), v6);

  -[EKDirectoryRecord preferredAddress](self, "preferredAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withString:", CFSTR("preferredAddress"), v7);

  -[EKDirectoryRecord principalPath](self, "principalPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withString:", CFSTR("principalPath"), v8);

  objc_msgSend(v5, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDictionary)userInfo
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[EKDirectoryRecord principalPath](self, "principalPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[EKDirectoryRecord principalPath](self, "principalPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, EKDirectoryRecordPrincipalPathKey);

  }
  return (NSDictionary *)v3;
}

+ (id)recordFromSearchResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayName:", v5);

  objc_msgSend(v3, "firstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFirstName:", v6);

  objc_msgSend(v3, "lastName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastName:", v7);

  objc_msgSend(v3, "preferredAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPreferredAddress:", v8);
  return v4;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_firstName, a3);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_storeStrong((id *)&self->_lastName, a3);
}

- (NSString)preferredAddress
{
  return self->_preferredAddress;
}

- (void)setPreferredAddress:(id)a3
{
  objc_storeStrong((id *)&self->_preferredAddress, a3);
}

- (NSString)principalPath
{
  return self->_principalPath;
}

- (void)setPrincipalPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_principalPath, 0);
  objc_storeStrong((id *)&self->_preferredAddress, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
