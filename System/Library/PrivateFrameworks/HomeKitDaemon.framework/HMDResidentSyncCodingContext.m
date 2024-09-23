@implementation HMDResidentSyncCodingContext

- (HMDResidentSyncCodingContext)initWithTargetUser:(id)a3 targetIsResident:(BOOL)a4 targetDeviceAddress:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  HMDResidentSyncCodingContext *v11;
  HMDResidentSyncCodingContext *v12;
  HMDResidentSyncCodingContext *v14;
  SEL v15;
  id v16;
  id v17;
  objc_super v18;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  if (v6 && (objc_msgSend(v9, "isOwner") & 1) == 0)
  {
    v14 = (HMDResidentSyncCodingContext *)_HMFPreconditionFailure();
    return (HMDResidentSyncCodingContext *)-[HMDResidentSyncCodingContext shouldExcludeObject:context:](v14, v15, v16, v17);
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)HMDResidentSyncCodingContext;
    v11 = -[HMDResidentSyncCodingContext init](&v18, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_targetUser, a3);
      v12->_targetIsResident = v6;
      objc_storeStrong((id *)&v12->_targetDeviceAddress, a5);
    }

    return v12;
  }
}

- (BOOL)_shouldExcludeForRestrictedGuestObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  HMDResidentSyncCodingContext *v18;
  NSObject *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    v11 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    if (v13)
    {
      objc_msgSend(v13, "targetUser");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isRestrictedGuest");

      if (v15)
      {
        v16 = objc_msgSend(v10, "shouldIncludeForRestrictedGuestWithContext:", v13) ^ 1;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v20;
        v24 = 2112;
        v25 = v11;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@nil codingContext after cast: %@", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
    }
    LOBYTE(v16) = 0;
    goto LABEL_16;
  }
  LOBYTE(v16) = 0;
LABEL_17:

  return v16;
}

- (HMDHomeMember)targetUser
{
  return self->_targetUser;
}

- (BOOL)targetIsResident
{
  return self->_targetIsResident;
}

- (HMDDeviceAddress)targetDeviceAddress
{
  return self->_targetDeviceAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDeviceAddress, 0);
  objc_storeStrong((id *)&self->_targetUser, 0);
  objc_storeStrong((id *)&self->_relevantBulletinRegistrations, 0);
  objc_storeStrong((id *)&self->_relevantTriggers, 0);
}

@end
