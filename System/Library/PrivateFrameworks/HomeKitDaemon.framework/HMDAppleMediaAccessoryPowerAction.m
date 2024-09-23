@implementation HMDAppleMediaAccessoryPowerAction

- (HMDAppleMediaAccessoryPowerAction)initWithUUID:(id)a3 accessory:(id)a4 targetSleepWakeState:(unint64_t)a5 actionSet:(id)a6
{
  id v10;
  HMDAppleMediaAccessoryPowerAction *v11;
  HMDAppleMediaAccessoryPowerAction *v12;
  objc_super v14;

  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDAppleMediaAccessoryPowerAction;
  v11 = -[HMDAction initWithUUID:actionSet:](&v14, sel_initWithUUID_actionSet_, a3, a6);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_accessory, v10);
    v12->_targetSleepWakeState = a5;
  }

  return v12;
}

- (unint64_t)type
{
  return 4;
}

- (id)stateDump
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDAction uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessoryPowerAction accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Action uuid: %@, Accessory: %@, Power State: %tu"), v4, v5, -[HMDAppleMediaAccessoryPowerAction targetSleepWakeState](self, "targetSleepWakeState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMDAppleMediaAccessoryPowerAction;
  -[HMDAction dictionaryRepresentation](&v11, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMDAppleMediaAccessoryPowerAction accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD5270]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAppleMediaAccessoryPowerAction targetSleepWakeState](self, "targetSleepWakeState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD5280]);

  v9 = (void *)objc_msgSend(v4, "copy");
  return v9;
}

- (void)executeWithSource:(unint64_t)a3 clientName:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  HMDAppleMediaAccessoryPowerAction *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  HMDAppleMediaAccessoryPowerAction *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v12;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Executing Apple TV Power Action", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  v13 = -[HMDAppleMediaAccessoryPowerAction targetSleepWakeState](v10, "targetSleepWakeState");
  if (v13)
  {
    if (v13 == 2)
    {
      v14 = &unk_24E96D1C0;
    }
    else if (v13 == 1)
    {
      v14 = &unk_24E96D1A8;
    }
    else
    {
      v14 = 0;
    }
    objc_initWeak((id *)buf, v10);
    -[HMDAppleMediaAccessoryPowerAction accessory](v10, "accessory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "mediaProfile");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __84__HMDAppleMediaAccessoryPowerAction_executeWithSource_clientName_completionHandler___block_invoke;
    v22[3] = &unk_24E79AFA0;
    objc_copyWeak(&v24, (id *)buf);
    v23 = v8;
    objc_msgSend(v21, "handleSetValue:withRequestProperty:withCompletionHandler:", v14, CFSTR("HMDMediaProfileSetPowerKey"), v22);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v10;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[HMDAppleMediaAccessoryPowerAction targetSleepWakeState](v16, "targetSleepWakeState");
      *(_DWORD *)buf = 138543618;
      v26 = v18;
      v27 = 2048;
      v28 = v19;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Invalid target sleep wake state set: %tu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (BOOL)requiresDeviceUnlock
{
  return 0;
}

- (id)associatedAccessories
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[HMDAppleMediaAccessoryPowerAction accessory](self, "accessory");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v4;
}

- (BOOL)isAssociatedWithAccessory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessoryPowerAction accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "hmf_isEqualToUUID:", v6);

  return v7;
}

- (BOOL)isUnsecuringAction
{
  return 0;
}

- (BOOL)isCompatibleWithAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDAppleMediaAccessoryPowerAction;
  if (-[HMDAction isCompatibleWithAction:](&v9, sel_isCompatibleWithAction_, v4))
  {
    -[HMDAppleMediaAccessoryPowerAction accessory](self, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 == v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isStaleWithAccessory:(id)a3
{
  return 0;
}

- (HMDAppleMediaAccessoryPowerAction)initWithModelObject:(id)a3 parent:(id)a4 error:(id *)a5
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
  id v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  HMDAppleMediaAccessoryPowerAction *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  HMDAppleMediaAccessoryPowerAction *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v46;
  id v47;
  void *v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
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

    if (!v15)
    {
      v34 = (void *)MEMORY[0x227676638]();
      v25 = self;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v50 = v36;
        _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Parent is not an actionset", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v34);
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 22);
        v33 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = 0;
      }
      goto LABEL_42;
    }
    objc_msgSend(v15, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accessoryUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accessoryWithUUID:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v37 = (void *)MEMORY[0x227676638]();
      v25 = self;
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "accessoryUUID");
        v48 = v37;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v39;
        v51 = 2112;
        v52 = (uint64_t)v40;
        _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Unable to find accessory with UUID: %@", buf, 0x16u);

        v37 = v48;
      }

      objc_autoreleasePoolPop(v37);
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
        v33 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = 0;
      }
      goto LABEL_41;
    }
    v19 = v18;
    objc_opt_class();
    v20 = objc_opt_isKindOfClass() & 1;
    if (v20)
      v21 = v19;
    else
      v21 = 0;
    v47 = v21;

    if (v20)
    {
      objc_msgSend(v12, "targetSleepWakeState");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "unsignedIntegerValue");

      if ((unint64_t)(v23 - 3) > 0xFFFFFFFFFFFFFFFDLL)
      {
        objc_msgSend(v12, "uuid");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[HMDAppleMediaAccessoryPowerAction initWithUUID:accessory:targetSleepWakeState:actionSet:](self, "initWithUUID:accessory:targetSleepWakeState:actionSet:", v44, v19, v23, v15);

        v33 = v25;
        goto LABEL_40;
      }
      v24 = (void *)MEMORY[0x227676638]();
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v46 = v24;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v27;
        v51 = 2048;
        v52 = v23;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Invalid target sleep wake state: %lu", buf, 0x16u);

        v24 = v46;
      }

      objc_autoreleasePoolPop(v24);
      if (a5)
      {
        v28 = (void *)MEMORY[0x24BDD1540];
        v29 = 3;
LABEL_36:
        objc_msgSend(v28, "hmErrorWithCode:", v29, v46, v47);
        v33 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_40:

LABEL_41:
LABEL_42:

        goto LABEL_43;
      }
    }
    else
    {
      v41 = (void *)MEMORY[0x227676638]();
      v25 = self;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v43;
        v51 = 2112;
        v52 = 0;
        _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not an Apple Media Accessory: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v41);
      if (a5)
      {
        v28 = (void *)MEMORY[0x24BDD1540];
        v29 = 22;
        goto LABEL_36;
      }
    }
    v33 = 0;
    goto LABEL_40;
  }
  v30 = (void *)MEMORY[0x227676638]();
  v25 = self;
  HMFGetOSLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v50 = v32;
    _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Action model does not exist", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v30);
  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 22);
    v33 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }
LABEL_43:

  return v33;
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  HMDAppleMediaAccessoryPowerActionModel *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAppleMediaAccessoryPowerActionModel *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a4 < 4)
  {
    v10 = 0;
  }
  else
  {
    v6 = [HMDAppleMediaAccessoryPowerActionModel alloc];
    -[HMDAction uuid](self, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAction actionSet](self, "actionSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v6, "initWithObjectChangeType:uuid:parentUUID:", a3, v7, v9);

    -[HMDAppleMediaAccessoryPowerAction accessory](self, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessoryPowerActionModel setAccessoryUUID:](v10, "setAccessoryUUID:", v12);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAppleMediaAccessoryPowerAction targetSleepWakeState](self, "targetSleepWakeState"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessoryPowerActionModel setTargetSleepWakeState:](v10, "setTargetSleepWakeState:", v13);

  }
  return v10;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  HMDAppleMediaAccessoryPowerAction *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  HMDAppleMediaAccessoryPowerAction *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDAppleMediaAccessoryPowerAction *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
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
    objc_msgSend(v10, "transactionResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "propertyWasSet:", CFSTR("accessoryUUID")))
    {
      if (!objc_msgSend(v13, "propertyWasSet:", CFSTR("targetSleepWakeState")))
        goto LABEL_22;
      goto LABEL_20;
    }
    -[HMDAction actionSet](self, "actionSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessoryUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accessoryWithUUID:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    if (v20)
    {
      -[HMDAppleMediaAccessoryPowerAction setAccessory:](self, "setAccessory:", v20);

      if ((objc_msgSend(v13, "propertyWasSet:", CFSTR("targetSleepWakeState")) & 1) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
    v26 = (void *)MEMORY[0x227676638]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "accessoryUUID");
      v33 = v26;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v29;
      v36 = 2112;
      v37 = v13;
      v38 = 2112;
      v39 = v30;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unknown accessory saved in object model %@: %@", buf, 0x20u);

      v26 = v33;
      v27 = v32;
    }

    objc_autoreleasePoolPop(v26);
    if ((objc_msgSend(v13, "propertyWasSet:", CFSTR("targetSleepWakeState")) & 1) != 0)
    {
LABEL_20:
      objc_msgSend(v13, "targetSleepWakeState");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessoryPowerAction setTargetSleepWakeState:](self, "setTargetSleepWakeState:", objc_msgSend(v31, "integerValue"));

LABEL_21:
      objc_msgSend(v14, "markChanged");
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v24;
      v36 = 2112;
      v37 = v11;
      v38 = 2112;
      v39 = (id)objc_opt_class();
      v25 = v39;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "respondWithError:", v14);
  }
LABEL_22:

}

- (HMDAppleMediaAccessoryPowerAction)initWithCoder:(id)a3
{
  id v4;
  HMDAction *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  HMDAppleMediaAccessoryPowerAction *v11;
  HMDAppleMediaAccessoryPowerAction *v12;
  HMDAppleMediaAccessoryPowerAction *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[HMDAction initWithCoder:]([HMDAction alloc], "initWithCoder:", v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD5268]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD5278]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");
    -[HMDAction uuid](v5, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAction actionSet](v5, "actionSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HMDAppleMediaAccessoryPowerAction initWithUUID:accessory:targetSleepWakeState:actionSet:](self, "initWithUUID:accessory:targetSleepWakeState:actionSet:", v9, v6, v8, v10);

    v12 = v11;
    v13 = v12;
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19.receiver = v12;
      v19.super_class = (Class)HMDAppleMediaAccessoryPowerAction;
      v17 = -[HMDAppleMediaAccessoryPowerAction class](&v19, sel_class);
      *(_DWORD *)buf = 138543618;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode base class: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDAppleMediaAccessoryPowerAction;
  v4 = a3;
  -[HMDAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[HMDAppleMediaAccessoryPowerAction accessory](self, "accessory", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, *MEMORY[0x24BDD5268]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAppleMediaAccessoryPowerAction targetSleepWakeState](self, "targetSleepWakeState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, *MEMORY[0x24BDD5278]);

}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAction uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("UUID"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAppleMediaAccessoryPowerAction type](self, "type");
  HMActionTypeAsString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Type"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMDAppleMediaAccessory)accessory
{
  return (HMDAppleMediaAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (unint64_t)targetSleepWakeState
{
  return self->_targetSleepWakeState;
}

- (void)setTargetSleepWakeState:(unint64_t)a3
{
  self->_targetSleepWakeState = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
}

void __84__HMDAppleMediaAccessoryPowerAction_executeWithSource_clientName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x227676638]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v12;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v5;
    v13 = "%{public}@Failed to execute %@ with error: %@";
    v14 = v11;
    v15 = OS_LOG_TYPE_ERROR;
    v16 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v12;
    v21 = 2112;
    v22 = v9;
    v13 = "%{public}@Successfully executed %@";
    v14 = v11;
    v15 = OS_LOG_TYPE_DEFAULT;
    v16 = 22;
  }
  _os_log_impl(&dword_2218F0000, v14, v15, v13, (uint8_t *)&v19, v16);

LABEL_7:
  objc_autoreleasePoolPop(v8);
  v17 = _Block_copy(*(const void **)(a1 + 32));
  v18 = v17;
  if (v17)
    (*((void (**)(void *, id))v17 + 2))(v17, v5);

}

+ (id)actionWithDictionaryRepresentation:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDAppleMediaAccessoryPowerActionModel *v10;
  void *v11;
  void *v12;
  HMDAppleMediaAccessoryPowerActionModel *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  HMDAppleMediaAccessoryPowerAction *v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v41;
  uint64_t v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kActionType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    _HMFPreconditionFailure();
  v9 = v8;
  if (objc_msgSend(v8, "unsignedIntegerValue") == 4)
  {
    v10 = [HMDAppleMediaAccessoryPowerActionModel alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v10, "initWithObjectChangeType:uuid:parentUUID:", 0, v11, v12);

    -[HMDAppleMediaAccessoryPowerActionModel loadModelWithActionInformation:](v13, "loadModelWithActionInformation:", v6);
    -[HMDAppleMediaAccessoryPowerActionModel accessoryUUID](v13, "accessoryUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessoryWithUUID:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    if (v18)
    {
      -[HMDAppleMediaAccessoryPowerActionModel targetSleepWakeState](v13, "targetSleepWakeState");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedIntegerValue");

      if ((unint64_t)(v20 - 3) > 0xFFFFFFFFFFFFFFFDLL)
      {
        objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("kActionUUID"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if (v36)
        {
          v38 = v36;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1880], "UUID");
          v38 = (id)objc_claimAutoreleasedReturnValue();
        }
        v39 = v38;

        v30 = -[HMDAppleMediaAccessoryPowerAction initWithUUID:accessory:targetSleepWakeState:actionSet:]([HMDAppleMediaAccessoryPowerAction alloc], "initWithUUID:accessory:targetSleepWakeState:actionSet:", v39, v18, v20, 0);
        goto LABEL_22;
      }
      v21 = MEMORY[0x227676638]();
      v22 = a1;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v41 = v21;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v24;
        v45 = 2048;
        v46 = v20;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Invalid power state: %tu", buf, 0x16u);

        v21 = v41;
      }

      v25 = (void *)v21;
    }
    else
    {
      v31 = MEMORY[0x227676638]();
      v32 = a1;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAppleMediaAccessoryPowerActionModel accessoryUUID](v13, "accessoryUUID");
        v42 = v31;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v34;
        v45 = 2112;
        v46 = (uint64_t)v35;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find an Apple TV in the home with UUID: %@", buf, 0x16u);

        v31 = v42;
      }

      v25 = (void *)v31;
    }
    objc_autoreleasePoolPop(v25);
    v30 = 0;
LABEL_22:

    goto LABEL_23;
  }
  v26 = (void *)MEMORY[0x227676638]();
  v27 = a1;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v29;
    v45 = 2112;
    v46 = (uint64_t)v9;
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Invalid action type: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v26);
  v30 = 0;
LABEL_23:

  return v30;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t26_221591 != -1)
    dispatch_once(&logCategory__hmf_once_t26_221591, &__block_literal_global_221592);
  return (id)logCategory__hmf_once_v27_221593;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __48__HMDAppleMediaAccessoryPowerAction_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v27_221593;
  logCategory__hmf_once_v27_221593 = v0;

}

@end
