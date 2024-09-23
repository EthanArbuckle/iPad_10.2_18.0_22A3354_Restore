@implementation HMMutableHomeWalletKeyDeviceState

- (id)copyWithZone:(_NSZone *)a3
{
  HMHomeWalletKeyDeviceState *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(HMHomeWalletKeyDeviceState);
  -[HMHomeWalletKeyDeviceState setCanAddWalletKeyErrorCode:](v4, "setCanAddWalletKeyErrorCode:", -[HMHomeWalletKeyDeviceState canAddWalletKeyErrorCode](self, "canAddWalletKeyErrorCode"));
  -[HMHomeWalletKeyDeviceState walletKey](self, "walletKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeWalletKeyDeviceState setWalletKey:](v4, "setWalletKey:", v5);

  -[HMHomeWalletKeyDeviceState expressEnablementConflictingPassDescription](self, "expressEnablementConflictingPassDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeWalletKeyDeviceState setExpressEnablementConflictingPassDescription:](v4, "setExpressEnablementConflictingPassDescription:", v6);

  -[HMHomeWalletKeyDeviceState setCanAddWalletKey:](v4, "setCanAddWalletKey:", -[HMHomeWalletKeyDeviceState canAddWalletKey](self, "canAddWalletKey"));
  return v4;
}

@end
