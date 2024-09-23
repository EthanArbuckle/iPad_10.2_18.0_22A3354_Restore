@implementation HMDCloudPairedMetadataDiagnostics

- (HMDCloudPairedMetadataDiagnostics)initWithAccessoryIdentifier:(id)a3 jsonDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  int v11;
  id v12;
  int v13;
  id v14;
  void *v15;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;
  int v20;
  void *v21;
  NSObject *v22;
  void *v23;
  HMDCloudPairedMetadataDiagnostics *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  _WORD v38[17];

  *(_QWORD *)&v38[13] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "firmwareVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v34 = 0;
    v9 = decodeStringFromJSONDictionary(v7, CFSTR("p"), 1, &v34);
    v10 = v34;
    if (!v9)
    {
      v24 = 0;
LABEL_19:

      goto LABEL_20;
    }
    v33 = 0;
    v11 = decodeStringFromJSONDictionary(v7, CFSTR("d"), 1, &v33);
    v12 = v33;
    if (!v11)
    {
      v24 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v32 = 0;
    v13 = decodeUnsignedIntegerFromJSONDictionary(v7, CFSTR("c"), 1, 0xFFuLL, &v32);
    v14 = v32;
    v15 = v14;
    if (v13)
    {
      v16 = objc_msgSend(v14, "unsignedIntegerValue");
      v31 = v15;
      v17 = decodeUnsignedIntegerFromJSONDictionary(v7, CFSTR("t"), 1, 0xFFuLL, &v31);
      v18 = v31;

      if (v17)
      {
        v19 = objc_msgSend(v18, "unsignedIntegerValue");
        if (!v19)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          self = -[HMDCloudPairedMetadataDiagnostics initWithAccessoryIdentifier:privacyPolicyURL:uploadDestination:consentVersion:uploadType:](self, "initWithAccessoryIdentifier:privacyPolicyURL:uploadDestination:consentVersion:uploadType:", v6, v29, v30, v16, 0);

          v24 = self;
          goto LABEL_17;
        }
        v20 = v19;
        v21 = (void *)MEMORY[0x1D17BA0A0]();
        self = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v36 = v23;
          v37 = 1024;
          *(_DWORD *)v38 = v20;
          v38[2] = 2112;
          *(_QWORD *)&v38[3] = v6;
          _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Invalid uploadType: %u received in JSON for accessory: %@", buf, 0x1Cu);

        }
        objc_autoreleasePoolPop(v21);
      }
      v24 = 0;
    }
    else
    {
      v24 = 0;
      v18 = v14;
    }
LABEL_17:

    goto LABEL_18;
  }
  v25 = (void *)MEMORY[0x1D17BA0A0]();
  self = self;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v27;
    v37 = 2112;
    *(_QWORD *)v38 = v6;
    _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Version configuration must contain firmware version: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v25);
  v24 = 0;
LABEL_20:

  return v24;
}

- (HMDCloudPairedMetadataDiagnostics)initWithAccessoryIdentifier:(id)a3 privacyPolicyURL:(id)a4 uploadDestination:(id)a5 consentVersion:(unint64_t)a6 uploadType:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  HMDCloudPairedMetadataDiagnostics *v16;
  HMDCloudPairedMetadataDiagnostics *v17;
  HMDCloudPairedMetadataDiagnostics *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HMDCloudPairedMetadataDiagnostics;
  v16 = -[HMDCloudPairedMetadataDiagnostics init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_accessoryIdentifier, a3);
    objc_storeStrong((id *)&v17->_privacyPolicyURL, a4);
    objc_storeStrong((id *)&v17->_uploadDestination, a5);
    v17->_consentVersion = a6;
    v17->_uploadType = a7;
    v18 = v17;
  }

  return v17;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCloudPairedMetadataDiagnostics privacyPolicyURL](self, "privacyPolicyURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("privacyPolicyURL"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCloudPairedMetadataDiagnostics uploadDestination](self, "uploadDestination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("uploadDestination"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDCloudPairedMetadataDiagnostics consentVersion](self, "consentVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("consentVersion"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDCloudPairedMetadataDiagnostics uploadType](self, "uploadType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("uploadType"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSDictionary)prettyJSONDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("privacyPolicyURL");
  -[HMDCloudPairedMetadataDiagnostics privacyPolicyURL](self, "privacyPolicyURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = CFSTR("uploadDestination");
  -[HMDCloudPairedMetadataDiagnostics uploadDestination](self, "uploadDestination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v11[2] = CFSTR("consentVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDCloudPairedMetadataDiagnostics consentVersion](self, "consentVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  v11[3] = CFSTR("uploadType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDCloudPairedMetadataDiagnostics uploadType](self, "uploadType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v9;
}

- (NSURL)privacyPolicyURL
{
  return self->_privacyPolicyURL;
}

- (NSURL)uploadDestination
{
  return self->_uploadDestination;
}

- (unint64_t)consentVersion
{
  return self->_consentVersion;
}

- (unint64_t)uploadType
{
  return self->_uploadType;
}

- (HMDNetworkRouterFirewallRuleAccessoryIdentifier)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_uploadDestination, 0);
  objc_storeStrong((id *)&self->_privacyPolicyURL, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_117792 != -1)
    dispatch_once(&logCategory__hmf_once_t0_117792, &__block_literal_global_117793);
  return (id)logCategory__hmf_once_v1_117794;
}

void __48__HMDCloudPairedMetadataDiagnostics_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_117794;
  logCategory__hmf_once_v1_117794 = v0;

}

@end
