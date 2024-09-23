@implementation BCSBusinessEmailItemIdentifier

- (_QWORD)initWithEmail:(_QWORD *)a1
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)BCSBusinessEmailItemIdentifier;
    v5 = objc_msgSendSuper2(&v11, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 3, a2);
      v6 = objc_msgSend(a1, "_truncatedHashForString:", a1[3]);
      a1[6] = v6;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)a1[7];
      a1[7] = v8;

    }
  }

  return a1;
}

- (id)initWithEmail:(void *)a3 fullDomain:(void *)a4 topLevelDomain:
{
  id v8;
  id v9;
  id v10;
  id *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  objc_super v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)BCSBusinessEmailItemIdentifier;
    v11 = (id *)objc_msgSendSuper2(&v19, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 3, a2);
      objc_storeStrong(a1 + 4, a3);
      objc_storeStrong(a1 + 5, a4);
      v12 = objc_msgSend(a1, "_truncatedHashForString:", a1[3]);
      a1[6] = (id)v12;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v13;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(a1, "_truncatedHashForString:", a1[4]));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v14;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(a1, "_truncatedHashForString:", a1[5]));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 3);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = a1[7];
      a1[7] = (id)v16;

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
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[BCSBusinessEmailItemIdentifier truncatedHash](self, "truncatedHash"));
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
  int v8;
  void *v9;
  void *v10;
  int v11;
  char isKindOfClass;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5 != -[BCSBusinessEmailItemIdentifier type](self, "type"))
    goto LABEL_6;
  objc_msgSend(v4, "itemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessEmailItemIdentifier itemIdentifier](self, "itemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (!v8)
    goto LABEL_6;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_25462B7B0)
    && (objc_msgSend(v4, "truncatedHashes"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        -[BCSBusinessEmailItemIdentifier truncatedHashes](self, "truncatedHashes"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v9, "isEqualToArray:", v10),
        v10,
        v9,
        v11))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
LABEL_6:
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)setMatchingTruncatedHash:(int64_t)a3
{
  self->_matchingTruncatedHash = a3;
  -[BCSBusinessEmailItemIdentifier setHasMatchingTruncatedHash:](self, "setHasMatchingTruncatedHash:", 1);
}

- (NSString)pirKey
{
  NSString *v3;
  int64_t v4;
  uint64_t v5;
  void *v6;
  NSString *fullDomain;
  int64_t v9;
  NSString *topLevelDomain;
  int64_t v11;

  if (-[BCSBusinessEmailItemIdentifier hasMatchingTruncatedHash](self, "hasMatchingTruncatedHash"))
  {
    v3 = self ? self->_email : 0;
    v4 = -[BCSBusinessEmailItemIdentifier _truncatedHashForString:](self, "_truncatedHashForString:", v3);
    if (v4 != -[BCSBusinessEmailItemIdentifier matchingTruncatedHash](self, "matchingTruncatedHash"))
    {
      if (self)
        fullDomain = self->_fullDomain;
      else
        fullDomain = 0;
      v9 = -[BCSBusinessEmailItemIdentifier _truncatedHashForString:](self, "_truncatedHashForString:", fullDomain);
      if (v9 == -[BCSBusinessEmailItemIdentifier matchingTruncatedHash](self, "matchingTruncatedHash"))
      {
        if (self)
        {
          v5 = 32;
          goto LABEL_7;
        }
      }
      else
      {
        if (self)
          topLevelDomain = self->_topLevelDomain;
        else
          topLevelDomain = 0;
        v11 = -[BCSBusinessEmailItemIdentifier _truncatedHashForString:](self, "_truncatedHashForString:", topLevelDomain);
        if (v11 != -[BCSBusinessEmailItemIdentifier matchingTruncatedHash](self, "matchingTruncatedHash"))
          goto LABEL_5;
        if (self)
        {
          v5 = 40;
          goto LABEL_7;
        }
      }
LABEL_19:
      v6 = 0;
      return (NSString *)v6;
    }
  }
LABEL_5:
  if (!self)
    goto LABEL_19;
  v5 = 24;
LABEL_7:
  v6 = *(Class *)((char *)&self->super.isa + v5);
  return (NSString *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  NSString *fullDomain;
  NSString *topLevelDomain;
  void *v8;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    *(_QWORD *)(v4 + 48) = -[BCSBusinessEmailItemIdentifier truncatedHash](self, "truncatedHash");
    if (self)
    {
      objc_storeStrong((id *)(v4 + 24), self->_email);
      fullDomain = self->_fullDomain;
    }
    else
    {
      v8 = *(void **)(v4 + 24);
      *(_QWORD *)(v4 + 24) = 0;

      fullDomain = 0;
    }
    objc_storeStrong((id *)(v4 + 32), fullDomain);
    if (self)
      topLevelDomain = self->_topLevelDomain;
    else
      topLevelDomain = 0;
    objc_storeStrong((id *)(v4 + 40), topLevelDomain);
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

  objc_msgSend(v7, "encodeObject:forKey:", self->_email, CFSTR("Email"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_fullDomain, CFSTR("FullDomain"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_topLevelDomain, CFSTR("TopLevelDomain"));

}

- (BCSBusinessEmailItemIdentifier)initWithCoder:(id)a3
{
  id v4;
  BCSBusinessEmailItemIdentifier *v5;
  void *v6;
  uint64_t v7;
  NSString *email;
  uint64_t v9;
  NSString *fullDomain;
  uint64_t v11;
  NSString *topLevelDomain;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BCSBusinessEmailItemIdentifier;
  v5 = -[BCSBusinessEmailItemIdentifier init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TruncatedHash"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_truncatedHash = objc_msgSend(v6, "longLongValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Email"));
    v7 = objc_claimAutoreleasedReturnValue();
    email = v5->_email;
    v5->_email = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FullDomain"));
    v9 = objc_claimAutoreleasedReturnValue();
    fullDomain = v5->_fullDomain;
    v5->_fullDomain = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TopLevelDomain"));
    v11 = objc_claimAutoreleasedReturnValue();
    topLevelDomain = v5->_topLevelDomain;
    v5->_topLevelDomain = (NSString *)v11;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)matchingTruncatedHash
{
  return self->_matchingTruncatedHash;
}

- (void)setEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setFullDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setTopLevelDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setTruncatedHash:(int64_t)a3
{
  self->_truncatedHash = a3;
}

- (NSArray)truncatedHashes
{
  return self->_truncatedHashes;
}

- (void)setTruncatedHashes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)hasMatchingTruncatedHash
{
  return self->_hasMatchingTruncatedHash;
}

- (void)setHasMatchingTruncatedHash:(BOOL)a3
{
  self->_hasMatchingTruncatedHash = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_truncatedHashes, 0);
  objc_storeStrong((id *)&self->_topLevelDomain, 0);
  objc_storeStrong((id *)&self->_fullDomain, 0);
  objc_storeStrong((id *)&self->_email, 0);
}

@end
