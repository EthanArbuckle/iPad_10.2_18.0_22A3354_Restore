@implementation ASSecureCloudShareItem

+ (ASSecureCloudShareItem)shareItemWithCodableShareItem:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  ASSecureCloudShareItem *v11;

  v3 = a3;
  objc_msgSend(v3, "zoneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDBCF48]);
  objc_msgSend(v3, "shareURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithString:", v6);

  v8 = (objc_class *)objc_opt_class();
  objc_msgSend(v3, "invitationToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  ASSecureUnarchiveClassWithDataAndStrictness(v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (v4 && v7 && v10)
    v11 = -[ASSecureCloudShareItem initWithZoneName:shareURL:invitationToken:]([ASSecureCloudShareItem alloc], "initWithZoneName:shareURL:invitationToken:", v4, v7, v10);

  return v11;
}

- (id)codableShareItem
{
  ASCodableSecureCloudShareItem *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  ASCodableSecureCloudShareItem *v11;
  NSObject *v12;
  id v14;

  v3 = objc_alloc_init(ASCodableSecureCloudShareItem);
  -[ASSecureCloudShareItem zoneName](self, "zoneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableSecureCloudShareItem setZoneName:](v3, "setZoneName:", v4);

  -[ASSecureCloudShareItem shareURL](self, "shareURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableSecureCloudShareItem setShareURL:](v3, "setShareURL:", v6);

  v7 = (void *)MEMORY[0x24BDD1618];
  -[ASSecureCloudShareItem invitationToken](self, "invitationToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v7, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;

  if (!v9 || v10)
  {
    ASLoggingInitialize();
    v12 = ASLogDefault;
    if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_ERROR))
      -[ASSecureCloudShareItem(InvitationCodingSupport) codableShareItem].cold.1((uint64_t)v10, v12);
    v11 = 0;
  }
  else
  {
    -[ASCodableSecureCloudShareItem setInvitationToken:](v3, "setInvitationToken:", v9);
    v11 = v3;
  }

  return v11;
}

- (ASSecureCloudShareItem)initWithZoneName:(id)a3 shareURL:(id)a4 invitationToken:(id)a5
{
  id v9;
  id v10;
  id v11;
  ASSecureCloudShareItem *v12;
  ASSecureCloudShareItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ASSecureCloudShareItem;
  v12 = -[ASSecureCloudShareItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_shareURL, a4);
    objc_storeStrong((id *)&v13->_invitationToken, a5);
    objc_storeStrong((id *)&v13->_zoneName, a3);
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *shareURL;
  id v5;

  shareURL = self->_shareURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", shareURL, CFSTR("shareURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_invitationToken, CFSTR("invitationToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_zoneName, CFSTR("zoneName"));

}

- (ASSecureCloudShareItem)initWithCoder:(id)a3
{
  id v4;
  ASSecureCloudShareItem *v5;
  uint64_t v6;
  NSURL *shareURL;
  uint64_t v8;
  CKDeviceToDeviceShareInvitationToken *invitationToken;
  uint64_t v10;
  NSString *zoneName;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASSecureCloudShareItem;
  v5 = -[ASSecureCloudShareItem init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shareURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    shareURL = v5->_shareURL;
    v5->_shareURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invitationToken"));
    v8 = objc_claimAutoreleasedReturnValue();
    invitationToken = v5->_invitationToken;
    v5->_invitationToken = (CKDeviceToDeviceShareInvitationToken *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zoneName"));
    v10 = objc_claimAutoreleasedReturnValue();
    zoneName = v5->_zoneName;
    v5->_zoneName = (NSString *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 2, self->_shareURL);
  objc_storeStrong(v4 + 3, self->_invitationToken);
  objc_storeStrong(v4 + 1, self->_zoneName);
  return v4;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (CKDeviceToDeviceShareInvitationToken)invitationToken
{
  return self->_invitationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationToken, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
}

@end
