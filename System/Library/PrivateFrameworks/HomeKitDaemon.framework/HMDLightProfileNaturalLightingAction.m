@implementation HMDLightProfileNaturalLightingAction

- (HMDLightProfileNaturalLightingAction)initWithUUID:(id)a3 lightProfileUUID:(id)a4 naturalLightingEnabled:(BOOL)a5 actionSet:(id)a6 notificationCenter:(id)a7
{
  id v12;
  id v13;
  id v14;
  HMDLightProfileNaturalLightingAction *v15;
  HMDLightProfileNaturalLightingAction *v16;
  uint64_t v17;
  NSUUID *lightProfileUUID;
  void *v19;
  uint64_t v20;
  HMDLightProfile *lightProfile;
  objc_super v23;

  v12 = a4;
  v13 = a6;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HMDLightProfileNaturalLightingAction;
  v15 = -[HMDAction initWithUUID:actionSet:](&v23, sel_initWithUUID_actionSet_, a3, v13);
  v16 = v15;
  if (v15)
  {
    v15->_naturalLightingEnabled = a5;
    v17 = objc_msgSend(v12, "copy");
    lightProfileUUID = v16->_lightProfileUUID;
    v16->_lightProfileUUID = (NSUUID *)v17;

    v16->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(v13, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lightProfileWithUUID:", v12);
    v20 = objc_claimAutoreleasedReturnValue();
    lightProfile = v16->_lightProfile;
    v16->_lightProfile = (HMDLightProfile *)v20;

    objc_storeStrong((id *)&v16->_notificationCenter, a7);
  }

  return v16;
}

- (HMDLightProfileNaturalLightingAction)initWithUUID:(id)a3 lightProfileUUID:(id)a4 naturalLightingEnabled:(BOOL)a5 actionSet:(id)a6
{
  _BOOL8 v6;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDLightProfileNaturalLightingAction *v15;

  v6 = a5;
  v10 = (void *)MEMORY[0x24BDD16D0];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMDLightProfileNaturalLightingAction initWithUUID:lightProfileUUID:naturalLightingEnabled:actionSet:notificationCenter:](self, "initWithUUID:lightProfileUUID:naturalLightingEnabled:actionSet:notificationCenter:", v13, v12, v6, v11, v14);

  return v15;
}

- (BOOL)isAssociatedWithAccessory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLightProfileNaturalLightingAction lightProfile](self, "lightProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqual:", v7);

  return v8;
}

- (BOOL)isCompatibleWithAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDLightProfileNaturalLightingAction;
  if (-[HMDAction isCompatibleWithAction:](&v9, sel_isCompatibleWithAction_, v4))
  {
    -[HMDLightProfileNaturalLightingAction lightProfileUUID](self, "lightProfileUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lightProfileUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isStaleWithAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[HMDLightProfileNaturalLightingAction lightProfile](self, "lightProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqual:", v8))
  {
    objc_msgSend(v5, "readCharacteristicRequests");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hmf_isEmpty");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)associatedAccessories
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[HMDLightProfileNaturalLightingAction lightProfile](self, "lightProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v4;
}

- (BOOL)isUnsecuringAction
{
  return 0;
}

- (id)writeRequestForTransitionStartWithLightProfile:(id)a3 startDate:(id)a4 type:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  +[HMDCharacteristicWriteRequest writeRequestForTransitionStartWithLightProfile:naturalLightingEnabled:startDate:type:](HMDCharacteristicWriteRequest, "writeRequestForTransitionStartWithLightProfile:naturalLightingEnabled:startDate:type:", v9, -[HMDLightProfileNaturalLightingAction isNaturalLightingEnabled](self, "isNaturalLightingEnabled"), v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setLightProfile:(id)a3
{
  HMDLightProfile *v4;
  HMDLightProfile *lightProfile;

  v4 = (HMDLightProfile *)a3;
  os_unfair_lock_lock_with_options();
  lightProfile = self->_lightProfile;
  self->_lightProfile = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDLightProfile)lightProfile
{
  os_unfair_lock_s *p_lock;
  HMDLightProfile *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_lightProfile;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setNaturalLightingEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_naturalLightingEnabled = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isNaturalLightingEnabled
{
  HMDLightProfileNaturalLightingAction *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_naturalLightingEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (HMDLightProfileNaturalLightingAction)initWithCoder:(id)a3
{
  id v4;
  HMDAction *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  HMDLightProfileNaturalLightingAction *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDLightProfileNaturalLightingAction *v16;
  HMDLightProfileNaturalLightingAction *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  objc_super v26;
  _QWORD v27[2];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[HMDAction initWithCoder:]([HMDAction alloc], "initWithCoder:", v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD6528]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[HMDAction actionSet](v5, "actionSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "decodeBoolForKey:", *MEMORY[0x24BDD64F8]);
      -[HMDAction uuid](v5, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[HMDLightProfileNaturalLightingAction initWithUUID:lightProfileUUID:naturalLightingEnabled:actionSet:](self, "initWithUUID:lightProfileUUID:naturalLightingEnabled:actionSet:", v9, v6, v8, v7);

      LODWORD(v8) = objc_msgSend(v4, "hmd_isForXPCTransport");
      v11 = objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess");
      if (!(_DWORD)v8 || v11)
      {
        v12 = (void *)MEMORY[0x24BDBCF20];
        v27[0] = objc_opt_class();
        v27[1] = objc_opt_class();
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setWithArray:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("services"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDLightProfileNaturalLightingAction setLightServices:](v10, "setLightServices:", v15);

      }
      v16 = v10;

      v17 = v16;
    }
    else
    {
      v22 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v24;
        v30 = 2112;
        v31 = 0;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode, light profile UUID is: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      v17 = 0;
    }

  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26.receiver = v16;
      v26.super_class = (Class)HMDLightProfileNaturalLightingAction;
      v21 = -[HMDLightProfileNaturalLightingAction class](&v26, sel_class);
      *(_DWORD *)buf = 138543618;
      v29 = v20;
      v30 = 2112;
      v31 = v21;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode base class: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    v17 = 0;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDLightProfileNaturalLightingAction;
  -[HMDAction encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    -[HMDLightProfileNaturalLightingAction lightProfile](self, "lightProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v5, *MEMORY[0x24BDD64E0]);
  }
  else
  {
    -[HMDLightProfileNaturalLightingAction lightProfileUUID](self, "lightProfileUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, *MEMORY[0x24BDD6528]);

    -[HMDLightProfileNaturalLightingAction lightProfile](self, "lightProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "services");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("services"));

  }
  v8 = -[HMDLightProfileNaturalLightingAction isNaturalLightingEnabled](self, "isNaturalLightingEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", v8, *MEMORY[0x24BDD64F8]);

}

- (BOOL)isActionForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HMDLightProfileNaturalLightingAction lightProfile](self, "lightProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "readCharacteristicRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__HMDLightProfileNaturalLightingAction_isActionForCharacteristic___block_invoke;
  v10[3] = &unk_24E79AA10;
  v11 = v4;
  v7 = v4;
  v8 = objc_msgSend(v6, "na_any:", v10);

  return v8;
}

- (unint64_t)type
{
  return 3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HMDLightProfileNaturalLightingAction;
  -[HMDAction dictionaryRepresentation](&v10, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMDLightProfileNaturalLightingAction lightProfileUUID](self, "lightProfileUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD6528]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDLightProfileNaturalLightingAction isNaturalLightingEnabled](self, "isNaturalLightingEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD64F8]);

  v8 = (void *)objc_msgSend(v4, "copy");
  return v8;
}

- (void)configureWithHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMDLightProfileNaturalLightingAction notificationCenter](self, "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[HMDLightProfileNaturalLightingAction notificationCenter](self, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleAccessoryProfileAddedNotification_, CFSTR("HMDAccessoryProfileAddedNotification"), 0);

  -[HMDLightProfileNaturalLightingAction lightProfileUUID](self, "lightProfileUUID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lightProfileWithUUID:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDLightProfileNaturalLightingAction setLightProfile:](self, "setLightProfile:", v7);
}

- (void)handleAccessoryProfileAddedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDLightProfileNaturalLightingAction *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDLightProfileNaturalLightingAction *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "lightProfiles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __80__HMDLightProfileNaturalLightingAction_handleAccessoryProfileAddedNotification___block_invoke;
    v21[3] = &unk_24E782CB8;
    v21[4] = self;
    objc_msgSend(v8, "na_firstObjectPassingTest:", v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v23 = v13;
        v24 = 2112;
        v25 = v14;
        v26 = 2112;
        v27 = v9;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling accessory profile update notification: %@, updating light profile to: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      -[HMDLightProfileNaturalLightingAction setLightProfile:](v11, "setLightProfile:", v9);
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "object");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      v26 = 2112;
      v27 = v20;
      v28 = 2112;
      v29 = objc_opt_class();
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Accessory profile update notification: %@ is sent by object: %@ which is not of type %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (HMDLightProfileNaturalLightingAction)initWithModelObject:(id)a3 parent:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDLightProfileNaturalLightingAction *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDLightProfileNaturalLightingAction *v24;
  void *v25;
  HMDLightProfileNaturalLightingAction *v26;
  NSObject *v27;
  void *v28;
  HMDLightProfileNaturalLightingAction *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  void *v36;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    v13 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    if (v15)
    {
      objc_msgSend(v12, "lightProfileUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v38 = v9;
        objc_msgSend(v15, "home");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lightProfileWithUUID:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x227676638]();
        v20 = self;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v22;
          v42 = 2112;
          v43 = v18;
          _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Creating natural lighting action with action model with light profile: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v19);
        objc_msgSend(v12, "uuid");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[HMDLightProfileNaturalLightingAction initWithUUID:lightProfileUUID:naturalLightingEnabled:actionSet:](v20, "initWithUUID:lightProfileUUID:naturalLightingEnabled:actionSet:", v23, v16, objc_msgSend(v12, "isNaturalLightingEnabled"), v15);

        if (v18)
          -[HMDLightProfileNaturalLightingAction setLightProfile:](v24, "setLightProfile:", v18);
        else
          -[HMDLightProfileNaturalLightingAction configureWithHome:](v24, "configureWithHome:", v17);
        v9 = v38;
        v26 = v24;

        v29 = v26;
      }
      else
      {
        v33 = (void *)MEMORY[0x227676638]();
        v26 = self;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = v9;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v36;
          v42 = 2112;
          v43 = 0;
          _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to create action, model is missing light profile UUID: %@", buf, 0x16u);

          v9 = v35;
        }

        objc_autoreleasePoolPop(v33);
        if (a5)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
          v29 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v29 = 0;
        }
      }

    }
    else
    {
      v30 = (void *)MEMORY[0x227676638]();
      v26 = self;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v39 = v9;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v41 = v32;
        v42 = 2112;
        v43 = v13;
        v44 = 2112;
        v45 = objc_opt_class();
        _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to create action, model's parent is of invalid class %@:%@", buf, 0x20u);

        v9 = v39;
      }

      objc_autoreleasePoolPop(v30);
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 22);
        v29 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = 0;
      }
    }

  }
  else
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v28;
      v42 = 2112;
      v43 = v10;
      v44 = 2112;
      v45 = objc_opt_class();
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to create action, model is of invalid class %@:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v25);
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 22);
      v29 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = 0;
    }
  }

  return v29;
}

- (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  void *v8;
  HMDLightProfileNaturalLightingActionModel *v9;
  void *v10;
  void *v11;
  HMDLightProfileNaturalLightingActionModel *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDLightProfileNaturalLightingAction *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  int64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (a4 < 4)
    return 0;
  -[HMDAction actionSet](self, "actionSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543874;
      v34 = v24;
      v35 = 2048;
      v36 = a4;
      v37 = 2112;
      v38 = 0;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to create model object for change type:%lu missing actionSet: %@", (uint8_t *)&v33, 0x20u);

    }
    objc_autoreleasePoolPop(v21);
    v12 = 0;
    goto LABEL_13;
  }
  v9 = [HMDLightProfileNaturalLightingActionModel alloc];
  -[HMDAction uuid](self, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v9, "initWithObjectChangeType:uuid:parentUUID:", a3, v10, v11);

  -[HMDLightProfileNaturalLightingAction lightProfileUUID](self, "lightProfileUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLightProfileNaturalLightingActionModel setLightProfileUUID:](v12, "setLightProfileUUID:", v13);

  -[HMDLightProfileNaturalLightingActionModel setNaturalLightingEnabled:](v12, "setNaturalLightingEnabled:", -[HMDLightProfileNaturalLightingAction isNaturalLightingEnabled](self, "isNaturalLightingEnabled"));
  -[HMDLightProfileNaturalLightingAction lightProfile](self, "lightProfile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "accessory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLightProfileNaturalLightingActionModel setAccessoryUUID:](v12, "setAccessoryUUID:", v17);

    objc_msgSend(v15, "services");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = &__block_literal_global_98924;
LABEL_11:
    objc_msgSend(v18, "na_map:", v20);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLightProfileNaturalLightingActionModel setServiceUUIDs:](v12, "setServiceUUIDs:", v32);

    goto LABEL_12;
  }
  -[HMDLightProfileNaturalLightingAction lightServices](self, "lightServices");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  if (v26)
  {
    -[HMDLightProfileNaturalLightingAction lightServices](self, "lightServices");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "accessory");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "uuid");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLightProfileNaturalLightingActionModel setAccessoryUUID:](v12, "setAccessoryUUID:", v30);

    -[HMDLightProfileNaturalLightingAction lightServices](self, "lightServices");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = &__block_literal_global_25_98925;
    goto LABEL_11;
  }
LABEL_12:

LABEL_13:
  return v12;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  HMDLightProfileNaturalLightingAction *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDLightProfileNaturalLightingAction *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  HMDLightProfileNaturalLightingAction *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  HMDLightProfileNaturalLightingAction *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  HMDLightProfileNaturalLightingAction *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  _QWORD v54[3];
  _QWORD v55[3];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    -[HMDAction actionSet](self, "actionSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "home");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        v53 = v8;
        objc_msgSend(v13, "setProperties");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "containsObject:", CFSTR("naturalLightingEnabledField"));

        v20 = (void *)MEMORY[0x227676638]();
        v21 = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
        if (v19)
        {
          v52 = v10;
          if (v23)
          {
            HMFGetLogIdentifier();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDLightProfileNaturalLightingAction isNaturalLightingEnabled](v21, "isNaturalLightingEnabled");
            HMFBooleanToString();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "isNaturalLightingEnabled");
            HMFBooleanToString();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v57 = v24;
            v58 = 2112;
            v59 = (uint64_t)v25;
            v60 = 2112;
            v61 = v26;
            _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating natural lighting enabled from %@ to %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v20);
          -[HMDLightProfileNaturalLightingAction setNaturalLightingEnabled:](v21, "setNaturalLightingEnabled:", objc_msgSend(v13, "isNaturalLightingEnabled"));
          v54[0] = CFSTR("kActionUUID");
          -[HMDAction uuid](v21, "uuid");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "UUIDString");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v55[0] = v27;
          v54[1] = CFSTR("kActionInfo");
          -[HMDLightProfileNaturalLightingAction dictionaryRepresentation](v21, "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v55[1] = v28;
          v54[2] = CFSTR("kHomeUUID");
          objc_msgSend(v17, "uuid");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "UUIDString");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v55[2] = v30;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = v52;
          v32 = (void *)MEMORY[0x227676638](objc_msgSend(v52, "respondWithPayload:", v31));
          v33 = v21;
          HMFGetOSLogHandle();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v57 = v35;
            v58 = 2112;
            v59 = (uint64_t)v31;
            _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Responding to client after updating action with response %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v32);

        }
        else
        {
          if (v23)
          {
            HMFGetLogIdentifier();
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setProperties");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v57 = v49;
            v58 = 2112;
            v59 = (uint64_t)v50;
            _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Ignoring update naturalLightingEnabledField property is not set: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v20);
          objc_msgSend(v10, "respondWithSuccess");
        }
        v8 = v53;
      }
      else
      {
        v44 = (void *)MEMORY[0x227676638]();
        v45 = self;
        HMFGetOSLogHandle();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v57 = v47;
          v58 = 2112;
          v59 = (uint64_t)v15;
          v60 = 2112;
          v61 = 0;
          _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to update action, action set missing home %@:%@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v44);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "respondWithError:", v48);

        v17 = 0;
      }
    }
    else
    {
      v40 = (void *)MEMORY[0x227676638]();
      v41 = self;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v43;
        v58 = 2112;
        v59 = 0;
        _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to update action, missing action set: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v40);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "respondWithError:", v17);
    }

  }
  else
  {
    v36 = (void *)MEMORY[0x227676638]();
    v37 = self;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v57 = v39;
      v58 = 2112;
      v59 = objc_opt_class();
      v60 = 2112;
      v61 = v11;
      _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Ignoring update from object of unhandled type %@:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v36);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "respondWithError:", v15);
  }

}

- (id)attributeDescriptions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)HMDLightProfileNaturalLightingAction;
  -[HMDAction attributeDescriptions](&v17, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDLightProfileNaturalLightingAction lightProfileUUID](self, "lightProfileUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Light Profile UUID"), v6);
  v18[0] = v7;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDLightProfileNaturalLightingAction lightProfile](self, "lightProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Light Profile"), v9);
  v18[1] = v10;
  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDLightProfileNaturalLightingAction isNaturalLightingEnabled](self, "isNaturalLightingEnabled");
  HMFBooleanToString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Natural Light Enabled"), v12);
  v18[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v14);

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

- (NSUUID)lightProfileUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)lightServices
{
  return self->_lightServices;
}

- (void)setLightServices:(id)a3
{
  objc_storeStrong((id *)&self->_lightServices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightServices, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_lightProfileUUID, 0);
  objc_storeStrong((id *)&self->_lightProfile, 0);
}

uint64_t __74__HMDLightProfileNaturalLightingAction_modelObjectWithChangeType_version___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __74__HMDLightProfileNaturalLightingAction_modelObjectWithChangeType_version___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __80__HMDLightProfileNaturalLightingAction_handleAccessoryProfileAddedNotification___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lightProfileUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __66__HMDLightProfileNaturalLightingAction_isActionForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)actionWithDictionaryRepresentation:(id)a3 actionSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDLightProfileNaturalLightingAction *v10;
  void *v11;
  void *v12;
  HMDLightProfileNaturalLightingAction *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[HMDLightProfileNaturalLightingAction actionWithDictionaryRepresentation:home:](HMDLightProfileNaturalLightingAction, "actionWithDictionaryRepresentation:home:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = [HMDLightProfileNaturalLightingAction alloc];
      objc_msgSend(v9, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lightProfileUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HMDLightProfileNaturalLightingAction initWithUUID:lightProfileUUID:naturalLightingEnabled:actionSet:](v10, "initWithUUID:lightProfileUUID:naturalLightingEnabled:actionSet:", v11, v12, objc_msgSend(v9, "isNaturalLightingEnabled"), v7);

    }
    else
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = a1;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543874;
        v24 = v21;
        v25 = 2112;
        v26 = v7;
        v27 = 2112;
        v28 = v8;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Failed to create natural lighting action with dictionary representation and action set %@:%@", (uint8_t *)&v23, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      v13 = 0;
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = a1;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v17;
      v25 = 2112;
      v26 = v7;
      v27 = 2112;
      v28 = 0;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Failed to create natural lighting action with dictionary representation, action set missing home %@:%@", (uint8_t *)&v23, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 0;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)actionWithDictionaryRepresentation:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  HMDLightProfileNaturalLightingAction *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  void *v35;
  void *context;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  const __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("kActionUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kActionType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = a1;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v24;
      v39 = 2112;
      v40 = v6;
      v41 = 2112;
      v42 = CFSTR("kActionType");
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Failed to create natural lighting action with dictionary representation mising key %@:%@", buf, 0x20u);

    }
    goto LABEL_16;
  }
  if (objc_msgSend(v12, "integerValue") != 3)
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = a1;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      HMActionTypeAsString();
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v26;
      v39 = 2112;
      v40 = v6;
      v41 = 2112;
      v42 = v27;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Failed to create natural lighting action with dictionary representation invalid action type %@:%@", buf, 0x20u);

    }
LABEL_16:

    objc_autoreleasePoolPop(v21);
    v17 = 0;
    goto LABEL_25;
  }
  v14 = (const __CFString *)*MEMORY[0x24BDD6528];
  objc_msgSend(v6, "hmf_UUIDForKey:", *MEMORY[0x24BDD6528]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v7, "lightProfileWithUUID:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = -[HMDLightProfileNaturalLightingAction initWithUUID:lightProfileUUID:naturalLightingEnabled:actionSet:]([HMDLightProfileNaturalLightingAction alloc], "initWithUUID:lightProfileUUID:naturalLightingEnabled:actionSet:", v11, v15, objc_msgSend(v6, "hmf_BOOLForKey:", *MEMORY[0x24BDD64F8]), 0);
      context = (void *)MEMORY[0x227676638](-[HMDLightProfileNaturalLightingAction setLightProfile:](v17, "setLightProfile:", v16));
      v18 = a1;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v35 = v16;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v38 = v20;
        v39 = 2112;
        v40 = v18;
        v41 = 2112;
        v42 = (const __CFString *)v17;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Created natural lighting action with dictionary representation %@:%@", buf, 0x20u);

        v16 = v35;
      }
    }
    else
    {
      context = (void *)MEMORY[0x227676638]();
      v32 = a1;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v33;
        v39 = 2112;
        v40 = v15;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Failed to create natural lighting action with dictionary representation light profile with UUID does not exisit: %@", buf, 0x16u);

      }
      v17 = 0;
    }

    objc_autoreleasePoolPop(context);
  }
  else
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = a1;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v31;
      v39 = 2112;
      v40 = v6;
      v41 = 2112;
      v42 = v14;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Failed to create natural lighting action with dictionary representation missing key %@:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v28);
    v17 = 0;
  }

LABEL_25:
  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t30_98957 != -1)
    dispatch_once(&logCategory__hmf_once_t30_98957, &__block_literal_global_29_98958);
  return (id)logCategory__hmf_once_v31_98959;
}

void __51__HMDLightProfileNaturalLightingAction_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v31_98959;
  logCategory__hmf_once_v31_98959 = v0;

}

@end
