@implementation HMDHomeManagerXPCMessageSendPolicy

- (BOOL)canSendWithPolicyParameters:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  void *v11;
  HMDHomeManagerXPCMessageSendPolicy *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  HMDHomeManagerXPCMessageSendPolicy *v18;
  void *v19;
  void *v20;
  const char *v21;
  HMDHomeManagerXPCMessageSendPolicy *v23;
  HMDHomeManagerXPCMessageSendPolicy *v24;
  int v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (!v6)
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v14;
      v27 = 2112;
      v28 = objc_opt_class();
      v29 = 2112;
      v30 = v4;
      v15 = "%{public}@Cannot send message with policy parameters because they are of unexpected class %@: %@";
      v16 = v13;
      v17 = 32;
LABEL_13:
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v25, v17);
LABEL_17:

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  v7 = objc_msgSend(v6, "entitlements");
  v8 = -[HMDHomeManagerXPCMessageSendPolicy entitlements](self, "entitlements") & v7;
  if (v8 != -[HMDHomeManagerXPCMessageSendPolicy entitlements](self, "entitlements"))
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "entitlements");
      HMXPCClientEntitlementsShortDescription();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeManagerXPCMessageSendPolicy entitlements](v18, "entitlements");
      HMXPCClientEntitlementsShortDescription();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v14;
      v27 = 2112;
      v28 = (uint64_t)v19;
      v29 = 2112;
      v30 = v20;
      v21 = "%{public}@Cannot send message with policy parameters because entitlements %@ do not contain all of the requi"
            "red entitlements: %@";
LABEL_16:
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEBUG, v21, (uint8_t *)&v25, 0x20u);

      goto LABEL_17;
    }
LABEL_18:

    objc_autoreleasePoolPop(v11);
    v10 = 0;
    goto LABEL_19;
  }
  if (-[HMDHomeManagerXPCMessageSendPolicy options](self, "options"))
  {
    v9 = -[HMDHomeManagerXPCMessageSendPolicy options](self, "options");
    if ((objc_msgSend(v6, "options") & v9) == 0)
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        goto LABEL_18;
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "options");
      HMHomeManagerOptionsToString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeManagerXPCMessageSendPolicy options](v23, "options");
      HMHomeManagerOptionsToString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v14;
      v27 = 2112;
      v28 = (uint64_t)v19;
      v29 = 2112;
      v30 = v20;
      v21 = "%{public}@Cannot send message with policy parameters because options %@ do not contain one of the required options: %@";
      goto LABEL_16;
    }
  }
  if (-[HMDHomeManagerXPCMessageSendPolicy isActive](self, "isActive") && (objc_msgSend(v6, "isActive") & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543362;
    v26 = v14;
    v15 = "%{public}@Cannot send message with policy parameters because active is NO";
    v16 = v13;
    v17 = 12;
    goto LABEL_13;
  }
  v10 = 1;
LABEL_19:

  return v10;
}

- (unint64_t)options
{
  return self->_options;
}

- (unint64_t)entitlements
{
  return self->_entitlements;
}

- (BOOL)isActive
{
  return self->_active;
}

- (HMDHomeManagerXPCMessageSendPolicy)initWithEntitlements:(unint64_t)a3 options:(unint64_t)a4 active:(BOOL)a5
{
  HMDHomeManagerXPCMessageSendPolicy *v8;
  unint64_t v9;
  HMDHomeManagerXPCMessageSendPolicy *v10;
  objc_super v12;

  if (a4)
  {
    v12.receiver = self;
    v12.super_class = (Class)HMDHomeManagerXPCMessageSendPolicy;
    v8 = -[HMDHomeManagerXPCMessageSendPolicy init](&v12, sel_init);
    if (v8)
    {
      v8->_options = a4;
      if (a3 <= 1)
        v9 = 1;
      else
        v9 = a3;
      v8->_entitlements = v9;
      v8->_active = a5;
    }
    self = v8;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (HMDHomeManagerXPCMessageSendPolicy)initWithEntitlements:(unint64_t)a3 options:(unint64_t)a4
{
  return -[HMDHomeManagerXPCMessageSendPolicy initWithEntitlements:options:active:](self, "initWithEntitlements:options:active:", a3, a4, 0);
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
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHomeManagerXPCMessageSendPolicy options](self, "options");
  HMHomeManagerOptionsToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Options"), v4);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHomeManagerXPCMessageSendPolicy entitlements](self, "entitlements", v5);
  HMXPCClientEntitlementsShortDescription();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Entitlements"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHomeManagerXPCMessageSendPolicy isActive](self, "isActive");
  HMFBooleanToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Active"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  HMDHomeManagerXPCMessageSendPolicy *v4;
  HMDHomeManagerXPCMessageSendPolicy *v5;
  HMDHomeManagerXPCMessageSendPolicy *v6;
  HMDHomeManagerXPCMessageSendPolicy *v7;
  unint64_t v8;
  unint64_t v9;
  _BOOL4 v10;
  _BOOL4 v11;
  objc_super v13;

  v4 = (HMDHomeManagerXPCMessageSendPolicy *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HMDHomeManagerXPCMessageSendPolicy;
    if (-[HMDXPCMessageSendPolicy isEqual:](&v13, sel_isEqual_, v4))
    {
      v5 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      if (v7
        && (v8 = -[HMDHomeManagerXPCMessageSendPolicy options](self, "options"),
            v8 == -[HMDHomeManagerXPCMessageSendPolicy options](v7, "options"))
        && (v9 = -[HMDHomeManagerXPCMessageSendPolicy entitlements](self, "entitlements"),
            v9 == -[HMDHomeManagerXPCMessageSendPolicy entitlements](v7, "entitlements")))
      {
        v10 = -[HMDHomeManagerXPCMessageSendPolicy isActive](self, "isActive");
        v11 = v10 ^ -[HMDHomeManagerXPCMessageSendPolicy isActive](v7, "isActive") ^ 1;
      }
      else
      {
        LOBYTE(v11) = 0;
      }

    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[HMDHomeManagerXPCMessageSendPolicy options](self, "options");
  return -[HMDHomeManagerXPCMessageSendPolicy entitlements](self, "entitlements") ^ v3;
}

@end
