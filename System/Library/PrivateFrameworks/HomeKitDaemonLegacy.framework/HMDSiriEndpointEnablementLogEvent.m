@implementation HMDSiriEndpointEnablementLogEvent

- (HMDSiriEndpointEnablementLogEvent)initWithConfigurationDataSource:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char isKindOfClass;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  HMDSiriEndpointEnablementLogEvent *v18;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v21 = a3;
  objc_msgSend(v21, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v22 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v3);
        v9 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        if (v11)
        {
          objc_msgSend(v11, "hostAccessory");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0 || !v12)
          {
            v14 = objc_msgSend(v11, "hasSiriEndpointService");
            objc_msgSend(v11, "siriEndpointProfile");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v15 && (objc_msgSend(v15, "siriTouchToUse") == 1 || objc_msgSend(v16, "siriListening") == 1))
              ++v22;
            v6 += v14;

          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }
  else
  {
    v22 = 0;
    v6 = 0;
  }

  objc_msgSend(v21, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HMDSiriEndpointEnablementLogEvent initWithHomeUUID:numCapableSiriEndpoints:numEnabledSiriEndpoints:](self, "initWithHomeUUID:numCapableSiriEndpoints:numEnabledSiriEndpoints:", v17, v6, v22);

  return v18;
}

- (HMDSiriEndpointEnablementLogEvent)initWithHomeUUID:(id)a3 numCapableSiriEndpoints:(unint64_t)a4 numEnabledSiriEndpoints:(unint64_t)a5
{
  HMDSiriEndpointEnablementLogEvent *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDSiriEndpointEnablementLogEvent;
  result = -[HMMHomeLogEvent initWithHomeUUID:](&v8, sel_initWithHomeUUID_, a3);
  if (result)
  {
    result->_numCapableSiriEndpointAccessories = a4;
    result->_numEnabledSiriEndpointAccessories = a5;
  }
  return result;
}

- (HMDSiriEndpointEnablementLogEvent)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDSiriEndpointEnablementLogEvent *v9;
  HMDSiriEndpointEnablementLogEvent *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numCapableEndpoints"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numEnabledEndpoints"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5 && v6 && v7)
  {
    v9 = -[HMDSiriEndpointEnablementLogEvent initWithHomeUUID:numCapableSiriEndpoints:numEnabledSiriEndpoints:](self, "initWithHomeUUID:numCapableSiriEndpoints:numEnabledSiriEndpoints:", v5, objc_msgSend(v6, "unsignedIntValue"), objc_msgSend(v7, "unsignedIntValue"));
    v10 = v9;
  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Could not init HMDSiriEndpointEnablementLogEvent with dictionary %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (id)serializedMetric
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("homeUUID");
  -[HMMHomeLogEvent homeUUIDString](self, "homeUUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("numCapableEndpoints");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDSiriEndpointEnablementLogEvent numCapableSiriEndpointAccessories](self, "numCapableSiriEndpointAccessories"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("numEnabledEndpoints");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDSiriEndpointEnablementLogEvent numEnabledSiriEndpointAccessories](self, "numEnabledSiriEndpointAccessories"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.siri.endpoint.enablement");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("numCapableSiriEndpointAccessories");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDSiriEndpointEnablementLogEvent numCapableSiriEndpointAccessories](self, "numCapableSiriEndpointAccessories"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("numEnabledSiriEndpointAccessories");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDSiriEndpointEnablementLogEvent numEnabledSiriEndpointAccessories](self, "numEnabledSiriEndpointAccessories"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (unint64_t)numCapableSiriEndpointAccessories
{
  return self->_numCapableSiriEndpointAccessories;
}

- (unint64_t)numEnabledSiriEndpointAccessories
{
  return self->_numEnabledSiriEndpointAccessories;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11_185898 != -1)
    dispatch_once(&logCategory__hmf_once_t11_185898, &__block_literal_global_47_185899);
  return (id)logCategory__hmf_once_v12_185900;
}

void __48__HMDSiriEndpointEnablementLogEvent_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v12_185900;
  logCategory__hmf_once_v12_185900 = v0;

}

@end
