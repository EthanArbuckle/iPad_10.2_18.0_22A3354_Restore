@implementation __HMDDeviceController

- (__HMDDeviceController)initWithDevice:(id)a3 accountRegistry:(id)a4
{
  id v7;
  id v8;
  void *v9;
  __HMDDeviceController *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)__HMDDeviceController;
  v10 = -[HMDDeviceController initWithDevice:identifier:](&v14, sel_initWithDevice_identifier_, v8, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_accountRegistry, a4);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v10, sel___handleAddedAccount_, CFSTR("HMDAccountRegistryAddedAccountNotification"), v7);
    objc_msgSend(v11, "addObserver:selector:name:object:", v10, sel___handleAddedDevice_, CFSTR("HMDAccountAddedDeviceNotification"), 0);
    NSStringFromSelector(sel_started);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v10, v12, 5, __HMDAccountRegistryStartedContext);

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[__HMDDeviceController accountRegistry](self, "accountRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_started);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, v4, __HMDAccountRegistryStartedContext);

  v5.receiver = self;
  v5.super_class = (Class)__HMDDeviceController;
  -[HMDDeviceController dealloc](&v5, sel_dealloc);
}

- (void)updateWithDevice:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __HMDDeviceController *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __HMDDeviceController *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  __HMDDeviceController *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  __HMDDeviceController *v26;
  NSObject *v27;
  void *v28;
  char v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v29 = 0;
  -[HMDDeviceController device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[__HMDDeviceController accountRegistry](self, "accountRegistry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceForDevice:exists:", v8, &v29);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v8, "shouldMergeObject:", v6))
      {
        v17 = (void *)MEMORY[0x227676638]();
        v18 = self;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v31 = v20;
          v32 = 2112;
          v33 = v6;
          _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Merging with device: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v17);
        if (objc_msgSend(v8, "mergeObject:", v6))
        {
          v21 = (void *)MEMORY[0x227676638]();
          v22 = v18;
          HMFGetOSLogHandle();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v31 = v24;
            _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Updated device", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v21);
        }
      }
      v16 = 0;
      v15 = 0;
      if (v7)
        goto LABEL_9;
      goto LABEL_10;
    }
    if (v10 == v8)
    {
      objc_msgSend(v8, "account");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isCurrentAccount"))
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 48, CFSTR("Not supported."), CFSTR("Cannot update device on current account."), 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = (void *)MEMORY[0x227676638]();
        v26 = self;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v31 = v28;
          v32 = 2112;
          v33 = v6;
          _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Updating with device: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v25);
        objc_msgSend(v8, "updateWithDevice:", v6);
        v15 = 0;
      }
      v10 = v8;
      if (v7)
        goto LABEL_9;
      goto LABEL_10;
    }
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v14;
      v32 = 2112;
      v33 = v8;
      v34 = 2112;
      v35 = v10;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Backed Device not equal to device: %@ != %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 48, CFSTR("Not supported."), CFSTR("Backed Device unexpected value."), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Device not found."), CFSTR("Unknown device."), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
  }
  v16 = 0;
  if (v7)
LABEL_9:
    v7[2](v7, v15);
LABEL_10:

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  __HMDDeviceController *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __HMDDeviceController *v25;
  NSObject *v26;
  void *v27;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if ((void *)__HMDAccountRegistryStartedContext == a6)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    if (objc_msgSend(v16, "BOOLValue"))
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v20;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Registry is available", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      -[__HMDDeviceController accountRegistry](v18, "accountRegistry");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDeviceController identifier](v18, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "deviceForIdentifier:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = (void *)MEMORY[0x227676638]();
        v25 = v18;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v30 = v27;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Device present in registry, updating", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v24);
        __HMDDeviceControllerUpdateDevice(v25, v23);
      }

    }
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)__HMDDeviceController;
    -[__HMDDeviceController observeValueForKeyPath:ofObject:change:context:](&v28, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)__handleAddedAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  __HMDDeviceController *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMDAccountNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "devices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __46____HMDDeviceController___handleAddedAccount___block_invoke;
    v16[3] = &unk_24E787A50;
    v16[4] = self;
    objc_msgSend(v9, "hmf_objectPassingTest:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shortDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v14;
        v19 = 2112;
        v20 = v15;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Account added containing target device: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      __HMDDeviceControllerUpdateDevice(v12, v10);
    }

  }
}

- (void)__handleAddedDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __HMDDeviceController *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HMDDeviceNotificationKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDeviceController identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "hmf_isEqualToUUID:", v13) & 1) != 0)
  {
    -[__HMDDeviceController accountRegistry](self, "accountRegistry");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "accounts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", v7);

    if (v16)
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "shortDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v20;
        v24 = 2112;
        v25 = v21;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Target device added to account: %@", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      __HMDDeviceControllerUpdateDevice(v18, v11);
    }
  }
  else
  {

  }
}

- (HMDAccountRegistry)accountRegistry
{
  return (HMDAccountRegistry *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountRegistry, 0);
}

@end
