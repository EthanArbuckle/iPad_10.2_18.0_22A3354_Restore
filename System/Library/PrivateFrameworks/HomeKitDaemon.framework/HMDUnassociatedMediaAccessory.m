@implementation HMDUnassociatedMediaAccessory

- (id)modelForChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5
{
  id v7;
  id v8;
  HMDMediaAccessoryModel *v9;

  v7 = a5;
  v8 = a4;
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:]([HMDMediaAccessoryModel alloc], "initWithObjectChangeType:uuid:parentUUID:", a3, v8, v7);

  return v9;
}

- (HMDUnassociatedMediaAccessory)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 messageDispatcher:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  HMDUnassociatedMediaAccessory *v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v12)
  {
    v14 = (void *)MEMORY[0x24BDD7338];
    v15 = objc_alloc(MEMORY[0x24BDD1880]);
    v16 = (void *)objc_msgSend(v15, "initWithUUIDString:", *MEMORY[0x24BDD4A30]);
    objc_msgSend(v14, "categoryWithIdentifier:", v16);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  v19.receiver = self;
  v19.super_class = (Class)HMDUnassociatedMediaAccessory;
  v17 = -[HMDUnassociatedAccessory initWithIdentifier:name:category:messageDispatcher:](&v19, sel_initWithIdentifier_name_category_messageDispatcher_, v10, v11, v12, v13);

  return v17;
}

- (HMDUnassociatedMediaAccessory)initWithAdvertisement:(id)a3 messageDispatcher:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  HMDUnassociatedMediaAccessory *v12;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "category");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDUnassociatedMediaAccessory initWithIdentifier:name:category:messageDispatcher:](self, "initWithIdentifier:name:category:messageDispatcher:", v10, v9, v11, v8);

  if (v12)
    objc_storeStrong((id *)&v12->_advertisement, a3);

  return v12;
}

- (void)updateAdvertisementData:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    os_unfair_recursive_lock_lock_with_options();
    objc_storeStrong((id *)&self->_advertisement, a3);
    os_unfair_recursive_lock_unlock();
    v5 = v6;
  }

}

- (BOOL)isHAPAirPlay2Accessory
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  char v6;

  -[HMDUnassociatedMediaAccessory advertisement](self, "advertisement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    objc_msgSend(v4, "outputDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x2276756B4](objc_msgSend(v5, "outputDevice"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)transportTypes
{
  return 16;
}

- (id)dumpDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[HMDUnassociatedAccessory name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAccessory uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAccessory category](self, "category");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAccessory identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Media Accessory '%@': uuid %@  category %@ identifier %@"), v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKey:", v10, *MEMORY[0x24BE3EB68]);
  return v3;
}

- (int64_t)associationOptions
{
  void *v3;
  void *v4;
  int64_t v5;

  -[HMDUnassociatedMediaAccessory advertisement](self, "advertisement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[HMDUnassociatedMediaAccessory advertisement](self, "advertisement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "associationOptions");

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDUnassociatedAccessory identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDUnassociatedMediaAccessory *v4;
  HMDUnassociatedMediaAccessory *v5;
  HMDUnassociatedMediaAccessory *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMDUnassociatedMediaAccessory *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDUnassociatedAccessory identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUnassociatedAccessory identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)addTransactionForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  HMDUnassociatedMediaAccessory *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDUnassociatedAccessory uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedMediaAccessory modelForChangeType:uuid:parentUUID:](self, "modelForChangeType:uuid:parentUUID:", 1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDUnassociatedAccessory identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIdentifier:", v8);

  -[HMDUnassociatedAccessory name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProvidedName:", v9);

  v10 = (void *)MEMORY[0x24BDD7338];
  -[HMDUnassociatedAccessory category](self, "category");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "categoryIdentifierForCategory:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessoryCategory:", v12);

  objc_msgSend(v7, "providedName");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v7, "configuredName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      -[HMDUnassociatedAccessory category](self, "category");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "providedName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqualToString:", v18);

      if ((v19 & 1) == 0)
      {
        -[HMDUnassociatedAccessory category](self, "category");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "categoryType");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x24BDD49E0]);

        if ((v22 & 1) == 0)
        {
          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          objc_msgSend(v4, "rooms", 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v23, "copy");

          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v43;
LABEL_7:
            v28 = 0;
            while (1)
            {
              if (*(_QWORD *)v43 != v27)
                objc_enumerationMutation(v24);
              objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v28), "name");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "providedName");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v29, "caseInsensitiveCompare:", v30);

              if (!v31)
                goto LABEL_17;
              if (v26 == ++v28)
              {
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
                if (v26)
                  goto LABEL_7;
                break;
              }
            }
          }

          objc_msgSend(v4, "roomForEntireHome");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "name");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "providedName");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v33, "caseInsensitiveCompare:", v34);

          if (v35)
          {
            v36 = (void *)MEMORY[0x227676638]();
            v37 = self;
            HMFGetOSLogHandle();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "providedName");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v47 = v39;
              v48 = 2112;
              v49 = v40;
              _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Populating configuredName with providedName: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v36);
            objc_msgSend(v7, "providedName");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setConfiguredName:", v24);
LABEL_17:

          }
        }
      }
    }
  }

  return v7;
}

- (HMDAccessoryAdvertisement)advertisement
{
  return (HMDAccessoryAdvertisement *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAdvertisement:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisement, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_68943 != -1)
    dispatch_once(&logCategory__hmf_once_t4_68943, &__block_literal_global_68944);
  return (id)logCategory__hmf_once_v5_68945;
}

void __44__HMDUnassociatedMediaAccessory_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_68945;
  logCategory__hmf_once_v5_68945 = v0;

}

@end
