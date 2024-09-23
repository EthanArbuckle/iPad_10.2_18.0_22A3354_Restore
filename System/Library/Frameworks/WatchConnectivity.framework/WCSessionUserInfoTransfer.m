@implementation WCSessionUserInfoTransfer

- (WCSessionUserInfoTransfer)initWithComplicationTransferIdentifier:(id)a3
{
  id v4;
  void *v5;
  WCSessionUserInfoTransfer *v6;

  v4 = a3;
  WCTransferIdentifierFromComplicationIdentifier(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WCSessionUserInfoTransfer initWithTranferIdentifier:complicationTransferIdentifier:currentComplication:](self, "initWithTranferIdentifier:complicationTransferIdentifier:currentComplication:", v5, v4, 1);

  return v6;
}

- (WCSessionUserInfoTransfer)initWithTranferIdentifier:(id)a3 complicationTransferIdentifier:(id)a4 currentComplication:(BOOL)a5
{
  id v9;
  id v10;
  WCSessionUserInfoTransfer *v11;
  WCSessionUserInfoTransfer *v12;
  NSError *transferError;
  uint64_t v14;
  NSDate *creationDate;
  WCUserInfo *v16;
  WCUserInfo *userInfoStorage;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)WCSessionUserInfoTransfer;
  v11 = -[WCSessionUserInfoTransfer init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    transferError = v11->_transferError;
    v11->_transferError = 0;

    v12->_transferring = 1;
    v14 = objc_opt_new();
    creationDate = v12->_creationDate;
    v12->_creationDate = (NSDate *)v14;

    objc_storeStrong((id *)&v12->_transferIdentifier, a3);
    v12->_currentComplicationInfo = a5;
    objc_storeStrong((id *)&v12->_complicationTransferIdentifier, a4);
    v16 = objc_alloc_init(WCUserInfo);
    userInfoStorage = v12->_userInfoStorage;
    v12->_userInfoStorage = v16;

  }
  return v12;
}

- (WCSessionUserInfoTransfer)initWithProtoBufFileURL:(id)a3
{
  void *v4;
  id v5;
  WCDProtoUserInfoTransfer *v6;
  NSObject *p_super;
  void *v8;
  void *v9;
  id v11;

  if (a3)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", a3, 0, &v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    if (v4)
    {
      v6 = -[WCDProtoUserInfoTransfer initWithData:]([WCDProtoUserInfoTransfer alloc], "initWithData:", v4);
      p_super = &v6->super.super;
      if (v6
        && -[WCDProtoUserInfoTransfer hasTransferIdentifier](v6, "hasTransferIdentifier")
        && -[NSObject hasClientData](p_super, "hasClientData"))
      {
        -[NSObject transferIdentifier](p_super, "transferIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[WCSessionUserInfoTransfer initWithTranferIdentifier:complicationTransferIdentifier:currentComplication:](self, "initWithTranferIdentifier:complicationTransferIdentifier:currentComplication:", v8, 0, 0);

        -[NSObject clientData](p_super, "clientData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WCSessionUserInfoTransfer updateUserInfoData:error:](self, "updateUserInfoData:error:", v9, 0);

      }
    }
    else
    {
      wc_log();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        -[WCSessionUserInfoTransfer initWithProtoBufFileURL:].cold.1((uint64_t)v5, p_super);
    }

  }
  return self;
}

- (WCSessionUserInfoTransfer)init
{
  void *v3;
  void *v4;
  WCSessionUserInfoTransfer *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WCSessionUserInfoTransfer initWithTranferIdentifier:complicationTransferIdentifier:currentComplication:](self, "initWithTranferIdentifier:complicationTransferIdentifier:currentComplication:", v4, 0, 0);

  return v5;
}

- (NSDictionary)userInfo
{
  void *v2;
  void *v3;

  -[WCSessionUserInfoTransfer userInfoStorage](self, "userInfoStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)userInfoData
{
  void *v2;
  void *v3;

  -[WCSessionUserInfoTransfer userInfoStorage](self, "userInfoStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfoData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (BOOL)updateUserInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[WCSessionUserInfoTransfer userInfoStorage](self, "userInfoStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "updateUserInfo:error:", v6, a4);

  return (char)a4;
}

- (BOOL)updateUserInfoData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[WCSessionUserInfoTransfer userInfoStorage](self, "userInfoStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "updateUserInfoData:error:", v6, a4);

  return (char)a4;
}

- (BOOL)verifyUserInfo
{
  void *v2;
  char v3;

  -[WCSessionUserInfoTransfer userInfoStorage](self, "userInfoStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "verifyUserInfo");

  return v3;
}

- (void)cancel
{
  id v3;

  +[WCSession defaultSession](WCSession, "defaultSession");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelUserInfo:", self);

}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[WCSessionUserInfoTransfer creationDate](self, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WCSessionUserInfoTransfer isCurrentComplicationInfo](self, "isCurrentComplicationInfo"))
    v6 = "YES";
  else
    v6 = "NO";
  if (-[WCSessionUserInfoTransfer isTransferring](self, "isTransferring"))
    v7 = "YES";
  else
    v7 = "NO";
  -[WCSessionUserInfoTransfer userInfoData](self, "userInfoData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = "YES";
  else
    v9 = "NO";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, current complication info: %s, transferring: %s, hasUserInfo: %s>"), v5, self, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  WCSessionUserInfoTransfer *v4;
  WCSessionUserInfoTransfer *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (WCSessionUserInfoTransfer *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WCSessionUserInfoTransfer transferIdentifier](self, "transferIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WCSessionUserInfoTransfer transferIdentifier](v5, "transferIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WCSessionUserInfoTransfer transferIdentifier](self, "transferIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 currentComplicationInfo;
  id v5;

  currentComplicationInfo = self->_currentComplicationInfo;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", currentComplicationInfo, CFSTR("currentComplicationInfo"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_transferring, CFSTR("transferring"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transferIdentifier, CFSTR("transferIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfoStorage, CFSTR("userInfoStorage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_complicationTransferIdentifier, CFSTR("complicationTransferIdentifier"));

}

- (WCSessionUserInfoTransfer)initWithCoder:(id)a3
{
  id v4;
  WCSessionUserInfoTransfer *v5;
  void *v6;
  uint64_t v7;
  NSString *transferIdentifier;
  uint64_t v9;
  WCUserInfo *userInfoStorage;
  uint64_t v11;
  NSDate *creationDate;
  void *v13;
  uint64_t v14;
  NSString *complicationTransferIdentifier;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WCSessionUserInfoTransfer;
  v5 = -[WCSessionUserInfoTransfer init](&v17, sel_init);
  if (v5)
  {
    v5->_currentComplicationInfo = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("currentComplicationInfo"));
    v5->_transferring = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("transferring"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    transferIdentifier = v5->_transferIdentifier;
    v5->_transferIdentifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userInfoStorage"));
    v9 = objc_claimAutoreleasedReturnValue();
    userInfoStorage = v5->_userInfoStorage;
    v5->_userInfoStorage = (WCUserInfo *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v11 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("complicationTransferIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    complicationTransferIdentifier = v5->_complicationTransferIdentifier;
    v5->_complicationTransferIdentifier = (NSString *)v14;

  }
  return v5;
}

- (id)protobufData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setVersion:", 1);
  -[WCSessionUserInfoTransfer userInfoData](self, "userInfoData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientData:", v4);

  -[WCSessionUserInfoTransfer transferIdentifier](self, "transferIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTransferIdentifier:", v5);

  objc_msgSend(v3, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isCurrentComplicationInfo
{
  return self->_currentComplicationInfo;
}

- (void)setCurrentComplicationInfo:(BOOL)a3
{
  self->_currentComplicationInfo = a3;
}

- (BOOL)isTransferring
{
  return self->_transferring;
}

- (void)setTransferring:(BOOL)a3
{
  self->_transferring = a3;
}

- (WCUserInfo)userInfoStorage
{
  return self->_userInfoStorage;
}

- (void)setUserInfoStorage:(id)a3
{
  objc_storeStrong((id *)&self->_userInfoStorage, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSError)transferError
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTransferError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)transferIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTransferIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)complicationTransferIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setComplicationTransferIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationTransferIdentifier, 0);
  objc_storeStrong((id *)&self->_transferIdentifier, 0);
  objc_storeStrong((id *)&self->_transferError, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_userInfoStorage, 0);
}

- (void)initWithProtoBufFileURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  NSPrintF();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446466;
  v5 = "-[WCSessionUserInfoTransfer initWithProtoBufFileURL:]";
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_216F21000, a2, OS_LOG_TYPE_ERROR, "%{public}s %{public}@", buf, 0x16u);

}

@end
