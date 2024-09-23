@implementation DAKeyInvitationRequestConfig

- (DAKeyInvitationRequestConfig)initWithSharingSessionIdentifier:(id)a3 ownerIdsIdentifier:(id)a4
{
  id v7;
  id v8;
  DAKeyInvitationRequestConfig *v9;
  DAKeyInvitationRequestConfig *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DAKeyInvitationRequestConfig;
  v9 = -[DAKeyInvitationRequestConfig init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sharingSessionIdentifier, a3);
    objc_storeStrong((id *)&v10->_ownerIdsIdentifier, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DAKeyInvitationRequestConfig sharingSessionIdentifier](self, "sharingSessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sharingSessionIdentifier"));

  -[DAKeyInvitationRequestConfig ownerIdsIdentifier](self, "ownerIdsIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ownerIdsIdentifier"));

}

- (DAKeyInvitationRequestConfig)initWithCoder:(id)a3
{
  id v4;
  DAKeyInvitationRequestConfig *v5;
  uint64_t v6;
  NSUUID *sharingSessionIdentifier;
  uint64_t v8;
  NSString *ownerIdsIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DAKeyInvitationRequestConfig;
  v5 = -[DAKeyInvitationRequestConfig init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingSessionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    sharingSessionIdentifier = v5->_sharingSessionIdentifier;
    v5->_sharingSessionIdentifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownerIdsIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    ownerIdsIdentifier = v5->_ownerIdsIdentifier;
    v5->_ownerIdsIdentifier = (NSString *)v8;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Sharing Session Id    : %@\n"), self->_sharingSessionIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Owner IDS Id          : %@\n"), self->_ownerIdsIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  return v3;
}

- (NSUUID)sharingSessionIdentifier
{
  return self->_sharingSessionIdentifier;
}

- (NSString)ownerIdsIdentifier
{
  return self->_ownerIdsIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerIdsIdentifier, 0);
  objc_storeStrong((id *)&self->_sharingSessionIdentifier, 0);
}

@end
