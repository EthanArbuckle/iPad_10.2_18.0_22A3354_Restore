@implementation KCSharingGroupInvite

- (KCSharingGroupInvite)initWithGroupID:(id)a3 shareURL:(id)a4 senderHandle:(id)a5 inviteeHandle:(id)a6 inviteToken:(id)a7 sentTime:(id)a8 displayName:(id)a9
{
  id v16;
  id v17;
  KCSharingGroupInvite *v18;
  KCSharingGroupInvite *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)KCSharingGroupInvite;
  v18 = -[KCSharingGroupInvite init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_groupID, a3);
    objc_storeStrong((id *)&v19->_shareURL, a4);
    objc_storeStrong((id *)&v19->_senderHandle, a5);
    objc_storeStrong((id *)&v19->_inviteeHandle, a6);
    objc_storeStrong((id *)&v19->_inviteToken, a7);
    objc_storeStrong((id *)&v19->_sentTime, a8);
    objc_storeStrong((id *)&v19->_displayName, a9);
  }

  return v19;
}

- (KCSharingGroupInvite)initWithCoder:(id)a3
{
  id v4;
  KCSharingGroupInvite *v5;
  uint64_t v6;
  NSString *groupID;
  uint64_t v8;
  NSURL *shareURL;
  uint64_t v10;
  NSString *senderHandle;
  uint64_t v12;
  NSString *inviteeHandle;
  uint64_t v14;
  NSData *inviteToken;
  uint64_t v16;
  NSDate *sentTime;
  uint64_t v18;
  NSString *displayName;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)KCSharingGroupInvite;
  v5 = -[KCSharingGroupInvite init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupID"));
    v6 = objc_claimAutoreleasedReturnValue();
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shareURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    shareURL = v5->_shareURL;
    v5->_shareURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderHandle"));
    v10 = objc_claimAutoreleasedReturnValue();
    senderHandle = v5->_senderHandle;
    v5->_senderHandle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inviteeHandle"));
    v12 = objc_claimAutoreleasedReturnValue();
    inviteeHandle = v5->_inviteeHandle;
    v5->_inviteeHandle = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inviteToken"));
    v14 = objc_claimAutoreleasedReturnValue();
    inviteToken = v5->_inviteToken;
    v5->_inviteToken = (NSData *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sentTime"));
    v16 = objc_claimAutoreleasedReturnValue();
    sentTime = v5->_sentTime;
    v5->_sentTime = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v18 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v18;

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
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[KCSharingGroupInvite groupID](self, "groupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("groupID"));

  -[KCSharingGroupInvite shareURL](self, "shareURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("shareURL"));

  -[KCSharingGroupInvite senderHandle](self, "senderHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("senderHandle"));

  -[KCSharingGroupInvite inviteeHandle](self, "inviteeHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("inviteeHandle"));

  -[KCSharingGroupInvite inviteToken](self, "inviteToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("inviteToken"));

  -[KCSharingGroupInvite sentTime](self, "sentTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("sentTime"));

  -[KCSharingGroupInvite displayName](self, "displayName");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("displayName"));

}

- (NSString)groupID
{
  return self->_groupID;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (NSData)inviteToken
{
  return self->_inviteToken;
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (NSString)inviteeHandle
{
  return self->_inviteeHandle;
}

- (NSDate)sentTime
{
  return self->_sentTime;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_sentTime, 0);
  objc_storeStrong((id *)&self->_inviteeHandle, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
  objc_storeStrong((id *)&self->_inviteToken, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
