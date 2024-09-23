@implementation HMDAccessoryReachabilityElectionParameter

- (HMDAccessoryReachabilityElectionParameter)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  HMDAccessoryReachabilityElectionParameter *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDAccessoryReachabilityElectionParameter *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDAccessoryReachabilityElectionParameter *v25;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") != 1)
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      self = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543618;
        v33 = v19;
        v34 = 2112;
        v35 = v5;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unexpected representation, invalid keys: %@", (uint8_t *)&v32, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      goto LABEL_23;
    }
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (v9)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v9);
      if (v10)
      {
        v11 = (void *)v10;

        objc_msgSend(v5, "allValues");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
        v15 = v14;

        if (v15)
        {
          self = -[HMDAccessoryReachabilityElectionParameter initWithIdentifier:isReachable:](self, "initWithIdentifier:isReachable:", v11, objc_msgSend(v15, "BOOLValue"));
          v16 = self;
        }
        else
        {
          v27 = (void *)MEMORY[0x1D17BA0A0]();
          self = self;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "allValues");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "firstObject");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = 138543618;
            v33 = v29;
            v34 = 2112;
            v35 = v31;
            _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Invalid reachability: %@", (uint8_t *)&v32, 0x16u);

          }
          objc_autoreleasePoolPop(v27);
          v16 = 0;
        }

        v6 = v11;
        goto LABEL_24;
      }
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v25 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543618;
      v33 = v23;
      v34 = 2112;
      v35 = v9;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Invalid identifier: %@", (uint8_t *)&v32, 0x16u);
    }
    else
    {
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_22:

        objc_autoreleasePoolPop(v20);
LABEL_23:
        v16 = 0;
LABEL_24:

        goto LABEL_25;
      }
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543618;
      v33 = v23;
      v34 = 2112;
      v35 = v24;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Invalid key type: %@", (uint8_t *)&v32, 0x16u);

    }
    goto LABEL_22;
  }
  v16 = 0;
LABEL_25:

  return v16;
}

- (HMDAccessoryReachabilityElectionParameter)initWithIdentifier:(id)a3 isReachable:(BOOL)a4
{
  id v6;
  void *v7;
  HMDAccessoryReachabilityElectionParameter *v8;
  uint64_t v9;
  NSUUID *identifier;
  HMDAccessoryReachabilityElectionParameter *v12;
  SEL v13;
  objc_super v14;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v14.receiver = self;
    v14.super_class = (Class)HMDAccessoryReachabilityElectionParameter;
    v8 = -[HMDAccessoryReachabilityElectionParameter init](&v14, sel_init);
    if (v8)
    {
      v9 = objc_msgSend(v7, "copy");
      identifier = v8->_identifier;
      v8->_identifier = (NSUUID *)v9;

      v8->_reachable = a4;
    }

    return v8;
  }
  else
  {
    v12 = (HMDAccessoryReachabilityElectionParameter *)_HMFPreconditionFailure();
    return (HMDAccessoryReachabilityElectionParameter *)-[HMDAccessoryReachabilityElectionParameter dictionaryRepresentation](v12, v13);
  }
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryReachabilityElectionParameter identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  v5 = -[HMDAccessoryReachabilityElectionParameter isReachable](self, "isReachable");
  v6 = &unk_1E8B35010;
  if (v5)
    v6 = &unk_1E8B34FF8;
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDAccessoryReachabilityElectionParameter identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  int v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDAccessoryReachabilityElectionParameter identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "hmf_isEqualToUUID:", v8))
    {
      v9 = -[HMDAccessoryReachabilityElectionParameter isReachable](self, "isReachable");
      v10 = v9 ^ objc_msgSend(v6, "isReachable") ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
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

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessoryReachabilityElectionParameter identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Identifier"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessoryReachabilityElectionParameter isReachable](self, "isReachable");
  HMFBooleanToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Reachable"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isReachable
{
  return self->_reachable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
