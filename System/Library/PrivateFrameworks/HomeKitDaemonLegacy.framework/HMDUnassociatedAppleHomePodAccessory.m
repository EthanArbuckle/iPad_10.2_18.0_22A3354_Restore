@implementation HMDUnassociatedAppleHomePodAccessory

- (id)modelForChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  HMDUnassociatedAppleHomePodAccessory *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  __objc2_class **v16;
  HMDUnassociatedAppleHomePodAccessory *v17;
  void *v18;
  uint8_t v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = -[HMDUnassociatedAppleMediaAccessory variant](self, "variant");
  if (v10 != 4)
  {
    if (v10 == 1)
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v20 = 138543362;
        *(_QWORD *)&v20[4] = v14;
        v15 = "%{public}@Unexpectedly creating an original HomePod model from a original HomePod";
        goto LABEL_9;
      }
    }
    else
    {
      if (v10)
      {
LABEL_11:
        v16 = off_1E89990F8;
        goto LABEL_12;
      }
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v20 = 138543362;
        *(_QWORD *)&v20[4] = v14;
        v15 = "%{public}@Unexpectedly creating a model of an unknown HomePod";
LABEL_9:
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_FAULT, v15, v20, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v11);
    goto LABEL_11;
  }
  v16 = off_1E8999108;
LABEL_12:
  -[__objc2_class homePodAccessoryModelWithChangeType:uuid:parentUUID:](*v16, "homePodAccessoryModelWithChangeType:uuid:parentUUID:", a3, v8, v9, *(_OWORD *)v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (HMDUnassociatedAppleHomePodAccessory)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 productColor:(int64_t)a6 idsIdentifierString:(id)a7 requiredPairingCapabilities:(unint64_t)a8 minimumPairingSoftware:(id)a9 rawAccessoryCapabilities:(id)a10 rawResidentCapabilities:(id)a11 messageDispatcher:(id)a12
{
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HMDUnassociatedAppleHomePodAccessory;
  return -[HMDUnassociatedAppleMediaAccessory initWithIdentifier:name:category:requiredPairingCapabilities:minimumPairingSoftware:productColor:idsIdentifierString:rawAccessoryCapabilities:rawResidentCapabilities:messageDispatcher:](&v13, sel_initWithIdentifier_name_category_requiredPairingCapabilities_minimumPairingSoftware_productColor_idsIdentifierString_rawAccessoryCapabilities_rawResidentCapabilities_messageDispatcher_, a3, a4, a5, a8, a9, a6, a7, a10, a11, a12);
}

@end
