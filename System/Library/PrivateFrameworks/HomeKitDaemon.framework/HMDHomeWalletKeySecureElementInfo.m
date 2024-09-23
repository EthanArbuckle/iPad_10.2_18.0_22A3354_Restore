@implementation HMDHomeWalletKeySecureElementInfo

- (HMDHomeWalletKeySecureElementInfo)initWithDeviceCredentialKey:(id)a3 applicationIdentifier:(id)a4 subCredentialIdentifier:(id)a5 secureElementIdentifier:(id)a6 pairedReaderIdentifier:(id)a7 paymentCredentialType:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  HMDHomeWalletKeySecureElementInfo *v19;
  uint64_t v20;
  NSData *deviceCredentialKey;
  uint64_t v22;
  NSString *applicationIdentifier;
  uint64_t v24;
  NSString *subCredentialIdentifier;
  uint64_t v26;
  NSString *secureElementIdentifier;
  uint64_t v28;
  NSString *pairedReaderIdentifier;
  objc_super v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v31.receiver = self;
  v31.super_class = (Class)HMDHomeWalletKeySecureElementInfo;
  v19 = -[HMDHomeWalletKeySecureElementInfo init](&v31, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    deviceCredentialKey = v19->_deviceCredentialKey;
    v19->_deviceCredentialKey = (NSData *)v20;

    v22 = objc_msgSend(v15, "copy");
    applicationIdentifier = v19->_applicationIdentifier;
    v19->_applicationIdentifier = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    subCredentialIdentifier = v19->_subCredentialIdentifier;
    v19->_subCredentialIdentifier = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    secureElementIdentifier = v19->_secureElementIdentifier;
    v19->_secureElementIdentifier = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    pairedReaderIdentifier = v19->_pairedReaderIdentifier;
    v19->_pairedReaderIdentifier = (NSString *)v28;

    v19->_paymentCredentialType = a8;
  }

  return v19;
}

- (HMDHomeWalletKeySecureElementInfo)initWithPaymentApplication:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDHomeWalletKeySecureElementInfo *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDHomeWalletKeySecureElementInfo *v28;
  void *v30;
  void *v31;
  int64_t v32;
  HMDHomeWalletKeySecureElementInfo *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "secureElementIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subcredentials");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = +[HMDHomeWalletKeySecureElementInfo hmdPaymentTypeFromPKPaymentType:flow:](HMDHomeWalletKeySecureElementInfo, "hmdPaymentTypeFromPKPaymentType:flow:", objc_msgSend(v6, "paymentType"), v7);
  objc_msgSend(v6, "applicationIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    objc_msgSend(v10, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 && v8)
    {
      objc_msgSend(v10, "pairedReaderIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v32 = v11;
  v17 = (void *)MEMORY[0x227676638]();
  v33 = self;
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v31 = v7;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pairedReaderIdentifier");
    v30 = v17;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545154;
    v35 = v20;
    v36 = 2112;
    v37 = v21;
    v38 = 2112;
    v39 = v6;
    v40 = 2112;
    v41 = v10;
    v42 = 2112;
    v43 = v22;
    v44 = 2112;
    v45 = v23;
    v46 = 2112;
    v47 = v8;
    v48 = 2112;
    v49 = v24;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] PKPass is missing data. paymentApplication: %@, subcredential: %@, paymentApplication.applicationIdentifier: %@, subcredential.identifier: %@, secureElementIdentifier: %@, subcredential.pairedReaderIdentifier: %@", buf, 0x52u);

    v17 = v30;
    v7 = v31;
  }

  objc_autoreleasePoolPop(v17);
  v11 = v32;
  self = v33;
LABEL_10:
  objc_msgSend(v6, "applicationIdentifier", v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pairedReaderIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[HMDHomeWalletKeySecureElementInfo initWithDeviceCredentialKey:applicationIdentifier:subCredentialIdentifier:secureElementIdentifier:pairedReaderIdentifier:paymentCredentialType:](self, "initWithDeviceCredentialKey:applicationIdentifier:subCredentialIdentifier:secureElementIdentifier:pairedReaderIdentifier:paymentCredentialType:", 0, v25, v26, v8, v27, v11);

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  BOOL v19;
  int v21;
  void *v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (-[HMDHomeWalletKeySecureElementInfo deviceCredentialKey](self, "deviceCredentialKey"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "deviceCredentialKey"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = HMFEqualObjects(),
        v8,
        v7,
        v9))
  {
    -[HMDHomeWalletKeySecureElementInfo applicationIdentifier](self, "applicationIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", v11))
    {
      -[HMDHomeWalletKeySecureElementInfo subCredentialIdentifier](self, "subCredentialIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "subCredentialIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToString:", v13))
      {
        -[HMDHomeWalletKeySecureElementInfo secureElementIdentifier](self, "secureElementIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "secureElementIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v14, "isEqualToString:", v15))
          goto LABEL_14;
        -[HMDHomeWalletKeySecureElementInfo pairedReaderIdentifier](self, "pairedReaderIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "pairedReaderIdentifier");
        v22 = v14;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = HMFEqualObjects();

        v14 = v22;
        if (v21)
        {
          v18 = -[HMDHomeWalletKeySecureElementInfo paymentCredentialType](self, "paymentCredentialType");
          v19 = v18 == objc_msgSend(v6, "paymentCredentialType");
        }
        else
        {
LABEL_14:
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  -[HMDHomeWalletKeySecureElementInfo deviceCredentialKey](self, "deviceCredentialKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMDHomeWalletKeySecureElementInfo applicationIdentifier](self, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMDHomeWalletKeySecureElementInfo subCredentialIdentifier](self, "subCredentialIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[HMDHomeWalletKeySecureElementInfo secureElementIdentifier](self, "secureElementIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  -[HMDHomeWalletKeySecureElementInfo pairedReaderIdentifier](self, "pairedReaderIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDHomeWalletKeySecureElementInfo paymentCredentialType](self, "paymentCredentialType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");

  return v14;
}

- (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)attributeDescriptions
{
  id v3;
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
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  _QWORD v21[6];

  v21[5] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDHomeWalletKeySecureElementInfo deviceCredentialKey](self, "deviceCredentialKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "hmf_hexadecimalRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Device Credential Public Key"), v19);
  v21[0] = v4;
  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDHomeWalletKeySecureElementInfo applicationIdentifier](self, "applicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Application Identifier"), v6);
  v21[1] = v7;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDHomeWalletKeySecureElementInfo subCredentialIdentifier](self, "subCredentialIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Sub Credential Identifier"), v9);
  v21[2] = v10;
  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDHomeWalletKeySecureElementInfo secureElementIdentifier](self, "secureElementIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Secure Element Identifier"), v12);
  v21[3] = v13;
  v14 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDHomeWalletKeySecureElementInfo pairedReaderIdentifier](self, "pairedReaderIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("Paired Reader Identifier"), v15);
  v21[4] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSData)deviceCredentialKey
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)applicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)subCredentialIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)secureElementIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)pairedReaderIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)paymentCredentialType
{
  return self->_paymentCredentialType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedReaderIdentifier, 0);
  objc_storeStrong((id *)&self->_secureElementIdentifier, 0);
  objc_storeStrong((id *)&self->_subCredentialIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceCredentialKey, 0);
}

+ (int64_t)hmdPaymentTypeFromPKPaymentType:(unint64_t)a3 flow:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (a3 == 1003)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  if (a3 != 1004)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = a1;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      v18 = 2048;
      v19 = a3;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Unrecognized paymentType, defaulting to HMDPaymentCredentialType0. paymentType: %lu", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    goto LABEL_7;
  }
  v7 = 1;
LABEL_8:

  return v7;
}

+ (id)createForEasyProvisioning
{
  return -[HMDHomeWalletKeySecureElementInfo initWithDeviceCredentialKey:applicationIdentifier:subCredentialIdentifier:secureElementIdentifier:pairedReaderIdentifier:paymentCredentialType:]([HMDHomeWalletKeySecureElementInfo alloc], "initWithDeviceCredentialKey:applicationIdentifier:subCredentialIdentifier:secureElementIdentifier:pairedReaderIdentifier:paymentCredentialType:", 0, &stru_24E79DB48, &stru_24E79DB48, &stru_24E79DB48, 0, 0);
}

+ (id)createForExpressConflictCheckWithSecureElementIdentifier:(id)a3
{
  id v3;
  HMDHomeWalletKeySecureElementInfo *v4;

  v3 = a3;
  v4 = -[HMDHomeWalletKeySecureElementInfo initWithDeviceCredentialKey:applicationIdentifier:subCredentialIdentifier:secureElementIdentifier:pairedReaderIdentifier:paymentCredentialType:]([HMDHomeWalletKeySecureElementInfo alloc], "initWithDeviceCredentialKey:applicationIdentifier:subCredentialIdentifier:secureElementIdentifier:pairedReaderIdentifier:paymentCredentialType:", 0, CFSTR("A00000085801010100000001"), CFSTR("50306AC7BE75749DA5F104397B29933A78E71B59"), v3, 0, 0);

  return v4;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
