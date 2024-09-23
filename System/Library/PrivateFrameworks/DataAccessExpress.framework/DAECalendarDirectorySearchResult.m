@implementation DAECalendarDirectorySearchResult

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10.receiver = self;
  v10.super_class = (Class)DAECalendarDirectorySearchResult;
  -[DAECalendarDirectorySearchResult description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAECalendarDirectorySearchResult displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAECalendarDirectorySearchResult preferredAddress](self, "preferredAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAECalendarDirectorySearchResult principalPath](self, "principalPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("[%@] displayName: [%@] preferredAddress: [%@] principalPath: [%@]"), v4, v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAECalendarDirectorySearchResult)initWithCoder:(id)a3
{
  id v4;
  DAECalendarDirectorySearchResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[DAECalendarDirectorySearchResult init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAECalendarDirectorySearchResult setDisplayName:](v5, "setDisplayName:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAECalendarDirectorySearchResult setFirstName:](v5, "setFirstName:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAECalendarDirectorySearchResult setLastName:](v5, "setLastName:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredAddress"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAECalendarDirectorySearchResult setPreferredAddress:](v5, "setPreferredAddress:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("principalPath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAECalendarDirectorySearchResult setPrincipalPath:](v5, "setPrincipalPath:", v10);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[DAECalendarDirectorySearchResult displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("displayName"));

  -[DAECalendarDirectorySearchResult firstName](self, "firstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("firstName"));

  -[DAECalendarDirectorySearchResult lastName](self, "lastName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("lastName"));

  -[DAECalendarDirectorySearchResult preferredAddress](self, "preferredAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("preferredAddress"));

  -[DAECalendarDirectorySearchResult principalPath](self, "principalPath");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("principalPath"));

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
  objc_storeStrong((id *)&self->_principalPath, a3);
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
