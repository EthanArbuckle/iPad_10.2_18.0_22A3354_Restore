@implementation HMDAccessoryTransportInformation

- (NSDictionary)transportInfoDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("HM.serverIdentifier");
  -[HMDAccessoryTransportInformation serverIdentifier](self, "serverIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("HM.instanceID");
  -[HMDAccessoryTransportInformation instanceID](self, "instanceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("linkType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDAccessoryTransportInformation linkType](self, "linkType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (NSString)serverIdentifier
{
  return self->_serverIdentifier;
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (HAPAccessory)hapAccessory
{
  os_unfair_lock_s *p_lock;
  HAPAccessory *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_hapAccessory;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setReachable:(BOOL)a3
{
  os_unfair_lock_s *p_lock;
  NSDate *v6;
  NSDate *reachableLastChangedTime;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_reachable = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  reachableLastChangedTime = self->_reachableLastChangedTime;
  self->_reachableLastChangedTime = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)setHapAccessory:(id)a3
{
  HAPAccessory *v4;
  HAPAccessory *hapAccessory;

  v4 = (HAPAccessory *)a3;
  os_unfair_lock_lock_with_options();
  hapAccessory = self->_hapAccessory;
  self->_hapAccessory = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isReachable
{
  HMDAccessoryTransportInformation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_reachable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setProtocolVersion:(id)a3
{
  NSString *v4;
  NSString *protocolVersion;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  protocolVersion = self->_protocolVersion;
  self->_protocolVersion = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDAccessoryTransportInformation)initWithServerIdentifier:(id)a3 instanceID:(id)a4 linkType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  HMDAccessoryTransportInformation *v11;
  uint64_t v12;
  NSString *serverIdentifier;
  uint64_t v14;
  NSNumber *instanceID;
  HMDAccessoryTransportInformation *v17;
  SEL v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  v10 = v9;
  if (!v9)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!a5)
  {
LABEL_9:
    v17 = (HMDAccessoryTransportInformation *)_HMFPreconditionFailure();
    return (HMDAccessoryTransportInformation *)-[HMDAccessoryTransportInformation protocolVersion](v17, v18);
  }
  v19.receiver = self;
  v19.super_class = (Class)HMDAccessoryTransportInformation;
  v11 = -[HMDAccessoryTransportInformation init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    serverIdentifier = v11->_serverIdentifier;
    v11->_serverIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v10, "copy");
    instanceID = v11->_instanceID;
    v11->_instanceID = (NSNumber *)v14;

    v11->_linkType = a5;
  }

  return v11;
}

- (NSString)protocolVersion
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_protocolVersion;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSDate)reachableLastChangedTime
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_reachableLastChangedTime;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)report
{
  void *v3;
  void *v4;
  __CFString *v5;
  id v6;
  char isKindOfClass;
  HMDAccessoryTransportReachabilityReport *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  HMDAccessoryTransportReachabilityReport *v15;

  -[HMDAccessoryTransportInformation hapAccessory](self, "hapAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessoryTransportInformation linkType](self, "linkType");
  HAPLinkTypeDescription();
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && v6)
  {

    v5 = CFSTR("Thread");
  }
  v8 = [HMDAccessoryTransportReachabilityReport alloc];
  v9 = objc_msgSend(v6, "hasAdvertisement");
  objc_msgSend(v6, "communicationProtocol");
  HAPCommunicationProtocolDescription();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryTransportInformation protocolVersion](self, "protocolVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDAccessoryTransportInformation isReachable](self, "isReachable");
  -[HMDAccessoryTransportInformation reachableLastChangedTime](self, "reachableLastChangedTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reachabilityChangedReason");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMDAccessoryTransportReachabilityReport initWithLinkType:hasAdvertisement:protocol:protocolVersion:reachable:reachableLastChangedTime:reason:](v8, "initWithLinkType:hasAdvertisement:protocol:protocolVersion:reachable:reachableLastChangedTime:reason:", v5, v9, v10, v11, v12, v13, v14);

  return v15;
}

- (HMDAccessoryTransportInformation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDAccessoryTransportInformation *v14;
  HMDAccessoryTransportInformation *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.serverIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.instanceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("linkType"));
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8 || v7 == 0)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HAPLinkTypeDescription();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544130;
      v18 = v12;
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot decode from serverIdentifier: %@ instanceID: %@ linkType: %@", (uint8_t *)&v17, 0x2Au);

    }
    objc_autoreleasePoolPop(v10);
    v15 = 0;
  }
  else
  {
    v14 = -[HMDAccessoryTransportInformation initWithServerIdentifier:instanceID:linkType:](self, "initWithServerIdentifier:instanceID:linkType:", v5, v6, v7);
    v15 = v14;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HMDAccessoryTransportInformation serverIdentifier](self, "serverIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("HM.serverIdentifier"));

  -[HMDAccessoryTransportInformation instanceID](self, "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("HM.instanceID"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[HMDAccessoryTransportInformation linkType](self, "linkType"), CFSTR("linkType"));
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
  -[HMDAccessoryTransportInformation serverIdentifier](self, "serverIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Server ID"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessoryTransportInformation instanceID](self, "instanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Instance ID"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessoryTransportInformation linkType](self, "linkType");
  HAPLinkTypeDescription();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Link Type"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessoryTransportInformation isReachable](self, "isReachable");
  HMFBooleanToString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Reachable"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_serverIdentifier, 0);
  objc_storeStrong((id *)&self->_reachableLastChangedTime, 0);
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_hapAccessory, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
