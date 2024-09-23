@implementation HMMTRRegulatoryInfo

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_1109 != -1)
    dispatch_once(&logCategory__hmf_once_t3_1109, &__block_literal_global_1110);
  return (id)logCategory__hmf_once_v4_1111;
}

void __34__HMMTRRegulatoryInfo_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_1111;
  logCategory__hmf_once_v4_1111 = v0;

}

- (id)countryCode
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  HMMTRRegulatoryInfo *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE7D058], "currentEstimates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BE7D058], "lastKnownEstimates");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  v5 = objc_msgSend(v3, "count");
  v6 = (void *)MEMORY[0x242656984]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "countryCode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v10;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Estimated country code: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "countryCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRRegulatoryInfo iso3166_1FromISO3166_2CountryCode:](v7, "iso3166_1FromISO3166_2CountryCode:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v16;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@No RDEstimate available", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v15 = 0;
  }

  return v15;
}

- (id)iso3166_1FromISO3166_2CountryCode:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  HMMTRRegulatoryInfo *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") < 2)
    goto LABEL_10;
  if (objc_msgSend(v4, "length") != 2)
  {
    if (objc_msgSend(v4, "characterAtIndex:", 2) == 45)
    {
      objc_msgSend(v4, "substringToIndex:", 2);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    v7 = (void *)MEMORY[0x242656984]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Malformatted ISO-3166-2 country code: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  v5 = v4;
LABEL_6:
  v6 = v5;
LABEL_11:

  return v6;
}

@end
