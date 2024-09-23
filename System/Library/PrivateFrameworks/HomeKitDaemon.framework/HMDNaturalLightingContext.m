@implementation HMDNaturalLightingContext

- (HMDNaturalLightingContext)initWithCurve:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  HMDNaturalLightingContext *v8;
  uint64_t v9;
  HMDNaturalLightingCurve *curve;
  uint64_t v11;
  NSTimeZone *timeZone;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDNaturalLightingContext;
  v8 = -[HMDNaturalLightingContext init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    curve = v8->_curve;
    v8->_curve = (HMDNaturalLightingCurve *)v9;

    v11 = objc_msgSend(v7, "copy");
    timeZone = v8->_timeZone;
    v8->_timeZone = (NSTimeZone *)v11;

  }
  return v8;
}

- (HMDNaturalLightingContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDNaturalLightingContext *v7;
  HMDNaturalLightingContext *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HHNLC.cck"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HHNLC.tzk"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = -[HMDNaturalLightingContext initWithCurve:timeZone:](self, "initWithCurve:timeZone:", v5, v6);
      v8 = v7;
    }
    else
    {
      v12 = (void *)MEMORY[0x227676638]();
      v7 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v14;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode time zone", (uint8_t *)&v16, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      v8 = 0;
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode curve", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDNaturalLightingContext curve](self, "curve");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HHNLC.cck"));

  -[HMDNaturalLightingContext timeZone](self, "timeZone");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HHNLC.tzk"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "curve");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNaturalLightingContext curve](self, "curve");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v9))
    {
      objc_msgSend(v7, "timeZone");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeZone");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMDNaturalLightingContext curve](self, "curve");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMDNaturalLightingContext timeZone](self, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
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
  -[HMDNaturalLightingContext curve](self, "curve");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Curve"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDNaturalLightingContext timeZone](self, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Time Zone"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMDNaturalLightingCurve)curve
{
  return (HMDNaturalLightingCurve *)objc_getProperty(self, a2, 8, 1);
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_curve, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_238376 != -1)
    dispatch_once(&logCategory__hmf_once_t3_238376, &__block_literal_global_238377);
  return (id)logCategory__hmf_once_v4_238378;
}

void __40__HMDNaturalLightingContext_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_238378;
  logCategory__hmf_once_v4_238378 = v0;

}

@end
