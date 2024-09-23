@implementation FKBankConnectTermsAndConditions

- (FKBankConnectTermsAndConditions)initWithIdentifier:(id)a3 publishedAt:(id)a4 reviewedAt:(id)a5 inEffectOn:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FKBankConnectTermsAndConditions *v14;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  NSDate *publishedAt;
  uint64_t v19;
  NSDate *reviewedAt;
  uint64_t v21;
  NSDate *inEffectOn;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)FKBankConnectTermsAndConditions;
  v14 = -[FKBankConnectTermsAndConditions init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    publishedAt = v14->_publishedAt;
    v14->_publishedAt = (NSDate *)v17;

    v19 = objc_msgSend(v12, "copy");
    reviewedAt = v14->_reviewedAt;
    v14->_reviewedAt = (NSDate *)v19;

    v21 = objc_msgSend(v13, "copy");
    inEffectOn = v14->_inEffectOn;
    v14->_inEffectOn = (NSDate *)v21;

  }
  return v14;
}

- (BOOL)shouldNotifyAboutChanges
{
  NSDate *inEffectOn;
  void *v4;
  uint64_t v5;
  NSDate *publishedAt;
  void *v7;
  uint64_t v8;

  inEffectOn = self->_inEffectOn;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSDate compare:](inEffectOn, "compare:", v4);

  if (v5 == -1)
    return 0;
  publishedAt = self->_publishedAt;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSDate compare:](publishedAt, "compare:", v7);

  if (v8 != -1)
    return 0;
  if (self->_reviewedAt)
    return -[NSDate compare:](self->_publishedAt, "compare:") == NSOrderedDescending;
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FKBankConnectTermsAndConditions *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDate *publishedAt;
  uint64_t v10;
  NSDate *reviewedAt;
  uint64_t v12;
  NSDate *inEffectOn;

  v5 = objc_alloc_init(FKBankConnectTermsAndConditions);
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v8 = -[NSDate copyWithZone:](self->_publishedAt, "copyWithZone:", a3);
  publishedAt = v5->_publishedAt;
  v5->_publishedAt = (NSDate *)v8;

  v10 = -[NSDate copyWithZone:](self->_reviewedAt, "copyWithZone:", a3);
  reviewedAt = v5->_reviewedAt;
  v5->_reviewedAt = (NSDate *)v10;

  v12 = -[NSDate copyWithZone:](self->_inEffectOn, "copyWithZone:", a3);
  inEffectOn = v5->_inEffectOn;
  v5->_inEffectOn = (NSDate *)v12;

  return v5;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_publishedAt);
  objc_msgSend(v3, "safelyAddObject:", self->_reviewedAt);
  objc_msgSend(v3, "safelyAddObject:", self->_inEffectOn);
  v4 = FKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  FKBankConnectTermsAndConditions *v4;
  FKBankConnectTermsAndConditions *v5;
  void **v6;
  char v7;

  v4 = (FKBankConnectTermsAndConditions *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (FKEqualObjects(self->_identifier, v6[1])
      && FKEqualObjects(self->_publishedAt, v6[2])
      && FKEqualObjects(self->_reviewedAt, v6[3]))
    {
      v7 = FKEqualObjects(self->_inEffectOn, v6[4]);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)publishedAt
{
  return self->_publishedAt;
}

- (NSDate)reviewedAt
{
  return self->_reviewedAt;
}

- (NSDate)inEffectOn
{
  return self->_inEffectOn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inEffectOn, 0);
  objc_storeStrong((id *)&self->_reviewedAt, 0);
  objc_storeStrong((id *)&self->_publishedAt, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
