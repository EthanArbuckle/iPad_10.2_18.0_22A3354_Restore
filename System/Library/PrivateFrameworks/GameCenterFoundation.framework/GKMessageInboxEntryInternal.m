@implementation GKMessageInboxEntryInternal

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)objc_opt_new();
  -[GKMessageInboxEntryInternal url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUrl:", v5);

  -[GKMessageInboxEntryInternal senderHandle](self, "senderHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSenderHandle:", v6);

  -[GKMessageInboxEntryInternal senderAlias](self, "senderAlias");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSenderAlias:", v7);

  -[GKMessageInboxEntryInternal contactID](self, "contactID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContactID:", v8);

  -[GKMessageInboxEntryInternal contactName](self, "contactName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContactName:", v9);

  -[GKMessageInboxEntryInternal friendCode](self, "friendCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFriendCode:", v10);

  -[GKMessageInboxEntryInternal timestamp](self, "timestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimestamp:", v11);

  return v4;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_10 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_10, &__block_literal_global_41);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_10;
}

void __54__GKMessageInboxEntryInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("url");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("senderHandle");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("senderAlias");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("contactID");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("contactName");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("friendCode");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("timestamp");
  v3[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_10;
  secureCodedPropertyKeys_sSecureCodedKeys_10 = v0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)senderDisplayName
{
  NSString *contactName;

  contactName = self->_contactName;
  if (!contactName)
  {
    if (!self->_senderAlias)
      return (NSString *)&stru_1E75BB5A8;
    contactName = self->_senderHandle;
  }
  return contactName;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)senderAlias
{
  return self->_senderAlias;
}

- (void)setSenderAlias:(id)a3
{
  objc_storeStrong((id *)&self->_senderAlias, a3);
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (void)setSenderHandle:(id)a3
{
  objc_storeStrong((id *)&self->_senderHandle, a3);
}

- (NSString)contactID
{
  return self->_contactID;
}

- (void)setContactID:(id)a3
{
  objc_storeStrong((id *)&self->_contactID, a3);
}

- (NSString)contactName
{
  return self->_contactName;
}

- (void)setContactName:(id)a3
{
  objc_storeStrong((id *)&self->_contactName, a3);
}

- (NSString)friendCode
{
  return self->_friendCode;
}

- (void)setFriendCode:(id)a3
{
  objc_storeStrong((id *)&self->_friendCode, a3);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_friendCode, 0);
  objc_storeStrong((id *)&self->_contactName, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
  objc_storeStrong((id *)&self->_senderAlias, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
