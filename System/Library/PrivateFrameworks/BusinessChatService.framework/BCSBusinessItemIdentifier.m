@implementation BCSBusinessItemIdentifier

+ (BCSBusinessItemIdentifier)identifierWithPhoneNumber:(uint64_t)a1
{
  id v2;
  BCSBusinessItemIdentifier *v3;
  id v4;
  void *v5;
  int64_t v6;
  objc_super v8;

  v2 = a2;
  objc_opt_self();
  v3 = [BCSBusinessItemIdentifier alloc];
  v4 = v2;
  if (v3)
  {
    v8.receiver = v3;
    v8.super_class = (Class)BCSBusinessItemIdentifier;
    v3 = (BCSBusinessItemIdentifier *)objc_msgSendSuper2(&v8, sel_init);
    if (v3)
    {
      +[BCSPhoneNumberNormalizer normalizedPhoneNumberForPhoneNumber:](BCSPhoneNumberNormalizer, "normalizedPhoneNumberForPhoneNumber:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = +[BCSHashService SHA256TruncatedHashForInputString:includedBytes:](BCSHashService, "SHA256TruncatedHashForInputString:includedBytes:", v5, 8);

      v3->_computedTruncatedHash = v6;
    }
  }

  return v3;
}

+ (BCSBusinessItemIdentifier)identifierWithBusinessItem:(uint64_t)a1
{
  id v2;
  BCSBusinessItemIdentifier *v3;
  id v4;
  objc_super v6;

  v2 = a2;
  objc_opt_self();
  v3 = [BCSBusinessItemIdentifier alloc];
  v4 = v2;
  if (v3)
  {
    v6.receiver = v3;
    v6.super_class = (Class)BCSBusinessItemIdentifier;
    v3 = (BCSBusinessItemIdentifier *)objc_msgSendSuper2(&v6, sel_init);
    if (v3)
      v3->_computedTruncatedHash = objc_msgSend(v4, "phoneHash");
  }

  return v3;
}

- (NSString)description
{
  void *v2;
  void *v3;

  if (self)
  {
    -[BCSBusinessItemIdentifier succinctDescriptionBuilder](self);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "build");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)debugDescription
{
  void *v2;
  void *v3;
  id v4;

  v2 = self;
  if (self)
  {
    -[BCSBusinessItemIdentifier succinctDescriptionBuilder](self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "appendInt64:withName:", objc_msgSend(v2, "truncatedHash"), CFSTR("truncatedHash"));
    objc_msgSend(v3, "build");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v2;
}

- (NSObject)itemIdentifier
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[BCSBusinessItemIdentifier truncatedHash](self, "truncatedHash"));
}

- (int64_t)truncatedHash
{
  if (self)
    return *(_QWORD *)(self + 8);
  return self;
}

- (int64_t)type
{
  return 1;
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
  if (v5 == -[BCSBusinessItemIdentifier type](self, "type"))
  {
    objc_msgSend(v4, "itemIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSBusinessItemIdentifier itemIdentifier](self, "itemIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)succinctDescriptionBuilder
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "itemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("itemIdentifier"));

  return v2;
}

@end
