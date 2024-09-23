@implementation HMDCharacteristicWriteRequest

+ (id)writeRequestForTransitionStartWithLightProfile:(id)a3 naturalLightingEnabled:(BOOL)a4 startDate:(id)a5 type:(unint64_t)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  HMDLightProfileDataSource *v11;
  void *v12;

  v7 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_alloc_init(HMDLightProfileDataSource);
  +[HMDCharacteristicWriteRequest writeRequestForTransitionStartWithLightProfile:naturalLightingEnabled:startDate:type:dataSource:](HMDCharacteristicWriteRequest, "writeRequestForTransitionStartWithLightProfile:naturalLightingEnabled:startDate:type:dataSource:", v10, v7, v9, a6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)writeRequestForTransitionStartWithLightProfile:(id)a3 naturalLightingEnabled:(BOOL)a4 startDate:(id)a5 type:(unint64_t)a6 dataSource:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v39;
  id v40;
  unint64_t v41;
  void *v42;
  void *context;
  void *v44;
  __CFString *v45;
  id v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  const __CFString *v53;
  uint64_t v54;

  v10 = a4;
  v54 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a7;
  objc_msgSend(v12, "service");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "findCharacteristicWithType:", CFSTR("00000143-0000-1000-8000-0026BB765291"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0D16448], "naturalLightingValueTransitionWithLightProfile:naturalLightingEnabled:startDate:dataSource:", v12, v10, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v41 = a6;
      v18 = objc_alloc_init(MEMORY[0x1E0D16450]);
      v19 = objc_alloc(MEMORY[0x1E0D16478]);
      v47 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "initWithTransitions:", v20);

      v44 = (void *)v21;
      objc_msgSend(v18, "setTransitionStart:", v21);
      v46 = 0;
      objc_msgSend(v18, "serializeWithError:", &v46);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (__CFString *)v46;
      context = (void *)MEMORY[0x1D17BA0A0]();
      v23 = a1;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v22)
      {
        v39 = v14;
        v40 = v13;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "hmf_hexadecimalRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v49 = v26;
          v50 = 2112;
          v51 = v27;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Writing value to transition control characteristic: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(context);
        objc_msgSend(v12, "uniqueIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:", v16, v22, 0, v28, v41, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v39;
        v13 = v40;
      }
      else
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v49 = v42;
          v50 = 2112;
          v51 = v18;
          v52 = 2112;
          v53 = v45;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize transition control write request %@:%@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(context);
        v29 = 0;
      }

    }
    else
    {
      v34 = (void *)MEMORY[0x1D17BA0A0]();
      v35 = a1;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v37;
        v50 = 2112;
        v51 = v12;
        _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to create natural lighting transition for light profile: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v34);
      v29 = 0;
    }

  }
  else
  {
    v30 = (void *)MEMORY[0x1D17BA0A0]();
    v31 = a1;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v49 = v33;
      v50 = 2112;
      v51 = v15;
      v52 = 2112;
      v53 = CFSTR("00000143-0000-1000-8000-0026BB765291");
      _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Service doesn't support Value Transition Control Characteristic %@:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v30);
    v29 = 0;
  }

  return v29;
}

+ (id)writeRequestForTransitionFetchWithLightProfile:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  __CFString *v32;
  void *v33;
  void *v34;
  void *context;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  const __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const __CFString *)*MEMORY[0x1E0CB8810];
  objc_msgSend(v5, "findCharacteristicWithType:", *MEMORY[0x1E0CB8810]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v5, "findCharacteristicWithType:", CFSTR("00000143-0000-1000-8000-0026BB765291"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0D16470]);
      v10 = objc_alloc(MEMORY[0x1E0D16610]);
      objc_msgSend(v7, "instanceID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithValue:", v11);
      v13 = (void *)objc_msgSend(v9, "initWithHAPInstanceID:", v12);

      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16450]), "initWithTransitionFetch:transitionStart:", v13, 0);
      v36 = 0;
      objc_msgSend(v14, "serializeWithError:", &v36);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (__CFString *)v36;
      context = (void *)MEMORY[0x1D17BA0A0]();
      v17 = a1;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v15)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v33 = v13;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "hmf_hexadecimalRepresentation");
          v32 = v16;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v20;
          v39 = 2112;
          v40 = v21;
          _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Writing value to transition control characteristic: %@", buf, 0x16u);

          v16 = v32;
          v13 = v33;
        }

        objc_autoreleasePoolPop(context);
        +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:", v8, v15, 0, 0, 0, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v38 = v34;
          v39 = 2112;
          v40 = v14;
          v41 = 2112;
          v42 = v16;
          _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize transition control write request %@:%@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(context);
        v22 = 0;
      }

    }
    else
    {
      v27 = (void *)MEMORY[0x1D17BA0A0]();
      v28 = a1;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v38 = v30;
        v39 = 2112;
        v40 = v5;
        v41 = 2112;
        v42 = CFSTR("00000143-0000-1000-8000-0026BB765291");
        _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Service doesn't support Value Transition Control Characteristic %@:%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v27);
      v22 = 0;
    }

  }
  else
  {
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = a1;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v26;
      v39 = 2112;
      v40 = v5;
      v41 = 2112;
      v42 = v6;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Service doesn't support Color Temperature Characteristic %@:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
    v22 = 0;
  }

  return v22;
}

- (HMDCharacteristicWriteRequest)initWithCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 identifier:(id)a6 type:(unint64_t)a7 includeResponseValue:(BOOL)a8 contextData:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  HMDCharacteristicWriteRequest *v18;
  HMDCharacteristicWriteRequest *v19;
  objc_super v23;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)HMDCharacteristicWriteRequest;
  v18 = -[HMDCharacteristicRequest initWithCharacteristic:](&v23, sel_initWithCharacteristic_, a3);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong(&v18->_value, a4);
    objc_storeStrong((id *)&v19->_authorizationData, a5);
    objc_storeStrong((id *)&v19->_identifier, a6);
    v19->_requestType = a7;
    v19->_includeResponseValue = a8;
    objc_storeStrong((id *)&v19->_contextData, a9);
  }

  return v19;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)HMDCharacteristicWriteRequest;
  -[HMDCharacteristicRequest attributeDescriptions](&v16, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCharacteristicWriteRequest value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Value"), v5);
  v17[0] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCharacteristicWriteRequest value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Type"), objc_opt_class());
  v17[1] = v9;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCharacteristicWriteRequest includeResponseValue](self, "includeResponseValue");
  HMFBooleanToString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Include response value"), v11);
  v17[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)value
{
  return self->_value;
}

- (NSData)authorizationData
{
  return self->_authorizationData;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (BOOL)includeResponseValue
{
  return self->_includeResponseValue;
}

- (NSData)contextData
{
  return self->_contextData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_authorizationData, 0);
  objc_storeStrong(&self->_value, 0);
}

+ (HMDCharacteristicWriteRequest)writeRequestWithCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 type:(unint64_t)a6
{
  return +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:identifier:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:identifier:type:", a3, a4, a5, 0, a6);
}

+ (HMDCharacteristicWriteRequest)writeRequestWithCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 identifier:(id)a6 type:(unint64_t)a7
{
  return (HMDCharacteristicWriteRequest *)objc_msgSend(a1, "writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:", a3, a4, a5, a6, a7, 0);
}

+ (HMDCharacteristicWriteRequest)writeRequestWithCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 identifier:(id)a6 type:(unint64_t)a7 includeResponseValue:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;

  v8 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (a7 == 1)
  {
    +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "type");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isTargetCharacteristic:", v19);

    a7 = v20 ^ 1u;
  }
  v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:contextData:", v14, v15, v16, v17, a7, v8, 0);

  return (HMDCharacteristicWriteRequest *)v21;
}

+ (HMDCharacteristicWriteRequest)writeRequestWithCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 identifier:(id)a6 type:(unint64_t)a7 includeResponseValue:(BOOL)a8 contextData:(id)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;

  v9 = a8;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a9;
  if (a7 == 1)
  {
    +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "type");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isTargetCharacteristic:", v21);

    a7 = v22 ^ 1u;
  }
  v23 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:contextData:", v15, v16, v17, v18, a7, v9, v19);

  return (HMDCharacteristicWriteRequest *)v23;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_182540 != -1)
    dispatch_once(&logCategory__hmf_once_t3_182540, &__block_literal_global_101_182541);
  return (id)logCategory__hmf_once_v4_182542;
}

void __44__HMDCharacteristicWriteRequest_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_182542;
  logCategory__hmf_once_v4_182542 = v0;

}

@end
