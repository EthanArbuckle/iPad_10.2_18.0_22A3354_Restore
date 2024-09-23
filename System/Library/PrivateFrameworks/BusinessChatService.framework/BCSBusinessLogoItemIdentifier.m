@implementation BCSBusinessLogoItemIdentifier

- (_QWORD)initWithBusinessId:(_QWORD *)a1
{
  id v4;
  id v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)BCSBusinessLogoItemIdentifier;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 1, a2);
      a1[2] = objc_msgSend(a1, "_truncatedHashForString:", a1[1]);
    }
  }

  return a1;
}

- (int64_t)_truncatedHashForString:(id)a3
{
  return +[BCSHashService SHA256TruncatedHashForInputString:includedBytes:](BCSHashService, "SHA256TruncatedHashForInputString:includedBytes:", a3, 8);
}

- (NSObject)itemIdentifier
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[BCSBusinessLogoItemIdentifier truncatedHash](self, "truncatedHash"));
}

- (int64_t)truncatedHash
{
  return self->_truncatedHash;
}

- (int64_t)type
{
  return 4;
}

- (BOOL)matchesItemIdentifying:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5 == -[BCSBusinessLogoItemIdentifier type](self, "type"))
  {
    objc_msgSend(v4, "itemIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSBusinessLogoItemIdentifier itemIdentifier](self, "itemIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)pirKey
{
  if (self)
    self = (BCSBusinessLogoItemIdentifier *)self->_businessId;
  return (NSString *)self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  NSString *businessId;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    *(_QWORD *)(v4 + 16) = -[BCSBusinessLogoItemIdentifier truncatedHash](self, "truncatedHash");
    if (self)
      businessId = self->_businessId;
    else
      businessId = 0;
    objc_storeStrong((id *)(v4 + 8), businessId);
  }
  return (id)v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t truncatedHash;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  truncatedHash = self->_truncatedHash;
  v7 = a3;
  objc_msgSend(v4, "numberWithLongLong:", truncatedHash);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("TruncatedHash"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_businessId, CFSTR("BusinessId"));
}

- (BCSBusinessLogoItemIdentifier)initWithCoder:(id)a3
{
  id v4;
  BCSBusinessLogoItemIdentifier *v5;
  void *v6;
  uint64_t v7;
  NSString *businessId;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCSBusinessLogoItemIdentifier;
  v5 = -[BCSBusinessLogoItemIdentifier init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TruncatedHash"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_truncatedHash = objc_msgSend(v6, "longLongValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BusinessId"));
    v7 = objc_claimAutoreleasedReturnValue();
    businessId = v5->_businessId;
    v5->_businessId = (NSString *)v7;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setBusinessId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setTruncatedHash:(int64_t)a3
{
  self->_truncatedHash = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessId, 0);
}

@end
