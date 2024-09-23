@implementation BCSLinkItemIdentifier

+ (id)identifierWithURL:(uint64_t)a1
{
  id v2;
  void *v3;
  id *v4;

  v2 = a2;
  objc_opt_self();
  +[BCSURLNormalizer normalizedURLForURL:](BCSURLNormalizer, "normalizedURLForURL:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = -[BCSLinkItemIdentifier _initWithNormalizedURL:]((id *)[BCSLinkItemIdentifier alloc], v3);
  else
    v4 = 0;

  return v4;
}

- (id)_initWithNormalizedURL:(id *)a1
{
  id v4;
  id *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  int64_t v10;
  objc_super v12;

  v4 = a2;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)BCSLinkItemIdentifier;
    v5 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 2, a2);
      objc_msgSend(a1[2], "absoluteString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[BCSHashService SHA256HashForInputString:](BCSHashService, "SHA256HashForInputString:", v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v8 = a1[1];
      a1[1] = (id)v7;

      objc_msgSend(a1[2], "absoluteString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = +[BCSHashService SHA256TruncatedHashForInputString:includedBytes:](BCSHashService, "SHA256TruncatedHashForInputString:includedBytes:", v9, 8);

      a1[4] = (id)v10;
    }
  }

  return a1;
}

+ (id)identifierWithNormalizedURL:(uint64_t)a1
{
  id v2;
  id *v3;

  v2 = a2;
  objc_opt_self();
  v3 = -[BCSLinkItemIdentifier _initWithNormalizedURL:]((id *)[BCSLinkItemIdentifier alloc], v2);

  return v3;
}

+ (BCSLinkItemIdentifier)identifierWithHash:(uint64_t)a1
{
  id v3;
  BCSLinkItemIdentifier *v4;
  id v5;
  BCSLinkItemIdentifier *v6;
  objc_super v8;

  v3 = a2;
  objc_opt_self();
  if (+[BCSHashService isValidFullHash:](BCSHashService, "isValidFullHash:", v3))
  {
    v4 = [BCSLinkItemIdentifier alloc];
    v5 = v3;
    if (v4)
    {
      v8.receiver = v4;
      v8.super_class = (Class)BCSLinkItemIdentifier;
      v6 = (BCSLinkItemIdentifier *)objc_msgSendSuper2(&v8, sel_init);
      v4 = v6;
      if (v6)
      {
        objc_storeStrong((id *)&v6->_fullHash, a2);
        v4->_computedTruncatedHash = +[BCSHashService truncatedHashForFullHash:includedBytes:](BCSHashService, "truncatedHashForFullHash:includedBytes:", v5, 8);
      }
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)description
{
  void *v2;
  void *v3;

  if (self)
  {
    -[BCSLinkItemIdentifier succinctDescriptionBuilder](self);
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
  id *p_isa;
  void *v3;
  id v4;
  void *v5;
  id v6;

  p_isa = (id *)&self->super.isa;
  if (self)
  {
    -[BCSLinkItemIdentifier succinctDescriptionBuilder](self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "appendInt64:withName:", objc_msgSend(p_isa, "truncatedHash"), CFSTR("truncatedHash"));
    v5 = (void *)objc_msgSend(p_isa[1], "copy");
    v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("fullHash"));

    objc_msgSend(v3, "build");
    p_isa = (id *)objc_claimAutoreleasedReturnValue();

  }
  return p_isa;
}

- (int64_t)_truncatedDomainHashForNormalizedURL:(int64_t)result
{
  void *v2;
  int64_t v3;

  if (result)
  {
    objc_msgSend(a2, "host");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = +[BCSHashService SHA256TruncatedHashForInputString:includedBytes:](BCSHashService, "SHA256TruncatedHashForInputString:includedBytes:", v2, 8);

    return v3;
  }
  return result;
}

- (NSObject)itemIdentifier
{
  if (self)
    self = (BCSLinkItemIdentifier *)-[NSString copy](self->_fullHash, "copy");
  return self;
}

- (int64_t)truncatedHash
{
  if (self)
    return *(_QWORD *)(self + 32);
  return self;
}

- (int64_t)type
{
  return 2;
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
  if (v5 == -[BCSLinkItemIdentifier type](self, "type"))
  {
    objc_msgSend(v4, "itemIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSLinkItemIdentifier itemIdentifier](self, "itemIdentifier");
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
  id v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "appendObject:withName:skipIfNil:", a1[2], CFSTR("url"), 1);
  objc_msgSend(a1, "itemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "appendObject:withName:", v4, CFSTR("itemIdentifier"));

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_fullHash, 0);
}

@end
