@implementation HMMutableCHIPHome

- (id)copyWithZone:(_NSZone *)a3
{
  HMCHIPHome *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMCHIPHome *v9;

  v4 = +[HMCHIPHome allocWithZone:](HMCHIPHome, "allocWithZone:", a3);
  -[HMCHIPHome identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCHIPHome index](self, "index");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCHIPHome name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCHIPHome ecosystem](self, "ecosystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMCHIPHome initWithIdentifier:index:name:ecosystem:](v4, "initWithIdentifier:index:name:ecosystem:", v5, v6, v7, v8);

  return v9;
}

@end
