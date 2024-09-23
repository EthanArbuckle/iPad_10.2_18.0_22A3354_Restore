@implementation HMMutableCHIPEcosystem

- (id)copyWithZone:(_NSZone *)a3
{
  HMCHIPEcosystem *v4;
  void *v5;
  void *v6;
  HMCHIPEcosystem *v7;

  v4 = +[HMCHIPEcosystem allocWithZone:](HMCHIPEcosystem, "allocWithZone:", a3);
  -[HMCHIPEcosystem rootPublicKey](self, "rootPublicKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCHIPEcosystem vendor](self, "vendor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMCHIPEcosystem initWithRootPublicKey:vendor:](v4, "initWithRootPublicKey:vendor:", v5, v6);

  return v7;
}

@end
