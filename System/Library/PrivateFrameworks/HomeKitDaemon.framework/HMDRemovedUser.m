@implementation HMDRemovedUser

- (HMDRemovedUser)initWithUser:(id)a3 expiration:(id)a4
{
  id v7;
  id v8;
  HMDRemovedUser *v9;
  HMDRemovedUser *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDRemovedUser;
  v9 = -[HMDRemovedUser init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_user, a3);
    objc_storeStrong((id *)&v10->_expirationDate, a4);
    v10->_removalInProgress = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[HMDRemovedUser user](self, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemovedUser expirationDate](self, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, User = %@, Expiration = %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)mergeID
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDRemovedUser user](self, "user");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "senderCorrelationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isExpired
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  -[HMDRemovedUser user](self, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[HMDRemovedUser expirationDate](self, "expirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5 < 0.0;

  return v6;
}

- (BOOL)isEqualToUserID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HMDRemovedUser user](self, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  return v7;
}

- (BOOL)isEqualToUser:(id)a3
{
  id v4;
  id v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[HMDRemovedUser user](self, "user");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v4, "userID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMDRemovedUser isEqualToUserID:](self, "isEqualToUserID:", v6);

  }
  return v7;
}

- (HMDRemovedUser)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDRemovedUser *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.user"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.expiry"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HMDRemovedUser initWithUser:expiration:](self, "initWithUser:expiration:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDRemovedUser user](self, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.user"));

  -[HMDRemovedUser expirationDate](self, "expirationDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HM.expiry"));

}

- (HMDUser)user
{
  return self->_user;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (BOOL)isRemovalInProgress
{
  return self->_removalInProgress;
}

- (void)setRemovalInProgress:(BOOL)a3
{
  self->_removalInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

+ (id)removedUserWithUser:(id)a3
{
  id v3;
  HMDRemovedUser *v4;
  void *v5;
  HMDRemovedUser *v6;

  v3 = a3;
  v4 = [HMDRemovedUser alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 2592000.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDRemovedUser initWithUser:expiration:](v4, "initWithUser:expiration:", v3, v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
