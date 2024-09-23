@implementation MAAutoAssetSetInfoFound

- (id)initForAssetSetIdentifier:(id)a3 reportingStatus:(id)a4
{
  id v7;
  id v8;
  MAAutoAssetSetInfoFound *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MAAutoAssetSetInfoFound;
  v9 = -[MAAutoAssetSetInfoFound init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetSetIdentifier, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (MAAutoAssetSetInfoFound)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetSetInfoFound *v5;
  uint64_t v6;
  NSString *assetSetIdentifier;
  uint64_t v8;
  MAAutoAssetSetStatus *currentSetStatus;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MAAutoAssetSetInfoFound;
  v5 = -[MAAutoAssetSetInfoFound init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetSetIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentSetStatus"));
    v8 = objc_claimAutoreleasedReturnValue();
    currentSetStatus = v5->_currentSetStatus;
    v5->_currentSetStatus = (MAAutoAssetSetStatus *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MAAutoAssetSetInfoFound assetSetIdentifier](self, "assetSetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("assetSetIdentifier"));

  -[MAAutoAssetSetInfoFound currentSetStatus](self, "currentSetStatus");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("currentSetStatus"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetSetInfoFound summary](self, "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetInfoFound currentSetStatus](self, "currentSetStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)summary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetSetInfoFound assetSetIdentifier](self, "assetSetIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetInfoFound currentSetStatus](self, "currentSetStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "summary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("assetSetIdentifier:%@|currentSetStatus:%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (MAAutoAssetSetStatus)currentSetStatus
{
  return self->_currentSetStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSetStatus, 0);
  objc_storeStrong((id *)&self->_assetSetIdentifier, 0);
}

@end
