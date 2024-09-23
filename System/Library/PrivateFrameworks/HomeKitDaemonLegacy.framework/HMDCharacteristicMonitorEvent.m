@implementation HMDCharacteristicMonitorEvent

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HMDCharacteristicMonitorEvent;
  -[HMDCharacteristicEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicEvent eventValue](self, "eventValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[Char-Monitor-Event: %@, event value: %@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_evaluateNewValue:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  HMDCharacteristicMonitorEvent *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCharacteristicEventBase previousValue](self, "previousValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v6 = !-[HMDCharacteristicMonitorEvent _compareEventValue:](self, "_compareEventValue:", v4);
  else
    LOBYTE(v6) = 0;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = v5;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicEventBase characteristic](v8, "characteristic");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicEvent eventValue](v8, "eventValue");
    v17 = v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicEventBase characteristic](v8, "characteristic");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v18;
    v25 = 2112;
    v26 = v13;
    v27 = 2112;
    v28 = v14;
    v29 = 2112;
    v30 = v15;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Evaluated event, should fire: %@, previous value: %@, current value: %@, event monitor value: %@, %@", buf, 0x3Eu);

    v7 = v17;
    v5 = v18;
  }

  objc_autoreleasePoolPop(v7);
  return v6;
}

- (BOOL)_compareEventValue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[HMDCharacteristicEventBase characteristic](self, "characteristic", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicEvent eventValue](self, "eventValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCharacteristicEventBase compareValueOfCharacteristic:againstValue:operatorType:](HMDCharacteristicEventBase, "compareValueOfCharacteristic:againstValue:operatorType:", v4, v5, &unk_1E8B32AA8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (BOOL)isCompatibleWithEvent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDCharacteristicMonitorEvent;
  return -[HMDCharacteristicEvent isCompatibleWithEvent:](&v4, sel_isCompatibleWithEvent_, a3);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_20822 != -1)
    dispatch_once(&logCategory__hmf_once_t0_20822, &__block_literal_global_20823);
  return (id)logCategory__hmf_once_v1_20824;
}

void __44__HMDCharacteristicMonitorEvent_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_20824;
  logCategory__hmf_once_v1_20824 = v0;

}

@end
