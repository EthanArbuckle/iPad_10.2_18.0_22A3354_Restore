@implementation MEMessageSecurityInformation

- (MEMessageSecurityInformation)initWithSigners:(NSArray *)signers isEncrypted:(BOOL)isEncrypted signingError:(NSError *)signingError encryptionError:(NSError *)encryptionError
{
  return -[MEMessageSecurityInformation initWithSigners:isEncrypted:signingError:encryptionError:shouldBlockRemoteContent:localizedRemoteContentBlockingReason:](self, "initWithSigners:isEncrypted:signingError:encryptionError:shouldBlockRemoteContent:localizedRemoteContentBlockingReason:", signers, isEncrypted, signingError, encryptionError, 0, 0);
}

- (MEMessageSecurityInformation)initWithSigners:(NSArray *)signers isEncrypted:(BOOL)isEncrypted signingError:(NSError *)signingError encryptionError:(NSError *)encryptionError shouldBlockRemoteContent:(BOOL)shouldBlockRemoteContent localizedRemoteContentBlockingReason:(NSString *)localizedRemoteContentBlockingReason
{
  NSError *v15;
  NSError *v16;
  NSString *v17;
  MEMessageSecurityInformation *v18;
  MEMessageSecurityInformation *v19;
  NSArray *v21;
  objc_super v22;

  v21 = signers;
  v15 = signingError;
  v16 = encryptionError;
  v17 = localizedRemoteContentBlockingReason;
  v22.receiver = self;
  v22.super_class = (Class)MEMessageSecurityInformation;
  v18 = -[MEMessageSecurityInformation init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_signers, signers);
    v19->_isEncrypted = isEncrypted;
    objc_storeStrong((id *)&v19->_signingError, signingError);
    objc_storeStrong((id *)&v19->_encryptionError, encryptionError);
    v19->_shouldBlockRemoteContent = shouldBlockRemoteContent;
    objc_storeStrong((id *)&v19->_localizedRemoteContentBlockingReason, localizedRemoteContentBlockingReason);
  }

  return v19;
}

- (MEMessageSecurityInformation)initWithSigners:(id)a3 isEncrypted:(BOOL)a4 signingError:(id)a5 encryptionError:(id)a6 shouldBlockRemoteContent:(BOOL)a7 disallowUsersToLoadRemoteContent:(BOOL)a8 localizedRemoteContentBlockingReason:(id)a9
{
  id v15;
  id v16;
  id v17;
  MEMessageSecurityInformation *v18;
  MEMessageSecurityInformation *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)MEMessageSecurityInformation;
  v18 = -[MEMessageSecurityInformation init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_signers, a3);
    v19->_isEncrypted = a4;
    objc_storeStrong((id *)&v19->_signingError, a5);
    objc_storeStrong((id *)&v19->_encryptionError, a6);
    v19->_shouldBlockRemoteContent = a7;
    v19->_disallowUsersToLoadRemoteContent = a8;
    objc_storeStrong((id *)&v19->_localizedRemoteContentBlockingReason, a9);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEMessageSecurityInformation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  MEMessageSecurityInformation *v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("EFPropertyKey_signers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_isEncrypted"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_signingError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_encryptionError"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_shouldBlockRemoteContent"));
  v13 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_disallowUsersToLoadRemoteContent"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_localizedRemoteContentBlockingReason"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MEMessageSecurityInformation initWithSigners:isEncrypted:signingError:encryptionError:shouldBlockRemoteContent:disallowUsersToLoadRemoteContent:localizedRemoteContentBlockingReason:](self, "initWithSigners:isEncrypted:signingError:encryptionError:shouldBlockRemoteContent:disallowUsersToLoadRemoteContent:localizedRemoteContentBlockingReason:", v8, v9, v10, v11, v12, v13, v14);

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MEMessageSecurityInformation signers](self, "signers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_signers"));

  objc_msgSend(v8, "encodeBool:forKey:", -[MEMessageSecurityInformation isEncrypted](self, "isEncrypted"), CFSTR("EFPropertyKey_isEncrypted"));
  -[MEMessageSecurityInformation signingError](self, "signingError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_signingError"));

  -[MEMessageSecurityInformation encryptionError](self, "encryptionError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_encryptionError"));

  objc_msgSend(v8, "encodeBool:forKey:", -[MEMessageSecurityInformation shouldBlockRemoteContent](self, "shouldBlockRemoteContent"), CFSTR("EFPropertyKey_shouldBlockRemoteContent"));
  objc_msgSend(v8, "encodeBool:forKey:", -[MEMessageSecurityInformation disallowUsersToLoadRemoteContent](self, "disallowUsersToLoadRemoteContent"), CFSTR("EFPropertyKey_disallowUsersToLoadRemoteContent"));
  -[MEMessageSecurityInformation localizedRemoteContentBlockingReason](self, "localizedRemoteContentBlockingReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_localizedRemoteContentBlockingReason"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  if ((objc_msgSend(v5, "isEqual:", objc_opt_class()) & 1) != 0)
  {
    v6 = v4;
    -[MEMessageSecurityInformation signers](self, "signers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "signers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8)
      && (v9 = -[MEMessageSecurityInformation isEncrypted](self, "isEncrypted"),
          v9 == objc_msgSend(v6, "isEncrypted")))
    {
      -[MEMessageSecurityInformation signingError](self, "signingError");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "signingError");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (EFObjectsAreEqual())
      {
        -[MEMessageSecurityInformation encryptionError](self, "encryptionError");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "encryptionError");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (EFObjectsAreEqual()
          && (v15 = -[MEMessageSecurityInformation shouldBlockRemoteContent](self, "shouldBlockRemoteContent"),
              v15 == objc_msgSend(v6, "shouldBlockRemoteContent"))
          && (v16 = -[MEMessageSecurityInformation disallowUsersToLoadRemoteContent](self, "disallowUsersToLoadRemoteContent"), v16 == objc_msgSend(v6, "disallowUsersToLoadRemoteContent")))
        {
          -[MEMessageSecurityInformation localizedRemoteContentBlockingReason](self, "localizedRemoteContentBlockingReason");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "localizedRemoteContentBlockingReason");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = EFObjectsAreEqual();

        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  _BOOL8 isEncrypted;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 shouldBlockRemoteContent;

  v3 = -[NSArray hash](self->_signers, "hash");
  isEncrypted = self->_isEncrypted;
  v5 = -[NSError hash](self->_signingError, "hash");
  v6 = -[NSError hash](self->_encryptionError, "hash");
  shouldBlockRemoteContent = self->_shouldBlockRemoteContent;
  return 33 * (33 * (33 * (33 * (33 * v3 + isEncrypted) + v5) + v6) + shouldBlockRemoteContent)
       + -[NSString hash](self->_localizedRemoteContentBlockingReason, "hash")
       + 1291467969;
}

- (NSArray)signers
{
  return self->_signers;
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (NSError)signingError
{
  return self->_signingError;
}

- (NSError)encryptionError
{
  return self->_encryptionError;
}

- (BOOL)shouldBlockRemoteContent
{
  return self->_shouldBlockRemoteContent;
}

- (NSString)localizedRemoteContentBlockingReason
{
  return self->_localizedRemoteContentBlockingReason;
}

- (NSString)decoderID
{
  return self->_decoderID;
}

- (void)setDecoderID:(id)a3
{
  objc_storeStrong((id *)&self->_decoderID, a3);
}

- (BOOL)disallowUsersToLoadRemoteContent
{
  return self->_disallowUsersToLoadRemoteContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoderID, 0);
  objc_storeStrong((id *)&self->_localizedRemoteContentBlockingReason, 0);
  objc_storeStrong((id *)&self->_encryptionError, 0);
  objc_storeStrong((id *)&self->_signingError, 0);
  objc_storeStrong((id *)&self->_signers, 0);
}

@end
