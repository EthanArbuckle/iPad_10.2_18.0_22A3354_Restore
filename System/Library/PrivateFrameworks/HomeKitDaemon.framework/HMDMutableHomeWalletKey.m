@implementation HMDMutableHomeWalletKey

- (id)copyWithZone:(_NSZone *)a3
{
  HMDHomeWalletKey *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  HMDHomeWalletKey *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = +[HMDHomeWalletKey allocWithZone:](HMDHomeWalletKey, "allocWithZone:", a3);
  -[HMDHomeWalletKey typeIdentifier](self, "typeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKey serialNumber](self, "serialNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDHomeWalletKey state](self, "state");
  -[HMDHomeWalletKey walletKeyDescription](self, "walletKeyDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKey homeName](self, "homeName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDHomeWalletKey color](self, "color");
  -[HMDHomeWalletKey nfcInfos](self, "nfcInfos");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDHomeWalletKey initWithTypeIdentifier:serialNumber:state:walletKeyDescription:homeName:color:nfcInfos:](v4, "initWithTypeIdentifier:serialNumber:state:walletKeyDescription:homeName:color:nfcInfos:", v5, v6, v7, v8, v9, v10, v11);

  -[HMDHomeWalletKey accessCode](self, "accessCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKey setAccessCode:](v12, "setAccessCode:", v13);

  -[HMDHomeWalletKey changeAccessCodeHomeAppCustomURL](self, "changeAccessCodeHomeAppCustomURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKey setChangeAccessCodeHomeAppCustomURL:](v12, "setChangeAccessCodeHomeAppCustomURL:", v14);

  -[HMDHomeWalletKey customURL](self, "customURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKey setCustomURL:](v12, "setCustomURL:", v15);

  return v12;
}

@end
