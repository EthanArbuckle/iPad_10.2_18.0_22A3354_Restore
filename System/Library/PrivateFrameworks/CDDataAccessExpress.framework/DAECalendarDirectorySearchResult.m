@implementation DAECalendarDirectorySearchResult

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9.receiver = self;
  v9.super_class = (Class)DAECalendarDirectorySearchResult;
  -[DAECalendarDirectorySearchResult description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAECalendarDirectorySearchResult displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAECalendarDirectorySearchResult preferredAddress](self, "preferredAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("[%@] displayName: [%@] preferredAddress: [%@]"), v4, v5, v6);

  return v7;
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

  v4 = a3;
  v5 = -[DAECalendarDirectorySearchResult init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAECalendarDirectorySearchResult setDisplayName:](v5, "setDisplayName:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredAddress"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAECalendarDirectorySearchResult setPreferredAddress:](v5, "setPreferredAddress:", v7);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DAECalendarDirectorySearchResult displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("displayName"));

  -[DAECalendarDirectorySearchResult preferredAddress](self, "preferredAddress");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("preferredAddress"));

}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)preferredAddress
{
  return self->_preferredAddress;
}

- (void)setPreferredAddress:(id)a3
{
  objc_storeStrong((id *)&self->_preferredAddress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredAddress, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
