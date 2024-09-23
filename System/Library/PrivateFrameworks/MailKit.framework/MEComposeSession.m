@implementation MEComposeSession

- (MEComposeSession)initWithSessionID:(id)a3 composeContext:(id)a4 mailMessage:(id)a5
{
  id v9;
  id v10;
  id v11;
  MEComposeSession *v12;
  MEComposeSession *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MEComposeSession;
  v12 = -[MEComposeSession init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_composeContext, a4);
    objc_storeStrong((id *)&v13->_sessionID, a3);
    objc_storeStrong((id *)&v13->_mailMessage, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEComposeSession)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MEComposeSession *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_sessionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_composeContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_mailMessage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MEComposeSession initWithSessionID:composeContext:mailMessage:](self, "initWithSessionID:composeContext:mailMessage:", v5, v6, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MEComposeSession sessionID](self, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_sessionID"));

  -[MEComposeSession composeContext](self, "composeContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_composeContext"));

  -[MEComposeSession mailMessage](self, "mailMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_mailMessage"));

}

- (void)reloadSession
{
  id v3;
  id v4;

  -[MEComposeSession remoteHostContext](self, "remoteHostContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "regenerateEmailAddressTokenChangesForSession:", self);

  -[MEComposeSession remoteHostContext](self, "remoteHostContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "regenerateSecurityStatusInformationForSession:", self);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  if ((objc_msgSend(v5, "isEqual:", objc_opt_class()) & 1) != 0)
  {
    objc_msgSend(v4, "sessionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MEComposeSession sessionID](self, "sessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_sessionID, "hash") + 33;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (MEMessage)mailMessage
{
  return self->_mailMessage;
}

- (void)setMailMessage:(id)a3
{
  objc_storeStrong((id *)&self->_mailMessage, a3);
}

- (MEComposeContext)composeContext
{
  return self->_composeContext;
}

- (void)setComposeContext:(id)a3
{
  objc_storeStrong((id *)&self->_composeContext, a3);
}

- (MERemoteExtension)remoteExtension
{
  return self->_remoteExtension;
}

- (void)setRemoteExtension:(id)a3
{
  objc_storeStrong((id *)&self->_remoteExtension, a3);
}

- (MEComposeSessionHostProtocol_XPC)remoteHostContext
{
  return self->_remoteHostContext;
}

- (void)setRemoteHostContext:(id)a3
{
  objc_storeStrong((id *)&self->_remoteHostContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteHostContext, 0);
  objc_storeStrong((id *)&self->_remoteExtension, 0);
  objc_storeStrong((id *)&self->_composeContext, 0);
  objc_storeStrong((id *)&self->_mailMessage, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
