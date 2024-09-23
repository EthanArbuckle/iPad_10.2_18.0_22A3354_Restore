@implementation MPServerObjectDatabaseImportRequest

- (id)_initWithPayload:(id)a3
{
  id v5;
  MPServerObjectDatabaseImportRequest *v6;
  MPServerObjectDatabaseImportRequest *v7;
  uint64_t v8;
  ICUserIdentity *userIdentity;
  void *v10;
  uint64_t v11;
  NSDate *expirationDate;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDate *assetURLExpirationDate;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MPServerObjectDatabaseImportRequest;
  v6 = -[MPServerObjectDatabaseImportRequest init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_payload, a3);
    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
    v8 = objc_claimAutoreleasedReturnValue();
    userIdentity = v7->_userIdentity;
    v7->_userIdentity = (ICUserIdentity *)v8;

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateByAddingTimeInterval:", 604800.0);
    v11 = objc_claimAutoreleasedReturnValue();
    expirationDate = v7->_expirationDate;
    v7->_expirationDate = (NSDate *)v11;

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPPlaybackUserDefaults standardUserDefaults](MPPlaybackUserDefaults, "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "assetURLExpirationDuration");
    objc_msgSend(v13, "dateByAddingTimeInterval:");
    v15 = objc_claimAutoreleasedReturnValue();
    assetURLExpirationDate = v7->_assetURLExpirationDate;
    v7->_assetURLExpirationDate = (NSDate *)v15;

  }
  return v7;
}

- (void)setExpirationDate:(id)a3
{
  void *v4;
  NSDate *v5;
  NSDate *v6;
  NSDate *expirationDate;
  NSDate *v8;
  char v9;
  NSDate *v10;
  NSDate *v11;

  v11 = (NSDate *)a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateByAddingTimeInterval:", 604800.0);
    v11 = (NSDate *)objc_claimAutoreleasedReturnValue();

  }
  v5 = self->_expirationDate;
  v6 = v11;
  expirationDate = v11;
  if (v5 == v11)
    goto LABEL_6;
  v8 = v5;
  v9 = -[NSDate isEqual:](v5, "isEqual:", v11);

  if ((v9 & 1) == 0)
  {
    v10 = (NSDate *)-[NSDate copy](v11, "copy");
    expirationDate = self->_expirationDate;
    self->_expirationDate = v10;
    v6 = v11;
LABEL_6:
    v11 = v6;

  }
}

- (void)setUserIdentity:(id)a3
{
  ICUserIdentity **p_userIdentity;
  ICUserIdentity *userIdentity;
  void *v6;
  char v7;
  id obj;

  obj = a3;
  if (!obj)
  {
    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
    obj = (id)objc_claimAutoreleasedReturnValue();
  }
  userIdentity = self->_userIdentity;
  p_userIdentity = &self->_userIdentity;
  objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICUserIdentity isEqualToIdentity:inStore:](userIdentity, "isEqualToIdentity:inStore:", obj, v6);

  if ((v7 & 1) == 0)
    objc_storeStrong((id *)p_userIdentity, obj);

}

- (id)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong(&self->_payload, a3);
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSDate)assetURLExpirationDate
{
  return self->_assetURLExpirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetURLExpirationDate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong(&self->_payload, 0);
}

@end
