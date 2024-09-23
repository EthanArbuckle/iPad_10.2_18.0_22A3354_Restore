@implementation ASCLockupFeatureSafariExtension

- (ASCLockupFeatureSafariExtension)initWithContentProviderTeamID:(id)a3
{
  id v4;
  ASCLockupFeatureSafariExtension *v5;
  uint64_t v6;
  NSString *contentProviderTeamID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASCLockupFeatureSafariExtension;
  v5 = -[ASCLockupFeatureSafariExtension init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contentProviderTeamID = v5->_contentProviderTeamID;
    v5->_contentProviderTeamID = (NSString *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureSafariExtension)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ASCLockupFeatureSafariExtension *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentProviderTeamID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ASCLockupFeatureSafariExtension initWithContentProviderTeamID:](self, "initWithContentProviderTeamID:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCLockupFeatureSafariExtension contentProviderTeamID](self, "contentProviderTeamID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("contentProviderTeamID"));

}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCLockupFeatureSafariExtension contentProviderTeamID](self, "contentProviderTeamID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  v5 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  ASCLockupFeatureSafariExtension *v4;
  ASCLockupFeatureSafariExtension *v5;
  ASCLockupFeatureSafariExtension *v6;
  char v7;
  ASCLockupFeatureSafariExtension *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = (ASCLockupFeatureSafariExtension *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v8 = v6;

    if (v8)
    {
      -[ASCLockupFeatureSafariExtension contentProviderTeamID](self, "contentProviderTeamID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCLockupFeatureSafariExtension contentProviderTeamID](v8, "contentProviderTeamID");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v9 && v10)
        v7 = objc_msgSend(v9, "isEqual:", v10);
      else
        v7 = v9 == (void *)v10;

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (NSString)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCLockupFeatureSafariExtension contentProviderTeamID](self, "contentProviderTeamID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("contentProviderTeamID"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)contentProviderTeamID
{
  return self->_contentProviderTeamID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProviderTeamID, 0);
}

@end
