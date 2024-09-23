@implementation HMDCharacteristicMonitorEvent

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
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
  void *v6;
  _BOOL8 v7;
  void *v8;
  HMDCharacteristicMonitorEvent *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  _BOOL8 v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCharacteristicEventBase characteristic](self, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previousValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    LODWORD(v7) = !-[HMDCharacteristicMonitorEvent _compareEventValue:](self, "_compareEventValue:", v4);
  else
    LOBYTE(v7) = 0;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicEventBase characteristic](v9, "characteristic");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicEvent eventValue](v9, "eventValue");
    v19 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicEventBase characteristic](v9, "characteristic");
    v18 = v7;
    v7 = (_BOOL8)v6;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v7;
    v26 = 2112;
    v27 = v14;
    v28 = 2112;
    v29 = v15;
    v30 = 2112;
    v31 = v16;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Evaluated event, should fire: %@, previous value: %@, current value: %@, event monitor value: %@, %@", buf, 0x3Eu);

    v6 = (void *)v7;
    LOBYTE(v7) = v18;

    v8 = v19;
  }

  objc_autoreleasePoolPop(v8);
  return v7;
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
  +[HMDCharacteristicEventBase compareValueOfCharacteristic:againstValue:operatorType:](HMDCharacteristicEventBase, "compareValueOfCharacteristic:againstValue:operatorType:", v4, v5, &unk_24E96A820);
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
  if (logCategory__hmf_once_t0_28940 != -1)
    dispatch_once(&logCategory__hmf_once_t0_28940, &__block_literal_global_28941);
  return (id)logCategory__hmf_once_v1_28942;
}

void __44__HMDCharacteristicMonitorEvent_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_28942;
  logCategory__hmf_once_v1_28942 = v0;

}

@end
