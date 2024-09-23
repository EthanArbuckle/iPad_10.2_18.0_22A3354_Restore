@implementation HMMutableCHIPVendor

- (id)copyWithZone:(_NSZone *)a3
{
  HMCHIPVendor *v4;
  void *v5;
  void *v6;
  HMCHIPVendor *v7;

  v4 = +[HMCHIPVendor allocWithZone:](HMCHIPVendor, "allocWithZone:", a3);
  -[HMCHIPVendor identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCHIPVendor name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMCHIPVendor initWithIdentifier:name:](v4, "initWithIdentifier:name:", v5, v6);

  -[HMCHIPVendor setAppleVendor:](v7, "setAppleVendor:", -[HMCHIPVendor isAppleVendor](self, "isAppleVendor"));
  -[HMCHIPVendor setSystemCommissionerVendor:](v7, "setSystemCommissionerVendor:", -[HMCHIPVendor isSystemCommissionerVendor](self, "isSystemCommissionerVendor"));
  return v7;
}

@end
