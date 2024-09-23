@implementation HMMutableCHIPAccessoryPairing

- (id)copyWithZone:(_NSZone *)a3
{
  HMCHIPAccessoryPairing *v4;
  void *v5;
  void *v6;
  HMCHIPAccessoryPairing *v7;
  void *v8;

  v4 = +[HMCHIPAccessoryPairing allocWithZone:](HMCHIPAccessoryPairing, "allocWithZone:", a3);
  -[HMCHIPAccessoryPairing identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCHIPAccessoryPairing home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMCHIPAccessoryPairing initWithIdentifier:home:](v4, "initWithIdentifier:home:", v5, v6);

  -[HMCHIPAccessoryPairing systemCommissionerPairingUUID](self, "systemCommissionerPairingUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCHIPAccessoryPairing setSystemCommissionerPairingUUID:](v7, "setSystemCommissionerPairingUUID:", v8);

  return v7;
}

@end
