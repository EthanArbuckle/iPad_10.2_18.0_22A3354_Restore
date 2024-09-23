@implementation HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload

- (HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload)initWithGroupIdentifier:(id)a3 associatedGroupIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *v10;
  HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *v11;
  HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *v13;
  SEL v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = v8;
    v15.receiver = self;
    v15.super_class = (Class)HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload;
    v10 = -[HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload init](&v15, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_groupIdentifier, a3);
      objc_storeStrong((id *)&v11->_associatedGroupIdentifier, a4);
    }

    return v11;
  }
  else
  {
    v13 = (HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *)_HMFPreconditionFailure();
    return (HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *)-[HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload attributeDescriptions](v13, v14);
  }
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload groupIdentifier](self, "groupIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("groupIdentifier"), v4);
  v13[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload associatedGroupIdentifier](self, "associatedGroupIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("nil");
  v10 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("associatedGroupIdentifier"), v9);
  v13[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload)initWithPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *v7;
  HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "hmf_UUIDForKey:", CFSTR("groupIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_UUIDForKey:", CFSTR("associatedGroupIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = -[HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload initWithGroupIdentifier:associatedGroupIdentifier:](self, "initWithGroupIdentifier:associatedGroupIdentifier:", v5, v6);
    v8 = v7;
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v11;
      v15 = 2112;
      v16 = 0;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to get decode dependencies group identifier: %@ payload: %@ due", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
}

- (id)payloadCopy
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("groupIdentifier");
  -[HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload groupIdentifier](self, "groupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("associatedGroupIdentifier");
  v12[0] = v4;
  -[HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload associatedGroupIdentifier](self, "associatedGroupIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_1E89C3E38;
  if (v6)
    v8 = (const __CFString *)v6;
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload groupIdentifier](self, "groupIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *v4;
  HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *v5;
  HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *)a3;
  if (v4 == self)
  {
    v11 = 1;
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
      -[HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload groupIdentifier](self, "groupIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload groupIdentifier](v6, "groupIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "hmf_isEqualToUUID:", v8))
      {
        -[HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload associatedGroupIdentifier](self, "associatedGroupIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload associatedGroupIdentifier](v6, "associatedGroupIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = HMFEqualObjects();

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (NSUUID)groupIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)associatedGroupIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

+ (NSString)messageName
{
  return (NSString *)CFSTR("HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierRequestMessage");
}

@end
