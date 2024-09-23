@implementation LNMutualExclusionGroupRelevantContext

- (LNMutualExclusionGroupRelevantContext)initWithGroupIdentifier:(id)a3
{
  id v4;
  LNMutualExclusionGroupRelevantContext *v5;
  uint64_t v6;
  NSString *groupIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LNMutualExclusionGroupRelevantContext;
  v5 = -[LNRelevantContext _init](&v9, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v6;

  }
  return v5;
}

- (LNMutualExclusionGroupRelevantContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LNMutualExclusionGroupRelevantContext *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[LNMutualExclusionGroupRelevantContext initWithGroupIdentifier:](self, "initWithGroupIdentifier:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNMutualExclusionGroupRelevantContext groupIdentifier](self, "groupIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("groupIdentifier"));

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LNMutualExclusionGroupRelevantContext groupIdentifier](self, "groupIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  LNMutualExclusionGroupRelevantContext *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (LNMutualExclusionGroupRelevantContext *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[LNMutualExclusionGroupRelevantContext groupIdentifier](v4, "groupIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNMutualExclusionGroupRelevantContext groupIdentifier](self, "groupIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[LNMutualExclusionGroupRelevantContext groupIdentifier](self, "groupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<mutual exclusion group: %@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)analyticsDescription
{
  return CFSTR(".group()");
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
